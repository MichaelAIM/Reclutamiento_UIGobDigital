<template>
  <div class="container-xl py-4">
    <h2 class="h4 text-secondary fw-semibold mb-4">
      Postulaciones por Convocatoria
    </h2>

    <h5 class="text-muted mb-3">
      Total convocatorias: {{ Object.keys(convocatorias).length }}
    </h5>
    <div v-if="Object.keys(convocatorias).length > 0">
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
                  class="btn btn-sm"
                  @click.stop="cambiarEstadoConvocatoria(c.convocatoria.id, 5)"
                  title="Archivar Proceso"
                >
                  <i class="bi bi-archive-fill text-warning"></i>
                </button>
                <button
                  v-if="c.convocatoria.estado_id > 3"
                  @click="mostrarmodalCartaOferta = true"
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
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(p, i) in c.candidatos"
                  :key="i"
                  :class="{
                    'bg-accent-325': p.estado_candidato_id === 3,
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
                          :disabled="p.estado_candidato_id === 3"
                          :checked="p.estado_candidato_id > 1"
                          @change="
                            cambiarEstadoCandidato(
                              p.id,
                              $event.target.checked ? 2 : 1
                            )
                          "
                        />
                      </div>
                      <span
                        :class="[
                          'badge px-3 py-1',
                          p.estado_candidato_id < 2
                            ? 'bg-warning text-dark'
                            : 'bg-success text-white',
                        ]"
                      >
                        {{
                          p.estado_candidato_id < 2 ? "Pendiente" : "Revisado"
                        }}
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
                      title="Seleccionar"
                      @click="
                        cambiarEstadoCandidato(p.id, 3, c.convocatoria.id)
                      "
                      v-if="p.estado_candidato_id < 3"
                    >
                      <i class="bi bi-check-all"></i>
                    </button>
                    <button
                      v-else
                      class="btn btn-sm btn-outline-secondary"
                      title="Quitar selección"
                      @click="
                        cambiarEstadoCandidato(p.id, 1, c.convocatoria.id)
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
  <ModalCartaOferta v-model:visible="mostrarmodalCartaOferta" />
</template>

<script setup>
import { onMounted, ref, computed } from "vue";
import { fetchPostulacionesVigentes } from "../services/postulacionService";
import { update_convocatoria } from "../services/convocatoriaServices";
import { putCandidato } from "../services/candidatoService";
import ModalCandidato from "../components/modal/ModalCandidato.vue";
import ModalCartaOferta from "../components/modal/ModalCartaOferta.vue";
import Swal from "sweetalert2";

const convocatorias = ref([]);
const mostrarModalCandidato = ref(false);
const mostrarmodalCartaOferta = ref(false);
const modalCandidato = ref(null);
const expanded = ref([]);

function verCandidato(candidato) {
  mostrarModalCandidato.value = true;
  if (modalCandidato.value?.CargarDocumentos) {
    modalCandidato.value.CargarDocumentos(candidato);
  } else {
    console.warn("⚠️ Método CargarDocumentos no disponible en el hijo");
  }
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
  candidatoId,
  estado,
  convocatoriaId = null
) {
  const response = await putCandidato(candidatoId, estado);
  await cargarPostulaciones();
  if (estado === 3 && convocatoriaId) {
    await cambiarEstadoConvocatoria(convocatoriaId, 4);
    /*  const convocatoria = convocatorias.value.find(c => c.convocatoria.id === convocatoriaId);
    if(convocatoria) {
      const candidato = convocatoria.candidatos.find(p => p.id === candidatoId);
      if(candidato && modalCandidato.value?.EnviarCorreoSeleccion) {
        modalCandidato.value.EnviarCorreoSeleccion(candidato, convocatoria.convocatoria);
      }
    } */
  }
  if (estado === 1 && convocatoriaId) {
    await cambiarEstadoConvocatoria(convocatoriaId, 2);
  }
}
// Funcionalidad de botones
async function cambiarEstadoConvocatoria(convocatoriaId, estado) {
  console.log(
    `Cambiando estado de convocatoria ${convocatoriaId} a estado ${estado}`
  );
  // Si se intenta reabrir una convocatoria (estado 2), verificar si ya hay un candidato seleccionado (estado_id = 5)
  console.log("convocatoria cambio estado", convocatorias.value);

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

    console.log("Candidatos", candidatos);

    const tieneCandidatoSeleccionado = candidatos.some(
      (c) => c?.estado_candidato_id === 3
    );

    if (tieneCandidatoSeleccionado) {
      console.log("📌 Convocatoria con candidato seleccionado (estado_id = 3)");
      await Swal.fire({
        title: "Atención",
        text: "Esta convocatoria tiene un candidato seleccionado. Debe revisar los candidatos antes de reabrir la convocatoria.",
        icon: "warning",
        showCancelButton: true,
      });
      return;
    } else {
      console.log("🔍 No hay candidatos seleccionados aún");
    }
  }

  const response = await update_convocatoria(convocatoriaId, {
    estado_id: estado,
  });
  await cargarPostulaciones();
}

onMounted(async () => {
  await cargarPostulaciones();
  console.log("convocatorias", convocatorias.value);
});

async function cargarPostulaciones() {
  convocatorias.value = await fetchPostulacionesVigentes(4);
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
