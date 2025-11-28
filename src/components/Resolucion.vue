<template>
  <div class="resolucion-sheet" ref="resolucionRef">
    <!-- Opcional logo central encima del texto (si se proporciona) -->
    <div class="row">
      <div class="col-6" style="align-content: center">
        <div class="text-left mb-2">
          <img
            :src="logoCenter"
            alt="logo-center"
            class="logo-center img-fluid"
          />
        </div>
      </div>
      <div class="col-6 text-justify">
        <div class="header-text">
          <div class="entity">
            SERVICIO LOCAL DE EDUCACIÓN PÚBLICA DE CHINCHORRO
          </div>
          <div class="entity my-3">RESOLUCIÓN EXENTA</div>
          <div class="entity mt-2">
            NÓMBRESE AL PROFESIONAL DE LA EDUCACIÓN PARA CUMPLIR LABORES
            DOCENTES A CONTRATA.
          </div>
        </div>
      </div>
    </div>

    <!-- Resto del documento (idéntico al anterior) -->
    <section class="mt-3">
      <br />
      <div class="section-title">VISTO:</div>
      <br />
      <div class="section-body">
        {{ props.data.visto }}
      </div>
    </section>
    <br />
    <br />
    <section class="mt-3">
      <div class="section-title">CONSIDERANDO:</div>
      <br />
      <div
        v-for="item in props.data.considerando"
        :key="item"
        class="section-body mb-2"
      >
        {{ item }}
      </div>
    </section>

    <div class="page-break"></div>

    <section class="mt-3">
      <div class="section-title">RESUELVO:</div>
      <br />
      <ol class="resoluciones-list">
        <li>
          <span class="font-weight-bold">NÓMBRESE</span>, al profesional de la
          educación que cumplirá funciones docentes que se indican a
          continuación:
          <div class="table-responsive mt-3">
            <table class="table table-bordered table-fixed">
              <tbody>
                <tr>
                  <td>ESTABLECIMIENTO</td>
                  <td colspan="2" class="cell-left">
                    {{ props.data.establecimiento }}
                  </td>
                </tr>
                <tr>
                  <td>NOMBRE</td>
                  <td colspan="2" class="cell-left">
                    {{ props.data.nombre }}
                  </td>
                </tr>
                <tr>
                  <td>RUT</td>
                  <td colspan="2" class="cell-left">
                    {{ props.data.rut }}
                  </td>
                </tr>
                <tr>
                  <td class="cell-strong">TIPO DE FUNCIÓN</td>
                  <td colspan="2" class="cell-left">DOCENTE</td>
                </tr>
                <tr>
                  <td>NIVEL O MODALIDAD ENSEÑANZA</td>
                  <td colspan="2" class="cell-left">
                    {{ props.data.nivel_ensenanza }}
                  </td>
                </tr>

                <tr class="table-head">
                  <td class="cell-strong">FUENTE DE FINANCIAMIENTO</td>
                  <td class="cell-strong">HORAS</td>
                  <td class="cell-strong">ASIGNATURA Y/O FUNCIÓN</td>
                </tr>

                <tr>
                  <td>A CONTRATA SUBV. NORMAL</td>
                  <td class="cell-left">
                    {{ props.data.horas }}
                  </td>
                  <td class="cell-left">DOCENTE</td>
                </tr>

                <tr>
                  <td>JORNADA ESCOLAR COMPLETA</td>
                  <td>{{ props.data.jornada }}</td>
                  <td>
                    {{ props.data.asignatura }}
                  </td>
                </tr>

                <tr>
                  <td>SUBVENCIÓN PIE D.170</td>
                  <td>{{ props.data.subvencion_pie }}</td>
                  <td>{{ props.data.asignatura }}</td>
                </tr>

                <tr>
                  <td>SUBVENCIÓN PIE</td>
                  <td>{{ props.data.subvencion_pie }}</td>
                  <td>{{ props.data.asignatura }}</td>
                </tr>

                <tr>
                  <td>SUBVENCIÓN SEP</td>
                  <td>{{ props.data.subvencion_sep }}</td>
                  <td>{{ props.data.asignatura }}</td>
                </tr>

                <tr>
                  <td>TOTAL HORAS</td>
                  <td class="cell-left">{{ props.data.total_horas }}</td>
                  <td></td>
                </tr>

                <tr>
                  <td>FECHA DE INICIO</td>
                  <td colspan="2" class="cell-left">
                    {{ props.data.fecha_inicio }}
                  </td>
                </tr>

                <tr>
                  <td>FECHA DE TÉRMINO</td>
                  <td colspan="2" class="cell-left">
                    {{ props.data.fecha_termino }} o hasta que sus servicios
                    sean necesarios
                  </td>
                </tr>

                <tr>
                  <td class="cell-strong">CALIDAD JURIDICA</td>
                  <td colspan="2" class="cell-left">CONTRATA</td>
                </tr>
              </tbody>
            </table>
          </div>
        </li>

        <li class="mb-2 text-justify">
          Por razones impostergables del buen servicio, el profesional asumió
          sus funciones a contar de la fecha señalada, sin esperar el término de
          la total tramitación de la presente resolución.
        </li>

        <li class="text-justify">
          IMPÚTESE, al presente gasto a la cuenta 21-02-001 Personal Contrata y
          las demás asignaciones que correspondan, según subvención de
          financiamiento, del presupuesto vigente para el año 2025 del Servicio
          Local de Educación Pública de Chinchorro.
        </li>
      </ol>
    </section>

    <section class="mt-4">
      <div class="final-line text-center">
        ANÓTESE, REGÍSTRESE, COMUNÍQUESE Y ARCHÍVESE
      </div>
      <br />
      <br />
      <div class="signature-block mt-4 text-center">
        <div class="sign-name">{{ props.data.sign_name }}</div>
        <!-- Este debe ser dinámico (props) -->
        <div class="sign-role">{{ props.data.sign_role }}</div>
        <!-- Este debe ser dinámico (props) -->
        <div class="sign-entity mt-1">
          SERVICIO LOCAL DE EDUCACIÓN PÚBLICA DE CHINCHORRO
        </div>
        <!-- Este debe ser dinámico (props) -->
      </div>

      <div class="distribution mt-4" style="font-size: 8pt">
        <div class="dist-title">DISTRIBUCIÓN:</div>
        <ul class="dist-list mb-0">
          <li v-for="item in props.data.distribution" :key="item.id">
            {{ item.name }}
          </li>
          <!-- Este debe ser dinámico (props) en v-for -->
        </ul>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import html2pdf from "html2pdf.js";

