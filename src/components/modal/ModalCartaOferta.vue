<template>
  <div v-if="enviandoCorreo" class="modal-overlay">
    <div
      class="d-flex justify-content-center align-items-center"
      style="height: 100vh"
    >
      <div class="text-center">
        <div class="spinner-border text-white" role="status">
          <span class="visually-hidden"></span>
        </div>
        <p class="text-muted mt-3">Procesando...</p>
      </div>
    </div>
  </div>
  <ModalComponent v-if="visible" @close="emit('update:visible', false)">
    <!-- Loading institucional -->
    <template #header>
      <!-- <h5 class="modal-title">Carta Oferta</h5> -->
      <img
        :src="LogoFN"
        alt="Logo SLEP Chinchorro"
        class="mb-2"
        style="max-width: 180px"
      />
      <h4 class="fw-bold text-dark mt-3">CARTA OFERTA:</h4>
    </template>

    <template #body>
      <div class="row">
        <div class="col-md-9">
          <div class="card shadow-sm border-0 p-4 bg-white">
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

                <div class="form-group mt-3">
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
              </div>

              <div class="col-md-6">
                <div
                  class="text-center mb-2 border-primary border rounded text-primary py-4"
                >
                  <label class="text-primary mt-2"
                    >Persona seleccionada:
                  </label>
                  <p
                    v-if="oferta.Candidato?.nombre_completo"
                    style="font-size: 20px"
                    class="mb-1 pt-1 font-weight-bold text-primary"
                  >
                    {{ ` ${oferta.Candidato.nombre_completo}` }}
                  </p>
                  <p v-else>Sin Datos</p>

                  <p
                    v-if="oferta.Candidato?.rut"
                    style="font-size: 14px"
                    class="text-primary mb-0"
                  >
                    {{ ` ${oferta.Candidato.rut}` }}
                  </p>
                  <p v-else>Sin Datos</p>

                  <p
                    v-if="oferta.Candidato?.correo"
                    style="font-size: 14px"
                    class="text-primary"
                  >
                    {{ ` ${oferta.Candidato.correo}` }}
                  </p>
                  <p v-else>Sin Datos</p>
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
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div
                  class="card border-0 shadow-sm bg-light mt-4"
                  v-if="oferta.fecha_envio_dir"
                >
                  <div class="card-body p-3">
                    <div class="d-flex align-items-center">
                      <!-- Icono simple -->
                      <div class="flex-shrink-0 me-3">
                        <i
                          class="bi bi-envelope-check-fill text-success"
                          style="font-size: 2rem"
                        ></i>
                      </div>

                      <!-- Textos -->
                      <div class="flex-grow-1 ml-4">
                        <p class="text-muted mb-0 small">
                          Fecha de envio al Director:
                        </p>
                        <p class="h6 mb-0 fw-bold text-dark">
                          {{ fechaFormateada(oferta.fecha_envio_dir) }}
                        </p>
                      </div>
                    </div>
                  </div>
                </div>

                <div
                  class="card border-0 shadow-sm bg-light mt-4"
                  v-if="oferta.fecha_apr_director"
                >
                  <div class="card-body p-3">
                    <div class="d-flex align-items-center">
                      <!-- Icono simple -->
                      <div class="flex-shrink-0 me-3">
                        <div
                          class="bg-success rounded-circle d-flex align-items-center justify-content-center"
                          style="width: 40px; height: 40px"
                        >
                          <i
                            class="bi bi-check2-all text-white"
                            style="font-size: 1.5rem"
                          ></i>
                        </div>
                      </div>

                      <!-- Textos -->
                      <div class="flex-grow-1 ml-4">
                        <p class="text-muted mb-0 small">
                          Fecha de Aprobación del Director:
                        </p>
                        <p class="h6 mb-0 fw-bold text-dark">
                          {{ fechaFormateada(oferta.fecha_apr_director) }}
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div
                  class="card border-0 shadow-sm bg-light mt-4"
                  v-if="oferta.fecha_envio_candidato"
                >
                  <div class="card-body p-3">
                    <div class="d-flex align-items-center">
                      <!-- Icono simple -->
                      <div class="flex-shrink-0 me-3">
                        <i
                          class="bi bi-envelope-check-fill text-success"
                          style="font-size: 2rem"
                        ></i>
                      </div>

                      <!-- Textos -->
                      <div class="flex-grow-1 ml-4">
                        <p class="text-muted mb-0 small">
                          Fecha de envio al Candidato:
                        </p>
                        <p class="h6 mb-0 fw-bold text-dark">
                          {{ fechaFormateada(oferta.fecha_envio_candidato) }}
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
                <div
                  class="card border-0 shadow-sm bg-light mt-4"
                  v-if="oferta.fecha_apr_candidato"
                >
                  <div class="card-body p-3">
                    <div class="d-flex align-items-center">
                      <!-- Icono simple -->
                      <div class="flex-shrink-0 me-3">
                        <div
                          class="bg-success rounded-circle d-flex align-items-center justify-content-center"
                          style="width: 40px; height: 40px"
                        >
                          <i
                            class="bi bi-check2-all text-white"
                            style="font-size: 1.5rem"
                          ></i>
                        </div>
                      </div>

                      <!-- Textos -->
                      <div class="flex-grow-1 ml-4">
                        <p class="text-muted mb-0 small">
                          Fecha de aceptación de la oferta:
                        </p>
                        <p class="h6 mb-0 fw-bold text-dark">
                          {{ fechaFormateada(oferta.fecha_apr_candidato) }}
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row mt-4">
              <div class="col-md-6 mt-3">
                <div class="form-group">
                  <label class="font-weight-bold"
                    >(*) Horas Pactadas (confirmar):</label
                  >
                  <input
                    type="number"
                    class="form-control"
                    v-model="oferta.horas_pactadas"
                    :disabled="
                      oferta.fecha_envio_dir || oferta.fecha_envio_candidato
                    "
                  />
                </div>
              </div>
              <div class="col-md-6 mt-3">
                <div class="form-group">
                  <label class="font-weight-bold"
                    >(*) Fecha de ingreso (desde) :</label
                  >
                  <input
                    type="date"
                    class="form-control w-100"
                    v-model="oferta.fecha_ingreso"
                    :disabled="
                      oferta.fecha_envio_dir || oferta.fecha_envio_candidato
                    "
                  />
                </div>
              </div>

              <div class="col-12">
                <div class="my-3">
                  <h5 class="fw-semibold text-secondary">(*) Remuneración</h5>
                  <textarea
                    v-model="oferta.glosa_remuneracion"
                    rows="6"
                    class="w-100"
                    :disabled="
                      oferta.fecha_envio_dir || oferta.fecha_envio_candidato
                    "
                  ></textarea>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 py-5">
          <p class="border border-success py-1">
            <strong
              class="font-weight-bold bg-success text-white py-2 my-0 px-2 rounded-md"
            >
              Estado:
            </strong>
            <span v-if="oferta.estado_carta_ofertum?.nombre" class="ml-2">
              {{ ` ${oferta.estado_carta_ofertum.nombre.toUpperCase()}` }}
            </span>
            <span v-else> Estado no disponible </span>
          </p>
          <p class="border border-success py-1">
            <strong
              class="font-weight-bold bg-success text-white py-2 my-0 px-2 rounded-md"
            >
              Creación:
            </strong>
            <span v-if="oferta.created_at" class="ml-2">
              {{ ` ${formatoFechaHora(oferta.created_at)}` }}</span
            >
            <span v-else> Error! no disponible </span>
          </p>

          <button
            class="btn btn-danger mt-4"
            v-if="
              authStore?.user?.rol === 'admin' && !oferta.fecha_apr_director
            "
            @click="guardarCambios(3)"
          >
            <i class="bi bi-x-octagon"></i>
            Anular Postulacion
          </button>
          <button
            class="btn btn-success mt-4"
            @click="guardarCambios(null)"
            v-if="!oferta.fecha_apr_director"
          >
            <i class="bi bi-save mr-2"></i>Guardar Cambios
          </button>
          <button
            class="btn btn-primary mt-4"
            v-if="
              authStore?.user?.rol === 'admin' && !oferta.fecha_apr_director
            "
            @click="guardarCambios(1)"
          >
            <i class="bi bi-envelope-at mr-2"></i> Enviar Al Director
          </button>
          <button
            class="btn btn-outline-primary mt-4"
            v-if="
              authStore?.user?.rol === 'admin' && !oferta.fecha_apr_candidato
            "
            @click="guardarCambios(4)"
          >
            <i class="bi bi-envelope-at-fill mr-2"></i> Enviar Al Candidato
          </button>
        </div>
      </div>
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
import { fechaFormateada, formatoFechaHora } from "../../utils/validaciones";
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
  enviandoCorreo.value = true;

  if (enviarDirector === 1 || enviarDirector === 4) {
    if (
      !oferta.value.fecha_ingreso ||
      !oferta.value.horas_pactadas ||
      !oferta.value.glosa_remuneracion
    ) {
      Swal.fire("Error", "Debe completar todos los campos con (*) .", "error");
      enviandoCorreo.value = false;
      return false;
    }
  }

  if (enviarDirector === 3) {
    Swal.fire({
      title: "Estas Seguro?",
      text: "No podrás revertir esto.",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Si, Anular!",
    }).then((result) => {
      if (!result.isConfirmed) {
        return false;
      }
    });
  }

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
</script>
<style scoped>
.card {
  max-width: 900px;
  margin: auto;
}
ul {
  padding-left: 1.2rem;
}
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 9999;
  display: flex;
  justify-content: center;
  align-items: center;
}

.letter-spacing-1 {
  letter-spacing: 0.5px;
}

.shadow-custom {
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
    0 2px 4px -1px rgba(0, 0, 0, 0.06);
}

/* Efecto hover para interactividad */
.card-hover {
  transition: all 0.3s ease;
}

.card-hover:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 15px -3px rgba(0, 0, 0, 0.1);
}
.form-group {
  font-size: 14px;
  margin-bottom: 6px;
}
</style>
