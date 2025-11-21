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
  <div class="offset-md-4 col-md-4">
    <a class="banner border mb-3 flex-wrap bg-white">
      <div class="line"></div>
      <img
        src="../assets/img/Logotipo-Chinchorro-web.png"
        alt="Logo
      Contrataciones Slep Chinchorro"
        class="mb-3 d-block"
        style="max-width: 35%; height: auto"
      />

      <div class="px-4 pt-3 pb-1 w-100">
        <!-- <p class="h2">Iniciar Sesión</p> -->
        <img
          src="../assets/img/favicon-fb.ico"
          alt="Logo Contrataciones Slep Chinchorro"
          class="mb-3 mx-auto d-block"
          style="max-width: 50px; height: auto"
        />
        <div class="fw-semibold text-center text-dark w-100">
          Bienvenido al Sistema de Reclutamiento y Selección
        </div>
        <div class="text-center w-100">
          <span class="text-muted fw-light font-level-9">
            del Servicio Local de Educación Pública Chinchorro
          </span>
        </div>
      </div>

      <div class="p-4 w-100">
        <form @submit.prevent="iniciarSesion">
          <div class="mb-3 text-start">
            <label for="usuario" class="form-label fw-bold"
              >RUT (sin puntos, con guión)</label
            >
            <input
              type="text"
              class="form-control"
              id="usuario"
              v-model="usuario"
              @input="onRutInput"
              placeholder="Ej: 12345678-9"
              required
            />
          </div>
          <div class="mb-3 text-start">
            <label for="password" class="form-label fw-bold">Contraseña</label>
            <div class="input-group">
              <input
                :type="mostrarPassword ? 'text' : 'password'"
                class="form-control"
                id="password"
                v-model="password"
                placeholder="Ingresa tu contraseña"
                required
              />
              <button
                type="button"
                class="btn btn-outline-primary py-0"
                style="min-height: auto"
                @click="mostrarPassword = !mostrarPassword"
                title="Mostrar/Ocultar contraseña"
              >
                <i
                  :class="mostrarPassword ? 'bi bi-eye-slash' : 'bi bi-eye'"
                ></i>
              </button>
            </div>
          </div>

          <!-- Recordarme + Link -->
          <div
            class="d-flex flex-column flex-sm-row align-items-start align-items-sm-center justify-content-between w-100 gap-2"
          >
            <div class="form-check"></div>
            <a
              href="#"
              class="text-primary fw-medium text-decoration-none fs-0875"
              @click.prevent="mostrarRecuperar = true"
            >
              ¿Olvidó su contraseña?
            </a>
          </div>

          <button type="submit" class="btn btn-primary w-100 mt-3 mb-2 fs-0875">
            Iniciar Sesión
          </button>
          <a
            href="#"
            class="text-secondary fw-medium text-decoration-none fs-0875"
            @click="router.push('/register')"
          >
            ¿No tienes una cuenta? Regístrate aquí.
          </a>
          <RecaptchaBadge />
        </form>
      </div>
    </a>
  </div>
  <div v-if="cargandoRecaptcha" class="text-center mt-3">
    <i class="bi bi-shield-lock text-primary fs-4"></i>
    <div class="text-muted small mt-1">Validando seguridad institucional…</div>
  </div>

  <Modal v-if="mostrarRecuperar" @close="mostrarRecuperar = false">
    <template #header>
      <h5 class="modal-title">Recuperar Contraseña</h5>
    </template>

    <template #body>
      <div class="mb-3">
        <label for="rutRecuperacion" class="form-label fw-bold"
          >RUT registrado</label
        >
        <input
          type="text"
          class="form-control"
          id="rutRecuperacion"
          v-model="rutRecuperacion"
          placeholder="Ej: 12345678-9"
          required
        />
      </div>
    </template>

    <template #footer>
      <!--       <button class="btn btn-secondary" @click="mostrarRecuperar = false">
        Cerrar
      </button> -->
      <button class="btn btn-primary" @click="enviarRecuperacion">
        Enviar
      </button>
    </template>
  </Modal>
</template>

