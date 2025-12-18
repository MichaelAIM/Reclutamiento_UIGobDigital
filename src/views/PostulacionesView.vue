<template>
  <div class="container-xl py-4">
    <h2 class="h4 text-secondary fw-semibold mb-4">
      Postulaciones por Convocatoria
    </h2>

    <h5 class="text-muted mb-3">
      Total convocatorias: {{ Object.keys(convocatorias).length }}
    </h5>

    <!-- Loading institucional -->
    <div class="row py-5" v-if="cargandoPostulaciones">
      <div class="col-12 text-center">
        <div class="spinner-border text-primary" role="status">
          <span class="visually-hidden"></span>
        </div>
        <p class="text-muted mt-3">Cargando postulaciones...</p>
      </div>
    </div>

    <div v-if="!cargandoPostulaciones && Object.keys(convocatorias).length > 0">
      <div v-for="(c, index) in convocatorias" :key="index" class="mb-3">
        <div
          class="card border-0 shadow-sm"
          @click="toggle(index)"
          style="cursor: pointer"
        >
          <div
            class="card-body d-flex justify-content-between align-items-start"
          >
            <div>
              <h5 class="mb-1 text-dark fw-semibold">
                {{ c.convocatoria.cargo.nombre }}
              </h5>
              <div class="small text-muted">
                <div><strong>Código:</strong> {{ c.convocatoria.codigo }}</div>
                <div>
                  <strong>Dirección:</strong>
                  {{ c.convocatoria.institucione.nombre }}
                </div>
              </div>
            </div>

            <div class="d-flex flex-column align-items-end gap-2">
              <div
                :class="[
                  'px-3 py-1 rounded',
                  getEstadoClass(c.convocatoria.estado_id),
                ]"
              >
                <span class="fw-semibold">
                  {{ c.convocatoria.estado_convocatorium.nombre }}
                </span>
              </div>
            </div>
            <div class="d-flex flex-column align-items-end gap-3">
              <div class="mr-md-5">
                <button
                  class="btn btn-sm"
                  @click.stop="cambiarEstadoConvocatoria(c.convocatoria.id, 4)"
                  title="Cerrar Proceso"
                  v-if="c.convocatoria.estado_id < 4"
                >
                  <i class="bi bi-x-octagon-fill text-danger"></i>
                </button>

                <button
                  class="btn btn-sm"
                  @click.stop="cambiarEstadoConvocatoria(c.convocatoria.id, 2)"
                  title="Habiltar Proceso"
                  v-else
                >
                  <i class="bi bi-skip-backward-circle-fill text-success"></i>
                </button>
                <button
                  v-if="c.convocatoria.estado_id > 3"
                  class="btn btn-sm"
                  @click.stop="cambiarEstadoConvocatoria(c.convocatoria.id, 5)"
                  title="Archivar Proceso"
                >
                  <i class="bi bi-archive-fill text-warning"></i>
                </button>
                {{ c.convocatoria }}
                <button
                  v-if="c.convocatoria.estado_id > 3"
                  @click="verCartaoferta(c.convocatoria.cartaOferta)"
                  class="btn btn-sm"
                  title="Enviar Carta de Oferta"
                >
                  <i class="bi bi-envelope-check-fill text-info"></i>
                </button>
              </div>
              <i
                class="bi"
                :class="expanded[index] ? 'bi-chevron-up' : 'bi-chevron-down'"
                style="font-size: 1.2rem; cursor: pointer"
              ></i>
            </div>
          </div>
        </div>
        <!-- Contenido colapsable -->
        <div v-if="expanded[index]" class="mt-2">
          <div class="table-responsive">
            <table
              class="table table-bordered table-striped table-hover align-middle shadow-sm"
            >
              <thead class="table-light">
                <tr class="text-center">
                  <th>#</th>
                  <th>Nombre</th>
                  <th>Rut</th>
                  <th>Email</th>
                  <th>Especialidad</th>
                  <th>Estado</th>
                  <th width="10%">Acciones</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(p, i) in c.candidatos"
                  :key="i"
                  :class="{
                    'bg-accent-325': p.estado_candidato === 3,
                    'table-striped': true,
                  }"
                >
                  <td class="text-center">{{ i + 1 }}</td>
                  <td>{{ p.nombre_completo }}</td>
                  <td class="text-nowrap">{{ p.rut }}</td>
                  <td>{{ p.correo }}</td>
                  <td>{{ p.especialidad }}</td>
                  <td>
                    <div class="d-flex align-items-center gap-2">
                      <div class="form-check form-switch m-0">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          :id="`estado-${index}-${i}`"
                          :disabled="p.estado_candidato === 3"
                          :checked="p.estado_candidato > 1"
                          @change="
                            cambiarEstadoCandidato(
                              p.postulacion_id,
                              p.id,
                              $event.target.checked ? 2 : 1
                            )
                          "
                        />
                      </div>
                      <span
                        :class="[
                          'badge px-3 py-1',
                          p.estado_candidato < 2
                            ? 'bg-warning text-dark'
                            : 'bg-success text-white',
                        ]"
                      >
                        {{ p.estado_candidato < 2 ? "Pendiente" : "Revisado" }}
                      </span>
                    </div>
                  </td>
                  <td class="text-center">
                    <button
                      class="btn btn-sm btn-outline-info me-1"
                      title="Ver perfil"
                      @click="verCandidato(p)"
                    >
                      <i class="bi bi-eye"></i>
                    </button>
                    <button
                      class="btn btn-sm btn-outline-primary"
                      title="Seleccionar Candidato"
                      @click="
                        cambiarEstadoCandidato(
                          p.postulacion_id,
                          p.id,
                          3,
                          c.convocatoria.id,
                          {
                            institucion: c.convocatoria.institucion_id,
                            cargo: c.convocatoria.cargo_id,
                            jornada: c.convocatoria.jornada_id,
                          }
                        )
                      "
                      v-if="
                        p.estado_candidato < 3 && c.convocatoria.estado_id < 4
                      "
                    >
                      <i class="bi bi-check-all"></i>
                    </button>
                    <button
                      v-show="
                        p.estado_candidato >= 3 && c.convocatoria.estado_id > 3
                      "
                      class="btn btn-sm btn-outline-secondary"
                      title="Quitar selección"
                      @click="
                        cambiarEstadoCandidato(
                          p.postulacion_id,
                          p.id,
                          1,
                          c.convocatoria.id
                        )
                      "
                    >
                      <i class="bi bi-x-circle"></i>
                    </button>
                  </td>
                </tr>
                <tr v-if="c.candidatos.length === 0">
                  <td colspan="7" class="text-center text-muted py-3">
                    No hay postulaciones registradas.
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <div
      class="row py-5"
      v-else-if="
        !cargandoPostulaciones && Object.keys(convocatorias).length === 0
      "
    >
      <div class="col-12 text-center">
        <p class="text-muted">No hay postulaciones vigentes en este momento.</p>
      </div>
    </div>

    <div class="row py-5" v-else>
      <div class="col-12 text-center">
        <p class="text-muted">No hay postulaciones vigentes en este momento.</p>
      </div>
    </div>
  </div>

  <ModalCandidato
    v-model:visible="mostrarModalCandidato"
    ref="modalCandidato"
  />
  <ModalCartaOferta
    v-model:visible="mostrarmodalCartaOferta"
    :oferta_id="cartaOfertaId"
    :authStore="useAuthStore()"
  />
