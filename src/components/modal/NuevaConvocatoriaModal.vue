<template>
  <div
    class="modal fade"
    :class="{ show: visible }"
    tabindex="-1"
    role="dialog"
    style="display: block"
    v-if="visible"
  >
    <div
      class="modal-dialog modal-dialog-centered modal-lg"
      style="max-width: 900px"
    >
      <div class="modal-content rounded-4 shadow-lg border-0">
        <!-- Header -->
        <div class="modal-header bg-light border-bottom-0">
          <h5 class="modal-title fw-semibold text-primary-emphasis">
            Crear Nueva Convocatoria
          </h5>
          <button
            type="button"
            class="btn-close"
            @click="cerrarModal"
            aria-label="Cerrar"
          >
            x
          </button>
        </div>

        <!-- Body -->
        <div
          class="modal-body px-4 py-3 overflow-auto"
          style="max-height: 60vh"
        >
          <form @submit.prevent="submitForm">
            <!-- Sección: Datos Generales -->
            <div class="card border-0 shadow-sm mb-4">
              <div class="card-header bg-light fw-semibold">
                Datos Generales
              </div>
              <div class="card-body">
                <div class="row gy-4 gx-5">
                  <div class="col-md-6">
                    <label class="form-label">Nombre del Cargo</label>

                    <select
                      v-model="form.cargo"
                      class="form-select-lg form-select"
                      required
                    >
                      <option disabled value="">Seleccione</option>
                      <option :value="cargo.id" v-for="cargo in cargos">
                        cargo.nombre
                      </option>
                    </select>
                  </div>
                  <div class="col-md-6">
                    <label class="form-label">Código de Convocatoria</label>
                    <input
                      :value="form.codigo"
                      type="text"
                      class="form-control form-control-lg"
                      readonly
                    />
                  </div>
                  <div class="col-md-6 mt-3">
                    <label class="form-label">Tipo de Vacante</label>
                    <select
                      v-model="form.tipo"
                      class="form-select-lg form-select"
                      required
                    >
                      <option disabled value="">Seleccione</option>
                      <option>Docente</option>
                      <option>Administrativa</option>
                      <option>Técnica</option>
                      <option>Auxiliar</option>
                    </select>
                  </div>
                  <div class="col-md-6 mt-3">
                    <label class="form-label">Ciudad</label>
                    <input
                      v-model="form.ciudad"
                      type="text"
                      class="form-control form-control-lg"
                      placeholder="Ej: Arica"
                      required
                    />
                  </div>
                  <div class="col-md-6 mt-3">
                    <label class="form-label">Institución</label>
                    <input
                      v-model="form.institucion"
                      type="text"
                      class="form-control form-control-lg"
                      placeholder="Ej: Escuela Chinchorro"
                      required
                    />
                  </div>
                  <div class="col-md-6 mt-3">
                    <label class="form-label">Fecha de Cierre</label>
                    <input
                      v-model="form.fechaCierre"
                      type="date"
                      class="form-control form-control-lg"
                      required
                    />
                  </div>
                </div>
              </div>
            </div>

            <!-- Sección: Descripción y Requisitos -->
            <div class="card border-0 shadow-sm mb-4">
              <div class="card-header bg-light fw-semibold">
                Descripción y Requisitos
              </div>
              <div class="card-body row g-4">
                <div class="col-12">
                  <label class="form-label">Descripción</label>
                  <textarea
                    v-model="form.descripcion"
                    class="form-control"
                    rows="3"
                    placeholder="Describe brevemente el cargo y sus funciones"
                    required
                  ></textarea>
                </div>
                <div class="col-12">
                  <label class="form-label">Requisitos</label>
                  <textarea
                    v-model="form.requisitos"
                    class="form-control"
                    rows="3"
                    placeholder="Lista de requisitos académicos, técnicos o experiencia"
                    required
                  ></textarea>
                </div>
              </div>
            </div>

            <!-- Sección: Adjuntos y Envío -->
            <div class="card border-0 shadow-sm mb-4">
              <div class="card-header bg-light fw-semibold">
                Adjuntar Archivo
              </div>
              <div class="card-body row g-4">
                <div class="col-12">
                  <label class="form-label"
                    >Convocatoria en documento (PDF)</label
                  >
                  <input
                    type="file"
                    class="form-control"
                    @change="handleFileUpload"
                    accept=".pdf"
                  />
                  <small class="form-text text-muted">
                    Solo se permite un archivo PDF. Tamaño máximo: 5MB.
                  </small>
                </div>
                <div class="col-12 text-right mt-5">
                  <button type="submit" class="btn btn-success px-4 shadow-sm">
                    <i class="bi bi-check-circle"></i> Guardar Convocatoria
                  </button>
                </div>
              </div>
            </div>
          </form>
        </div>

        <!-- Footer -->
        <div class="modal-footer border-top-0 px-4 py-3">
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
import { onMounted, ref, watch } from "vue";
import {
  fetchCargos,
  fetchInstituciones,
  fetchCiudades,
} from "../../services/convocatoriaServices";

const showForm = ref(true);

const form = ref({
  cargo: "",
  codigo: "",
  tipo: "",
  ciudad: "",
  institucion: "",
  descripcion: "",
  requisitos: "",
  fechaCierre: "",
  archivo: null,
});

watch(
  () => form.value.cargo,
  (nuevoCargo) => {
    const timestamp = Date.now().toString().slice(-5);
    form.value.codigo = `CV-${nuevoCargo
      .slice(0, 3)
      .toUpperCase()}-${timestamp}`;
  }
);

const handleFileUpload = (event) => {
  const file = event.target.files[0];
  if (file && file.type === "application/pdf") {
    form.value.archivo = file;
  } else {
    alert("Solo se permiten archivos PDF.");
  }
};

const submitForm = async () => {
  try {
    const payload = {
      codigo: form.value.codigo,
      cargo_id: 1, // puedes mapear esto si tienes un selector
      cuidad_id: 1, // lo mismo aquí
      institucion_id: 1, // lo mismo aquí
      fecha_cierre: form.value.fechaCierre,
      descripcion: form.value.descripcion,
      requisitos: form.value.requisitos,
      estado_id: 1, // estado inicial, por ejemplo "Nuevo"
    };

    const response = await axios.post("/api/convocatorias", payload);
    console.log("Convocatoria insertada:", response.data);
    alert("Convocatoria registrada correctamente");
    cerrarModal();
  } catch (error) {
    console.error("Error al registrar convocatoria:", error);
    alert("Hubo un problema al registrar la convocatoria");
  }
};

const props = defineProps({
  visible: Boolean,
});

const emit = defineEmits(["update:visible"]);
const cargos = ref([]);
const ciudades = ref([]);
const instituciones = ref([]);

const cerrarModal = () => {
  emit("update:visible", false);
};

onMounted(async () => {
  const instituciones = await fetchInstituciones();
  const ciudades = await fetchCiudades();
  const cargos = await fetchCargos();
  console.log("cargos", cargos);
});
</script>

<style scoped>
.modal {
  background-color: rgba(0, 0, 0, 0.5);
}
.modal.show {
  display: block;
}
.form-select-lg {
  padding: 0.5rem 1rem;
  font-size: 1rem;
  line-height: 1.5;
  display: block;
  width: 100%;
  height: calc(1.5em + 1rem + 2px);
  font-size: 1.25rem;
  border-radius: 0;
  color: #495057;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
}
</style>
