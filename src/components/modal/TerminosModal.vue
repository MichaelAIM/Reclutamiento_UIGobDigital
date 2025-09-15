<template>
  <div
    class="modal fade"
    :class="{ show: visible }"
    tabindex="-1"
    role="dialog"
    style="display: block"
    v-if="visible"
  >
    <div
      class="modal-dialog modal-dialog-centered modal-lg"
      style="max-width: 700px"
    >
      <div class="modal-content rounded-4 shadow-lg border-0">
        <!-- Header -->
        <div class="modal-header bg-light border-bottom-0">
          <h5 class="modal-title fw-semibold text-primary-emphasis">
            Términos y Condiciones
          </h5>
          <button
            type="button"
            class="btn-close"
            @click="cerrarModal"
            aria-label="Cerrar"
          >
            x
          </button>
        </div>

        <!-- Body -->
        <div
          class="modal-body px-4 py-3 overflow-auto"
          style="max-height: 60vh"
        >
          <p class="mb-3 text-secondary">
            Al crear una cuenta en el Sistema de Reclutamiento del SLEP
            Chinchorro, usted acepta los siguientes términos y condiciones:
          </p>

          <ul class="list-group list-group-flush">
            <li class="list-group-item py-3">
              <strong>Uso Responsable:</strong> El sistema debe ser utilizado
              únicamente con fines legítimos relacionados con procesos de
              reclutamiento institucional.
            </li>
            <li class="list-group-item py-3">
              <strong>Protección de Datos:</strong> La información será tratada
              conforme a la Ley N°19.628 sobre Protección de la Vida Privada.
            </li>
            <li class="list-group-item py-3">
              <strong>Autenticidad:</strong> El usuario declara que los
              antecedentes entregados son verídicos y actualizados.
            </li>
            <li class="list-group-item py-3">
              <strong>Seguridad:</strong> Mantener la confidencialidad de su
              contraseña es su responsabilidad.
            </li>
            <li class="list-group-item py-3">
              <strong>Modificaciones:</strong> El SLEP puede modificar estos
              términos previa comunicación.
            </li>
            <li class="list-group-item py-3">
              <strong>Propiedad:</strong> El contenido y diseño están protegidos
              por derechos institucionales.
            </li>
            <li class="list-group-item py-3">
              <strong>Soporte:</strong> Para dudas o solicitudes, contactar a
              <a
                href="mailto:postulaciones@chinchorro.cl"
                class="text-decoration-none text-primary fw-semibold"
              >
                postulaciones@epchinchorro.cl </a
              >.
            </li>
          </ul>
        </div>

        <!-- Footer -->
        <div class="modal-footer border-top-0 px-4 py-3">
          <button
            type="button"
            class="btn btn-outline-secondary"
            @click="cerrarModal"
          >
            Cerrar
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";

const props = defineProps({
  visible: Boolean,
});

const emit = defineEmits(["update:visible"]);

const cerrarModal = () => {
  emit("update:visible", false);
};
</script>

<style scoped>
.modal {
  background-color: rgba(0, 0, 0, 0.5);
}
.modal.show {
  display: block;
}
</style>
