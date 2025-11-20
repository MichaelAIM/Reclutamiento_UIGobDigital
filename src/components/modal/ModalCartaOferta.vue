<template>
  <ModalComponent v-if="visible" @close="emit('update:visible', false)">
    <!-- Loading institucional -->
    <div class="row py-5" v-if="enviandoCorreo">
      <div class="col-12 text-center">
        <div class="spinner-border text-primary" role="status">
          <span class="visually-hidden"></span>
        </div>
        <p class="text-muted mt-3">Cargando postulaciones...</p>
      </div>
    </div>
    <template #header>
      <!-- <h5 class="modal-title">Carta Oferta</h5> -->
      <img
        :src="LogoFN"
        alt="Logo SLEP Chinchorro"
        class="mb-2"
        style="max-width: 180px"
      />
      <h4 class="fw-bold text-dark mt-3">CARTA OFERTA</h4>
    </template>

    <template #body>
      <div class="card shadow-sm border-0 p-4 bg-white">
        <div class="text-center mb-4">
          <!--       <p class="text-muted">
        Servicio Local de Educación Pública de Chinchorro
      </p> -->
        </div>

        <div class="row">
          <div class="col-md-6">
            <div class="form-group border border-success">
              <label
                class="font-weight-bold bg-success text-white py-1 mb-0 px-2 rounded-md"
                >Cargo:
              </label>
              <span v-if="oferta.cargo?.nombre">
                {{ ` ${oferta.cargo.nombre}` }}</span
              >
              <input
                v-else
                type="text"
                class="form-control"
                placeholder="Nombre del cargo"
              />
            </div>

            <div class="form-group">
              <label class="font-weight-bold">Jornada laboral:</label>
              <span v-if="oferta.jornada?.nombre">{{
                ` ${oferta.jornada.nombre}`
              }}</span>
              <input
                v-else
                type="text"
                class="form-control"
                placeholder="Jornada laboral"
              />
            </div>

            <div class="form-group">
              <label class="font-weight-bold">Establecimiento: </label>
              <span v-if="oferta.institucione?.nombre">
                {{ ` ${oferta.institucione.nombre}` }}</span
              >
              <input
                v-else
                type="text"
                class="form-control"
                placeholder="Nombre del establecimiento"
              />
            </div>

            <div class="form-group">
              <label class="font-weight-bold">Director: </label>
              <span v-if="oferta.institucione?.directore.nombre">
                {{ ` ${oferta.institucione.directore.nombre}` }}</span
              >
              <input
                v-else
                type="text"
                class="form-control"
                placeholder="Nombre del director"
              />
            </div>

            <div class="form-group">
              <label class="font-weight-bold">Correo Director: </label>
              <span v-if="oferta.institucione?.directore.correo">
                {{ ` ${oferta.institucione.directore.correo}` }}</span
              >
              <input
                v-else
                type="email"
                class="form-control"
                placeholder="Correo del director"
              />
            </div>

            <div
              class="mt-4 bg-accent-4 px-3"
              v-if="oferta.fecha_envio_candidato"
            >
              <strong>fecha de envio al Candidato: </strong>
              {{ fechaFormateada(oferta.fecha_envio_candidato) }}
            </div>

            <div
              class="mt-4 bg-accent-5 text-white px-3"
              v-if="oferta.fecha_apr_candidato"
            >
              <strong>fecha de aprovación Candidato: </strong>
              {{ fechaFormateada(oferta.fecha_apr_candidato) }}
            </div>

            <div class="mt-4 bg-accent-2 px-3" v-if="oferta.fecha_apr_director">
              <strong>fecha de envio al Director: </strong>
              {{ fechaFormateada(oferta.fecha_envio_dir) }}
            </div>

            <div class="mt-4 bg-accent-3 px-3" v-if="oferta.fecha_apr_director">
              <strong>fecha de aprovación Director: </strong>
              {{ fechaFormateada(oferta.fecha_apr_director) }}
            </div>
          </div>

          <div class="col-md-6">
            <div class="text-center mb-2 bg-primary text-white rounded-md">
              <p
                v-if="oferta.Candidato?.nombre_completo"
                style="font-size: 20px"
                class="mb-1 pt-4 text-white"
              >
                {{ ` ${oferta.Candidato.nombre_completo}` }}
                <br />
                <span v-if="oferta.Candidato?.rut" style="font-size: 12px">{{
                  ` ${oferta.Candidato.rut}`
                }}</span>
                <span v-else>Sin Datos</span>
              </p>
              <p v-else>Sin Datos</p>

              <label class="font-weight-bold pb-3"
                >Persona seleccionada:
              </label>
            </div>

            <div class="form-group">
              <label class="font-weight-bold" v-if="!oferta.Candidato?.rut"
                >RUT:</label
              >
              <input
                v-if="!oferta.Candidato?.rut"
                type="text"
                class="form-control"
                placeholder="RUR del candidato"
              />
            </div>

            <div class="form-group">
              <label class="font-weight-bold"
                >(*) Horas Pactadas (confirmar):</label
              >
              <input
                type="number"
                class="form-control"
                v-model="oferta.horas_pactadas"
              />
            </div>
            <div class="form-group">
              <label class="font-weight-bold"
                >(*) Fecha de ingreso (desde) :</label
              >
              <input
                type="date"
                class="form-control w-50"
                v-model="oferta.fecha_ingreso"
              />
            </div>
          </div>
        </div>

        <div class="my-3">
          <h5 class="fw-semibold text-secondary">(*) Remuneración</h5>
          <textarea
            v-model="oferta.glosa_remuneracion"
            rows="8"
            style="min-width: 100%"
          ></textarea>
        </div>
      </div>
    </template>

    <template #footer>
      <!--       <button class="btn btn-outline-success" @click="">
        <i class="bi bi-download mr-2"></i>Descargar PDF
      </button> -->
      <button
        class="btn btn-danger"
        v-if="authStore?.user?.rol === 'admin' && !oferta.fecha_apr_director"
        @click="guardarCambios(3)"
      >
        <i class="bi bi-x-octagon"></i>
        Anular Postulacion
      </button>
      <button
        class="btn btn-success ml-4"
        @click="guardarCambios(null)"
        v-if="!oferta.fecha_apr_director"
      >
        <i class="bi bi-save mr-2"></i>Guardar Cambios
      </button>
      <button
        class="btn btn-primary ml-4"
        v-if="authStore?.user?.rol === 'admin' && !oferta.fecha_apr_director"
        @click="guardarCambios(1)"
      >
        <i class="bi bi-envelope-at mr-2"></i> Enviar Al Director
      </button>
      <button
        class="btn btn-outline-primary ml-4"
        v-if="authStore?.user?.rol === 'admin' && !oferta.fecha_apr_candidato"
        @click="guardarCambios(4)"
      >
        <i class="bi bi-envelope-at-fill mr-2"></i> Enviar Al Candidato
      </button>
    </template>
  </ModalComponent>
