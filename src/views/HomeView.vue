<template>
  <header>
    <div class="top-header fixed-top" :class="visibility">
      <div class="doc-icons">
        <div class="doc-icon">
          <a href="#" class="text-decoration-none">
            <span class="cl cl-social text-white cl-facebook"></span>
          </a>
        </div>
        <div class="doc-icon">
          <a href="#" class="text-decoration-none">
            <span class="cl cl-social text-white cl-instagram"></span>
          </a>
        </div>
        <div class="doc-icon">
          <a href="#" class="text-decoration-none">
            <span class="cl cl-social text-white cl-twitter"></span>
          </a>
        </div>
        <div class="doc-icon">
          <a href="#" class="text-decoration-none">
            <span class="cl cl-social text-white cl-youtube"></span>
          </a>
        </div>
      </div>
    </div>
    <!-- Menu Principal -->
    <nav
      class="navbar navbar-lg navbar-expand-lg with-fixed-navbar-lg"
      :class="{ 'fixed-top': isScrolled }"
      :style="{
        backgroundColor: isScrolled ? 'rgba(255,255,255,0.95)' : 'transparent',
        boxShadow: isScrolled ? '0 2px 0 0 #e3e5ef' : 'none',
      }"
    >
      <div class="container-fluid">
        <a class="navbar-brand" href="/"
          ><i class="fa fa-spinner fa-spin page-loading-icon"></i
          ><img
            :src="Logo"
            class="ml-5"
            :style="{
              height: isScrolled ? '70%' : '90%',
              marginTop: isScrolled ? '1rem' : '0.5rem',
            }"
        /></a>
        <button
          class="navbar-toggler collapsed"
          type="button"
          aria-controls="navbarCollapse"
          aria-expanded="false"
          aria-label="Toggle navigation"
          data-bs-toggle="collapse"
          data-bs-target="#navbarLgLightExampleCollapse"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div
          class="navbar-collapse collapse justify-content-end"
          id="navbarLgLightExampleCollapse"
        >
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <a
                class="nav-link"
                :style="{ color: isScrolled ? '#000' : '#fff' }"
                href="#"
                >Inicio</a
              >
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                :style="{ color: isScrolled ? '#000' : '#fff' }"
                href="#procesos-vigentes"
                >Procesos Vigentes</a
              >
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                :style="{ color: isScrolled ? '#000' : '#fff' }"
                href="#como-postular"
                >Como Postular</a
              >
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                :style="{ color: isScrolled ? '#000' : '#fff' }"
                href="#centro-ayuda"
                >Centro de Ayuda</a
              >
            </li>
            <ul class="navbar-nav">
              <form class="simple-search search">
                <input
                  class="form-control"
                  type="text"
                  name="search"
                  placeholder="search"
                  aria-label="search"
                  aria-describedby="searchLineAction"
                />
                <div class="search-action">
                  <button
                    class="btn btn-outline-search dom-search-behavior-cancel d-none"
                    type="button"
                  >
                    <i class="icon cl cl-close"></i>
                  </button>
                  <button
                    class="btn btn-outline-search"
                    id="searchLineAction"
                    type="submit"
                  >
                    <i class="icon cl cl-search"></i>
                  </button>
                </div>
              </form>
            </ul>
            <li class="nav-item ml-md-3">
              <a
                class="btn btn-block"
                :class="
                  isScrolled ? 'btn-outline-secondary' : 'btn-outline-light'
                "
                href="#"
                >Registrar</a
              >
            </li>
            <li class="nav-item mr-md-5">
              <a class="btn btn-block btn-secondary" href="#">Iniciar sesión</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Banner Principal -->
    <section class="banner-custom mt-4">
      <div class="w-75 mx-auto px-0 py-5 my-5">
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
            <div class="mt-5"></div>
          </div>
          <div class="col-lg-6 offset-lg-1">
            <div class="card-data-list">
              <div class="card-data h-100 bg-transparent text-normal">
                <div class="card-data-title">
                  <div class="card-data-quantity">3</div>
                  <h5>Convocatorias Abiertas</h5>
                </div>
              </div>
              <div class="card-data h-100 bg-transparent text-normal">
                <div class="card-data-title">
                  <div class="card-data-quantity">23</div>
                  <h5>Convocatorias Realizadas 2025</h5>
                </div>
              </div>
              <div class="card-data h-100 bg-transparent text-normal">
                <div class="card-data-title">
                  <div class="card-data-quantity">100</div>
                  <h5>Vacantes históricas ofrecidas</h5>
                </div>
              </div>
            </div>
          </div>
          <!--           <div class="col-12">
            <button
              class="btn btn-pill-light text-decoration-none"
              type="button"
            >
              Revisar Convocatorias Disponibles
            </button>
          </div> -->
        </div>
      </div>
    </section>
  </header>

  <main class="container-fluid px-0">
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
          <a href="#" class="btn btn-primary-accent btn-lg">Comenzar ahora</a>
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
        <div class="row py-5">
          <div class="col-md-4">
            <a class="banner border mb-3 flex-wrap bg-white" href="#banners">
              <div class="line"></div>
              <div class="py-4 border-bottom border-accent banner-header w-100">
                <h4 class="banner-text flex-column">
                  <span class="font-weight-bold font-level-7"
                    >Profesor de Matemáticas</span
                  ><span class="font-level-8">SLEP-EDU-001-2025</span>
                </h4>
                <span class="banner-icon ml-auto" aria-hidden="true">
                  <div class="badge badge-danger font-level-7">Abierta</div>
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
                  Arica
                </p>
              </div>
              <div class="d-flex w-100">
                <p class="banner-text flex-column font-level-9">Institución:</p>
                <p
                  class="banner-icon ml-auto mb-0 font-level-9 font-weight-bolder"
                >
                  Liceo B-4 Antonio Varas de la Barra.
                </p>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9 fw-800">
                  Descripción:
                </p>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9">
                  Buscamos un profesional titulado para la enseñanza en
                  matemáticas en educación básica, con experiencia en
                  metodologías innovadoras.
                </p>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9 fw-800">
                  Requisitos:
                </p>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9">
                  Buscamos un profesional titulado para la enseñanza en
                  matemáticas en educación básica, con experiencia en
                  metodologías innovadoras.
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
                    Postulación hasta 05/09/2025 8:00:00
                  </div>
                </div>
                <span class="banner-icon ml-auto" aria-hidden="true">
                  <!-- <div class="badge badge-primary font-level-7">Postular</div> -->
                </span>
              </div>
            </a>
          </div>

          <div class="col-md-4">
            <a class="banner border mb-3 flex-wrap bg-white" href="#banners">
              <div class="line"></div>
              <div class="py-4 border-bottom border-accent banner-header w-100">
                <h4 class="banner-text flex-column">
                  <span class="font-weight-bold font-level-7"
                    >Psicólogo/a Educacional</span
                  ><span class="font-level-8">SLEP-EDU-001-2025</span>
                </h4>
                <span class="banner-icon ml-auto" aria-hidden="true">
                  <div class="badge badge-danger font-level-7">Abierta</div>
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
                  Putre
                </p>
              </div>
              <div class="d-flex w-100">
                <p class="banner-text flex-column font-level-9">Institución:</p>
                <p
                  class="banner-icon ml-auto mb-0 font-level-9 font-weight-bolder"
                >
                  Liceo Técnico Profesional Granaderos de Putre.
                </p>
              </div>
              <div class="d-flex w-100 mt-2">
                <h5
                  class="banner-text flex-column font-level-9 font-weight-bolder"
                >
                  Descripción:
                </h5>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9">
                  Únete a nuestro equipo de bienestar para apoyar el desarrollo
                  integral de los estudiantes.
                </p>
              </div>
              <div class="d-flex w-100 mt-2">
                <h5
                  class="banner-text flex-column font-level-9 font-weight-bolder"
                >
                  Requisitos:
                </h5>
              </div>
              <div class="d-flex w-100 mt-2">
                <p class="banner-text flex-column font-level-9">
                  Buscamos un profesional titulado para la enseñanza en
                  matemáticas en educación básica, con experiencia en
                  metodologías innovadoras.
                </p>
              </div>

              <div class="d-flex w-100 mt-2">
                <p
                  class="banner-text flex-column font-level-9 font-weight-bolder"
                >
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
                    Postulación hasta 05/09/2025 8:00:00
                  </div>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- Funcionalidades Section -->
    <section id="funcionalidades" class="section-padding">
      <div class="w-75 mx-auto">
        <div class="row g-4 mb-5">
          <div
            class="col-md-6 col-lg-3"
            v-for="feature in features"
            :key="feature.title"
          >
            <div class="card h-100 border-0 shadow-sm">
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

    <!-- Centro de Ayuda Section -->
    <section id="centro-ayuda" class="section-padding bg-light">
      <div class="container">
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
              <p><i class="bi bi-envelope me-2"></i>{{ contactInfo.email }}</p>
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
                      v-model="formData.name"
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
                      v-model="formData.email"
                      required
                    />
                  </div>
                  <div class="mb-3">
                    <label for="mensaje" class="form-label">Mensaje</label>
                    <textarea
                      class="form-control"
                      id="mensaje"
                      rows="4"
                      v-model="formData.message"
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
  <footer>
    <div class="container">
      <a class="footer-logo" href="#">
        <img
          class="footer-default-logo"
          src="../assets/img/Logotipo-Chinchorro-web-02.png"
          width="300"
        />
        <img
          class="footer-mobile-logo"
          src="../assets/img/Logotipo-Chinchorro-web-02.png"
          width="100"
        />
        <div class="line"></div>
      </a>
      <div class="row">
        <div class="col-xl-8">
          <div class="row footer-links">
            <div class="col-md-6"><a href="#">Link 1</a></div>
            <div class="col-md-6"><a href="#">Link 2</a></div>
          </div>
        </div>
        <div class="col-xl-4 align-self-center">
          <a
            class="btn btn-secondary btn-block"
            href="https://chinchorro.educacionpublica.cl//"
            target="_blank"
            >Visita nuestra web</a
          >
        </div>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
