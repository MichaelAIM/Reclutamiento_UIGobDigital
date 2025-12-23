<template>
  <div class="container my-4">
    <h1>
      {{
        fields.tipo_vacante_id == 1
          ? "Nueva Contratación"
          : "Reemplazo de Contratación"
      }}
    </h1>
    <div class="card p-3">
      <!-- Body -->
      <section>
        <div class="font-weight-bold">VISTO:</div>
        <div class="highlight-green mb-3 p-2 position-relative">
          <template v-if="!isEditingVisto">
            <p>{{ vistoText }}</p>
            <button
              class="btn btn-sm btn-outline-secondary position-absolute"
              style="bottom: 0px; right: 0px; border: none"
              @click="isEditingVisto = true"
              aria-label="Editar Visto"
            >
              <i class="bi bi-pencil" style="font-size: 18px"></i>
            </button>
          </template>
          <template v-else>
            <textarea
              class="form-control"
              rows="6"
              v-model="vistoText"
              aria-label="Visto editable"
            ></textarea>
            <div class="d-flex justify-content-end mt-2">
              <button
                class="btn btn-sm btn-success"
                @click="isEditingVisto = false"
                aria-label="Guardar Visto"
              >
                Guardar
              </button>
            </div>
          </template>
        </div>

        <div class="font-weight-bold">CONSIDERANDO:</div>
        <div class="mb-3">
          <div
            v-for="(c, i) in considerandoList"
            :key="c.id"
            class="d-flex mb-2 align-items-start"
          >
            <div class="flex-grow-1">
              <template v-if="c.text">
                <p>{{ c.text }}</p>
              </template>
              <template v-else>
                <textarea
                  class="form-control highlight-celeste"
                  v-model="c.text"
                  rows="5"
                  :placeholder="`Considerando ${i + 1}`"
                  @blur="onBlurConsiderando(i)"
                >
                </textarea>
              </template>
            </div>
            <i
              class="bi bi-trash3 text-danger ml-2 pointer"
              @click="removeConsiderando(i)"
            ></i>
          </div>
          <div class="d-flex align-items-center">
            <button
              class="btn btn-secondary btn-sm mr-3"
              @click="addConsiderando"
              type="button"
            >
              Agregar considerando
            </button>
            <small class="text-muted"
              >Agregar o quitar párrafos CONSIDERANDO</small
            >
          </div>
        </div>

        <div class="font-weight-bold">RESUELVO:</div>
        <div class="small text-muted mb-2">
          1. NÓMBRESE, al profesional de la educación que cumplirá funciones
          docentes que se indican a continuación:
        </div>

        <!-- Tabla (Bootstrap table) -->
        <div class="table-responsive mb-3">
          <table class="table table-bordered mb-0">
            <thead class="">
              <tr>
                <td scope="col" class="bg-light">ESTABLECIMIENTO</td>
                <th scope="col" colspan="2">
                  <InputEditable
                    v-model="fields.establecimiento"
                    placeholder="Nombre Establecimiento (puede ser nulo)"
                    aria-label="Establecimiento"
                  />
                </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="bg-light">NOMBRE</td>
                <td colspan="2">
                  <InputEditable
                    v-model="fields.nombre"
                    placeholder="Nombre completo (puede ser nulo)"
                    aria-label="Nombre"
                  />
                </td>
              </tr>

              <tr>
                <td class="bg-light">RUT</td>
                <td colspan="2">
                  <InputEditable
                    v-model="fields.rut"
                    placeholder="RUT (puede ser nulo)"
                    aria-label="RUT"
                  />
                </td>
              </tr>

              <tr>
                <td class="bg-light">TIPO DE FUNCIÓN</td>
                <td colspan="2">{{ fields.funcionContrato }}</td>
              </tr>
              <tr>
                <td>FECHA DE INICIO</td>
                <td colspan="2">
                  <span v-if="fields.fechaInicio">{{
                    fields.fechaInicio
                  }}</span>
                  <div v-else class="highlight-yellow p-1">
                    <input
                      class="form-control form-control-sm"
                      type="date"
                      v-model="fields.fechaInicio"
                      aria-label="Fecha de inicio"
                    />
                  </div>
                </td>
              </tr>

              <tr>
                <td>FECHA DE TÉRMINO</td>
                <td colspan="2">
                  <div v-if="fields.fechaTermino">
                    <span
                      >{{ fields.fechaTermino }} o hasta que sus servicios sean
                      necesarios</span
                    >
                    <button
                      class="btn btn-sm btn-outline-secondary border-0"
                      @click="habilitarFechaTermino"
                    >
                      <i class="bi bi-pencil"></i>
                    </button>
                  </div>

                  <div v-else class="highlight-yellow p-1">
                    <input
                      type="date"
                      class="form-control form-control-sm"
                      v-model="fields.fechaTermino"
                      placeholder="28/02/2026"
                      aria-label="Fecha de termino"
                    />
                  </div>
                </td>
              </tr>

              <tr>
                <td>CALIDAD JURIDICA</td>

                <td colspan="2">
                  <div class="highlight-yellow p-1 w-100">
                    <select
                      v-model="fields.calidadJuridica"
                      class="form-control form-control-sm inline-input"
                    >
                      <option value="1">CONTRATA</option>
                      <option value="2">TITULAR</option>
                    </select>
                  </div>
                </td>
              </tr>

              <tr>
                <td>TOTAL HORAS</td>
                <td>
                  <InputEditable
                    v-model="fields.totalHoras"
                    placeholder="Total horas"
                    aria-label="Total horas"
                  />
                </td>
                <td></td>
              </tr>
            </tbody>
          </table>
          <!-- <div class="font-weight-bold">RESUELVO:</div> -->
          <div class="small text-muted mb-2">2. Distribución horaria:</div>

          <div class="table-responsive">
            <table class="table table-bordered">
              <thead class="thead-light">
                <tr>
                  <th>Fuente de financiamiento</th>
                  <th>Nivel</th>
                  <th>Horas</th>
                  <th>Asignatura / Función</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(item, index) in fields.distribucion" :key="index">
                  <td>
                    <select
                      class="form-control form-control-sm"
                      v-model="item.fuente"
                      required
                    >
                      <option value="">Seleccione…</option>
                      <option>A CONTRATA SUBV. NORMAL</option>
                      <option>JORNADA ESCOLAR COMPLETA</option>
                      <option>SUBVENCIÓN PIE D.170</option>
                      <option>SUBVENCIÓN PIE</option>
                      <option>SUBVENCIÓN SEP</option>
                    </select>
                  </td>
                  <td>
                    <select
                      class="form-control form-control-sm"
                      v-model="item.nivel"
                      required
                    >
                      <option value="">Seleccione…</option>
                      <option>Basica</option>
                      <option>Media</option>
                    </select>
                  </td>
                  <td>
                    <input
                      type="number"
                      class="form-control form-control-sm"
                      v-model.number="item.horas"
                      min="1"
                      max="44"
                      required
                    />
                  </td>
                  <td>
                    <input
                      type="text"
                      class="form-control form-control-sm"
                      v-model="item.funcion"
                      required
                    />
                  </td>
                  <td>
                    <button
                      type="button"
                      class="btn btn-sm btn-danger"
                      @click="removeRow(index)"
                    >
                      Eliminar
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <button
            type="button"
            class="btn btn-sm btn-secondary"
            @click="addRow"
          >
            Agregar fila
          </button>

          <!-- Totales -->
          <div class="mt-3">
            <p>
              <strong>Total horas Básica:</strong>
              {{ totalHorasBasica }}
            </p>
            <p>
              <strong>Total horas Media:</strong>
              {{ totalHorasMedia }}
            </p>
            <p>
              <strong>Total horas Global:</strong>
              {{ totalHorasTotal }}
            </p>
            <small class="text-muted"
              >El total debe estar entre 1 y 44 horas.</small
            >
          </div>
        </div>

        <!-- Párrafos estáticos -->
        <div class="mt-3">
          <div class="text-center my-5">
            <select
              v-model="fields.firmanteId"
              @change="cambiarFirmante"
              class="form-control form-control-sm inline-input"
            >
              <option :value="f.id" v-for="f in firmantes" :key="f.id">
                {{ f.nombre }}
              </option>
            </select>
            <p class="h6 font-weight-bold">{{ fields.firmanteRut }}</p>
            <p class="h6 font-weight-bold">{{ fields.firmanteCargo }}</p>
            <p class="h6 font-weight-bold">
              SERVICIO LOCAL DE EDUCACIÓN PÚBLICA DE CHINCHORRO
            </p>
          </div>
        </div>

        <!-- DISTRIBUCIÓN dinámico -->
        <div class="font-weight-bold">DISTRIBUCIÓN:</div>
        <div class="my-3">
          <div
            v-for="(d, idx) in distribucionList"
            :key="d.id"
            class="d-flex mb-2 align-items-start"
          >
            <div class="flex-grow-1">
              <template v-if="d.text">
                <p>- {{ d.text }}</p>
              </template>
              <template v-else>
                <input
                  class="form-control highlight-celeste"
                  v-model="d.text"
                  :placeholder="`Distribución ${idx + 1}`"
                  @blur="onBlurDistribucion(idx)"
                />
              </template>
            </div>
            <i
              class="bi bi-trash3 text-danger ml-2 pointer"
              @click="removeDistribucion(idx)"
            ></i>
          </div>
          <div class="d-flex align-items-center">
            <button
              class="btn btn-secondary btn-sm mr-3"
              @click="addDistribucion"
              type="button"
            >
              Agregar unidad de distribución
            </button>
            <small class="text-muted"
              >Agregar o quitar unidades de distribución</small
            >
          </div>
        </div>

        <div class="d-flex my-4 justify-content-end">
          <button class="btn btn-primary mr-2" @click="saveDraft" type="button">
            Guardar borrador
          </button>

          <button
            class="btn btn-success mr-2"
            @click="GeneratePDF"
            type="button"
            :disabled="isGeneratingPdf"
          >
            <span
              v-if="isGeneratingPdf"
              class="spinner-border spinner-border-sm"
              role="status"
              aria-hidden="true"
            ></span>
            <span v-if="isGeneratingPdf">Generando...</span>
            <span v-else>Generar PDF</span>
          </button>

          <button
            class="btn btn-outline-secondary"
            @click="loadFromApi"
            type="button"
          >
            Recargar desde API
          </button>
        </div>
      </section>
    </div>
  </div>
  <div
    v-if="showPdfComponent"
    style="position: absolute; left: -9999px; top: -9999px; width: 900px"
  >
    <ResolucionPDF
      ref="pdfComponent"
      :data="pdfData"
      :autoGenerate="autoGeneratePdf"
      :autoOpenInNewTab="false"
      @pdf-generated="onPdfGenerated"
      @pdf-error="onPdfError"
    />
  </div>