</template>

<script setup>
import { onMounted, ref, computed } from "vue";
import {
  fetchPostulacionesVigentes,
  putPostulacionCandidato,
} from "../services/postulacionService";
import { update_convocatoria } from "../services/convocatoriaServices";
import ModalCandidato from "../components/modal/ModalCandidato.vue";
import ModalCartaOferta from "../components/modal/ModalCartaOferta.vue";
import Swal from "sweetalert2";
import { useAuthStore } from "../store/authStore";
import {
  crearCartaOferta,
  actualizarCartaOferta,
} from "../services/cartaOfertaService";

const convocatorias = ref([]);
const mostrarModalCandidato = ref(false);
const mostrarmodalCartaOferta = ref(false);
const modalCandidato = ref(null);
const expanded = ref([]);
const cargandoPostulaciones = ref(false);
const cartaOfertaId = ref(null);

function verCandidato(candidato) {
  mostrarModalCandidato.value = true;
  if (modalCandidato.value?.CargarDocumentos) {
    modalCandidato.value.CargarDocumentos(candidato);
  } else {
    console.warn("⚠️ Método CargarDocumentos no disponible en el hijo");
  }
}

function verCartaoferta(oferta) {
  cartaOfertaId.value = oferta.id;
  mostrarmodalCartaOferta.value = true;
}

