<template>
  <div class="container-xl py-4">
    <h2 class="h4 text-secondary fw-semibold mb-4">
      Postulaciones por Convocatoria
    </h2>

    <div v-for="(c, index) in convocatorias" :key="index" class="mb-3">
      <!-- Tarjeta de convocatoria -->
      <div
        class="card border-0 shadow-sm"
        @click="toggle(index)"
        style="cursor: pointer"
      >
        <div class="card-body d-flex justify-content-between align-items-start">
          <!-- Columna izquierda: texto -->
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

          <!-- Columna derecha: botones + ícono -->
          <div class="d-flex flex-column align-items-end gap-3">
            <div class="mr-md-5">
              <button
                class="btn btn-sm"
                @click.stop="cancelarPostulacion(c.convocatoria.id)"
                title="Cerrar Proceso"
              >
                <i class="bi bi-x-octagon-fill text-danger"></i>
              </button>
              <button
                class="btn btn-sm"
                @click.stop="archivarPostulacion(c.convocatoria.id)"
                title="Archivar Proceso"
              >
                <i class="bi bi-archive-fill text-warning"></i>
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
              <tr v-for="(p, i) in c.candidatos" :key="i">
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
                        v-model="p.estado"
                        @change="actualizarEstado(c.convocatoria.id, p)"
                      />
                    </div>
                    <span
                      :class="[
                        'badge px-3 py-1',
                        p.estado
                          ? 'bg-success text-white'
                          : 'bg-warning text-dark',
                      ]"
                    >
                      {{ p.estado ? "Revisado" : "Pendiente" }}
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
                  >
                    <i class="bi bi-check-all"></i>
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

  <ModalCandidato
    v-model:visible="mostrarModalCandidato"
    ref="modalCandidato"
  />
</template>

<script setup>
import { onMounted, ref } from "vue";
import { fetchPostulacionesVigentes } from "../services/postulacionService";
import { update_convocatoria } from "../services/convocatoriaServices";
import ModalCandidato from "../components/modal/ModalCandidato.vue";

const convocatorias = ref([]);
const mostrarModalCandidato = ref(false);
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

function toggle(index) {
  expanded.value[index] = !expanded.value[index];
}

function actualizarEstado(codigoConvocatoria, postulante) {
  console.log(
    `🔄 Estado actualizado para ${postulante.nombre_completo} en ${codigoConvocatoria}: ${postulante.estado}`
  );
}

// Funcionalidad de botones
async function cancelarPostulacion(convocatoria) {
  console.log("🗑️ Cancelar postulación:", convocatoria);
  const response = await update_convocatoria(convocatoria, { estado_id: 4 });
  await cargarPostulaciones();
}

async function archivarPostulacion(convocatoria) {
  console.log("📁 Archivar postulación:", convocatoria);
  const response = await update_convocatoria(convocatoria, { estado_id: 5 });
  await cargarPostulaciones();
}

onMounted(async () => {
  await cargarPostulaciones();
  console.log("convocatorias", convocatorias.value);

  //expanded.value = convocatorias.value.map(() => false);
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