</template>

<script setup>
import { ref, reactive, onMounted, computed, nextTick } from "vue";
import { useRouter, useRoute } from "vue-router";

/* Assets en public/src/assets/ */
import flagUrl from "../assets/img/flag.png";
import logoEducacionUrl from "../assets/img/logoDEP.png";
import logoChinchorroUrl from "../assets/img/Logotipo-Chinchorro-web.png";
import InputEditable from "../components/inputEditable.vue";
import {
  obtenerCartaOfertaPorId,
  listarFirmantes,
} from "../services/cartaOfertaService";
import { formatDate, FormatearFecha } from "../utils/validaciones";
import ResolucionPDF from "../components/Resolucion.vue";
import swal from "sweetalert2";

const showPdfComponent = ref(false);
const autoGeneratePdf = ref(true);
const pdfComponent = ref(null);
const isEditingVisto = ref(false);
const router = useRouter();
const route = useRoute();
const isGeneratingPdf = ref(false);

/* Editable "VISTO" */
const vistoText = ref(
  `La ley N°21.722 de Presupuestos del Sector Público para el año 2025; La ley N° 21.040 que crea el Sistema de Educación Pública; el Decreto con fuerza de ley N°39,de fecha 21 de Diciembre 2018, del Ministerio de Educación, que fija planta de personal del Servicio Local de Educación Pública de Chinchorro que comprende las comunas de Arica, Camarones, Putre y General Lagos y otras materias que indica; la Ley N° 18.575 Orgánica Constitucional de Bases Generales de la Administración del Estado; la Ley N°19.880 que establece Bases de los Procedimiento Administrativos; la Ley N° 18.834, sobre Estatuto Administrativo; la Resolución N° 06, de 2019 fija normas sobre exención del trámite de toma de razón de las materias de personal que indica; el Decreto N° 11 de 2021 que establece el orden de subrogancia de Director Ejecutivo; el Decreto Supremo N° 50 de 2024 que nombra Director Ejecutivo del Servicio Local de Educación Pública de Chinchorro; y las, facultades que invisto como Director Ejecutivo del Servicio Local de Educación Pública de Chinchorro;`
);

