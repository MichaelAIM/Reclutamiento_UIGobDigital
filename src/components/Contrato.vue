<template>
  <div
    class="resolucion-sheet pt-4"
    ref="contractRef"
    style="z-index: -9999; position: relative"
  >
    <!-- Contrato c
     ompleto (texto original íntegro). Cada fragmento "editable" está enlazado a data. -->
    <section class="contract-body">
      <p class="text-center mb-1">
        <strong>CONTRATO DE TRABAJO DE ASISTENTE DE LA EDUCACIÓN</strong>
      </p>
      <hr class="mt-1 mb-4" />
      <p>
        En
        <strong>Arica</strong>
        , a
        <strong v-if="data.fecha_resol">{{ data.fecha_resol }}</strong>
        , entre el
        <strong>SERVICIO LOCAL DE EDUCACIÓN PÚBLICA DE CHINCHORRO</strong>
        , en adelante el Servicio Local, RUT N°
        <strong>62.000.660-2</strong>
        , representado por su Directora Ejecutiva (s), doña
        <strong v-if="data.repNombre">{{ data.repNombre }}</strong>
        , cédula nacional de identidad Nº
        <strong v-if="data.repRUT">{{ data.repRUT }}</strong>
        , ambos con domicilio en
        <strong>Calle Codpa N°2173</strong>
        ; en adelante “el Empleador” y don(a)
        <strong v-if="data.trabajadorNombre">{{
          data.trabajadorNombre
        }}</strong>
        , RUN
        <strong v-if="data.trabajadorRUN">{{ data.trabajadorRUN }}</strong>
        ,
        <strong v-if="data.trabajadorNacionalidad">{{
          data.trabajadorNacionalidad
        }}</strong>
        ,
        <strong v-if="data.trabajadorEstado">{{
          data.trabajadorEstado
        }}</strong>
        , domiciliado en
        <strong v-if="data.trabajadorDomicilio">{{
          data.trabajadorDomicilio
        }}</strong>
        , en adelante “el Trabajador”, expresan que han convenido en el
        siguiente contrato de trabajo:
      </p>

      <table class="table table-borderless text-justify">
        <tbody>
          <tr>
            <td><strong>PRIMERO:</strong></td>
            <td>
              El trabajador
              <strong>Asistente de la Educación</strong>

              es contratado en su categoría de
              <strong v-if="data.primer_categoria">{{
                data.primer_categoria
              }}</strong>

              y se compromete a realizar las funciones de
              <strong v-if="data.primer_funciones">{{
                data.primer_funciones
              }}</strong>

              o cualquier otra labor que le encomiende el Empleador o sus jefes
              directos; y, consecuencialmente, a realizar todas aquellas
              actividades, funciones o servicios que emanen de la naturaleza de
              su trabajo, de la Ley, los Reglamentos e instrucciones que le
              impartan sus jefes directos.
            </td>
          </tr>
          <tr>
            <td><strong>SEGUNDO:</strong></td>
            <td>
              El trabajador deberá prestar sus servicios en el
              <strong v-if="data.segundo_establecimiento">{{
                data.segundo_establecimiento
              }}</strong>

              , de la ciudad de
              <strong v-if="data.segundo_ciudad">{{
                data.segundo_ciudad
              }}</strong>

              . Sin embargo, el Empleador podrá destinarle a cualquiera de las
              oficinas o dependencias de este Servicio Local dentro de la misma
              ciudad o comuna.
            </td>
          </tr>
          <tr>
            <td><strong>TERCERO:</strong></td>
            <td>
              La jornada de trabajo será de
              <strong v-if="data.tercero_horas">{{
                data.tercero_horas
              }}</strong>

              horas semanales distribuidas de la siguiente forma:

              <p class="mt-2 mb-0">
                <strong v-if="data.tercero_lunes_inicio">
                  LUNES A JUEVES: de
                  {{ data.tercero_lunes_inicio }}</strong
                >

                a
                <strong v-if="data.tercero_lunes_fin">{{
                  data.tercero_lunes_fin
                }}</strong>
              </p>
              <p class="mb-1">
                <strong v-if="data.tercero_viernes_inicio">
                  VIERNES: de
                  {{ data.tercero_viernes_inicio }}</strong
                >

                a
                <strong v-if="data.tercero_viernes_fin">{{
                  data.tercero_viernes_fin
                }}</strong>
              </p>

              <p class="mb-1">
                Como consecuencia, la jornada de trabajo diaria será
                interrumpida por un descanso de
                <strong>30 minutos</strong>

                destinada a colación.
              </p>

              <p class="mb-1">
                El Empleador, en conformidad con la Ley y de acuerdo con las
                necesidades de funcionamiento del Servicio Local, a través de la
                Subdirección de Gestión de Personas, podrá alterar el horario de
                inicio y término de la jornada diaria de trabajo.
              </p>

              <p class="mb-1">
                El Trabajador se compromete a laborar con dedicación durante
                toda la jornada convenida.
              </p>
            </td>
          </tr>
          <tr>
            <td><strong>CUARTO:</strong></td>
            <td>
              <p class="mb-1">
                El Trabajador percibirá un sueldo base de
                <strong>${{ data.sueldo }}.-</strong>
                ({{ data.sueldo_texto }}), por mes calendario, la que será
                liquidada y pagada por períodos vencidos, en las oficinas del
                empleador, el día 30 de cada mes.
              </p>

              <p class="mb-1">
                De la remuneración se deducirán los impuestos, las cotizaciones
                de previsión o seguridad social y las de salud.
              </p>
              <p class="mb-1">
                No se podrán hacer otras deducciones, salvo que estén
                autorizadas por la Ley, el Reglamento Interno o el Contrato, las
                que hayan sido ordenadas jurídicamente o las que sean
                autorizadas por el Trabajador, por escrito.
              </p>
            </td>
          </tr>
          <tr>
            <td><strong>QUINTO:</strong></td>
            <td>
              El presente gasto será con cargo a
              <strong v-if="data.quinto_fuente">{{ data.quinto_fuente }}</strong
              >.
            </td>
          </tr>
          <tr>
            <td><strong>SEXTO:</strong></td>
            <td>
              <p class="mb-1">
                El Trabajador percibirá, cuando corresponda los siguientes
                derechos:
              </p>

              <p class="mb-1">
                El derecho a percibir viáticos, pasajes y gastos reembolsables,
                mientras desempeñe las funciones del cargo, los que deberán ser
                fehacientemente acreditados por el mismo.
              </p>

              <p class="mb-1">
                El derecho, cuando corresponda, a percibir los beneficios de
                reajuste de remuneraciones a los trabajadores del sector
                público, otorgados en cada ocasión por el Estado a los
                trabajadores del sector público. Considerando para ello, los
                mismos montos y tramos que se determinan, cesando estos
                beneficios al término de la relación contractual.
              </p>

              <p>
                El trabajador podrá solicitar
                <strong>06</strong>
                días hábiles por año calendario, con goce de remuneraciones,
                para ausentarse de sus labores por motivos particulares. Estos
                permisos podrán fraccionarse por días, o medios días y deberán
                solicitarse a la jefatura respectiva, quien podrá concederlos o
                denegarlos por necesidades del servicio.
              </p>
            </td>
          </tr>
          <tr>
            <td><strong>SEPTIMO:</strong></td>
            <td>
              Son obligaciones esenciales del Trabajador, cuya infracción las
              partes entienden como incumplimiento grave de las obligaciones que
              impone el contrato, y en consecuencia, constituye causa
              justificada de terminación del presente contrato, las siguientes:
              <ul class="ml-0 pl-3 mt-2">
                <li>Cumplir íntegramente la jornada de trabajo;</li>
                <li>
                  Cuidar y mantener en perfecto estado de conservación, las
                  máquinas, útiles y otros bienes del Servicio Local, que le
                  sean entregados a través de la Unidad correspondiente;
                </li>
                <li>
                  Cumplir las instrucciones y las órdenes que le imparta
                  cualquiera de sus superiores;
                </li>
                <li>
                  Timbrar mediante huella dactilar el reloj digital, u otro
                  mecanismo de control de ingreso y salida que establezca el
                  empleador, tanto a la entrada como a la salida del
                  establecimiento educacional. Se presumirá que el Trabajador ha
                  faltado o ha llegado atrasado, en su caso, por la sola
                  circunstancia de no timbrar mediante huella dactilar el reloj
                  digital.
                </li>
                <li>
                  Trabajar horas extraordinarias cada vez que el Empleador o
                  jefes directos lo determinan, las que serán pagadas de acuerdo
                  al horario trabajado efectivamente un 50% según lo indicado en
                  el Código del Trabajo. La negativa de cumplir esta obligación
                  se entenderá como negativa del trabajador de desempeñar sus
                  labores, y por ende, como incumplimiento grave de las
                  obligaciones que le impone el contrato; y
                </li>
                <li>
                  En casos de inasistencia al trabajo, por enfermedad, el
                  trabajador deberá justificarla, únicamente con la
                  correspondiente licencia médica, dentro del plazo de 24 horas,
                  desde que aquel dejó de asistir al trabajo.
                </li>
                <li>
                  Cumplir con el llamado a desarrollar labores esenciales para
                  asegurarla correcta prestación del servicio educacional al
                  inicio del año escolar, durante su feriado legal, a solicitud
                  del Servicio Local o del director de su establecimiento
                  educacional, en conformidad con el artículo N° 41 de la Ley N°
                  21.109.
                </li>
                <li>
                  Las obligaciones contempladas en el artículo N° 61 de la Ley
                  N° 18.834 sobre Estatuto Administrativo, en relación con los
                  artículos N° 62 y 63 de la misma disposición, en conformidad
                  con lo señalado en el artículo N° 25 de la Ley N° 21.109.
                </li>
              </ul>
            </td>
          </tr>
          <tr>
            <td><strong>OCTAVO:</strong></td>
            <td>
              El asistente de la educación estará afecto a las siguientes
              prohibiciones:

              <ul class="ml-0 pl-3 mt-2 mb-1">
                <li>
                  Ejercer facultades, atribuciones o representación de las que
                  no esté legalmente investido, o no le hayan sido delegadas.
                </li>
                <li>
                  Intervenir, en razón de sus funciones, en asuntos en que
                  tengan interés él, su cónyuge, sus parientes consanguíneos
                  hasta el tercer grado inclusive o por afinidad hasta el
                  segundo grado, y las personas ligadas a él por adopción.
                </li>
                <li>
                  Actuar en juicio ejerciendo acciones civiles en contra de los
                  intereses del Estado o de las instituciones que de él formen
                  parte, salvo que se trate de un derecho que atañe directamente
                  al asistente, a su cónyuge o a sus parientes hasta el tercer
                  grado de consanguinidad o por afinidad hasta el segundo grado
                  y las personas ligadas a él por adopción.
                </li>
                <li>
                  Intervenir ante los tribunales de justicia como parte, testigo
                  o perito, respecto de hechos de que hubiere tomado
                  conocimiento en el ejercicio de sus funciones, o declarar en
                  juicio en que tenga interés el Estado o sus organismos, sin
                  previa comunicación a su empleador.
                </li>
                <li>
                  Someter a tramitación innecesaria o dilación los asuntos
                  entregados a su conocimiento o resolución, o exigir para estos
                  efectos documentos o requisitos no establecidos en las
                  disposiciones vigentes.
                </li>
                <li>
                  Solicitar, hacerse prometer o aceptar donativos, ventajas o
                  privilegios de cualquier naturaleza para sí o para terceros.
                </li>
                <li>
                  Ejecutar actividades, ocupar tiempo de la jornada de trabajo o
                  utilizar personal, material o información reservada o
                  confidencial del organismo para fines ajenos a los
                  institucionales.
                </li>
                <li>
                  Realizar cualquier actividad política dentro de la jornada de
                  trabajo o usar su autoridad, cargo o bienes de la institución
                  para fines ajenos a sus funciones.
                </li>
                <li>
                  Atentar contra los bienes de la institución, cometer actos que
                  produzcan la destrucción de materiales, instrumentos o
                  productos de trabajo o disminuyan su valor o causen su
                  deterioro.
                </li>
                <li>
                  Incitar a destruir o inutilizar instalaciones públicas o
                  privadas, o participar en hechos que las dañen.
                </li>
                <li>
                  Realizar cualquier acto atentatorio a la dignidad de los demás
                  integrantes de la comunidad educativa. Se considerará como una
                  acción de este tipo el acoso sexual, entendido según los
                  términos del inciso segundo del artículo N° 2 del Código del
                  Trabajo, y la discriminación arbitraria, según la define el
                  artículo N° 2 de la ley Nº 20.609.
                </li>
                <li>
                  Realizar todo acto calificado como acoso laboral en los
                  términos que dispone el inciso segundo del artículo N° 2 del
                  Código del Trabajo.
                </li>
              </ul>
            </td>
          </tr>
          <tr>
            <td><strong>NOVENO:</strong></td>
            <td>
              El trabajador se obliga a desarrollar su trabajo con el debido
              cuidado, evitando comprometer la seguridad y la salud de los demás
              trabajadores del Servicio Local y del medio ambiente. La
              infracción o incumplimiento de cualquiera de las obligaciones
              antes mencionada, o la trasgresión de las prohibiciones referidas,
              se estimará como incumplimiento grave de las obligaciones que
              impone el contrato y, cuando proceda, el Servicio Local se reserva
              el derecho de ponerle término a la relación laboral, sin derecho a
              indemnización alguna.
            </td>
          </tr>
          <tr>
            <td><strong>DÉCIMO:</strong></td>
            <td>
              Se podrá poner término al contrato de acuerdo con las causales
              estipuladas en artículos N° 33 y siguientes de la ley N° 21.109.
            </td>
          </tr>
          <tr>
            <td><strong>UNDÉCIMO:</strong></td>
            <td>
              La vigencia del presente contrato es a contar del
              <strong v-if="data.undecimo_inicio">{{
                data.undecimo_inicio
              }}</strong>
              hasta el
              <strong v-if="data.undecimo_termino">{{
                data.undecimo_termino
              }}</strong>
              , y podrá ponérsele término cuando concurran para ello causas
              justificadas.
            </td>
          </tr>
          <tr>
            <td><strong>DUODÉCIMO:</strong></td>
            <td>
              Se deja constancia que el Trabajador comenzó a prestar sus
              servicios en el Servicio Local de Educación Pública Chinchorro, el
              día
              <strong v-if="data.duodecimo_inicio">{{
                data.duodecimo_inicio
              }}</strong
              >.
            </td>
          </tr>
          <tr>
            <td><strong>DÉCIMO TERCERO:</strong></td>
            <td>
              Para todos los efectos legales derivados del presente contrato las
              partes fijan su domicilio en la ciudad de Arica y prorrogan
              competencia para ante sus Tribunales de Justicia.
            </td>
          </tr>
          <tr>
            <td><strong>DÉCIMO CUARTO:</strong></td>
            <td>
              Se entiende incorporadas al presente contrato las disposiciones
              establecidas en la Ley N° 21.109 sobre Estatuto de los Asistentes
              de la Educación, sin perjuicio, en lo no regulado expresamente por
              dicha ley se aplicará supletoriamente el Código del Trabajo.
            </td>
          </tr>
          <tr>
            <td><strong>DÉCIMO QUINTO:</strong></td>
            <td>
              Se entiende incorporadas al presente contrato las disposiciones
              legales que se dicten con posterioridad a la fecha de suscripción
              y que tengan relación con él.
            </td>
          </tr>
          <tr>
            <td><strong>DÉCIMO SEXTO:</strong></td>
            <td>
              Se deja constancia que la personería de Doña
              <strong v-if="data.repNombre">{{ data.repNombre }}</strong
              >, consta en la Resolución Exenta RA N°
              <strong v-if="data.decimo_resol">{{ data.decimo_resol }}</strong>
              que la nombra en calidad de Titular Directivo/a jefe/a de Unidad
              de Apoyo Técnico Pedagógico del Servicio Local de Educación
              Pública de Chinchorro; el Decreto N°11 de 25 de enero de 2021, que
              establece el orden de subrogancia de Director Ejecutivo y en uso
              de las facultades que me asisten como Directora Ejecutiva (S) del
              Servicio Local de Educación Pública de Chinchorro.
            </td>
          </tr>
          <tr>
            <td><strong>DÉCIMO SÉPTIMO:</strong></td>
            <td>
              El presente contrato se firma en
              <strong>03</strong>
              ejemplares, declarando el Trabajador haber recibido un ejemplar de
              él y que este es fiel reflejo de la relación laboral existente
              entre las partes, y los demás en el Servicio Local.
            </td>
          </tr>
          <tr>
            <td><strong>DÉCIMO OCTAVO:</strong></td>
            <td>
              El motivo que origina la celebración del presente contrato es por
              <strong>{{ data.decimo_motivo }}.</strong>
            </td>
          </tr>
        </tbody>
      </table>

      <!-- Tabla de firmas - preserva texto exacto -->
      <div class="mt-5">
        <div class="pt-4">
          <table class="table table-borderless">
            <tbody style="font-size: 8pt">
              <tr class="text-center">
                <td width="43%">
                  <div class="signature-line px-2">
                    <hr class="my-0" />
                    <strong>{{ data.trabajadorNombre }}</strong>
                    <br />
                    <strong>{{ data.trabajadorRUN }}</strong>
                  </div>
                </td>
                <td>
                  <div class="signature-line px-2">
                    <hr class="my-0 mx-5" />

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
    </section>
  </div>
