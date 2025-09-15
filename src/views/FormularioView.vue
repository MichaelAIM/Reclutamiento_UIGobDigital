<template>
  <div class="min-vh-100 d-flex align-items-center">
    <div class="container-fluid px-0">
      <div v-if="loading" class="text-center py-5">
        <div
          class="spinner-border text-light mb-3"
          style="width: 3rem; height: 3rem"
          role="status"
        >
          <span class="visually-hidden">Cargando...</span>
        </div>
        <p class="text-white-50">Cargando información...</p>
      </div>

      <main v-else class="card shadow-lg border-0 rounded-4 overflow-hidden">
        <div class="row g-0">
          <div class="col-lg-7 p-4 p-md-5">
            <form @submit.prevent="actualizarDatos" novalidate>
              <h2 class="h4 fw-bold mb-4 text-dark">Información Personal</h2>
              <div class="row g-3">
                <div class="col-md-5 my-2">
                  <label for="rut" class="form-label">Rut</label>
                  <input
                    type="text"
                    class="form-control"
                    id="rut"
                    v-model="form.rut"
                    disabled
                  />
                </div>
                <div class="col-md-7 my-2">
                  <label for="nombreCompleto" class="form-label"
                    >Nombre Completo</label
                  >
                  <input
                    type="text"
                    class="form-control"
                    id="nombreCompleto"
                    v-model="form.nombre_completo"
                  />
                </div>
                <div class="col-md-8 my-2">
                  <label for="correo" class="form-label"
                    >Correo Electrónico</label
                  >
                  <input
                    type="email"
                    class="form-control"
                    id="correo"
                    v-model="form.correo"
                  />
                </div>
                <div class="col-md-4 my-2">
                  <label for="telefono" class="form-label">Teléfono</label>
                  <input
                    type="tel"
                    class="form-control"
                    id="telefono"
                    v-model="form.telefono"
                  />
                </div>
                <div class="col-md-4 my-2">
                  <label for="estado_civil" class="form-label"
                    >Estado Civil</label
                  >
                  <select
                    id="estado_civil"
                    class="form-select"
                    v-model="form.estado_civil_id"
                  >
                    <option value="">Selecciona región</option>
                    <option v-for="r in estadosCivil" :key="r.id" :value="r.id">
                      {{ r.nombre }}
                    </option>
                  </select>
                </div>
                <div class="col-md-4 my-2">
                  <label for="fecha_nac" class="form-label"
                    >fecha nacimiento</label
                  >
                  <input
                    type="date"
                    class="form-control"
                    id="fecha_nac"
                    v-model="form.telefono"
                  />
                </div>
                <div class="col-md-4 my-2">
                  <label for="nacionalidad" class="form-label"
                    >Nacionalidad</label
                  >
                  <select
                    id="nacionalidad"
                    class="form-select"
                    v-model="form.nacionalidad_id"
                  >
                    <option value="">Selecciona región</option>
                    <option
                      v-for="r in store.estados.nacionalidades"
                      :key="r.id"
                      :value="r.id"
                    >
                      {{ r.nombre }}
                    </option>
                  </select>
                </div>
              </div>

              <div class="row">
                <div class="col-md-12">
                  <label for="direccion" class="form-label"
                    >Dirección Particular</label
                  >
                  <input
                    type="text"
                    id="direccion"
                    class="form-control"
                    v-model="form.direccion"
                  />
                </div>
                <div class="col-auto my-2">
                  <label for="region" class="form-label">Región</label>
                  <select
                    id="region"
                    class="form-select"
                    v-model="form.region_id"
                    @change="onRegionChange"
                  >
                    <option value="">Selecciona región</option>
                    <option
                      v-for="r in store.estados.regiones"
                      :key="r.id"
                      :value="r.id"
                    >
                      {{ r.nombre }}
                    </option>
                  </select>
                </div>

                <div class="col-auto my-2">
                  <label for="comuna" class="form-label">Comuna</label>
                  <select
                    id="comuna"
                    class="form-select"
                    v-model="form.comuna_id"
                    :disabled="!form.region_id"
                  >
                    <option value="">Selecciona comuna</option>
                    <option
                      v-for="c in store.estados.comunas"
                      :key="c.id"
                      :value="c.id"
                    >
                      {{ c.nombre }}
                    </option>
                  </select>
                </div>
              </div>

              <hr class="my-4" />
              <h3 class="h5 fw-bold mb-5 text-dark">Información Profesional</h3>

              <p class="h7">Disponibilidad para trabajar en las zonas:</p>
              <div class="form-check form-check-inline">
                <input
                  class="form-check-input"
                  type="checkbox"
                  id="inlineCheckbox1"
                  value="option1"
                />
                <label class="form-check-label" for="inlineCheckbox1"
                  >Arica</label
                >
              </div>
              <div class="form-check form-check-inline">
                <input
                  class="form-check-input"
                  type="checkbox"
                  id="inlineCheckbox2"
                  value="option2"
                />
                <label class="form-check-label" for="inlineCheckbox2"
                  >Putre</label
                >
              </div>
              <div class="form-check form-check-inline">
                <input
                  class="form-check-input"
                  type="checkbox"
                  id="inlineCheckbox3"
                  value="option3"
                />
                <label class="form-check-label" for="inlineCheckbox3"
                  >Azapa</label
                >
              </div>
              <div class="form-check form-check-inline">
                <input
                  class="form-check-input"
                  type="checkbox"
                  id="inlineCheckbox4"
                  value="option4"
                />
                <label class="form-check-label" for="inlineCheckbox4"
                  >Camarones</label
                >
              </div>

              <div class="my-3">
                <label for="Especialidad" class="form-label"
                  >Especialidad</label
                >
                <input type="text" id="Especialidad" class="form-control" />
              </div>

              <div class="my-3">
                <label for="comuna" class="form-label"
                  >Título Profesional</label
                >
                <select
                  id="comuna"
                  class="form-select"
                  v-model="form.comuna_id"
                  :disabled="!form.region_id"
                >
                  <option value="">Selecciona comuna</option>
                  <option
                    v-for="c in store.estados.comunas"
                    :key="c.id"
                    :value="c.id"
                  >
                    {{ c.nombre }}
                  </option>
                </select>
              </div>

              <div class="mb-3">
                <label for="mensaje" class="form-label"
                  >Presentación Personal</label
                >
                <textarea
                  class="form-control"
                  id="mensaje"
                  rows="4"
                  placeholder="Cuéntanos sobre tu experiencia y motivación..."
                  v-model="form.presentacion"
                ></textarea>
              </div>

              <div class="mt-4">
                <button type="submit" class="btn btn-upload w-100 py-2">
                  <i class="bi bi-check-circle me-2"></i>
                  Guardar Información
                </button>
              </div>
            </form>
          </div>

          <div class="col-lg-5 p-4 p-md-5" style="background-color: #f7f7f9">
            <h2 class="h4 fw-bold mb-4 text-dark">Documentos Requeridos</h2>

            <div class="d-flex flex-column gap-3">
              <div
                v-for="doc in documentosEsperados"
                :key="doc.id"
                class="doc-item d-flex align-items-center justify-content-between p-3 bg-white rounded-3 shadow-sm"
              >
                <div class="d-flex align-items-center">
                  <div class="doc-icon me-3">
                    <i v-if="doc.archivo?.guardado" class="bi bi-check-all"></i>
                    <i v-else class="bi bi-file-earmark-text-fill"></i>
                  </div>
                  <div class="d-flex flex-column">
                    <span class="fw-medium">{{ doc.nombre }}</span>
                    <small v-if="doc.archivo?.guardado" class="text-success">{{
                      doc.archivo.nombre_para_mostrar
                    }}</small>
                    <small v-else-if="doc.archivo" class="text-warning"
                      >Procesando...</small
                    >
                    <small v-else class="text-muted">No adjuntado</small>
                  </div>
                </div>

                <div class="d-flex align-items-center gap-2">
                  <button
                    v-if="doc.archivo?.guardado"
                    @click="descargar(doc)"
                    class="btn btn-outline-secondary btn-sm p-1"
                    title="Ver documento"
                  >
                    <i class="bi bi-eye"></i>
                  </button>
                  <label v-if="!doc.archivo" class="btn btn-upload btn-sm mb-0">
                    Subir
                    <input
                      type="file"
                      class="d-none"
                      @change="(e) => { const target = e.target as HTMLInputElement; if (target && target.files) { subirArchivo(doc.id, target.files[0]); } }"
                    />
                  </label>
                  <button
                    v-if="doc.archivo"
                    @click="confirmarEliminacion(doc)"
                    class="btn btn-outline-danger btn-sm p-1"
                    title="Eliminar documento"
                  >
                    <i class="bi bi-trash3"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, onMounted, reactive, watch, nextTick } from "vue";
