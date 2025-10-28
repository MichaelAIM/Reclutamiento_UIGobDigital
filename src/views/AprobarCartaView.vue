<template>
  <div class="container">
    <div v-if="loading" class="text-center">
      <div class="spinner-border text-primary" role="status"></div>
      <p class="mt-3">Cargando carta oferta...</p>
    </div>

    <div v-else-if="error" class="alert alert-danger">
      {{ error }}
    </div>

    <div v-else class="card shadow-sm p-4">
      <h4 class="fw-bold text-dark my-5">Carta Oferta</h4>

      <div class="row">
        <div class="col-md-6 text-left px-5">
          <p>
            <strong>Establecimiento:</strong> {{ carta.institucione?.nombre }}
          </p>
          <p>
            <strong>Director:</strong>
            {{ carta.institucione?.directore?.nombre }}
          </p>
          <p><strong>Cargo:</strong> {{ carta.cargo?.nombre }}</p>
          <p><strong>Jornada:</strong> {{ carta.jornada?.nombre }}</p>
        </div>
        <div class="col-md-6 text-left px-5">
          <p>
            <strong>Seleccionado:</strong>
            {{ carta.Candidato?.nombre_completo }}
          </p>
          <p><strong>RUT:</strong> {{ carta.Candidato?.rut }}</p>
          <p>
            <strong>Horas pactadas: </strong>
            <input
              type="number"
              :value="carta.horas_pactadas"
              class="form-control d-inline-block w-50 ms-2"
            />
          </p>
          <p>
            <strong>Fecha de ingreso: </strong>
            <input
              type="date"
              :value="carta.fecha_ingreso"
              class="form-control d-inline-block w-50 ms-2"
            />
          </p>
        </div>
      </div>

      <div class="mt-4 px-5 text-left">
        <h5 class="text-secondary">Remuneración</h5>
        <p style="white-space: pre-line">{{ carta.glosa_remuneracion }}</p>
      </div>

      <div class="my-4 text-end">
        <button class="btn btn-success" @click="aprobarCarta">
          <i class="bi bi-check-circle me-2"></i>Aprobar Carta
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from "vue";
import { useRoute } from "vue-router";
import {
  obtenerCartaPorToken,
  aprobarCartaOferta,
} from "../services/cartaOfertaService";
import Swal from "sweetalert2";

const route = useRoute();
//const token = route.params.token as string;
const token = route.query.token as string;
const carta = ref<any>(null);
const loading = ref(true);
const error = ref("");

onMounted(async () => {
  if (!token) {
    error.value = "Token no proporcionado.";
    loading.value = false;
    return;
  }
  try {
    carta.value = await obtenerCartaPorToken(token);
  } catch (err) {
    Swal.fire({
      icon: "error",
      title: "Error",
      text: "Token inválido o expirado.",
    });
    error.value = "Token inválido o expirado.";
  } finally {
    loading.value = false;
  }
});

async function aprobarCarta() {
  loading.value = true;
  try {
    const payload = {
      fecha_ingreso: carta.value.fecha_ingreso,
      horas_pactadas: carta.value.horas_pactadas,
    };
    console.log("payload", payload);

    await aprobarCartaOferta(token, payload);
    Swal.fire({
      icon: "success",
      title: "Carta Aprobada",
      text: "La carta oferta ha sido aprobada exitosamente.",
    });
  } catch (err) {
    Swal.fire({
      icon: "error",
      title: "Error",
      text: "No se pudo aprobar la carta oferta.",
    });
  } finally {
    loading.value = false;
  }
}
</script>