</template>

<script setup>
import { reactive, ref, onMounted, nextTick } from "vue";
import html2pdf from "html2pdf.js";

// Imágenes institucionales
import logoLeft from "../assets/img/flag.png";
import logoCenter from "../assets/img/logoDEP.png";
import logoRight from "../assets/img/Logotipo-Chinchorro-web.png";

// Referencia al contenedor de la resolución
const contractRef = ref(null);
const logoLeftImg = ref(null);
const logoRightImg = ref(null);
const autoDownloaded = ref(false);
const isGenerating = ref(false);
const showView = ref(false);

const props = defineProps({
  data: {
    type: Object,
    required: true,
    default: () => ({
      fecha_resol: "",
      repCargo: "",
      repNombre: "",
      repRUT: "",
      empleadorDomicilio: "",
      trabajadorNombre: "",
      trabajadorRUN: "",
      trabajadorNacionalidad: "",
      trabajadorEstado: "",
      trabajadorDomicilio: "",
      primer_cargo: "",
      primer_categoria: "",
      primer_funciones: "",
      segundo_establecimiento: "",
      segundo_ciudad: "",
      tercero_horas: "",
      tercero_lunes_inicio: "",
      tercero_lunes_fin: "",
      tercero_viernes_inicio: "",
      tercero_viernes_fin: "",
      sueldo: 0,
      sueldo_texto: "",
      quinto_fuente: "",
      undecimo_inicio: "",
      undecimo_termino: "",
      duodecimo_inicio: "",
      decimo_resol: "",
      decimo_motivo: "",
    }),
  },
  autoGenerate: {
    type: Boolean,
    default: false,
  },
  showView: {
    type: Boolean,
    default: false,
  },
});

