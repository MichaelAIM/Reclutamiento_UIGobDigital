<template>
  <div class="min-vh-100 d-flex align-items-center">
    <div class="container-fluid px-0 mx-3">
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
                    class="form-control w-100"
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
                    class="form-control w-100"
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
                    class="form-control w-100"
                    id="correo"
                    v-model="form.correo"
                  />
                </div>
                <div class="col-md-4 my-2">
                  <label for="telefono" class="form-label">Teléfono</label>
                  <input
                    type="tel"
                    class="form-control w-100"
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
                    class="form-select w-100"
                    v-model="form.estado_civil_id"
                  >
                    <option value="">Selecciona estado civil</option>
                    <option
                      v-for="r in store.estados.estadosCiviles"
                      :key="r.id"
                      :value="r.id"
                    >
                      {{ r.nombre }}
                    </option>
                  </select>
                </div>
                <div class="col-md-4 my-2">
                  <label for="fecha_nac" class="form-label"
                    >Fecha nacimiento</label
                  >
                  <input
                    type="date"
                    class="form-control w-100"
                    id="fecha_nac"
                    v-model="form.fecha_nacimiento"
                  />
                </div>
                <div class="col-md-4 my-2">
                  <label for="nacionalidad" class="form-label"
                    >Nacionalidad</label
                  >
                  <select
                    id="nacionalidad"
                    class="form-select w-100"
                    v-model="form.nacionalidad_id"
                  >
                    <option value="">Selecciona nacionalidad</option>
                    <option
                      v-for="r in store.estados.nacionalidades"
                      :key="r.id"
                      :value="r.id"
                    >
                      {{ r.nombre }}
                    </option>
                  </select>
                </div>
                <div class="col-12">
                  <label for="direccion" class="form-label"
                    >Dirección Particular</label
                  >
                  <input
                    type="text"
                    id="direccion"
                    class="form-control w-100"
                    v-model="form.direccion"
                  />
                </div>
                <div class="col-md-6 my-2">
                  <label for="region" class="form-label">Región</label>
                  <select
                    id="region"
                    class="form-select w-100"
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
                <div class="col-md-6 my-2">
                  <label for="comuna" class="form-label">Comuna</label>
                  <select
                    id="comuna"
                    class="form-select w-100"
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
              <hr />
              <h2 class="h4 fw-bold mb-4 text-dark">Información Profesional</h2>
              <div class="row g-3">
                <div class="col-md-6 my-2">
                  <label for="nivel_educativo" class="form-label"
                    >Último nivel de educación cursado</label
                  >
                  <select
                    id="nivel_educativo"
                    class="form-select w-100"
                    v-model="form.nivel_educacion_id"
                  >
                    <option
                      v-for="t in store.estados.nivelesEducacion"
                      :key="t.id"
                      :value="t.id"
                    >
                      {{ t.nombre }}
                    </option>
                  </select>
                </div>

                <div class="col-md-6 my-2">
                  <label for="categoria" class="form-label"
                    >Categoría funcionaria</label
                  >
                  <select
                    id="categoria"
                    class="form-select w-100"
                    v-model="form.categoria_funcionaria_id"
                  >
                    <option
                      v-for="t in store.estados.categoriaCargos"
                      :key="t.id"
                      :value="t.id"
                    >
                      {{ t.nombre }}
                    </option>
                  </select>
                </div>

                <div class="col-md-6 my-2">
                  <label for="especialidad" class="form-label"
                    >Especialidad
                    <span class="text-muted">(Solo si tiene)</span></label
                  >
                  <input
                    type="text"
                    id="especialidad"
                    class="form-control w-100"
                    v-model="form.especialidad"
                    :disabled="(form.nivel_educacion_id || 0) < 2"
                  />
                </div>

                <div
                  class="col-md-6 my-2"
                  v-if="(form.nivel_educacion_id || 0) >= 7"
                >
                  <label for="titulo_profesional" class="form-label"
                    >Título Profesional <span class="text-muted"></span
                  ></label>
                  <select
                    id="titulo_profesional"
                    class="form-select w-100"
                    v-model="form.titulo_profesional_id"
                    :disabled="(form.nivel_educacion_id || 0) < 7"
                  >
                    <option
                      v-for="t in store.estados.titulos"
                      :key="t.id"
                      :value="t.id"
                    >
                      {{ t.nombre }}
                    </option>
                  </select>
                </div>

                <!--               <div class="mb-3">
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
              </div> -->
              </div>
              <hr />
              <h2 class="h4 fw-bold mb-4 text-dark">
                Preferencias de Contratación
              </h2>

              <div class="row">
                <div class="col-12 my-2">
                  <label for="especialidad" class="form-label"
                    >Disponibilidad para trabajar en vacantes de tipo:</label
                  >
                  <div class="form-check form-check-inline">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      id="inlineCheckbox1"
                      value="option1"
                      v-model="form.tipo_vacante_nuevo"
                    />
                    <label class="form-check-label mb-0" for="inlineCheckbox1"
                      >Cargo Vacante</label
                    >
                  </div>
                  <div class="form-check form-check-inline ml-3">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      id="inlineCheckbox2"
                      v-model="form.tipo_vacante_reemplazo"
                      value="option2"
                    />
                    <label class="form-check-label mb-0" for="inlineCheckbox2"
                      >Reemplazo</label
                    >
                  </div>
                </div>

                <div class="col-12 my-2">
                  <label class="form-label"
                    >Disponibilidad para trabajar en las zonas de:</label
                  >
                  <multiselect
                    id="tagging"
                    v-model="form.ciudades_seleccionadas"
                    placeholder="Por favor selecciona una o varias localidades"
                    label="nombre"
                    track-by="id"
                    :options="store.estados.ciudades"
                    :multiple="true"
                    :taggable="true"
                  ></multiselect>
                </div>

                <!-- Nuevos campos multiselect para jornadas -->
                <div class="col-12 my-2">
                  <label class="form-label"
                    >Disponibilidad para trabajar en las jornadas de:</label
                  >

                  <multiselect
                    id="tagging"
                    v-model="form.jornadas_seleccionadas"
                    placeholder="Por favor selecciona una o varias jornadas"
                    label="nombre"
                    track-by="id"
                    :options="store.estados.jornadas"
                    :multiple="true"
                    :taggable="true"
                  ></multiselect>
                </div>

                <!-- Nuevos campos multiselect para modalidades horarias -->
                <div class="col-12 my-2">
                  <label class="form-label"
                    >Disponibilidad para trabajar en los horarios de:</label
                  >
                  <multiselect
                    id="tagging"
                    v-model="form.modalidades_seleccionadas"
                    placeholder="Por favor selecciona una o varias modalidades"
                    label="nombre"
                    track-by="id"
                    :options="store.estados.modalidades"
                    :multiple="true"
                    :taggable="true"
                  ></multiselect>
                </div>

                <div class="col-12 my-2">
                  <label for="cargos" class="form-label"
                    >Cargos de interés</label
                  >
                  <multiselect
                    id="tagging"
                    v-model="form.cargos"
                    placeholder="Puede seleccionar hasta un maxiomo de 3 cargos"
                    label="nombre"
                    track-by="id"
                    :options="cargosFiltrados"
                    :multiple="true"
                    :taggable="true"
                    :limit="5"
                    :max="3"
                    :disabled="(form.categoria_funcionaria_id || 0) < 1"
                    :maxHeight="600"
                  ></multiselect>
                </div>

                <div class="col-12 my-5 text-center">
                  <button type="submit" class="mx-0 btn btn-primary px-4 py-2">
                    Guardar Información
                  </button>
                </div>
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
                    <i
                      v-if="doc.archivo?.guardado"
                      class="bi bi-check-all text-success"
                    ></i>
                    <i
                      v-else
                      class="bi bi-file-earmark-text-fill text-primary"
                    ></i>
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
                  <label
                    v-if="!doc.archivo"
                    class="btn btn-upload btn-sm mb-0 px-3 font-level-9"
                  >
                    Subir
                    <input
                      type="file"
                      class="d-none"
                      @change="(e:any) => { const target = e.target as HTMLInputElement; if (target && target.files) { subirArchivo(doc.id, target.files[0]); } }"
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
import { computed, onMounted, reactive, toRaw } from "vue";
import Swal from "sweetalert2";
import { useAuthStore } from "../store/authStore";
import { useCandidatoStore } from "../store/candidatoStore";
import * as service from "../services/candidatoService";
import type { DocumentoEsperado } from "../types";
import { encryptId } from "../utils/validaciones";
import Multiselect from "vue-multiselect";