// Imágenes institucionales
import logoLeft from "../assets/img/flag.png";
import logoCenter from "../assets/img/logoDEP.png";
import logoRight from "../assets/img/Logotipo-Chinchorro-web.png";

const props = defineProps({
  data: { type: Object, required: false, default: () => ({}) },
  autoGenerate: { type: Boolean, default: false },
  autoOpenInNewTab: { type: Boolean, default: false },
});

const emit = defineEmits(["pdf-generated", "pdf-error"]);

// Referencia al contenedor de la resolución
const resolucionRef = ref(null);
const logoLeftImg = ref(null);
const logoRightImg = ref(null);
const autoDownloaded = ref(false);

// Esperar carga de imágenes antes de capturar
function waitForImages(containerEl, timeout = 8000) {
  return new Promise((resolve) => {
    const images = Array.from(containerEl.querySelectorAll("img"));
    if (!images.length) return resolve();
    let loaded = 0;
    const onDone = () => {
      loaded += 1;
      if (loaded >= images.length) resolve();
    };
    images.forEach((img) => {
      if (img.complete && img.naturalWidth !== 0) return onDone();
      const handle = () => {
        img.removeEventListener("load", handle);
        img.removeEventListener("error", handle);
        onDone();
      };
      img.addEventListener("load", handle);
      img.addEventListener("error", handle);
    });
    setTimeout(resolve, timeout);
  });
}

