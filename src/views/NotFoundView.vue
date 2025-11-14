<template>
  <div class="not-found">
    <h1>Error 404</h1>
    <p>La ruta solicitada no existe en el sistema institucional.</p>
    <router-link to="/">Volver al inicio</router-link>
  </div>
</template>

<script setup>
// Puedes agregar trazabilidad aquí si deseas registrar accesos inválidos
</script>

<style scoped>
.not-found {
  text-align: center;
  padding: 2rem;
  color: #b00020;
}
</style>
