<template>
  <div class="container-fluid px-5">
    <div class="row">
      <div class="col-xl-3">
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
      </div>
      <div class="col-xl-6 align-content-center">
        <!--         <div class="row footer-links">
          <div class="col-md-6"><a href="#">Link 1</a></div>
          <div class="col-md-6"><a href="#">Link 2</a></div>
        </div> -->

        <p class="mb-0 font-level-6">
          &copy;
          {{ anio }} - Servicio Local de Educación Pública Chinchorro. Todos los
          derechos reservados.
        </p>
      </div>
      <div class="col-xl-3 align-self-center">
        <a
          class="btn btn-secondary btn-block"
          href="https://chinchorro.educacionpublica.cl/inicio/"
          target="_blank"
          >Visita Nuestro Sitio Web Institucional</a
        >
      </div>
      <div class="col-xl-3"></div>
    </div>
  </div>
</template>
<script setup>
const anio = new Date().getFullYear();
</script>
<style scoped></style>
