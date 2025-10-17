<template>
  <div class="card shadow-sm border-0 p-4 bg-white">
    <div class="text-center mb-4">
      <img
        :src="LogoFN"
        alt="Logo SLEP Chinchorro"
        class="mb-2"
        style="max-width: 180px"
      />
      <h4 class="fw-bold text-dark mt-3">CARTA OFERTA</h4>
      <!--       <p class="text-muted">
        Servicio Local de Educación Pública de Chinchorro
      </p> -->
    </div>

    <div class="mb-3">
      <p><strong>Nombre del cargo:</strong> {{ oferta.cargo }}</p>
      <p><strong>Establecimiento:</strong> {{ oferta.establecimiento }}</p>
      <p><strong>Persona seleccionada:</strong> {{ oferta.nombre }}</p>
      <p><strong>Jornada laboral:</strong> {{ oferta.jornada }}</p>
      <p><strong>Fecha de ingreso:</strong> {{ oferta.fechaIngreso }}</p>
    </div>

    <div class="mb-3">
      <h5 class="fw-semibold text-secondary">Remuneración</h5>
      <p class="text-muted">
        La remuneración será ajustada a lo que el Servicio Local de Educación
        disponga, dependiendo de las características del postulante y del
        establecimiento en donde se desempeñará:
      </p>
      <textarea name="" id="" rows="8" cols="50">
1. Remuneración básica mínima nacional
2. Tramo de desempeño
3. Asignación de experiencia
4. Reconocimiento por años de servicio
5. Reconocimiento por desempeño en establecimientos con concentración de alumnos prioritarios
6. Otros beneficios institucionales
</textarea
      >
    </div>

    <div class="text-end mt-4">
      <button class="btn btn-outline-primary" @click="$emit('descargar')">
        <i class="bi bi-download me-2"></i>Descargar oferta
      </button>
      <button class="btn btn-primary ml-4" @click="$emit('descargar')">
        <i class="bi bi-send me-2"></i>Enviar Al Director
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import LogoFN from "../assets/img/Logotipo-Chinchorro-web.png";
defineProps<{
  oferta: {
    cargo: string;
    establecimiento: string;
    nombre: string;
    jornada: string;
    fechaIngreso: string;
  };
}>();
</script>

<style scoped>
.card {
  max-width: 700px;
  margin: auto;
}
ul {
  padding-left: 1.2rem;
}
</style>