<script setup>
import { ref } from "vue";
import { useAuthStore } from "../store/authStore";
import { useRouter } from "vue-router";
import Swal from "sweetalert2";
import { validarRut, formatearRut, limpiarRut } from "../utils/validaciones";
import { useRecaptchaV3 } from "../composables/useRecaptchaV3";
import RecaptchaBadge from "../components/RecaptchaBadge.vue";
import Modal from "../components/modal/ModalComponent.vue";
import { recuperarPassword } from "../services/authservice";

const checked1 = ref(true);
const usuario = ref("");
const password = ref("");
const authStore = useAuthStore();
const router = useRouter();
const { getToken } = useRecaptchaV3();
const cargandoRecaptcha = ref(false);
const mostrarPassword = ref(false);
const cargandoRecuperacion = ref(false);
const mostrarRecuperar = ref(false);
const rutRecuperacion = ref("");
const enviandoCorreo = ref(false);

async function enviarRecuperacion() {
  if (!validarRut(rutRecuperacion.value)) {
    Swal.fire({ icon: "warning", title: "RUT inválido" });
    return;
  }

  cargandoRecuperacion.value = true;

  try {
    await recuperarPassword({
      rut: limpiarRut(rutRecuperacion.value),
    });

    Swal.fire({
      icon: "success",
      title: "Solicitud enviada",
      text: "Si tu RUT está registrado, recibirás un correo con instrucciones para recuperar tu contraseña.",
    });

    mostrarRecuperar.value = false;
  } catch (error) {
    console.log(error);

    Swal.fire({
      icon: "error",
      title: "Error",
      text:
        error.response?.data?.message || "No se pudo procesar la solicitud.",
    });
  } finally {
    cargandoRecuperacion.value = false;
  }
}

function onRutInput(e) {
  const target = e.target;
  if (target.value === "") {
    usuario.value = "";
    return;
  }
  usuario.value = formatearRut(target.value);
}

async function iniciarSesion() {
  enviandoCorreo.value = true;

  if (!validarRut(usuario.value)) {
    Swal.fire({ icon: "warning", title: "RUT inválido" });
    return;
  }

  cargandoRecaptcha.value = true;
  const recaptchaToken = await getToken();
  cargandoRecaptcha.value = false;

  if (!recaptchaToken) {
    Swal.fire({
      icon: "warning",
      title: "Verificación fallida",
      text: "No se pudo validar tu sesión. Intenta nuevamente.",
    });
    return;
  }

  try {
    const rutLimpio = limpiarRut(usuario.value);
    await authStore.login({
      usuario: rutLimpio,
      password: password.value,
      recaptcha: recaptchaToken,
    });
    enviandoCorreo.value = false;

    Swal.fire({
      icon: "success",
      title: "Bienvenido",
      text: `Hola ${authStore.candidato.nombre_completo}, has iniciado sesión correctamente.`,
    });

    router.push("/perfil");
  } catch (error) {
    enviandoCorreo.value = false;

    let mensajeError = error.message;
    if (error.response.data) {
      mensajeError = error.response.data.message || mensajeError;
    }

    Swal.fire({
      icon: "error",
      title: "Error al registrar",
      text: mensajeError,
    });
  }
}
</script>
<style lang="css" scoped>
/* en App.vue o main.css (no scoped) */
.loader-overlay {
  position: fixed !important;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.7);
  z-index: 999999 !important;
  display: flex;
  justify-content: center;
  align-items: center;
}

@media (min-width: 992px) {
  .btn-default-size.collapsible-links-heading,
  .btn-default-size.collapsible-links-list-link,
  .btn.btn-default-size {
    display: inline-block;
    width: unset;
    min-width: unset;
  }
}
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
a.bg-white:focus,
a.bg-white:hover,
button.bg-white:focus,
button.bg-white:hover {
  background-color: #fff !important;
}
.form-control {
  border-radius: 0.375rem;
  box-shadow: none;
  border: 1px solid #ced4da;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
  font-size: 0.875rem;
}

.form-label {
  font-size: 0.875rem !important;
}

.fs-0875 {
  font-size: 0.875rem !important;
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
</style>
