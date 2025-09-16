<template>
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
        <!--    <p class="h2">Crear cuenta nueva</p> -->
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
        <form @submit.prevent="registrarUsuario">
          <!-- RUT -->
          <div class="mb-3 text-start">
            <label for="rut" class="form-label fw-bold">Rut</label>
            <input
              id="rut"
              v-model="rut"
              @input="onRutInput"
              type="text"
              class="form-control"
              placeholder="15678432-1"
            />
          </div>

          <!-- Nombre -->
          <div class="mb-3 text-start">
            <label for="name" class="form-label fw-bold">Nombre completo</label>
            <input
              id="name"
              v-model="nombre"
              type="text"
              class="form-control"
              placeholder="Juan Pérez"
            />
          </div>

          <!-- Correo -->
          <div class="mb-3 text-start">
            <label for="email2" class="form-label fw-bold"
              >Correo electrónico</label
            >
            <input
              id="email2"
              v-model="correo"
              @input="validarCorreo"
              type="email"
              class="form-control"
              placeholder="correo@ejemplo.cl"
            />
          </div>

          <!-- Password -->
          <div class="mb-3 text-start">
            <label for="password2" class="form-label fw-bold">Contraseña</label>
            <input
              id="password2"
              v-model="password"
              @input="validarPassword"
              type="password"
              class="form-control"
              placeholder="Contraseña segura"
            />
          </div>

          <!-- Términos -->
          <div class="form-check text-sm">
            <input
              class="form-check-input"
              type="checkbox"
              v-model="acceptedTerms"
              id="terms"
            />
            <label class="form-check-label fs-0875">
              Acepto los
              <a
                class="text-primary fw-medium text-decoration-none pointer fs-0875"
                @click.prevent="abrirModal"
              >
                términos y condiciones
              </a>
            </label>
          </div>

          <button
            type="submit"
            class="btn btn-primary w-100 mt-4 mb-2 fs-0875"
            :disabled="!acceptedTerms"
          >
            Registrarse
          </button>
        </form>
        <RecaptchaBadge />
        <div v-if="cargandoRecaptcha" class="text-center mt-3">
          <i class="bi bi-shield-lock text-primary fs-4"></i>
          <div class="text-muted small mt-1">
            Validando seguridad institucional…
          </div>
        </div>
      </div>
    </a>

    <!-- Modal de Términos -->
    <TerminosModal v-model:visible="mostrarModal" />
  </div>
</template>

<script setup>
import { ref } from "vue";
import TerminosModal from "../components/modal/TerminosModal.vue";
import Swal from "sweetalert2";
import { useAuthStore } from "../store/authStore";
import { useRouter } from "vue-router";
import { useRecaptchaV3 } from "../composables/useRecaptchaV3";
import RecaptchaBadge from "../components/RecaptchaBadge.vue";
import {
  validarRut,
  formatearRut,
  validarCorreo,
  validarPassword,
  limpiarRut,
} from "../utils/validaciones";

const nombre = ref("");
const rut = ref("");
const correo = ref("");
const password = ref("");
const auth = useAuthStore();
const router = useRouter();
const acceptedTerms = ref(false);
const mostrarModal = ref(false);
const { getToken } = useRecaptchaV3();
const cargandoRecaptcha = ref(false);

const abrirModal = () => {
  mostrarModal.value = true;
};

function onRutInput(e) {
  const target = e.target;
  if (target.value === "") {
    rut.value = "";
    return;
  }
  rut.value = formatearRut(target.value);
}

async function registrarUsuario() {
  if (!nombre.value.trim()) {
    Swal.fire({ icon: "warning", title: "Nombre requerido" });
    return;
  }

  if (!validarRut(rut.value)) {
    Swal.fire({ icon: "warning", title: "RUT inválido" });
    return;
  }

  if (!validarCorreo(correo.value)) {
    Swal.fire({ icon: "warning", title: "Correo inválido" });
    return;
  }

  if (!validarPassword(password.value)) {
    Swal.fire({
      icon: "warning",
      title: "Contraseña insegura",
      text: "Debe tener al menos 8 caracteres, una mayúscula, una minúscula y un número.",
    });
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
    await auth.registrar({
      nombre: nombre.value,
      rut: limpiarRut(rut.value),
      correo: correo.value,
      password: password.value,
      recaptcha: recaptchaToken,
    });

    Swal.fire({
      icon: "success",
      title: "Registro exitoso",
      text: `Hola ${auth.candidato.nombre_completo}, has iniciado sesión correctamente.`,
    });

    router.push("/perfil");
  } catch (error) {
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
a.bg-white:focus,
a.bg-white:hover,
button.bg-white:focus,
button.bg-white:hover {
  background-color: #fff !important;
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
</style>
