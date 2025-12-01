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
      <div class="bg-primary text-white py-3 mb-5 rounded">
        <h4 class="text-center">CARTA OFERTA</h4>
      </div>

      <div class="row mx-0 mt-3">
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
          <p><strong>Horas pactadas:</strong> {{ carta.horas_pactadas }}</p>
        </div>
        <div class="col-md-6 text-left pr-5">
          <div class="border border-success pl-5 pt-3">
            <p>
              <strong>Funcionario:</strong>
              {{ carta.Candidato?.nombre_completo }}
            </p>
            <p><strong>Rut:</strong> {{ carta.Candidato?.rut }}</p>
            <p><strong>Correo:</strong> {{ carta.Candidato?.correo }}</p>
            <p><strong>Fono:</strong> {{ carta.Candidato?.telefono }}</p>
            <p>
              <strong>Fecha de ingreso: </strong>
              <span v-if="!esDirector">{{ carta.fecha_ingreso }}</span>
              <input
                v-else
                type="date"
                :value="carta.fecha_ingreso"
                class="form-control d-inline-block w-50 ms-2"
                :disabled="aprobadoDirector"
              />
            </p>
          </div>
        </div>
      </div>

      <div class="mt-4 px-5 text-left">
        <h5 class="text-secondary">Remuneración</h5>
        <p style="white-space: pre-line">{{ carta.glosa_remuneracion }}</p>
      </div>

      <div
        class="my-4 p-5 border border-success rounded bg-success text-white"
        v-if="aprobadoDirector && esDirector"
      >
        <strong>Director:</strong>
        <strong>Fecha de Aprobación: </strong>
        {{ formatoFechaHora(carta.fecha_apr_director) }}
      </div>

      <div
        class="my-4 p-5 border border-success rounded bg-success text-white"
        v-else-if="aprobadoCandidato && !esDirector"
      >
        <strong>Candidato:</strong>
        <strong>Fecha de Aprobación: </strong>
        {{ formatoFechaHora(carta.fecha_apr_candidato) }}
      </div>

      <div class="my-4 text-end" v-else>
        <button class="btn btn-success btn-block" @click="ValidarCodigo">
          <i class="bi bi-check-circle mr-2"></i> Aprobar Carta
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
import { formatoFechaHora } from "../utils/validaciones";
import Swal from "sweetalert2";

const route = useRoute();
//const token = route.params.token as string;
const token = route.query.token as string;
const director = route.query.alt as string;
const carta = ref<any>(null);
const loading = ref(true);
const error = ref("");
const aprobadoCandidato = ref(false);
const aprobadoDirector = ref(false);
const esDirector = ref(false);

onMounted(async () => {
  if (!token) {
    error.value = "Token no proporcionado.";
    loading.value = false;
    return;
  }
  if (director === "D1r") {
    esDirector.value = true;
  }
  try {
    carta.value = await obtenerCartaPorToken(token);
    if (carta.value.fecha_apr_director) {
      aprobadoDirector.value = true;
    }
    if (carta.value.fecha_apr_candidato) {
      aprobadoCandidato.value = true;
    }
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

function ValidarCodigo() {
  Swal.fire({
    title: "Ingrese el código",
    input: "text",
    inputAttributes: {
      autocapitalize: "off",
    },
    confirmButtonColor: "#2d717c", // Color del botón
    cancelButtonColor: "#918d8d", // Si usas botón cancelar
    showCancelButton: true,
    confirmButtonText: "Ingresar",
    showLoaderOnConfirm: true,
    preConfirm: (login) => {
      aprobarCarta(login);
    },
    allowOutsideClick: () => !Swal.isLoading(),
  });
}

async function aprobarCarta(codigo: number) {
  loading.value = true;
  try {
    const payload = {
      fecha_ingreso: carta.value.fecha_ingreso,
      horas_pactadas: carta.value.horas_pactadas,
      esDirector: esDirector.value,
      codigo: codigo,
    };
    const { fechaAprobacion } = await aprobarCartaOferta(token, payload);
    if (esDirector.value) {
      aprobadoDirector.value = true;
      carta.value.fecha_apr_director = fechaAprobacion;
    } else {
      aprobadoCandidato.value = true;
      carta.value.fecha_apr_candidato = fechaAprobacion;
    }
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
