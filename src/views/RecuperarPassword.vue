<template>
  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card shadow-sm">
          <div class="card-header bg-primary text-white fw-bold">
            🔐 Restablecer contraseña
          </div>
          <div class="card-body">
            <div v-if="estado === 'cargando'" class="text-center">
              <div class="spinner-border text-primary" role="status"></div>
              <p class="mt-3">Validando enlace de recuperación...</p>
            </div>

            <div v-else-if="estado === 'invalido'" class="alert alert-danger">
              El enlace es inválido o ha expirado. Solicita una nueva
              recuperación.
            </div>

            <form v-else @submit.prevent="restablecerClave">
              <div class="mb-3">
                <label for="nuevaClave" class="form-label"
                  >Nueva contraseña</label
                >
                <input
                  type="password"
                  id="nuevaClave"
                  v-model="nuevaClave"
                  class="form-control"
                  required
                />
              </div>

              <div class="mb-3">
                <label for="confirmacionClave" class="form-label"
                  >Confirmar contraseña</label
                >
                <input
                  type="password"
                  id="confirmacionClave"
                  v-model="confirmacionClave"
                  class="form-control"
                  required
                />
                <div
                  v-if="confirmacionClave && confirmacionClave !== nuevaClave"
                  class="text-danger small mt-1"
                >
                  Las contraseñas no coinciden
                </div>
              </div>

              <button
                type="submit"
                class="btn btn-primary w-100"
                :disabled="enviando"
              >
                <span
                  v-if="enviando"
                  class="spinner-border spinner-border-sm me-2"
                ></span>
                Restablecer contraseña
              </button>
            </form>
          </div>
        </div>

        <div v-if="exito" class="alert alert-success mt-4 text-center">
          Contraseña actualizada correctamente. Serás redirigido al login...
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import { validarToken, cambiarPassword } from "../services/authservice";

const route = useRoute();
const router = useRouter();

const token = route.query.token as string;
const estado = ref<"cargando" | "valido" | "invalido">("cargando");
const nuevaClave = ref("");
const confirmacionClave = ref("");
const enviando = ref(false);
const exito = ref(false);

onMounted(async () => {
  try {
    await validarToken({ token });
    estado.value = "valido";
  } catch {
    estado.value = "invalido";
  }
});

async function restablecerClave() {
  if (nuevaClave.value !== confirmacionClave.value) return;

  enviando.value = true;
  try {
    const datos = {
      token,
      nuevaClave: nuevaClave.value,
    };
    await cambiarPassword(datos);
    exito.value = true;
    setTimeout(() => router.push("/login"), 2000);
  } catch {
    estado.value = "invalido";
  } finally {
    enviando.value = false;
  }
}
</script>
