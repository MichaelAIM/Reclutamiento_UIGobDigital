<template>
  <div class="top-header fixed-top" :class="visibility">
    <div class="doc-icons">
      <div class="doc-icon">
        <a
          href="https://www.facebook.com/epchinchorro/?locale=es_CL"
          class="text-decoration-none"
        >
          <span class="cl cl-social text-white cl-facebook"></span>
        </a>
      </div>
      <div class="doc-icon">
        <a
          href="https://www.instagram.com/slepchinchorro/?hl=es"
          class="text-decoration-none"
        >
          <span class="cl cl-social text-white cl-instagram"></span>
        </a>
      </div>
      <div class="doc-icon">
        <a
          href="https://x.com/edu__chinchorro?lang=es"
          class="text-decoration-none"
        >
          <span class="cl cl-social text-white cl-twitter"></span>
        </a>
      </div>
      <div class="doc-icon">
        <a
          href="https://www.youtube.com/@ServicioLocalChinchorro"
          class="text-decoration-none"
        >
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
              @click="router.push('/')"
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
              @click="irAlPerfil('/register')"
              >Registrar</a
            >
          </li>
          <li class="nav-item mr-md-5">
            <a class="btn btn-block btn-secondary" @click="irAlPerfil('/login')"
              >Iniciar sesión</a
            >
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>
<script setup>
import { onMounted, onUnmounted, reactive, ref } from "vue";
import { useRouter } from "vue-router";

const router = useRouter();

function irAlPerfil(URL) {
  router.push(URL);
}

const isScrolled = ref(false);
const visibility = ref("visible");
const Logo = ref("../../src/assets/img/Logotipo-Chinchorro-web-02.png");
const isBgNavbar = ref("bg-transparent");

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

onMounted(() => {
  window.addEventListener("scroll", handleScroll);
});

onUnmounted(() => {
  window.removeEventListener("scroll", handleScroll);
});
</script>
<style lang="css" scoped>
.navbar {
  position: fixed;
  top: 40px;
  transition: top 0.5s ease;
  width: 100%;
  z-index: 1000;
}

.nav-item {
  cursor: pointer;
}

.fixed-top {
  top: 0px;
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
</style>