// Convertir imagen a base64
function getImageDataUrl(imgElement) {
  return new Promise((resolve, reject) => {
    if (!imgElement || !imgElement.complete) {
      reject(new Error("Imagen no cargada"));
      return;
    }

    const canvas = document.createElement("canvas");
    canvas.width = imgElement.naturalWidth;
    canvas.height = imgElement.naturalHeight;

    const ctx = canvas.getContext("2d");
    ctx.drawImage(imgElement, 0, 0);

    try {
      const dataUrl = canvas.toDataURL("image/png");
      resolve(dataUrl);
    } catch (err) {
      reject(err);
    }
  });
}

// Generar y descargar PDF
async function generateAndDownloadPDF(
  filename = `Rex_${new Date().getFullYear()}_${props.data.nombre}.pdf`
) {
  console.log("Iniciando generación de PDF...");

  // Capturar el elemento inmediatamente en una variable local
  const element = resolucionRef.value;

  console.log("element:", element);

  if (!element) {
    console.error("element es null o undefined");
    return;
  }

  if (!(element instanceof HTMLElement)) {
    console.error("element no es un elemento HTML válido");
    return;
  }

  console.log("element.innerHTML length:", element.innerHTML?.length);
  console.log("element.offsetWidth:", element.offsetWidth);
  console.log("element.offsetHeight:", element.offsetHeight);

  await waitForImages(element);
  await new Promise((r) => setTimeout(r, 250));

  const opt = {
    margin: [25, 20, 5, 20], // Margen superior para el encabezado
    filename,
    image: { type: "jpeg", quality: 0.98 },
    html2canvas: {
      scale: 2,
      useCORS: true,
      logging: false,
      scrollY: 0,
    },
    jsPDF: { unit: "mm", format: [216, 330], orientation: "portrait" },
    pagebreak: { mode: ["css", "legacy"] },
  };

  console.log("Configuración de html2pdf:", opt);

  try {
    // Intentar pasar el elemento directamente
    console.log("Intentando generar PDF con html2pdf...");
    const worker = html2pdf().set(opt).from(element);
    const pdf = await worker.toPdf().get("pdf");

    // Obtener el número total de páginas
    const totalPages = pdf.internal.getNumberOfPages();
    const pageWidth = pdf.internal.pageSize.getWidth();

    // Convertir las imágenes de los logos a base64
    const logoLeftData = await getImageDataUrlFromImport(logoLeft);
    const logoRightData = await getImageDataUrlFromImport(logoRight);

    try {
      if (logoLeftImg.value) {
        logoLeftData = await getImageDataUrl(logoLeftImg.value);
      }
      if (logoRightImg.value) {
        logoRightData = await getImageDataUrl(logoRightImg.value);
      }

      // Agregar encabezado en todas las páginas
      for (let i = 1; i <= totalPages; i++) {
        pdf.setPage(i);

        // Logo izquierdo
        if (logoLeftData) {
          pdf.addImage(logoLeftData, "PNG", 20, 5, 53, 8);
        }

        // Logo derecho
        if (logoRightData) {
          pdf.addImage(logoRightData, "PNG", pageWidth - 90, 5, 59, 16.5);
        }
      }

      console.log(`Encabezados agregados a ${totalPages} páginas`);
    } catch (imgErr) {
      console.warn(
        "No se pudieron procesar las imágenes del encabezado:",
        imgErr
      );
    }

    // Guardar el PDF
    await worker.save();
  } catch (err) {
    console.error("Error generando PDF", err);
    // Fallback con menor calidad
    opt.html2canvas.scale = 1;
    try {
      await html2pdf().set(opt).from(resolucionRef.value).save();
    } catch (e) {
      console.error("Error en fallback PDF", e);
    }
  }
}

// Función para convertir imágenes importadas a base64
function getImageDataUrlFromImport(imagePath) {
  return new Promise((resolve, reject) => {
    const img = new Image();
    img.crossOrigin = "anonymous";
    img.src = imagePath;
    img.onload = () => {
      const canvas = document.createElement("canvas");
      canvas.width = img.naturalWidth;
      canvas.height = img.naturalHeight;
      const ctx = canvas.getContext("2d");
      ctx.drawImage(img, 0, 0);
      resolve(canvas.toDataURL("image/png"));
    };
    img.onerror = reject;
  });
}