defineExpose({ generatePDFInNewTab, generateAndDownloadPDF });
const emit = defineEmits(["pdf-error", "pdf-generated", "cerrarVista"]);
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
async function generateAndDownloadPDF() {
  const safeName = `Contrato_${
    (props.data && props.data.trabajadorNombre) || "sin-nombre"
  }.pdf`;
  if (!contractRef.value) return;

  await waitForImages(contractRef.value);
  await new Promise((r) => setTimeout(r, 250));

  const opt = {
    margin: [25, 20, 30, 20], // Margen superior para el encabezado
    filename: safeName,
    image: { type: "jpeg", quality: 0.98 },
    html2canvas: {
      scale: 2,
      useCORS: true,
      logging: false,
      scrollY: 0,
    },
    jsPDF: { unit: "mm", format: [216, 330], orientation: "portrait" },
    //pagebreak: { mode: ["avoid-all"] },
    pagebreak: { mode: ["css", "legacy"] },
  };

  try {
    const worker = html2pdf().set(opt).from(contractRef.value);
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
      await html2pdf().set(opt).from(contractRef.value).save();
    } catch (e) {
      console.error("Error en fallback PDF", e);
    }
  }
}

// Función para generar PDF en nueva pestaña
async function generatePDFInNewTab() {
  const safeName = `Contrato_${
    (props.data && props.data.trabajadorNombre) || "sin-nombre"
  }.pdf`;

  await nextTick(); // espera que el DOM esté listo
  await new Promise((r) => setTimeout(r, 250)); // espera adicional

  const el = contractRef.value;
  if (!el) {
    console.error("No se encontró el contrato");
    return;
  }

  isGenerating.value = true;

  try {
    await waitForImages(contractRef.value);
    await new Promise((r) => setTimeout(r, 250));

    const opt = {
      margin: [25, 20, 31, 20], // Margen superior para el encabezado
      filename: safeName,
      image: { type: "jpeg", quality: 0.98 },
      html2canvas: {
        scale: 2,
        useCORS: true,
        logging: false,
        scrollY: 0,
      },
      jsPDF: { unit: "mm", format: [216, 330], orientation: "portrait" },
      //pagebreak: { mode: ["avoid-all"] },
      pagebreak: { mode: ["css", "legacy"] },
    };

    const worker = html2pdf().set(opt).from(contractRef.value);
    const pdf = await worker.toPdf().get("pdf");

    // Agregar encabezados con logos
    const totalPages = pdf.internal.getNumberOfPages();
    const pageWidth = pdf.internal.pageSize.getWidth();

    try {
      const logoLeftData = await getImageDataUrlFromImport(logoLeft);
      const logoRightData = await getImageDataUrlFromImport(logoRight);

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
    } catch (imgErr) {
      console.warn(
        "No se pudieron procesar las imágenes del encabezado:",
        imgErr
      );
    }

    // Generar blob y abrir en nueva pestaña
    const pdfBlob = pdf.output("blob");
    const pdfUrl = URL.createObjectURL(pdfBlob);
    emit("cerrarVista");
    // Abrir en nueva pestaña
    window.open(pdfUrl, "_blank");

    // Limpiar URL después de un tiempo
    setTimeout(() => URL.revokeObjectURL(pdfUrl), 1000);

    //emit("pdf-generated", pdfBlob);
  } catch (err) {
    console.error("Error generando PDF:", err);
    emit("pdf-error", err.message);

    // Fallback: intentar con escala menor
    try {
      opt.html2canvas.scale = 1;
      await html2pdf().set(opt).from(contractRef.value).save();
    } catch (e) {
      console.error("Error en fallback PDF:", e);
    }
  } finally {
    isGenerating.value = false;
  }
}

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

