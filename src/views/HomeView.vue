<template>
  <header>
    <nav
      class="navbar navbar-lg navbar-expand-lg navbar-light bg-light with-fixed-navbar-lg"
    >
      <div class="container-fluid">
        <a class="navbar-brand" href="/"
          ><i class="fa fa-spinner fa-spin page-loading-icon"></i
          ><img :src="Logo" height="50"
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
              <a class="nav-link" href="#">Como Postular</a>
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
            <li class="nav-item ms-md-4">
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
  </header>

  <main class="container mt-4">
    <button type="button" class="btn btn-primary">Botón Principal</button>
  </main>
</template>

<script setup lang="ts">
import { ref, computed } from "vue";
import Logo from "../assets/img/Logotipo-Chinchorro-web.png";
const logo = Logo;

function openLogin() {
  console.log("login");

  /*   authMode.value = "login";
  showModalById("authModal"); */
}
function openRegister() {
  console.log("registrar");

  /*   authMode.value = "register";
  showModalById("authModal"); */
}
</script>

<style scoped>
@media (min-width: 992px) {
  nav.navbar.navbar-lg .navbar-brand {
    height: 120px !important;
  }
}
.navbar-brand img {
  margin-top: 13%;
  margin-bottom: auto;
}
</style>