let nextId = 1;
function newId() {
  return nextId++;
}

const considerandoList = ref([
  {
    id: newId(),
    text: `Que, la Ley 19.070 en su artículo N°6 establece “La función docente es aquella de carácter profesional de nivel superior, que lleva a cabo directamente los procesos sistemáticos de enseñanza y educación, lo que incluye el diagnóstico, planificación, ejecución y evaluación de los mismos procesos y de las actividades educativas generales y complementarias que tienen lugar en las unidades educacionales de nivel parvulario, básico y medio”.`,
  },
  {
    id: newId(),
    text: `Que, el Art. 22 de la ley 21.040 letra d establece que el director ejecutivo podrá “Contratar y designar, así como poner término a las funciones del personal del Servicio Local y de los profesionales de la educación, asistentes de la educación y otros profesionales de los establecimientos educacionales de su dependencia, de conformidad a la normativa vigente, según corresponda”.`,
  },
]);

const fields = reactive({
  establecimiento: "",
  nombre: "",
  rut: "",
  horasContrata: null,
  funcionContrato: "",
  firmanteId: 1,
  firmanteRut: "",
  firmanteCargo: "",
  totalHoras: 0,
  fechaInicio: "",
  fechaTermino: "28/02/2025",
  calidadJuridica: 1,
  tipo_vacante_id: 0,
  distribucion: [],
});