function getEstadoClass(estadoId) {
  const clases = {
    1: "bg-warning text-dark", // Pendiente
    2: "bg-info text-white", // En revisión
    3: "bg-success text-white", // Aprobado
    4: "bg-danger text-white", // Rechazado
    5: "bg-secondary text-white", // Archivado
  };
  return clases[estadoId] || "bg-light text-muted"; // fallback defensivo
}

const convocatoriasConCandidatos = computed(() =>
  convocatorias.value.filter((c) => c.candidatos?.length > 0)
);

function toggle(index) {
  expanded.value[index] = !expanded.value[index];
}

async function cambiarEstadoCandidato(
  postulacioId,
  candidatoId,
  estado,
  convocatoriaId = null,
  datos = {}
) {
  const response = await putPostulacionCandidato(postulacioId, estado);
  if (estado === 3 && convocatoriaId) {
    const { institucion, cargo, jornada } = datos;
    await cambiarEstadoConvocatoria(convocatoriaId, 4);
    const data = {
      convocatoria_id: convocatoriaId,
      candidato_id: candidatoId,
      institucion_id: institucion,
      cargo_id: cargo,
      jornada_id: jornada,
      estado: 1,
    };
    await crearCartaOferta(data);
    /*  const convocatoria = convocatorias.value.find(c => c.convocatoria.id === convocatoriaId);
    if(convocatoria) {
      const candidato = convocatoria.candidatos.find(p => p.id === candidatoId);
      if(candidato && modalCandidato.value?.EnviarCorreoSeleccion) {
        modalCandidato.value.EnviarCorreoSeleccion(candidato, convocatoria.convocatoria);
      }
    } */
  }
  if (estado === 1 && convocatoriaId) {
    // Buscar índice de la convocatoria en la lista
    const convIndex = convocatorias.value.findIndex(
      (c) => c.convocatoria?.id === convocatoriaId
    );

    if (convIndex === -1) {
      console.warn(`Convocatoria con ID ${convocatoriaId} no encontrada`);
    } else {
      // Buscar índice del candidato usando id del candidato o id de la postulacion
      const candidatoIndex = convocatorias.value[
        convIndex
      ].candidatos.findIndex(
        (p) => p.id === candidatoId && p.postulacion_id === postulacioId
      );

      if (candidatoIndex === -1) {
        console.warn(
          `Candidato/postulación no encontrada en la convocatoria ${convocatoriaId}`
        );
      } else {
        convocatorias.value[convIndex].candidatos[
          candidatoIndex
        ].estado_candidato = 1;
      }
    }

    await cambiarEstadoConvocatoria(convocatoriaId, 2);
  }
  if (response) {
    await cargarPostulaciones();
  } else {
    console.error("Error al actualizar el estado del candidato");
  }
}
// Funcionalidad de botones
async function cambiarEstadoConvocatoria(convocatoriaId, estado) {
  if (estado === 2) {
    // Convertir el objeto en arreglo de valores
    const listaConvocatorias = Object.values(convocatorias.value);

    const convocatoriaObj = listaConvocatorias.find(
      (c) => c.convocatoria?.id === convocatoriaId
    );

    if (!convocatoriaObj) {
      console.error(`No se encontró la convocatoria con ID ${convocatoriaId}`);
      return;
    }
    const candidatos = Array.isArray(convocatoriaObj.candidatos)
      ? convocatoriaObj.candidatos
      : [];

    const tieneCandidatoSeleccionado = candidatos.some(
      (c) => c?.estado_candidato === 3
    );

    console.log("tieneCandidatoSeleccionado = ", tieneCandidatoSeleccionado);

    if (tieneCandidatoSeleccionado) {
      await Swal.fire({
        title: "error!",
        text: "Esta convocatoria tiene un candidato seleccionado. Debe eliminar al candidato para reabrir la convocatoria.",
        icon: "error",
        showCancelButton: true,
      });
      return;
    } else {
      console.log("🔍 No hay candidatos seleccionados aún");
      const payload = {
        dato_envio: 3,
      };

      //console.log("convocatoriaObj", convocatoriaObj);
      await actualizarCartaOferta(
        convocatoriaObj.convocatoria.cartaOferta.id,
        payload
      );
      // Aqui cambiar estado de la carta oferta a "Anulada"
    }
  }

  const response = await update_convocatoria(convocatoriaId, {
    estado_id: estado,
  });

  await cargarPostulaciones();
}

