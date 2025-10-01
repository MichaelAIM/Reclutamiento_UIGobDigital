<template>
  <div
    class="modal fade"
    :class="{ show: visible }"
    tabindex="-1"
    role="dialog"
    style="display: block"
    v-if="visible && datos"
  >
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content rounded-4 shadow-lg border-0">
        <!-- Header -->
        <div class="modal-header bg-primary text-white">
          <h5 class="modal-title">
            <i class="bi bi-person-badge me-2"></i> Perfil Profesional
          </h5>
          <button
            type="button"
            class="btn-close btn-close-white"
            @click="cerrarModal"
            aria-label="Cerrar"
          ></button>
        </div>

        <!-- Body -->
        <div class="modal-body bg-light px-4 py-3">
          <div class="row g-4">
            <!-- Columna izquierda -->
            <div class="col-md-6">
              <!-- Información Personal -->
              <div class="card border-0 shadow-sm mb-3">
                <div class="card-header bg-white border-bottom">
                  <h6 class="mb-0 text-primary fw-semibold">
                    <i class="bi bi-person me-2"></i> Información Personal
                  </h6>
                </div>
                <div class="card-body">
                  <p><strong>RUT:</strong> {{ datos.rut }}</p>
                  <p>
                    <strong>Nombre:</strong>
                    {{ datos.nombre_completo ?? "Sin datos" }}
                  </p>
                  <p>
                    <strong>Correo:</strong> {{ datos.correo ?? "Sin datos" }}
                  </p>
                  <p>
                    <strong>Teléfono:</strong>
                    {{ datos.telefono ?? "Sin datos" }}
                  </p>
                  <p>
                    <strong>Fecha Nacimiento:</strong>
                    {{ datos.fecha_nacimiento ?? "Sin datos" }}
                  </p>
                  <p>
                    <strong>Estado Civil:</strong>
                    {{ datos.estados_civile?.nombre ?? "Sin datos" }}
                  </p>
                  <p>
                    <strong>Nacionalidad:</strong>
                    {{ datos.nacionalidade?.nombre ?? "Sin datos" }}
                  </p>
                  <p>
                    <strong>Dirección:</strong>
                    {{ datos.direccion ?? "Sin datos" }}
                  </p>
                </div>
              </div>

              <!-- Información Profesional -->
              <div class="card border-0 shadow-sm mb-3">
                <div class="card-header bg-white border-bottom">
                  <h6 class="mb-0 text-primary fw-semibold">
                    <i class="bi bi-mortarboard me-2"></i> Información
                    Profesional
                  </h6>
                </div>
                <div class="card-body">
                  <p>
                    <strong>Nivel de Estudios:</strong>
                    {{ datos.nivel_educacion?.nombre ?? "Sin datos" }}
                  </p>
                  <p><strong>Institución:</strong> {{ datos.institucion }}</p>
                  <p>
                    <strong>Título Profesional:</strong>
                    {{ datos.titulos_profesionale?.nombre ?? "Sin datos" }}
                  </p>
                  <p>
                    <strong>Especialidad:</strong>
                    {{ datos.especialidad ?? "Sin datos" }}
                  </p>
                </div>
              </div>

              <!-- Preferencias de Contratación -->
              <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-bottom">
                  <h6 class="mb-0 text-primary fw-semibold">
                    <i class="bi bi-gear me-2"></i> Preferencias de Contratación
                  </h6>
                </div>
                <div class="card-body">
                  <p>
                    <strong>Disponibilidad de regiones: </strong>
                    <span v-for="ciu in datos.ciudades">
                      {{ ciu.nombre ?? "Sin datos" }},
                    </span>
                  </p>
                  <p>
                    <strong>Disponibilidad Horaría: </strong>
                    <span v-for="mod in datos.modalidades_horarias">
                      {{ mod.nombre ?? "Sin datos" }},
                    </span>
                  </p>
                  <p>
                    <strong>Jornadas preferida: </strong>
                    <span v-for="jor in datos.jornadas">
                      {{ jor.nombre ?? "Sin datos" }},
                    </span>
                  </p>
                  <p>
                    <strong>Tipo de contrato:</strong> {{ datos.tipo_contrato }}
                  </p>
                  <p>
                    <strong>Tipos de vacantes de interés:</strong>
                    <span v-if="datos.tipo_vacante_nuevo">
                      Vacantes Nuevas,
                    </span>
                    <span v-if="datos.tipo_vacante_reemplazo">
                      Vacantes de Reemplazos</span
                    >
                  </p>
                  <p>
                    <strong class="mb-3">Cargos de interés: </strong>
                  </p>
                  <p v-for="cargo in datos.cargos">{{ cargo.nombre }},</p>
                </div>
              </div>
            </div>

            <!-- Columna derecha -->
            <div class="col-md-6">
              <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-bottom">
                  <h6 class="mb-0 text-primary fw-semibold">
                    <i class="bi bi-paperclip me-2"></i> Documentos Requeridos
                  </h6>
                </div>
                <div class="card-body">
                  <ul class="list-group list-group-flush">
                    <li
                      v-for="doc in documentos"
                      :key="doc.id"
                      class="list-group-item d-flex justify-content-between align-items-center"
                    >
                      <span class="fw-medium">{{ doc.nombre }}</span>
                      <small
                        v-if="doc.archivo?.guardado"
                        class="text-success"
                        >{{ doc.archivo.nombre_para_mostrar }}</small
                      >
                      <small v-else-if="doc.archivo" class="text-warning"
                        >Procesando...</small
                      >
                      <small v-else class="text-muted">No adjuntado</small>
                      <a
                        v-if="doc.archivo?.guardado"
                        @click="descargar(doc)"
                        class="btn btn-sm btn-outline-primary"
                      >
                        <i class="bi bi-file-earmark-text me-1"></i>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Footer -->
        <div class="modal-footer bg-white">
          <button
            type="button"
            class="btn btn-outline-secondary"
            @click="cerrarModal"
          >
            Cerrar
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, onUpdated, ref } from "vue";
import {
  fetchDocumentos,
  fetchDocumentosCandidato,
} from "../../services/candidatoService";
import { useCandidatoStore } from "../../store/candidatoStore";

const props = defineProps({
  visible: Boolean,
  datos: Object,
});
const store = useCandidatoStore();
const emit = defineEmits(["update:visible"]);
const docs = ref([]);
const docsCandidato = ref([]);
const documentos = ref([]);

function cerrarModal() {
  emit("update:visible", false);
}

function descargar(docto) {
  const doc = documentos.find((d) => d.id === docto.id);

  if (!doc || !doc.archivo) return;

  if (doc.archivo.guardado && doc.archivo.id !== undefined) {
    try {
      const encryptedId = encryptId(doc.archivo.id);
      const url = `${
        import.meta.env.VITE_API_URL
      }/upload_documentoCandidato/file/${encryptedId}`;
      window.open(url, "_blank");
    } catch (error) {
      console.error("Error al mostrar archivo en backend:", error);
      return;
    }
  }
}

onMounted(async () => {
  docs.value = await fetchDocumentos();
});

onUpdated(async () => {
  docsCandidato.value = await store.loadDocumentosCandidatos(props.datos.id);
  documentos.value = await store.setDocumentosCantidados(
    props.datos.estado_candidato_id,
    docsCandidato.value,
    docs.value
  );
  console.log("documentos Candidato", documentos.value);
});
</script>

<style scoped>
.modal {
  background-color: rgba(0, 0, 0, 0.5);
}
.modal.show {
  display: block;
}
</style>
