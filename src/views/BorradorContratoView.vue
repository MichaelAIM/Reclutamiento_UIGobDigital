<template>
  <div class="resolucion-sheet py-4">
    <section class="contract-body">
      <div class="contract-title my-5">
        <strong>CONTRATO DE TRABAJO DE ASISTENTE DE LA EDUCACIÓN</strong>
      </div>

      <div class="contract-paragraph">
        En Arica, a
        <div class="highlight-yellow p-1">
          <input
            type="text"
            v-model="data.fecha_resol"
            class="form-control form-control-sm inline-input"
          />
        </div>
        , entre el
        <strong>SERVICIO LOCAL DE EDUCACIÓN PÚBLICA DE CHINCHORRO</strong>
        , en adelante el Servicio Local, RUT N°
        <strong>62.000.660-2</strong>
        , representado por su Directora Ejecutiva (s), doña
        <div class="highlight-yellow p-1">
          <select
            v-model="data.repID"
            class="form-control form-control-sm inline-input"
          >
            <option value="1">JULIO VERDEJO AQUEVEQUE</option>
            <option value="2">WALTER VALLEJOS GONZÄLEZ</option>
          </select>
        </div>
        , cédula nacional de identidad Nº
        <strong v-if="data.repRUT">{{ data.repRUT }}</strong>
        <input
          v-else
          v-model="data.repRUT"
          class="form-control form-control-sm inline-input"
        />
        , ambos con domicilio en
        <strong v-if="data.empleadorDomicilio">{{
          data.empleadorDomicilio
        }}</strong>
        <input
          v-else
          v-model="data.empleadorDomicilio"
          class="form-control form-control-sm inline-input"
        />
        ; en adelante "el Empleador" y don(a)
        <strong v-if="data.trabajadorNombre">{{
          data.trabajadorNombre
        }}</strong>
        <input
          v-else
          v-model="data.trabajadorNombre"
          class="form-control form-control-sm inline-input"
        />
        , RUN
        <strong v-if="data.trabajadorRUN">{{ data.trabajadorRUN }}</strong>
        <input
          v-else
          v-model="data.trabajadorRUN"
          class="form-control form-control-sm inline-input"
        />
        ,
        <strong v-if="data.trabajadorNacionalidad">{{
          data.trabajadorNacionalidad
        }}</strong>
        <input
          v-else
          v-model="data.trabajadorNacionalidad"
          class="form-control form-control-sm inline-input"
        />
        ,
        <strong v-if="data.trabajadorEstado">{{
          data.trabajadorEstado
        }}</strong>
        <input
          v-else
          v-model="data.trabajadorEstado"
          class="form-control form-control-sm inline-input"
        />
        , domiciliado en
        <strong v-if="data.trabajadorDomicilio">{{
          data.trabajadorDomicilio
        }}</strong>
        <input
          v-else
          v-model="data.trabajadorDomicilio"
          class="form-control form-control-sm inline-input"
        />
        , en adelante "el Trabajador", expresan que han convenido en el
        siguiente contrato de trabajo:
      </div>

      <div class="contract-paragraph">
        <strong>PRIMERO:</strong> El trabajador
        <strong v-if="data.primer_cargo">{{ data.primer_cargo }}</strong>
        <input
          v-else
          v-model="data.primer_cargo"
          class="form-control form-control-sm inline-input"
        />
        es contratado en su categoría de
        <strong v-if="data.primer_categoria">{{
          data.primer_categoria
        }}</strong>
        <input
          v-else
          v-model="data.primer_categoria"
          class="form-control form-control-sm inline-input"
        />
        y se compromete a realizar las funciones de
        <strong v-if="data.primer_funciones">{{
          data.primer_funciones
        }}</strong>
        <input
          v-else
          v-model="data.primer_funciones"
          class="form-control form-control-sm inline-input"
        />
        o cualquier otra labor que le encomiende el Empleador o sus jefes
        directos; y, consecuencialmente, a realizar todas aquellas actividades,
        funciones o servicios que emanen de la naturaleza de su trabajo, de la
        Ley, los Reglamentos e instrucciones que le impartan sus jefes directos.
      </div>

      <div class="contract-paragraph">
        <strong>SEGUNDO:</strong> El trabajador deberá prestar sus servicios en
        el
        <strong v-if="data.segundo_establecimiento">{{
          data.segundo_establecimiento
        }}</strong>
        <input
          v-else
          v-model="data.segundo_establecimiento"
          class="form-control form-control-sm inline-input"
        />
        , de la ciudad de
        <strong v-if="data.segundo_ciudad">{{ data.segundo_ciudad }}</strong>
        <input
          v-else
          v-model="data.segundo_ciudad"
          class="form-control form-control-sm inline-input"
        />
        . Sin embargo, el Empleador podrá destinarle a cualquiera de las
        oficinas o dependencias de este Servicio Local dentro de la misma ciudad
        o comuna.
      </div>

      <div class="contract-paragraph">
        <strong>TERCERO:</strong> La jornada de trabajo será de
        <strong v-if="data.tercero_horas">{{ data.tercero_horas }}</strong>
        <input
          v-else
          v-model="data.tercero_horas"
          class="form-control form-control-sm inline-input"
        />
        horas semanales distribuidas de la siguiente forma:
      </div>

      <div class="ml-3">
        <strong> LUNES A JUEVES: de </strong>
        <div class="highlight-yellow p-1">
          <input
            type="time"
            v-model="data.tercero_lunes_inicio"
            class="form-control form-control-sm inline-input"
          />
        </div>
        <strong> a </strong>
        <div class="highlight-yellow p-1">
          <input
            type="time"
            v-model="data.tercero_lunes_fin"
            class="form-control form-control-sm inline-input"
          />
        </div>
        <br />
        <div class="my-1">
          <strong> VIERNES: de </strong>
          <div class="highlight-yellow p-1">
            <input
              type="time"
              v-model="data.tercero_viernes_inicio"
              class="form-control form-control-sm inline-input"
            />
          </div>
          <strong> a </strong>
          <div class="highlight-yellow p-1">
            <input
              type="time"
              v-model="data.tercero_viernes_fin"
              class="form-control form-control-sm inline-input"
            />
          </div>
        </div>
      </div>

      <div class="contract-paragraph">
        <strong>CUARTO:</strong> El Trabajador percibirá un sueldo base de
        <div class="highlight-yellow p-1">
          <input
            v-model.number="data.sueldo"
            type="number"
            class="form-control form-control-sm inline-input"
          />
        </div>
        ({{ data.sueldo_texto }}.-), por mes calendario, la que será liquidada y
        pagada por períodos vencidos, en las oficinas del empleador, el día 30
        de cada mes.
      </div>

      <div class="contract-paragraph">
        <strong>QUINTO:</strong> El presente gasto será con cargo a
        <div class="highlight-yellow p-1">
          <input
            type="text"
            v-model="data.quinto_fuente"
            class="form-control form-control-sm inline-input"
          />.
        </div>
      </div>

      <div class="contract-paragraph">
        <strong>UNDÉCIMO:</strong> La vigencia del presente contrato es a contar
        del
        <strong v-if="data.undecimo_inicio">{{ data.undecimo_inicio }}</strong>
        <input
          v-else
          v-model="data.undecimo_inicio"
          class="form-control form-control-sm inline-input"
        />
        hasta el
        <div class="highlight-yellow p-1">
          <input
            type="text"
            v-model="data.undecimo_termino"
            class="form-control form-control-sm inline-input"
          />
        </div>
        , y podrá ponérsele término cuando concurran para ello causas
        justificadas.
      </div>

      <div class="contract-paragraph">
        <strong>DUODÉCIMO:</strong> Se deja constancia que el Trabajador comenzó
        a prestar sus servicios en el Servicio Local de Educación Pública
        Chinchorro, el día
        <strong v-if="data.duodecimo_inicio">{{
          data.duodecimo_inicio
        }}</strong>
        <input
          v-else
          v-model="data.duodecimo_inicio"
          class="form-control form-control-sm inline-input"
        />.
      </div>

      <div class="contract-paragraph">
        <strong>DÉCIMO:</strong> Se deja constancia que la personería de Doña
        <strong>{{ data.repNombre }}</strong>
        , consta en la Resolución Exenta RA N°
        <strong v-if="data.decimo_resol">{{ data.decimo_resol }}</strong>
        <input
          v-else
          v-model="data.decimo_resol"
          class="form-control form-control-sm inline-input"
        />
        que la nombra en calidad de Titular Directivo/a jefe/a de Unidad de
        Apoyo Técnico Pedagógico del Servicio Local de Educación Pública de
        Chinchorro; el Decreto N°11 de 25 de enero de 2021, que establece el
        orden de subrogancia de Director Ejecutivo y en uso de las facultades
        que me asisten como Directora Ejecutiva (S) del Servicio Local de
        Educación Pública de Chinchorro.
      </div>

      <div class="contract-paragraph">
        <strong>DÉCIMO:</strong> El motivo que origina la celebración del
        presente contrato es por
        <div class="highlight-yellow p-1">
          <input
            type="text"
            :value="data.decimo_motivo"
            class="form-control form-control-sm inline-input"
            style="min-width: 350px"
          />
        </div>
        .
      </div>

      <!-- Tabla de firmas - preserva texto exacto -->
      <div class="mt-3">
        <div class="pt-2">
          <table class="table table-borderless">
            <tbody style="font-size: 10pt">
              <tr class="text-center">
                <td>
                  <div class="signature-line">
                    <strong>{{ data.trabajadorNombre }}</strong>
                    <br />
                    <strong>{{ data.trabajadorRUN }}</strong>
                  </div>
                </td>
                <td>
                  <div class="signature-line px-3">
                    <strong>
                      {{ data.repNombre }}
                    </strong>
                    <br />
                    <strong>
                      {{ data.repCargo }}
                    </strong>
                    <br />
                    <strong
                      >SERVICIO LOCAL DE EDUCACIÓN PÚBLICA DE CHINCHORRO</strong
                    >
                    <br />
                    <strong>RUT N° 62.000.660-2</strong>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Botones de control -->
      <div class="d-flex my-4 justify-content-center gap-3">
        <button
          class="btn btn-primary"
          @click="saveDraft"
          type="button"
          :disabled="generatingPDF"
        >
          Guardar borrador
        </button>
        <button
          class="btn btn-success"
          @click="abrirPDF"
          type="button"
          :disabled="generatingPDF"
        >
          <span
            v-if="generatingPDF"
            class="spinner-border spinner-border-sm me-2"
          ></span>
          {{ generatingPDF ? "Generando..." : "Generar Vista Previa" }}
        </button>
        <button
          class="btn btn-info"
          @click="generateAndDownloadPDF"
          type="button"
          :disabled="generatingPDF"
        >
          Aceptar e enviar PDF directamente
        </button>
        <button
          class="btn btn-outline-secondary"
          @click="resetFromApi"
          type="button"
          :disabled="generatingPDF"
        >
          Recargar desde API
        </button>
      </div>

      <ContratoComponent
        v-if="mostrarContrato"
        ref="contratoRef"
        :data="data"
        @cerrarVista="cerrarVistaContrato"
      />
    </section>
  </div>