</template>
<script setup lang="ts">
import Modal from "../../components/modal/ModalComponent.vue";
import LogoFN from "../../assets/img/Logotipo-Chinchorro-web.png";
import {
  obtenerCartaOfertaPorId,
  actualizarCartaOferta,
} from "../../services/cartaOfertaService";
import { fechaFormateada } from "../../utils/validaciones";
import { watch, ref } from "vue";
import Swal from "sweetalert2";

const ModalComponent = Modal as any;
const oferta = ref<any>({
  institucione: {
    nombre: "",
    directore: {
      nombre: "",
      correo: "",
    },
  },
  cargo: { nombre: "" },
  jornada: { nombre: "" },
  Candidato: { nombre_completo: "", rut: "" },
  fecha_ingreso: "",
  horas_pactadas: 0,
  glosa_remuneracion: "",
});
const enviandoCorreo = ref(false);
const props = defineProps<{
  oferta_id: number | null;
  authStore: {
    user: {
      rol: string;
    };
  } | null;
  visible: boolean;
}>();

async function guardarCambios(enviarDirector: number | null) {
  if (
    !oferta.value.fecha_ingreso ||
    !oferta.value.horas_pactadas ||
    !oferta.value.glosa_remuneracion
  ) {
    Swal.fire("Error", "Debe completar todos los campos con (*) .", "error");
    return false;
  }
  enviandoCorreo.value = true;
  try {
    const payload = {
      fecha_ingreso: oferta.value.fecha_ingreso,
      glosa_remuneracion: oferta.value.glosa_remuneracion,
      horas_pactadas: oferta.value.horas_pactadas,
      dato_envio: enviarDirector,
    };
    await actualizarCartaOferta(props.oferta_id!, payload);
    if (enviarDirector == 1) {
      Swal.fire("Éxito", "Carta oferta enviada correctamente.", "success");
    } else {
      Swal.fire("Éxito", "Cambios guardados correctamente.", "success");
    }
  } catch (error) {
    console.error("Error al guardar cambios:", error);
    alert("Error al guardar cambios.");
  } finally {
    enviandoCorreo.value = false;
  }
}

watch(
  () => props.oferta_id,
  async (nuevoId, anteriorId) => {
    if (nuevoId && nuevoId !== anteriorId) {
      console.log("Cambio en oferta_id:", anteriorId, "→", nuevoId);
      try {
        oferta.value = await obtenerCartaOfertaPorId(nuevoId);
        if (
          oferta.value.Convocatorium.jornada_id == 1 &&
          !oferta.value.horas_pactadas
        ) {
          oferta.value.horas_pactadas = 44;
        } else if (
          oferta.value.Convocatorium.jornada_id == 3 &&
          !oferta.value.horas_pactadas
        ) {
          oferta.value.horas_pactadas = 22;
        } else if (
          oferta.value.Convocatorium.jornada_id == 3 &&
          !oferta.value.horas_pactadas
        ) {
          oferta.value.horas_pactadas = 33;
        }
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
  max-width: 900px;
  margin: auto;
}
ul {
  padding-left: 1.2rem;
}
</style>