// Agregar una fila nueva
function addRow(funcion = "") {
  if (typeof funcion === "object") {
    funcion = "";
  }
  fields.distribucion.push({
    fuente: "", // Ej: "A CONTRATA SUBV. NORMAL"
    nivel: "", // "Basica" o "Media"
    horas: 0, // Número de horas
    funcion: funcion || "", // Asignatura o función
  });
}

function updateNivel() {
  let text = "";
  if (totalHorasBasica.value > 0) {
    text = `(${totalHorasBasica.value}) EDUCACIÓN BÁSICA`;
  }
  if (totalHorasMedia.value > 0) {
    if (text.length > 0) {
      text += "/";
    }
    text += ` (${totalHorasMedia.value}) EDUCACIÓN MEDIA`;
  }
  return text;
}

// Eliminar una fila por índice
function removeRow(index) {
  fields.distribucion.splice(index, 1);
}

// Totales calculados automáticamente
const totalHorasBasica = computed(() =>
  fields.distribucion
    .filter((item) => item.nivel === "Basica")
    .reduce((sum, item) => sum + (item.horas || 0), 0)
);

const totalHorasMedia = computed(() =>
  fields.distribucion
    .filter((item) => item.nivel === "Media")
    .reduce((sum, item) => sum + (item.horas || 0), 0)
);

const totalHorasTotal = computed(
  () => totalHorasBasica.value + totalHorasMedia.value
);

// Validación de la distribución
function validarDistribucion() {
  if (!fields.distribucion.length) {
    return "Debe registrar al menos una fila en la distribución horaria.";
  }
  if (totalHorasTotal.value < 1 || totalHorasTotal.value > 44) {
    return "El total de horas debe estar entre 1 y 44.";
  }
  const filaIncompleta = fields.distribucion.find(
    (d) => !d.fuente || !d.nivel || !d.horas || !d.funcion
  );
  if (filaIncompleta) {
    return "Complete todos los campos en cada fila (fuente, nivel, horas, función).";
  }
  return null; // Distribución válida
}

const tercerConsiderando = ref("");

const distribucionList = ref([
  { id: newId(), text: "Subdirección Gestión y Desarrollo de Personas" },
  { id: newId(), text: "Unidad de remuneraciones" },
  { id: newId(), text: "Carpeta funcionario/a" },
  { id: newId(), text: "Oficina de partes" },
]);

// Datos computados para el PDF
const pdfData = computed(() => ({
  visto: vistoText.value,
  considerando: considerandoList.value.map((item) => item.text),
  establecimiento: fields.establecimiento,
  nombre: fields.nombre,
  rut: fields.rut,
  nivel_ensenanza: updateNivel(),
  horas: fields.horasContrata,
  funcion: fields.funcionContrato,
  total_horas: totalHorasTotal.value,
  fecha_inicio: fields.fechaInicio,
  fecha_termino: fields.fechaTermino,
  sign_name: fields.firmanteNombre,
  sign_role: fields.firmanteCargo,
  tipo_vacante_id: fields.tipo_vacante_id,
  calidad_juridica: fields.calidadJuridica,
  distribucion_horaria: fields.distribucion,
  distribution: distribucionList.value,
}));