</template>

<script setup>
import { reactive, ref, computed, nextTick, onMounted } from "vue";
import ContratoComponent from "../components/Contrato.vue";
import { obtenerCartaOfertaPorId } from "../services/cartaOfertaService";
import {
  formatoMoneda,
  numeroATexto,
  formatearFechaHoy,
} from "../utils/validaciones";
import { useRouter, useRoute } from "vue-router";
const router = useRouter();
const route = useRoute();
const contratoRef = ref(null);
const generatingPDF = ref(false);
const autoGeneratePDF = ref(false);
const mostrarContrato = ref(false);

const data = reactive({
  fecha_resol: formatearFechaHoy(),
  repID: 1,
  repRUT: "12355432-9",
  repNombre: "JULIO VERDEJO AQUEVEQUE ",
  repCargo: "FIRMA DIRECTORA EJECUTIVA (S)",
  empleadorDomicilio: "Calle Codpa Nº2173",
  trabajadorNombre: "JOHANNA DE LOURDES TOMALA CHAVEZ",
  trabajadorRUN: "23025402-8",
  trabajadorNacionalidad: "Ecuatoriana",
  trabajadorEstado: "casada",
  trabajadorDomicilio: "Av. Juan Antonio Ríos #926, comuna de Arica",
  primer_cargo: "Asistente de la Educación",
  primer_categoria: "ADMINISTRATIVO",
  primer_funciones: "INSPECTORA DE PATIO",
  segundo_establecimiento: "LICEO JOVINA NARANJO FERNÁNDEZ",
  segundo_ciudad: "Arica",
  tercero_horas: "44",
  tercero_lunes_inicio: "08:00",
  tercero_lunes_fin: "17:00",
  tercero_viernes_inicio: "08:00",
  tercero_viernes_fin: "16:00",
  sueldo: 225879,
  sueldo_texto: "",
  quinto_fuente: "SUBVENCIÓN NORMAL",
  undecimo_inicio: "03 de marzo de 2025",
  undecimo_termino: "28 de febrero de 2026",
  duodecimo_inicio: "03 de marzo de 2025",
  decimo_resol: "RA Nº125934/191/2023",
  decimo_motivo: "NECESIDADES DEL SERVICIO",
});