import Swal from "sweetalert2";
import { useRouter } from "vue-router";
import { useAuthStore } from "../store/authStore";
import { useCandidatoStore } from "../store/candidatoStore";
import * as service from "../services/candidatoService";
import type { DocumentoEsperado } from "../types";
import { encryptId } from "../utils/validaciones";
import Multiselect from "vue-multiselect"; // <-- 1. Importa el componente
import "vue-multiselect/dist/vue-multiselect.css"; // <-- 2. Importa los estilos

const store = useCandidatoStore();
const authStore = useAuthStore();

const router = useRouter();

const estadosCivil = [
  { id: 1, nombre: "Solter@" },
  { id: 2, nombre: "Casad@" },
  { id: 3, nombre: "Divorciad@" },
  { id: 4, nombre: "Viud@" },
];

const form = reactive({
  id: null,
  rut: "",
  nombre_completo: "",
  correo: "",
  telefono: "",
  direccion: "",
  region_id: null,
  comuna_id: null,
  nacionalidad_id: null,
  estado_civil_id: null,
  fecha_nacimiento: null,
  presentacion: "",
  cargos: [],
  titulo_profesional_id: null,
  estado_candidato_id: 1,
});

const documentosEsperados = reactive<DocumentoEsperado[]>([]);
const loading = computed(() => store.loading ?? true);