import { onMounted, onUnmounted, reactive, ref } from "vue";
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

const handleScroll = () => {
  isScrolled.value = window.scrollY > 40;
  console.log(isScrolled.value);

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

onMounted(() => {
  window.addEventListener("scroll", handleScroll);
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
  email: string;
  phone: string;
  hours: string;
}

interface FormData {
  name: string;
  email: string;
  message: string;
}

const contactInfo = reactive<ContactInfo>({
  email: " postulaciones@slepchinchorro.cl",
  phone: " +56 58 234 5678",
  hours: " Lunes a Viernes: 8:30 - 17:30 hrs",
});

const formData = reactive<FormData>({
  name: "",
  email: "",
  message: "",
});

const submitForm = () => {
  console.log("Formulario enviado:", formData);
  alert("Mensaje enviado con éxito. Nos pondremos en contacto contigo pronto.");

  // Resetear el formulario
  formData.name = "";
  formData.email = "";
  formData.message = "";
};
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

.navbar {
  position: fixed;
  top: 40px;
  transition: top 0.5s ease;
  width: 100%;
  z-index: 1000;
}

.fixed-top {
  top: 0px;
}

.banner-header {
  position: relative;
  display: flex;
  align-items: center;
}

.banner-custom {
  background: linear-gradient(135deg, var(--footer-bg) 0%, var(--dark) 100%);
  color: white;
  padding: 5rem 0;
  /*margin-bottom: 4rem;*/
  position: relative;
  overflow: hidden;
}

.banner-custom::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: url("../assets/img/banner.webp");
  background-size: cover;
  opacity: 0.5;
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