const sueldoTexto = computed(() => {
  if (data.sueldo === null || data.sueldo === undefined || data.sueldo === "") {
    return null;
  }
  const numeroLimpio = data.sueldo.toString().replace(/[$,]/g, "");
  const numero = parseInt(numeroLimpio);
  return numeroATexto(isNaN(numero) ? null : numero);
});

const contractRef = ref(null);

function cerrarVistaContrato() {
  mostrarContrato.value = false;
}

async function abrirPDF() {
  generatingPDF.value = true;
  mostrarContrato.value = true;
  await nextTick(); // espera que Vue actualice el DOM
  await new Promise((r) => setTimeout(r, 250)); // espera extra para asegurar render

  if (!contratoRef.value || !contratoRef.value.generatePDFInNewTab) {
    console.error("Referencia al contrato no disponible");
    generatingPDF.value = false;
    mostrarContrato.value = false;

    return;
  }

  try {
    await contratoRef.value.generatePDFInNewTab();
  } catch (err) {
    console.error("Error al generar PDF:", err);
  } finally {
    generatingPDF.value = false;
  }
}

function saveDraft() {
  console.log("Guardando borrador...", data);
  // Implementar lógica de guardado
}

async function resetFromApi(nuevoId) {
  console.log("Recargando desde API...");
  // Implementar lógica de recarga desde API

  const dataos = await obtenerCartaOfertaPorId(nuevoId);
  console.log("datos", dataos);
}