onMounted(async () => {
  await cargaDatosBase();
  onRegionChange();
});

async function cargaDatosBase() {
  await store.loadCatalogos(authStore.candidato.id);
  Object.assign(documentosEsperados, store.estados.documentos);
  Object.assign(form, authStore.candidato);
}

async function subirArchivo(id: any, archivo: File) {
  const doc: any = documentosEsperados.find((d: any) => d.id === id);
  doc.archivo = {
    id,
    nombre: archivo.name,
    nombre_para_mostrar: archivo.name,
    guardado: false,
  };

  const formData = new FormData();
  formData.append("rut", authStore.candidato.rut!);
  formData.append("candidato_id", String(authStore.candidato.id || ""));
  formData.append("documento_id", id);
  formData.append("nombre_para_mostrar", archivo.name);
  formData.append("file", archivo);

  const response = await service.uploadDocumentoCandidato(formData);

  if (response) {
    const doc: any = documentosEsperados.find((d: any) => d.id === id);
    if (doc) {
      doc.archivo = {
        id: response.data.documento.id,
        nombre: response.data.documento.nombre,
        nombre_para_mostrar: archivo.name,
        guardado: true,
      };
    }
  }
}

function confirmarEliminacion(doc: any) {
  Swal.fire({
    title: "¿Eliminar documento?",
    text: 'Esta acción revertirá el estado a "Sin subir".',
    icon: "warning",
    showCancelButton: true,
    confirmButtonText: "Sí, eliminar",
    cancelButtonText: "Cancelar",
    confirmButtonColor: "#d33",
    cancelButtonColor: "#6c757d",
  }).then((result) => {
    if (result.isConfirmed) {
      eliminarArchivo(doc);
      Swal.fire("Eliminado", "El documento ha sido eliminado.", "success");
    }
  });
}

