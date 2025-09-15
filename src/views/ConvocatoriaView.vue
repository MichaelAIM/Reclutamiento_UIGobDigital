<template>
  <div class="min-vh-100 py-4">
    <div class="container">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="h4 text-secondary fw-semibold mb-4">
          Convocatorias disponibles
        </h2>

        <button class="btn btn-success" @click="abrirModal">
          <i class="bi bi-plus-circle mr-2"></i> Añadir convocatoria
        </button>
      </div>

      <div class="row">
        <div class="col-6">
          <div class="input-group rounded-pill flex-grow-1">
            <span class="input-group-text bg-white border-end-0">
              <i class="bi bi-person"></i>
            </span>
            <input
              type="text"
              class="form-control border-start-0"
              placeholder="Cargo (Ej. Profesor)"
            />
          </div>
        </div>
        <div class="col-3">
          <select class="form-select flex-grow-1 w-100">
            <option selected disabled hidden value="">Estado</option>
            <option>Abierta</option>
            <option>Cerrada</option>
          </select>
        </div>
        <div class="col-3">
          <select class="form-select flex-grow-1 w-100">
            <option selected disabled hidden value="">Tipo de contrato</option>
            <option>Contrato</option>
            <option>Honorarios</option>
          </select>
        </div>
      </div>

      <div class="row py-5">
        <div
          class="col-md-6"
          v-for="convocatoria in convocatorias"
          :key="convocatoria.id"
        >
          <a class="banner border mb-3 flex-wrap bg-white">
            <div class="line"></div>
            <div class="py-4 border-bottom border-accent banner-header w-100">
              <h4 class="banner-text flex-column">
                <span class="font-weight-bold font-level-7">{{
                  convocatoria.cargo.nombre
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
                {{ convocatoria.institucione.nombre }}
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
    </div>
  </div>
  <NuevaConvocatoria v-model:visible="mostrarModal" />
</template>

<script setup>
import { reactive, defineEmits, ref, onMounted } from "vue";
import NuevaConvocatoria from "../components/modal/NuevaConvocatoriaModal.vue";
import { fetchConvocatorias } from "../services/convocatoriaServices";

const emit = defineEmits(["filtrar"]);
const mostrarModal = ref(false);

const abrirModal = () => {
  mostrarModal.value = true;
};

const convocatorias = ref([]);
const filtros = reactive({
  cargo: "",
  estado: "",
  contrato: "",
});

function aplicarFiltros() {
  emit("filtrar", { ...filtros });
}

function resetFiltros() {
  filtros.cargo = "";
  filtros.estado = "";
  filtros.contrato = "";
  aplicarFiltros();
}

onMounted(async () => {
  convocatorias.value = await fetchConvocatorias();
});
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
.form-label {
  font-weight: 600;
}
.card-header {
  border-bottom: 1px solid #dee2e6;
}
.form-control,
.form-select {
  height: 40px;
  min-width: 180px;
  border: #dee2e6 solid 1px;
}
.filter-item {
  min-width: 180px;
  margin-right: 1rem;
  margin-bottom: 0.5rem;
}
.form-control,
.form-select {
  height: 40px;
}
</style>