const store = useCandidatoStore();
const authStore = useAuthStore();

const cargosFiltrados = computed(() => {
  if (form.categoria_funcionaria_id === null) return [];

  return store.estados.cargos.filter(
    (cargo: any) => cargo.tipo_cargo_id === form.categoria_funcionaria_id
  );
});

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
  titulo_profesional_id: null,
  estado_candidato_id: 1,
  nivel_educacion_id: null,
  cargos: [] as Array<{ id: number; nombre: string }>,
  jornadas_seleccionadas: [] as Array<{ id: number; nombre: string }>, // Nuevo array para jornadas
  ciudades_seleccionadas: [] as Array<{ id: number; nombre: string }>, // Nuevo array para ciudades
  modalidades_seleccionadas: [] as Array<{ id: number; nombre: string }>, // Nuevo array para modalidades
  especialidad: "",
  tipo_vacante_nuevo: false,
  tipo_vacante_reemplazo: false,
  categoria_funcionaria_id: null,
});

const documentosEsperados = reactive<DocumentoEsperado[]>([]);
const loading = computed(() => store.loading ?? true);

onMounted(async () => {
  await store.loadCatalogos(authStore.candidato.id);
  console.log("docuemntos", store.estados.documentos);

  if (authStore.candidato.id !== null) {
    const response = await store.setCantidado(authStore.candidato.id);
    authStore.candidato = await formatearCandidato(response);
    console.log("response", response);
  }

  Object.assign(documentosEsperados, store.estados.documentos);
  Object.assign(form, authStore.candidato);
  onRegionChange();
  // Si el candidato tiene jornadas como IDs, transformarlas en objetos
  if (Array.isArray(authStore.candidato.jornadas_seleccionadas)) {
    form.jornadas_seleccionadas = authStore.candidato.jornadas_seleccionadas
      .map((id: number) => store.estados.jornadas.find((j) => j.id === id))
      .filter((j): j is { id: number; nombre: string } => j !== undefined);
  }
  if (Array.isArray(authStore.candidato.ciudades_seleccionadas)) {
    form.ciudades_seleccionadas = authStore.candidato.ciudades_seleccionadas
      .map((id: number) => store.estados.ciudades.find((j) => j.id === id))
      .filter((j): j is { id: number; nombre: string } => j !== undefined);
  }
  if (Array.isArray(authStore.candidato.modalidades_seleccionadas)) {
    form.modalidades_seleccionadas =
      authStore.candidato.modalidades_seleccionadas
        .map((id: number) => store.estados.modalidades.find((j) => j.id === id))
        .filter((j): j is { id: number; nombre: string } => j !== undefined);
  }
  if (Array.isArray(authStore.candidato.cargos)) {
    form.cargos = authStore.candidato.cargos
      .map((id: number) => store.estados.cargos.find((j) => j.id === id))
      .filter((j): j is { id: number; nombre: string } => j !== undefined);
  }
});

