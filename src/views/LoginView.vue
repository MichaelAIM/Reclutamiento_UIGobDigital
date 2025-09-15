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

      <div class="p-4 pt-3 w-100">
        <!-- <p class="h2">Iniciar Sesión</p> -->
        <img
          src="../assets/img/favicon-fb.ico"
          alt="Logo Contrataciones Slep Chinchorro"
          class="mb-3 mx-auto d-block"
          style="max-width: 60px; height: auto"
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
            <input
              type="password"
              class="form-control"
              id="password"
              v-model="password"
              placeholder="Ingresa tu contraseña"
              required
            />
          </div>

          <!-- Recordarme + Link -->
          <div
            class="d-flex flex-column flex-sm-row align-items-start align-items-sm-center justify-content-between w-100 gap-2"
          >
            <div class="form-check"></div>
            <a href="#" class="text-primary fw-medium text-decoration-none">
              ¿Olvidó su contraseña?
            </a>
          </div>

          <button type="submit" class="btn btn-primary w-100 mt-5">
            Iniciar Sesión
          </button>
        </form>
      </div>
    </a>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useAuthStore } from "../store/authStore";
import { useRouter } from "vue-router";
import Swal from "sweetalert2";
import { validarRut, formatearRut, limpiarRut } from "../utils/validaciones";

const checked1 = ref(true);
const usuario = ref("");
const password = ref("");
const authStore = useAuthStore();
const router = useRouter();

function onRutInput(e) {
  const target = e.target;
  if (target.value === "") {
    usuario.value = "";
    return;
  }
  usuario.value = formatearRut(target.value);
}

async function iniciarSesion() {
  if (!validarRut(usuario.value)) {
    Swal.fire({
      icon: "warning",
      title: "RUT inválido",
      text: "Por favor ingresa un RUT válido (Ej: 12345678-9)",
    });
    return;
  }

  try {
    const rutLimpio = limpiarRut(usuario.value);
    await authStore.login({ usuario: rutLimpio, password: password.value });
    Swal.fire({
      icon: "success",
      title: "Bienvenido",
      text: `Hola ${authStore.candidato.nombre_completo}, has iniciado sesión correctamente.`,
    });
    router.push("/perfil");
  } catch (error) {
    Swal.fire({
      icon: "error",
      title: "Error de acceso",
      text: error.message,
    });
  }
}
</script>
<style lang="css" scoped>
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
</style>