onMounted(async () => {
  //if (autoDownloaded.value) return;
  //autoDownloaded.value = true;
  //await new Promise((r) => setTimeout(r, 500));
  // generateAndDownloadPDF();
  //generatePDFInNewTab();
});
</script>

<style scoped>
.margen-firma {
  margin-bottom: 151px;
}
.resolucion-sheet {
  font-family: Verdana, Geneva, sans-serif;
  font-size: 10pt;
  color: #000;
  background: #fff;
  max-width: 900px;
  margin: 0 auto;
  line-height: 1.5;
}
tr td:last-child {
  padding-left: 0px;
  padding-right: 0px;
  font-size: 10pt;
}
p {
  font-size: 10pt;
  font-family: Verdana, Geneva, sans-serif;
  margin: 0;
  line-height: 1.5;
}
ul.li {
  max-width: 900px;
  margin: 0;
  line-height: 1.5;
}
/* Header text */
.header-text .entity {
  font-size: 10pt;
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
  font-size: 8pt;
  line-height: 1.2;
  border: 1px dashed #bbb;
  border-radius: 2px;
  background: transparent;
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

.page-break {
  page-break-before: always;
  break-before: page;
  height: 1px;
  margin: 20px 0 0 0;
}
p,
li {
  page-break-inside: avoid !important;
}
/* Impresión/PDF */
@media print {
  .resolucion-sheet {
    max-width: 100%;
    font-size: 10pt;
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
