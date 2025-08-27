<template>
  <header>
    <!-- Menu Principal -->
    <nav
      class="navbar navbar-lg navbar-expand-lg navbar-light bg-light with-fixed-navbar-lg fixed-top"
    >
      <div class="container-fluid">
        <a class="navbar-brand" href="/"
          ><i class="fa fa-spinner fa-spin page-loading-icon"></i
          ><img :src="Logo" class="ml-4"
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
            <li class="nav-item"><a class="nav-link" href="#">Inicio</a></li>
            <li class="nav-item">
              <a class="nav-link" href="#procesos-vigentes"
                >Procesos Vigentes</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#como-postular">Como Postular</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Centro de Ayuda</a>
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
              <a class="btn btn-block btn-outline-secondary" href="#"
                >Registrar</a
              >
            </li>
            <li class="nav-item">
              <a class="btn btn-block btn-secondary" href="#">Iniciar sesión</a>
            </li>
            <li class="nav-behavior">
              <a class="nav-link text-uppercase text-underline" href="#">en</a>
            </li>
            <li class="nav-separator"></li>
            <li class="nav-behavior">
              <a class="nav-link" href="#"><i class="cl cl-login"></i></a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Banner Principal -->
    <section class="banner-custom mt-5">
      <div class="w-75 mx-auto px-0 py-5 my-5">
        <div class="row align-items-center">
          <div class="col-12 col-md-6 col-lg-5">
            <h1 class="mb-5 display-4 ltr-1">¡Buscamos tu talento!</h1>
            <p
              class="mb-4 text-white font-level-3 ltr-1"
              style="line-height: 2rem"
            >
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
          <div class="col-12">
            <button
              class="btn btn-pill-light text-decoration-none"
              type="button"
            >
              Revisar Convocatorias Disponibles
            </button>
          </div>
        </div>
      </div>
    </section>
  </header>

  <main class="container-fluid px-0">
    <!-- Cómo Postular Section -->
    <section id="como-postular" class="section py-5">
      <div class="w-75 mx-auto">
        <div class="section-header mt-3">
          <h2 class="pb-2 border-bottom border-accent" id="secciones">
            ¿Cómo Postular?
          </h2>
        </div>
        <div class="section-body">
          <p>Sigue estos sencillos pasos para completar tu postulación</p>
        </div>

        <div class="row g-4 mt-5">
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

    <!-- Funcionalidades Section -->
    <section id="funcionalidades" class="section-padding bg-light">
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

    <!-- Procesos Vigentes -->
    <section id="procesos-vigentes" class="section py-5">
      <div class="w-75 mx-auto">
        <div class="section-header mt-3">
          <h2 class="pb-2 border-bottom border-accent" id="secciones">
            Procesos Vigentes
          </h2>
        </div>
        <div class="section-body">
          <p>Encuentra una oportunidad de empleo en el Slep Chinchorro</p>
        </div>
      </div>
    </section>
  </main>
</template>

<script setup lang="ts">
import { ref } from "vue";
import Logo from "../assets/img/Logotipo-Chinchorro-web.png";
// Datos para las funcionalidades
interface Feature {
  icon: string;
  title: string;
  description: string;
  colorClass: string;
}

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
</script>

<style scoped>
.banner-custom {
  background: linear-gradient(135deg, var(--primary) 0%, var(--dark) 100%);
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
  /*background-color: var(--light);*/
  color: var(--primary);
  padding: 0.35rem 0.65rem;
  border-radius: 50rem;
  font-weight: 600;
  margin: 0.25rem;
  font-size: 0.875rem;
}

.bg-wts {
  background-color: hsla(219, 42%, 30%, 0.3);
  border-radius: 10px;
}

.section-padding {
  padding: 7rem 0;
}

.borde-difuminado {
  box-shadow: 0 0 0 5px rgba(53, 76, 115, 0.2); /* color institucional con transparencia */
}

.ltr-1 {
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
</style>
