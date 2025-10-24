<template>
  <ModalComponent v-if="visible" @close="emit('update:visible', false)">
    <template #header>
      <!-- <h5 class="modal-title">Carta Oferta</h5> -->
      <img
        :src="LogoFN"
        alt="Logo SLEP Chinchorro"
        class="mb-2"
        style="max-width: 180px"
      />
    </template>

    <template #body>
      <div class="card shadow-sm border-0 p-4 bg-white">
        <div class="text-center mb-4">
          <!--       <h4 class="fw-bold text-dark mt-3">CARTA OFERTA</h4> -->
          <!--       <p class="text-muted">
        Servicio Local de Educación Pública de Chinchorro
      </p> -->
        </div>

        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label class="font-weight-bold">Establecimiento:</label>
              <span v-if="oferta.institucione?.nombre">{{
                oferta.institucione.nombre
              }}</span>
              <input
                v-else
                type="text"
                class="form-control"
                placeholder="Nombre del establecimiento"
              />
            </div>

            <div class="form-group">
              <label class="font-weight-bold">Director:</label>
              <span v-if="oferta.institucione?.directore.nombre">{{
                oferta.institucione.directore.nombre
              }}</span>
              <input
                v-else
                type="text"
                class="form-control"
                placeholder="Nombre del director"
              />
            </div>

            <div class="form-group">
              <label class="font-weight-bold">Correo Director:</label>
              <span v-if="oferta.institucione?.directore.correo">{{
                oferta.institucione.directore.correo
              }}</span>
              <input
                v-else
                type="email"
                class="form-control"
                placeholder="Correo del director"
              />
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="font-weight-bold">Nombre del cargo:</label>
              <span v-if="oferta.cargo?.nombre">{{ oferta.cargo.nombre }}</span>
              <input
                v-else
                type="text"
                class="form-control"
                placeholder="Nombre del cargo"
              />
            </div>

            <div class="form-group">
              <label class="font-weight-bold">Persona seleccionada:</label>
              <span v-if="oferta.Candidato?.nombre_completo">{{
                oferta.Candidato.nombre_completo
              }}</span>
              <input
                v-else
                type="text"
                class="form-control"
                placeholder="Nombre del candidato"
              />
            </div>

            <div class="form-group">
              <label class="font-weight-bold">RUR persona seleccionada:</label>
              <span v-if="oferta.Candidato?.rut">{{
                oferta.Candidato.rut
              }}</span>
              <input
                v-else
                type="text"
                class="form-control"
                placeholder="RUR del candidato"
              />
            </div>

            <div class="form-group">
              <label class="font-weight-bold">Jornada laboral:</label>
              <span v-if="oferta.jornada?.nombre">{{
                oferta.jornada.nombre
              }}</span>
              <input
                v-else
                type="text"
                class="form-control"
                placeholder="Jornada laboral"
              />
            </div>

            <div class="form-group">
              <label class="font-weight-bold">Fecha de ingreso:</label>
              <input
                type="date"
                class="form-control"
                :value="oferta.fecha_ingreso ?? ''"
              />
            </div>
          </div>
        </div>

        <div class="mb-3">
          <h5 class="fw-semibold text-secondary">Remuneración</h5>
          <p class="text-muted">
            La remuneración será ajustada a lo que el Servicio Local de
            Educación disponga, dependiendo de las características del
            postulante y del establecimiento en donde se desempeñará:
          </p>
          <textarea name="" id="" rows="8" cols="70" style="max-width: 100%">
            1. Remuneración básica mínima nacional
            2. Tramo de desempeño
            3. Asignación de experiencia
            4. Reconocimiento por años de servicio
            5. Reconocimiento por desempeño en establecimientos con concentración de alumnos prioritarios
            6. Otros beneficios institucionales
          </textarea>
        </div>
      </div>
    </template>

    <template #footer>
      <button class="btn btn-outline-success" @click="">
        <i class="bi bi-download mr-2"></i>Descargar PDF
      </button>
      <button class="btn btn-success" @click="">
        <i class="bi bi-save mr-2"></i>Guardar Cambios
      </button>
      <button
        class="btn btn-primary ml-4"
        v-if="authStore.user.rol === 'admin'"
        @click=""
      >
        <i class="bi bi-send mr-2"></i>Enviar Al Director
      </button>
    </template>
  </ModalComponent>
</template>
<script setup lang="ts">
import Modal from "../../components/modal/ModalComponent.vue";
import LogoFN from "../../assets/img/Logotipo-Chinchorro-web.png";
import { obtenerCartaOfertaPorId } from "../../services/cartaOfertaService";
import { watch, ref } from "vue";

const ModalComponent = Modal as any;
const oferta = ref<any>({});
const props = defineProps<{
  oferta_id: number | null;
  authStore: {
    user: {
      rol: string;
    };
  };
  visible: boolean;
}>();

watch(
  () => props.oferta_id,
  async (nuevoId, anteriorId) => {
    if (nuevoId && nuevoId !== anteriorId) {
      console.log("Cambio en oferta_id:", anteriorId, "→", nuevoId);
      try {
        oferta.value = await obtenerCartaOfertaPorId(nuevoId);
        console.log("oferta data:", oferta);
      } catch (error) {
        console.error("Error al obtener la carta oferta:", error);
      }
    }
  }
);

const emit = defineEmits(["update:visible"]);

/* function descargarPDF() {
  // Lógica para descargar la carta oferta en PDF
  alert("Descargando carta oferta en PDF...");
} */
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
