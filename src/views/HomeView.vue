<template>
  <header>
    <NavBar />
    <!-- Banner Principal -->
    <section class="banner-custom mt-4">
      <div class="w-75 mx-auto px-0 my-5 section-padding">
        <div class="row align-items-center">
          <div class="col-12 col-md-6 col-lg-5">
            <h1 class="mb-5 display-4">
              <span class="bg-letra">¡Buscamos tu talento!</span>
            </h1>
            <p class="mb-4 text-white font-level-3" style="line-height: 2rem">
              Únete al equipo SLEP Chinchorro y forma parte del desarrollo y la
              transformación educativa en las comunas de:
            </p>
            <div class="mb-5">
              <span class="comunas-badge bg-accent-5 text-white">Arica</span>
              <span class="comunas-badge bg-accent-2">Camarones</span>
              <span class="comunas-badge bg-accent-3">General Lagos</span>
              <span class="comunas-badge bg-accent-4 text-white">Putre</span>
            </div>
            <div class="my-5"></div>
          </div>
          <div class="col-lg-6 offset-lg-1">
            <div class="card-data-list">
              <div class="card-data h-100 bg-transparent text-normal">
                <div class="card-data-title">
                  <div class="card-data-quantity">
                    {{ indices.disponibles }}
                  </div>
                  <h5>Convocatorias Abiertas</h5>
                </div>
              </div>
              <div class="card-data h-100 bg-transparent text-normal">
                <div class="card-data-title">
                  <div class="card-data-quantity">
                    {{ indices.creadasEsteAnio }}
                  </div>
                  <h5>
                    Convocatorias Realizadas {{ new Date().getFullYear() }}
                  </h5>
                </div>
              </div>
              <div class="card-data h-100 bg-transparent text-normal">
                <div class="card-data-title">
                  <div class="card-data-quantity">
                    {{ indices.registradas }}
                  </div>
                  <h5>Vacantes históricas ofrecidas</h5>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </header>

  <main class="container-fluid px-0">
    <!-- Funcionalidades Section -->
    <section
      id="funcionalidades"
      style="padding-top: 4rem; padding-bottom: 5rem"
    >
      <div class="w-75 mx-auto">
        <div class="section-header mt-5">
          <h2 class="pb-2 border-bottom border-accent" id="secciones">
            Comienza hoy tu camino con nosotros
          </h2>
        </div>
        <div class="section-body">
          <p>
            Hemos diseñado un proceso simple, claro y transparente para que
            postules con confianza y seas parte de esta gran misión educativa.
          </p>
        </div>
        <div class="row g-4 mb-5" style="margin-top: 4rem">
          <div
            class="col-md-6 col-lg-3"
            v-for="feature in features"
            :key="feature.title"
          >
            <div class="card h-100 border-0 shadow-sm hover">
              <div class="card-body text-center p-4">
                <div
                  class="card-icon text-white rounded-circle d-inline-flex align-items-center justify-content-center"
                  :class="feature.colorClass"
                  style="width: 70px; height: 70px"
                >
                  <i :class="feature.icon"></i>
                </div>
                <h4 class="card-title">{{ feature.title }}</h4>
                <p class="card-text">{{ feature.description }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Procesos Vigentes -->
    <section id="procesos-vigentes" class="section-padding bg-light">
      <div class="w-75 mx-auto">
        <div class="section-header mt-3">
          <h2 class="pb-2 border-bottom border-accent" id="secciones">
            Procesos Vigentes
          </h2>
        </div>
        <div class="section-body">
          <p>Encuentra una oportunidad de empleo en el Slep Chinchorro</p>
        </div>
        <div class="row py-5" v-if="convocatorias.length > 0">
          <div
            class="col-md-4"
            v-for="convocatoria in convocatorias"
            :key="convocatoria.id"
          >
            <a class="banner border mb-3 flex-wrap bg-white">
              <div class="line"></div>
              <div class="py-4 border-bottom border-accent banner-header w-100">
                <h4 class="banner-text flex-column">
                  <span class="font-weight-bold font-level-7">{{
                    convocatoria.cargo?.nombre
                  }}</span
                  ><span class="font-level-8">{{ convocatoria.codigo }}</span>
                </h4>
                <span class="banner-icon ml-auto" aria-hidden="true">
                  <div class="badge badge-danger font-level-7">
                    {{ convocatoria.estado_convocatorium.nombre }}
                  </div>
                </span>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9">
                  Tipo de vacante:
                </p>
                <p
                  class="banner-icon ml-auto mb-0 font-level-9 font-weight-bolder"
                >
                  Contrata
                </p>
              </div>
              <div class="d-flex w-100">
                <p class="banner-text flex-column font-level-9">Ciudad:</p>
                <p
                  class="banner-icon ml-auto mb-0 font-level-9 font-weight-bolder"
                >
                  {{ convocatoria.ciudade.nombre }}
                </p>
              </div>
              <div class="d-flex w-100">
                <p class="banner-text flex-column font-level-9">Institución:</p>
                <p
                  class="banner-icon ml-auto mb-0 font-level-9 font-weight-bolder"
                >
                  {{ convocatoria.institucione?.nombre }}
                </p>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9 fw-800">
                  Descripción:
                </p>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9">
                  {{ convocatoria.descripcion }}
                </p>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9 fw-800">
                  Requisitos:
                </p>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9">
                  {{ convocatoria.requisitos }}
                </p>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9 fw-800">
                  Adjuntos:
                </p>
                <p class="banner-icon ml-auto mb-0 font-level-9">
                  <span
                    class="cl cl-document-verified ml-2 mb-2 font-level-2 color-accent-3"
                  ></span>
                  <span
                    class="cl cl-document-verified ml-2 mb-2 font-level-2 color-accent-3"
                  ></span>
                </p>
              </div>
              <div class="py-1 border-bottom d-flex w-100 border-accent"></div>
              <div class="d-flex w-100 my-3">
                <div class="banner-text flex-column">
                  <div class="badge badge-info font-level-8">
                    Postulación hasta {{ convocatoria.fecha_cierre }} 8:00:00
                  </div>
                </div>
                <span class="banner-icon ml-auto" aria-hidden="true">
                  <!-- <div class="badge badge-primary font-level-7">Postular</div> -->
                </span>
              </div>
            </a>
          </div>
        </div>
        <div class="row py-5" v-else>
          <div class="col-12 text-center">
            <p class="text-muted">
              No hay convocatorias vigentes en este momento.
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Cómo Postular Section -->
    <section id="como-postular" class="section-padding">
      <div class="w-75 mx-auto">
        <div class="section-header mt-3">
          <h2 class="pb-2 border-bottom border-accent" id="secciones">
            ¿Cómo Postular?
          </h2>
        </div>
        <div class="section-body">
          <p>Sigue estos sencillos pasos para completar tu postulación</p>
        </div>

        <div class="row g-4 mt-5 pt-5">
          <div class="col-md-4 mt-4" v-for="step in steps" :key="step.number">
            <div class="text-center">
              <div
                class="step-number mx-auto text-white"
                :class="step.colorClass"
              >
                {{ step.number }}
              </div>
              <h4 class="my-3">{{ step.title }}</h4>
              <p>{{ step.description }}</p>
            </div>
          </div>
        </div>
        <div class="text-center mt-5">
          <a href="#" class="btn btn-secondary btn-lg">Iniciar Sesión</a>
        </div>
      </div>
    </section>

    <!-- Centro de Ayuda Section -->
    <section id="centro-ayuda" class="section-padding bg-light">
      <div class="container px-4">
        <div class="row">
          <div class="col-lg-6">
            <h2 class="fw-bold mb-4">Centro de Ayuda</h2>
            <p class="lead mb-4">
              ¿Tienes dudas o necesitas asistencia? Contáctanos y te
              responderemos a la brevedad.
            </p>
            <div class="mb-4">
              <h5>Soporte Institucional</h5>
              <p>
                Nuestro equipo de Reclutamiento y Selección está disponible para
                ayudarte con cualquier consulta relacionada con el proceso de
                postulación.
              </p>
              <p><i class="bi bi-envelope me-2"></i>{{ contactInfo.correo }}</p>
              <p><i class="bi bi-telephone me-2"></i>{{ contactInfo.phone }}</p>
              <p><i class="bi bi-clock me-2"></i>{{ contactInfo.hours }}</p>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card border-0 shadow">
              <div class="card-body p-4">
                <h4 class="card-title mb-4">Formulario de Contacto</h4>
                <form @submit.prevent="submitForm">
                  <div class="mb-3">
                    <label for="nombre" class="form-label"
                      >Nombre completo</label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="nombre"
                      v-model="formData.nombre"
                      required
                    />
                  </div>
                  <div class="mb-3">
                    <label for="rut" class="form-label">rut</label>
                    <input
                      type="text"
                      class="form-control"
                      id="rut"
                      v-model="formData.rut"
                      @input="onRutInput"
                      required
                    />
                  </div>
                  <div class="mb-3">
                    <label for="correo" class="form-label"
                      >Correo electrónico</label
                    >
                    <input
                      type="email"
                      class="form-control"
                      id="correo"
                      v-model="formData.correo"
                      required
                    />
                  </div>
                  <div class="mb-3">
                    <label for="mensaje" class="form-label">Mensaje</label>
                    <textarea
                      class="form-control"
                      id="mensaje"
                      rows="4"
                      v-model="formData.mensaje"
                      required
                    ></textarea>
                  </div>
                  <button type="submit" class="btn btn-secondary float-right">
                    Enviar mensaje
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer class="align-content-center">
    <Footer />
  </footer>
</template>

<script setup lang="ts">
import { onMounted, onUnmounted, reactive, ref } from "vue";
import NavBar from "../components/Navbar.vue";
import Footer from "../components/Footer.vue";
import {
  fetchConvocatorias,
  fetchCountConvocatorias,
} from "../services/convocatoriaServices";
import type { Convocatoria } from "../types";
import api from "../services/apiService";
import Swal from "sweetalert2";

// Datos para las funcionalidades
interface Feature {
  icon: string;
  title: string;
  description: string;
  colorClass: string;
}

const isScrolled = ref(false);
const visibility = ref("visible");
const Logo = ref("../../src/assets/img/Logotipo-Chinchorro-web-02.png");
const isBgNavbar = ref("bg-transparent");

const convocatorias = ref<Convocatoria[]>([]);
const indices = ref({
  disponibles: 0,
  creadasEsteAnio: 0,
  registradas: 0,
});

const handleScroll = () => {
  isScrolled.value = window.scrollY > 40;

  if (isScrolled.value) {
    visibility.value = "invisible";
    Logo.value = "../../src/assets/img/Logotipo-Chinchorro-web.png";
    isBgNavbar.value = "bg-light";
  } else {
    visibility.value = "visible";
    Logo.value = "../../src/assets/img/Logotipo-Chinchorro-web-02.png";
    isBgNavbar.value = "bg-transparent";
  }
};

onMounted(async () => {
  window.addEventListener("scroll", handleScroll);
  convocatorias.value = (await fetchConvocatorias()) ?? [];
  indices.value = await fetchCountConvocatorias();
});

onUnmounted(() => {
  window.removeEventListener("scroll", handleScroll);
});

const features = ref<Feature[]>([
  {
    icon: "bi bi-person-plus",
    title: "Registro Simplificado",
    description:
      "Crea tu perfil de manera rápida y sencilla con nuestro formulario intuitivo.",
    colorClass: "bg-accent-5",
  },
  {
    icon: "bi bi-file-earmark-text",
    title: "Gestión de Documentos",
    description:
      "Sube y gestiona todos tus documentos requeridos en un solo lugar.",
    colorClass: "bg-accent-2",
  },
  {
    icon: "bi bi-briefcase",
    title: "Postulación a Vacantes",
    description:
      "Encuentra y postula a las vacantes disponibles en nuestras instituciones educativas.",
    colorClass: "bg-accent-3",
  },
  {
    icon: "bi bi-clock-history",
    title: "Seguimiento de Proceso",
    description: "Monitorea el estado de tus postulaciones en tiempo real.",
    colorClass: "bg-accent-4",
  },
]);

// Datos para los pasos de postulación
interface Step {
  number: number;
  title: string;
  description: string;
  colorClass: string;
}

const steps = ref<Step[]>([
  {
    number: 1,
    title: "Completar datos personales",
    description:
      "Llena el formulario con tu información personal, académica y profesional. Asegúrate de que todos los datos sean correctos y estén actualizados.",
    colorClass: "bg-accent-primary",
  },
  {
    number: 2,
    title: "Subir documentos requeridos",
    description:
      "Adjunta los documentos solicitados según el perfil al que estés postulando. Revisa que los archivos sean legibles y estén completos.",
    colorClass: "bg-accent-5",
  },
  {
    number: 3,
    title: "Postular a la oferta disponible",
    description:
      "Selecciona la vacante de tu interés y envía tu postulación. Recibirás un correo de confirmación con los detalles de tu aplicación.",
    colorClass: "bg-accent-3",
  },
]);

// Datos para el formulario de contacto
interface ContactInfo {
  correo: string;
  phone: string;
  hours: string;
}

interface FormData {
  nombre: string;
  correo: string;
  mensaje: string;
  rut: string;
}

const contactInfo = reactive<ContactInfo>({
  correo: " postulaciones@epchinchorro.cl",
  phone: " +56 58 234 5678",
  hours: " Lunes a Viernes: 8:30 - 17:30 hrs",
});

const formData = reactive<FormData>({
  nombre: "",
  correo: "",
  mensaje: "",
  rut: "",
});

function onRutInput(e: any) {
  const target = e.target;
  if (target.value === "") {
    formData.rut = "";
    return;
  }
  formData.rut = formatearRut(target.value);
}

function formatearRut(rut: string): string {
  const limpio = rut.replace(/[^\dkK]/g, "").toUpperCase();
  if (limpio.length < 2) return limpio;

  const cuerpo = limpio.slice(0, -1);
  const dv = limpio.slice(-1);

  const cuerpoFormateado = cuerpo
    .split("")
    .reverse()
    .reduce(
      (acc, char, i) =>
        acc + char + ((i + 1) % 3 === 0 && i + 1 !== cuerpo.length ? "." : ""),
      ""
    )
    .split("")
    .reverse()
    .join("");

  return `${cuerpoFormateado}-${dv}`;
}

function limpiarRut(rut: string): string {
  return rut.replace(/\./g, "").toUpperCase();
}

function calculateDV(rut: string) {
  const clean = rut.replace(/\D/g, ""); // Elimina cualquier carácter no numérico
  const rutWithoutVerifier = clean.slice(0, -1);
  const verifierDigit = clean.slice(-1);
  let sum = 0;
  let multiplier = 2;

  for (let i = rutWithoutVerifier.length - 1; i >= 0; i--) {
    sum += parseInt(rutWithoutVerifier[i]) * multiplier;
    multiplier = multiplier === 7 ? 2 : multiplier + 1;
  }

  const remainder = 11 - (sum % 11);
  if (remainder === 11) return "0";
  if (remainder === 10) return "K";

  if (verifierDigit !== remainder.toString()) {
    return false;
  }
  return true;
}

const submitForm = async () => {
  try {
    if (
      !formData.nombre ||
      !formData.correo ||
      !formData.mensaje ||
      !formData.rut
    ) {
      alert("Por favor, completa todos los campos del formulario.");
      return;
    }
    formData.rut = limpiarRut(formData.rut);

    if (!calculateDV(formData.rut)) {
      Swal.fire({
        icon: "warning",
        title: "RUT inválido, reemplace e intente nuevamente",
      });
      return;
    }

    await api.post("mensajes", formData);
    resetearFormulario();
    Swal.fire(
      "¡Mensaje enviado!",
      "Nos pondremos en contacto contigo pronto.",
      "success"
    );
  } catch (error) {
    console.error("Error al validar el formulario:", error);
    Swal.fire(
      "Error",
      "Ocurrió un error al validar el formulario. Inténtalo de nuevo.",
      "error"
    );
    return;
  }
};

function resetearFormulario() {
  formData.nombre = "";
  formData.correo = "";
  formData.mensaje = "";
  formData.rut = "";
}
</script>

<style scoped>
.line::after {
  position: absolute;
  right: 0;
  bottom: -10px;
  left: 0;
  height: 5px;
  content: "";
  background: linear-gradient(
    to right,
    #3abff0 0,
    #90d039 50%,
    #f8d63c 50%,
    #f0757f 100%
  );
}

.banner-header {
  position: relative;
  display: flex;
  align-items: center;
}

.banner-custom {
  background: linear-gradient(135deg, var(--footer-bg) 0%, var(--dark) 100%);
  color: white;
  padding: 5rem 0 0 0;
  /*margin-bottom: 4rem;*/
  position: relative;
  overflow: hidden;
}

.banner-custom::before {
  content: "";
  position: absolute;
  inset: 0; /* shorthand para top, right, bottom, left = 0 */
  background-image: url("../assets/img/banner.webp");
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  opacity: 0.5;
  z-index: 0;
}

.banner-custom > * {
  position: relative;
  z-index: 1;
}

.comunas-badge {
  display: inline-block;
  color: var(--primary);
  padding: 0.35rem 0.65rem;
  border-radius: 50rem;
  font-weight: 600;
  margin: 0.25rem;
  font-size: 0.875rem;
}

.section-padding {
  padding: 7rem 0;
}

.subrayado {
  color: white;
  -webkit-text-stroke: 0.2px #3a9cf8;
  text-shadow: 0px 1px 4px #23430c;
}

@media (min-width: 768px) {
  footer {
    min-height: 200px !important;
  }
}

.step-number {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  font-size: 1.5rem;
  margin-bottom: 1rem;
}

.card-icon {
  font-size: 2.5rem;
  margin-bottom: 1rem;
}

.fw-800 {
  font-weight: 800;
}

.hover:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  background-color: var(--light) !important;
}

.top-header {
  background-color: var(--accent-5); /* Color de fondo similar al original */
  width: 100%;
  padding: 8px 0;
}

.doc-icons {
  display: flex;
  justify-content: flex-end; /* Alinea los iconos a la derecha */
  padding-right: 2rem; /* Espaciado desde el borde derecho */
}

.doc-icon {
  margin: 0 8px;
}

.cl-social {
  font-size: 1.2rem;
  transition: color 0.3s;
}

.cl-social:hover {
  color: #fff !important;
}

/* Ajuste para que el contenido no quede oculto tras el navbar fijo */
body {
  padding-top: 100px;
}

/* Ajustes para dispositivos móviles */
@media (max-width: 991.98px) {
  .doc-icons {
    padding-right: 1rem;
    justify-content: center; /* Centrar en móviles */
  }

  body {
    padding-top: 160px;
  }
}
</style>