onMounted(async () => {
  data.sueldo_texto = sueldoTexto;
  resetFromApi(route.params.id);
});
</script>

<style scoped>
.highlight-yellow {
  background: #fff6cc;
  border-radius: 3px;
  display: inline-block;
}

.resolucion-sheet {
  font-size: 10pt;
  color: #000;
  background: #fff;
  max-width: 900px;
  margin: 0 auto;
  line-height: 1.5;
}

strong {
  font-size: 10pt;
}

/* Header text */
.header-text .entity {
  font-size: 12pt;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.04em;
}

/* Body */
.contract-body p {
  margin-bottom: 0.85rem;
  text-align: justify;
}

/* Inputs inline para reemplazar negritas vacías */
.inline-input {
  display: inline-block;
  width: auto;
  min-width: 120px;
  max-width: 420px;
  padding: 0.125rem 0.35rem;
  font-size: 10pt;
  line-height: 1.2;
  border: 1px dashed #bbb;
  border-radius: 2px;
  margin-left: 4px;
}

/* Evita que los inputs rompan el layout en PDF */
.inline-input {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* Firma */
.signature-line {
  min-height: 32px;
  margin-top: 8px;
}

/* Listas */
.contract-body ul {
  margin-left: 1.25rem;
}
.contract-title {
  text-align: center;
  font-size: 1.1em;
}

.contract-paragraph {
  margin-bottom: 0.85rem;
  text-align: justify;
  line-height: 1.5;
}

.d-inline-block {
  display: inline-block;
}
/* Impresión/PDF */
@media print {
  .inline-input {
    border: none;
    background: transparent;
  }
  .resolucion-sheet {
    max-width: 100%;
    padding: 10mm;
    font-size: 10pt;
  }
}

/* Page size guidance */
@page {
  size: 216mm 330mm;
  margin: 12mm;
}
</style>