// Ejecutar al montar
onMounted(async () => {
  if (autoDownloaded.value) return;
  autoDownloaded.value = true;
});

function generatePDF() {
  generateAndDownloadPDF();
}

// Exponer la función para que el componente padre pueda llamarla
defineExpose({
  generatePDF,
});
</script>

<style scoped>
.resolucion-sheet {
  font-family: Verdana, Geneva, sans-serif;
  font-size: 10pt;
  color: #000;
  background: #fff;
  max-width: 900px;
  margin: 0 auto;
  line-height: 1.5;
  padding-top: 10px;
}

/* Header logos layout */
.header-logos {
  /* espacio para logos y texto central; mantiene proporciones del documento original */
  min-height: 85px;
}
.logo-col {
  width: 22%;
}
.logo-col-2 {
  width: 30%;
}
.logo {
  max-height: 70px;
  object-fit: contain;
}
.logo-center-wrapper {
  margin-top: -6px;
}
.logo-center {
  max-height: 100px;
  object-fit: contain;
}

/* Texto header */
.header-text .entity {
  font-size: 10pt;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.04em;
}
.header-text .title {
  font-size: 10pt;
  font-weight: 700;
  text-transform: uppercase;
}
.header-text .subtitle {
  font-size: 10pt;
  text-transform: uppercase;
  font-weight: 600;
}

/* Ajustes para que el texto quede exactamente centrado verticalmente respecto a logos */
.header-logos .header-text {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
}

/* Secciones y tablas siguen igual que antes */
.section-title {
  font-weight: 700;
  text-transform: uppercase;
  margin-bottom: 6px;
  font-size: 10pt;
}
.section-body {
  text-align: justify;
  white-space: pre-wrap;
  font-size: 10pt;
}

/* Tabla institucional */
.table-fixed {
  table-layout: fixed;
  width: 100%;
}
.table-bordered {
  border: 1px solid #000;
  border-collapse: collapse;
}
.table-bordered th,
.table-bordered td {
  border: 1px solid #000;
  padding: 6px;
  vertical-align: top;
  font-size: 9pt;
  word-wrap: break-word;
  white-space: pre-wrap;
}

/* Proporciones por columna */
.table-bordered td:nth-child(1),
.table-bordered th:nth-child(1) {
  width: 30%;
}
.table-bordered td:nth-child(2),
.table-bordered th:nth-child(2) {
  width: 35%;
}
.table-bordered td:nth-child(3),
.table-bordered th:nth-child(3) {
  width: 35%;
}

/* Encabezados de tabla */
.table-head td,
.table-head th {
  font-weight: 700;
  text-align: center;
}
.table-bordered td,
.table-bordered th {
  padding: 6px;
}

/* Celdas específicas */
.cell-center {
  text-align: center;
  font-weight: 700;
  text-transform: uppercase;
}
.cell-left {
  text-align: left;
}
.cell-strong {
  font-weight: 700;
  text-transform: uppercase;
}

.resoluciones-list {
  margin-left: 1rem;
  padding-left: 0.5rem;
}

.signature-block .sign-name {
  font-weight: 700;
  margin-bottom: 2px;
  letter-spacing: 0.02em;
}
.signature-block .sign-role {
  margin-top: 2px;
}
.signature-block .sign-entity {
  font-size: 12px;
  color: #000;
}

.dist-title {
  text-decoration: underline;
  text-transform: uppercase;
  margin-bottom: 6px;
}
.dist-list {
  margin-left: 1rem;
  list-style: none;
  padding-left: 0;
}
.dist-list li {
  margin-bottom: 4px;
}

.final-line {
  margin-top: 8px;
  font-weight: 700;
}

.page-break {
  page-break-before: always;
  break-before: page;
  height: 1px;
  margin: 20px 0 0 0;
}

@media print {
  .resolucion-sheet {
    max-width: 100%;
    font-size: 13px;
  }
  .logo {
    max-height: 65px;
  }
  .logo-center {
    max-height: 75px;
  }
  .page-break {
    page-break-before: always;
    break-before: page;
  }
}
@page {
  size: 216mm 330mm; /* folio */
}
</style>