onMounted(async () => {
  await cargarPostulaciones();
});

async function cargarPostulaciones() {
  cargandoPostulaciones.value = true;
  try {
    const { data } = await fetchPostulacionesVigentes(4);

    const transformada = data.map((item) => {
      const cartaOfertaValida =
        item.cartas_ofertas?.find((carta) => carta.estado !== 4) || null;

      return {
        convocatoria: {
          id: item.id,
          codigo: item.codigo,
          cargo_id: item.cargo_id,
          ciudad_id: item.ciudad_id,
          institucion_id: item.institucion_id,
          fecha_cierre: item.fecha_cierre,
          descripcion: item.descripcion,
          requisitos: item.requisitos,
          created_at: item.created_at,
          estado_id: item.estado_id,
          modalidad_id: item.modalidad_id,
          tipo_vacante_id: item.tipo_vacante_id,
          jornada_id: item.jornada_id,
          categoria_cargo_id: item.categoria_cargo_id,
          cargo: item.cargo,
          institucione: item.institucione,
          estado_convocatorium: item.estado_convocatorium,
          cartaOferta: cartaOfertaValida,
        },
        candidatos:
          item.Postulacions?.map((p) => {
            const c = p.Candidato || {};
            return {
              id: c.id,
              nombre_completo: c.nombre_completo,
              rut: c.rut,
              correo: c.correo,
              telefono: c.telefono,
              nacionalidade: c.nacionalidade,
              estados_civile: c.estados_civile,
              direccion: c.direccion,
              fecha_nacimiento: c.fecha_nacimiento,
              especialidad: c.especialidad,
              estado_candidato_id: c.estado_candidato_id,
              postulacion_id: p.id,
              created_at_postulacion: p.created_at,
              estado_candidato: p.estado_candidato,
              cargos: c.cargos,
              modalidades_horarias: c.modalidades_horarias,
              ciudades: c.ciudades,
              nivel_educacion: c.nivel_educacion,
              titulos_profesionale: c.titulos_profesionale,
              jornadas: c.jornadas,
              comentarios: c.comentarios,
            };
          }) || [],
      };
    });

    convocatorias.value = transformada;

    console.log("data", data);
  } catch (error) {
    console.error("Error al cargar postulaciones:", error);
  } finally {
    cargandoPostulaciones.value = false;
  }
}
</script>

<style scoped>
.table th,
.table td {
  vertical-align: middle;
}
.badge {
  font-size: 0.85rem;
  border-radius: 0.5rem;
  min-width: 90px;
  text-align: center;
}
.form-check-input {
  cursor: pointer;
  position: relative;
}
.card:hover {
  box-shadow: 0 0 0.25rem rgba(0, 0, 0, 0.1);
}
</style>