const firmantes = ref(null);

function cambiarFirmante() {
  const newFirmante = firmantes.value.find(
    (f) => f.id === parseInt(fields.firmanteId)
  );
  if (newFirmante) {
    fields.firmanteRut = newFirmante.rut;
    fields.firmanteNombre = newFirmante.nombre;
    fields.firmanteCargo = newFirmante.cargo;
  }
}

async function loadFromApi() {
  try {
    firmantes.value = await listarFirmantes();
    cambiarFirmante();
    const data = await obtenerCartaOfertaPorId(route.params.id);
    console.log(data);
    fields.establecimiento = data.institucione.nombre.toUpperCase();
    fields.nombre = data.Candidato.nombre_completo.toUpperCase();
    fields.rut = data.Candidato.rut;
    fields.totalHoras = data.horas_pactadas;
    fields.tipo_vacante_id = data.Convocatorium.tipo_vacante_id;
    fields.fechaInicio = formatDate(data.fecha_ingreso);
    fields.funcionContrato = data.cargo.nombre.toUpperCase();
    considerandoList.value.push({
      id: newId(),
      text: `Que, con fecha ${FormatearFecha(
        data.fecha_ingreso
      )}, la Subdirección de Apoyo Técnico y Pedagógico remite a la Subdirección de Gestión y Desarrollo de Personas, planilla de distribución horaria año escolar 2026, insumo necesario para gestionar nombramientos de profesionales de la educación del establecimiento educacional ${
        fields.establecimiento
      }.`,
    });
    addRow(data.cargo.nombre.toUpperCase());
  } catch (e) {
    console.warn("No se cargaron datos desde API, usando valores por defecto");
  }
}

const habilitarFechaTermino = () => {
  fields.fechaTermino = null;
};

onMounted(() => {
  if (route.params.id) {
    console.log("Esta es la id = " + route.params.id);
  } else {
    alert("error");
  }
  loadFromApi();
});

function addConsiderando() {
  considerandoList.value.push({ id: newId(), text: "" });
}
function removeConsiderando(i) {
  considerandoList.value.splice(i, 1);
}
function addDistribucion() {
  distribucionList.value.push({ id: newId(), text: "" });
}
function removeDistribucion(i) {
  distribucionList.value.splice(i, 1);
}
async function GeneratePDF(params) {
  isGeneratingPdf.value = true;
  showPdfComponent.value = true;
  autoGeneratePdf.value = true;

  if (totalHorasTotal.value != fields.totalHoras) {
    swal.fire({
      icon: "error",
      title: "Error",
      text: "La distribución horaria no coincide con las horas pactadas",
    });
    showPdfComponent.value = false;
    autoGeneratePdf.value = false;
    isGeneratingPdf.value = false;
    return;
  }

  // Esperar a que Vue renderice el componente
  await nextTick();

  // Verificar que el componente existe y llamar al método
  if (pdfComponent.value && pdfComponent.value.generatePDF) {
    pdfComponent.value.generatePDF();
    isGeneratingPdf.value = false;
  } else {
    console.error("El componente PDF no está disponible");
  }

  showPdfComponent.value = false;
  autoGeneratePdf.value = false;
}
function onPdfGenerated() {
  console.log("PDF generado exitosamente");
}
function onPdfError(error) {
  console.error("Error al generar PDF:", error);
  alert("Error al generar el PDF");
}
</script>

<style scoped>
.highlight-green {
  background: #d9f5d9;
  border-radius: 3px;
}
.highlight-yellow {
  background: #fff6cc;
  border-radius: 3px;
  display: inline-block;
}
.highlight-burdeo {
  background: #f7dede;
  border-left: 4px solid #8b1b1b;
  border-radius: 2px;
}
.highlight-celeste {
  background: #e6f7ff;
  border-radius: 3px;
}

/* Small layout tweaks */
.doc-table td,
.doc-table th {
  vertical-align: top;
}
.repeat-item textarea {
  resize: vertical;
}

/* Reduce default textarea font to match doc */
.doc-textarea {
  font-family: "Times New Roman", Times, serif;
}

.distribucion-item {
  display: flex;
  align-items: center;
}
.distribucion-item:hover {
  background-color: #f8d7da;
}
</style>