async function formatearCandidato(candidato: any) {
  let region_id = null;
  if (candidato.comuna) {
    region_id = candidato.comuna.regione.id;
  }

  return {
    id: candidato.id,
    rut: candidato.rut,
    nombre_completo: candidato.nombre_completo,
    titulo_profesional_id: candidato.titulo_profesional_id,
    telefono: candidato.telefono,
    correo: candidato.correo,
    estado_candidato_id: candidato.estado_candidato_id,
    nacionalidad_id: candidato.nacionalidad_id,
    estado_civil_id: candidato.estado_civil_id,
    direccion: candidato.direccion,
    comuna_id: candidato.comuna_id,
    usuario_id: candidato.usuario_id,
    fecha_nacimiento: candidato.fecha_nacimiento,
    presentacion: candidato.presentacion,
    region_id,
    cargos: candidato.cargos ? candidato.cargos.map((c: any) => c.id) : [],
    jornadas_seleccionadas: candidato.jornadas
      ? candidato.jornadas.map((c: any) => c.id)
      : [],
    ciudades_seleccionadas: candidato.ciudades
      ? candidato.ciudades.map((c: any) => c.id)
      : [],
    modalidades_seleccionadas: candidato.modalidades_horarias
      ? candidato.modalidades_horarias.map((c: any) => c.id)
      : [],
    categoria_funcionaria_id: candidato.categoria_funcionaria_id,
    nivel_educacion_id: candidato.nivel_educacion_id,
    especialidad: candidato.especialidad,
    tipo_vacante_nuevo: candidato.tipo_vacante_nuevo,
    tipo_vacante_reemplazo: candidato.tipo_vacante_reemplazo,
  };
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

  try {
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

      Swal.fire({
        icon: "success",
        title: "Documento subido",
        text: "El archivo fue guardado correctamente.",
      });
    }
  } catch (error: any) {
    const mensaje = error?.response?.data?.error || "Error al subir el archivo";

    Swal.fire({
      icon: "error",
      title: "Error de validación",
      text: mensaje,
    });
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

function onRegionChange() {
  if (form.region_id && store) {
    store.loadComunas(form.region_id);
  }
}

async function actualizarDatos() {
  if (!authStore.candidato.id) {
    Swal.fire("Error", "ID de candidato no válido", "error");
    return;
  }
  const payload = {
    ...toRaw(form),
    jornadas_seleccionadas: form.jornadas_seleccionadas.map((j) => j.id),
    ciudades_seleccionadas: form.ciudades_seleccionadas.map((j) => j.id),
    modalidades_seleccionadas: form.modalidades_seleccionadas.map((j) => j.id),
    cargos: form.cargos.map((j) => j.id),
  };

  const update = await store.updateCandidato(authStore.candidato.id, payload);
  if (update) {
    Object.assign(authStore.candidato, update);
  }
  Swal.fire(
    "Datos Almacenados",
    "Tu información ha sido registrada correctamente",
    "success"
  );
}
</script>
<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>
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

.card {
  backdrop-filter: blur(10px);
  background-color: rgba(255, 255, 255, 0.95);
}

.multiselect-container {
  max-height: 200px;
  overflow-y: auto;
  border: 1px solid #dee2e6;
  border-radius: 0.375rem;
  padding: 10px;
}

.form-check {
  margin-bottom: 0.5rem;
}
</style>