async function eliminarArchivo(docto: any) {
  const doc = documentosEsperados.find((d) => d.id === docto.id);
  if (!doc || !doc.archivo) return;

  if (doc.archivo.guardado && doc.archivo.id !== undefined) {
    try {
      const encryptedId = encryptId(doc.archivo.id);
      await service.deleteDocumentoCandidato(encryptedId);
      doc.archivo = null;
    } catch (error) {
      console.error("Error al eliminar archivo en backend:", error);
      return;
    }
  }
  doc.archivo = null;
}

function descargar(docto: any) {
  const doc = documentosEsperados.find((d) => d.id === docto.id);

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

async function actualizarDatos() {
  if (!authStore.candidato.id) {
    Swal.fire("Error", "ID de candidato no válido", "error");
    return;
  }
  const update = await store.updateCandidato(authStore.candidato.id, form);
  if (update) {
    Object.assign(authStore.candidato, update);
  }
  Swal.fire(
    "Datos Almacenados",
    "Tu información ha sido registrada correctamente",
    "success"
  );
}

function onRegionChange() {
  if (form.region_id && store) {
    store.loadComunas(form.region_id);
  }
}
</script>

<style scoped>
@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css");

.portal-bg {
  background: linear-gradient(135deg, #4c46af 0%, #7b42b0 100%);
  font-family: "Inter", sans-serif;
}
.portal-header {
  position: relative;
}
.form-label {
  font-weight: 500;
  color: #4a5568;
}
.form-control,
.form-select {
  border-radius: 0.5rem;
  border: 1px solid #e2e8f0;
  padding: 0.5rem 1rem;
  transition: all 0.2s ease-in-out;
}
.form-control:focus,
.form-select:focus {
  border-color: #fe6565;
  box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
}
.doc-item {
  border: 1px solid #e2e8f0;
  transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
}
.doc-item:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08) !important;
}
.doc-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  background-color: #eef2ff;
  border-radius: 50%;
  color: #fe6565;
  font-size: 1.1rem;
  flex-shrink: 0;
}
.btn i,
.collapsible-links-heading i,
.collapsible-links-list-link i {
  font-size: 1rem;
}
.btn-upload {
  background-color: #fe6565;
  color: white;
  border: none;
  border-radius: 0.375rem;
  font-weight: 600;
  padding: 0.5rem 1.25rem;
  transition: background-color 0.2s ease-in-out;
  cursor: pointer;
}
.btn-upload:hover {
  background-color: #fe6565;
  color: white;
}
.btn-outline-secondary.btn-sm,
.btn-outline-danger.btn-sm {
  width: 32px;
  height: 32px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
}
.badge-pill {
  display: inline-flex;
  align-items: center;
  padding: 0.35em 0.75em;
  font-size: 0.875em;
  font-weight: 500;
  background-color: #eef2ff;
  color: #fe6565;
  border-radius: 9999px;
  border: 1px solid #c7d2fe;
}
.btn-close-pill {
  border: none;
  background: none;
  font-size: 1.2em;
  line-height: 1;
  color: #fe6565;
  margin-left: 0.5em;
  padding: 0;
  cursor: pointer;
  opacity: 0.7;
}
.btn-close-pill:hover {
  opacity: 1;
}

.form-group {
  margin-bottom: 1rem;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

.debug-info {
  margin-top: 1rem;
  padding: 1rem;
  background-color: #f8f9fa;
  border-radius: 4px;
  font-size: 0.9rem;
}

.form-check-input {
  cursor: pointer;
  position: relative !important;
}
</style>
