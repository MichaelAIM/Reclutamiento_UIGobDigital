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
                  <div class="col-md-6 my-2">
                    <label class="form-label">Tipo de Cargo</label>
                    <select
                      v-model="form.categoria_cargo_id"
                      class="form-select-lg form-select"
                      required
                    >
                      <option disabled value="">Seleccione</option>
                      <option
                        :value="cat.id"
                        :key="cat.id"
                        v-for="cat in categoria_cargo"
                      >
                        {{ cat.nombre }}
                      </option>
                    </select>
                  </div>
                  <div class="col-md-6 my-2">
                    <label class="form-label">Cargo</label>

                    <select
                      v-model="form.cargo_id"
                      class="form-select-lg form-select"
                      required
                    >
                      <option disabled value="">Seleccione</option>
                      <option
                        :value="cargo.id"
                        :key="cargo.id"
                        v-for="cargo in cargosFiltrados"
                      >
                        {{ cargo.nombre }}
                      </option>
                    </select>
                  </div>
                  <div class="col-md-6 my-2">
                    <label class="form-label">Ciudad</label>
                    <select
                      v-model="form.ciudad_id"
                      class="form-select-lg form-select"
                      required
                    >
                      <option disabled value="">Seleccione</option>
                      <option
                        :value="ciudad.id"
                        :key="ciudad.id"
                        v-for="ciudad in ciudades"
                      >
                        {{ ciudad.nombre }}
                      </option>
                    </select>
                  </div>
                  <div class="col-md-6 my-2">
                    <label class="form-label">Institución</label>
                    <select
                      v-model="form.institucion_id"
                      class="form-select-lg form-select"
                      required
                    >
                      <option disabled value="">Seleccione</option>
                      <option
                        :value="institucion.id"
                        :key="institucion.id"
                        v-for="institucion in instituciones"
                      >
                        {{ institucion.nombre }}
                      </option>
                    </select>
                  </div>
                  <div class="col-md-6 my-2">
                    <label class="form-label">Modalidad horaria</label>
                    <select
                      v-model="form.modalidad_id"
                      class="form-select-lg form-select"
                      required
                    >
                      <option disabled value="">Seleccione</option>
                      <option
                        :value="modalidad.id"
                        :key="modalidad.id"
                        v-for="modalidad in modalidades"
                      >
                        {{ modalidad.nombre }}
                      </option>
                    </select>
                  </div>
                  <div class="col-md-6 my-2">
                    <label class="form-label">Tipo de Jornada</label>
                    <select
                      v-model="form.jornada_id"
                      class="form-select-lg form-select"
                      required
                    >
                      <option disabled value="">Seleccione</option>
                      <option
                        :value="jornada.id"
                        :key="jornada.id"
                        v-for="jornada in jornadas"
                      >
                        {{ jornada.nombre }}
                      </option>
                    </select>
                  </div>
                  <div class="col-md-6 my-2">
                    <label class="form-label">Tipo de vacante</label>
                    <select
                      v-model="form.tipo_vacante_id"
                      class="form-select-lg form-select"
                      required
                    >
                      <option disabled value="">Seleccione</option>
                      <option
                        :value="tipo.id"
                        :key="tipo.id"
                        v-for="tipo in tipoVacante"
                      >
                        {{ tipo.nombre }}
                      </option>
                    </select>
                  </div>
                  <div class="col-md-6 my-2">
                    <label class="form-label">Fecha de Cierre</label>
                    <input
                      v-model="form.fecha_cierre"
                      type="date"
                      class="form-control form-control-lg"
                      required
                    />
                  </div>
                  <div class="col-md-6 my-2">
                    <label class="form-label">Código de Convocatoria</label>
                    <input
                      :value="form.codigo"
                      type="text"
                      class="form-control form-control-lg"
                      readonly
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

                <div class="col-12 text-right mt-5">
                  <button type="submit" class="btn btn-success px-4 shadow-sm">
                    <i class="bi bi-check-circle"></i> Guardar Convocatoria
                  </button>
                </div>
              </div>
            </div>

            <!-- Sección: Adjuntos y Envío -->
            <!-- <div class="card border-0 shadow-sm mb-4">
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
              </div>
            </div> -->
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
import { onMounted, ref, watch, computed } from "vue";
import {
  fetchCargos,
  fetchInstituciones,
  fetchCiudades,
  fetchTipo_vacante,
  fetchModalidades,
  fetchJornadas,
  crear_convocatoria,
} from "../../services/convocatoriaServices";

const showForm = ref(true);

const emit = defineEmits(["update:visible"]);
const cargos = ref();
const ciudades = ref();
const instituciones = ref();
const tipoVacante = ref();
const jornadas = ref();
const modalidades = ref();

const categoria_cargo = ref([
  { id: 1, nombre: "Administrativo" },
  { id: 2, nombre: "Docente" },
  { id: 3, nombre: "Técnico o Asistente" },
]);

const initialFormState = {
  cargo_id: "",
  codigo: "",
  categoria_cargo_id: "",
  ciudad_id: "",
  institucion_id: "",
  descripcion: "",
  requisitos: "",
  fecha_cierre: "",
  archivo: null,
  modalidad_id: "",
  tipo_vacante_id: "",
  jornada_id: "",
};

const form = ref({ ...initialFormState });

// Función para resetear el formulario
const resetForm = () => {
  form.value = { ...initialFormState };
};

watch(
  () => form.value.categoria_cargo_id,
  (nuevoTipoId) => {
    const cargoSeleccionado = categoria_cargo.value.find(
      (c) => c.id === nuevoTipoId
    );
    const hash = cargoSeleccionado?.nombre?.slice(0, 3).toUpperCase() || "XXX";
    const stamp = Date.now().toString().slice(-4); // 4 dígitos finales del timestamp
    const año = new Date().getFullYear();

    form.value.codigo = `SLEP-${hash}-${stamp}-${año}`;
  }
);

const cargosFiltrados = computed(() => {
  const lista = cargos.value || [];
  const tipo = form.value.categoria_cargo_id;
  if (!tipo) return [];
  return lista.filter((cargo) => cargo.tipo_cargo_id === tipo);
});

const handleFileUpload = (event) => {
  const file = event.target.files[0];
  if (file && file.type === "application/pdf") {
    form.value.archivo = file;
  } else {
    alert("Solo se permiten archivos PDF.");
  }
};

const submitForm = async () => {
  console.log("Entro al submit");
  console.log(form.value);

  try {
    const response = await crear_convocatoria(form.value);
    console.log("Convocatoria insertada:", response.data);
    console.log("volvio al submit");
    emit("update");
    resetForm();
    cerrarModal();
  } catch (error) {
    console.error("Error al registrar convocatoria:", error);
  }
};

const props = defineProps({
  visible: Boolean,
});

const cerrarModal = () => {
  emit("update:visible", false);
};

onMounted(async () => {
  instituciones.value = await fetchInstituciones();
  ciudades.value = await fetchCiudades();
  cargos.value = await fetchCargos();
  modalidades.value = await fetchModalidades();
  tipoVacante.value = await fetchTipo_vacante();
  jornadas.value = await fetchJornadas();
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
