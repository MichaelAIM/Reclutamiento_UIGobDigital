<template>
  <Modal v-if="visible" @close="emit('update:visible', false)">
    <template #header>
      <h5 class="modal-title">Carta Oferta</h5>
    </template>

    <template #body>
      <CartaOferta
        :oferta="{
          cargo: 'Docente Inglés',
          establecimiento: 'Liceo Comercial Arica',
          nombre: 'Paulette Plaza Olivares',
          jornada: '44 hrs.',
          fechaIngreso: '2025-11-04',
        }"
        @descargar="descargarPDF"
      />
    </template>

    <template #footer>
      <!--       <button class="btn btn-secondary" @click="mostrarRecuperar = false">
        Cerrar
      </button> -->
      <!--   <button class="btn btn-primary">Enviar</button> -->
    </template>
  </Modal>
</template>
<script setup>
import Modal from "../../components/modal/ModalComponent.vue";
import CartaOferta from "../../components/cartaOferta.vue";
import { ref } from "vue";
defineProps({
  visible: {
    type: Boolean,
    required: true,
  },
});

const emit = defineEmits(["update:visible"]);

function descargarPDF() {
  // Lógica para descargar la carta oferta en PDF
  alert("Descargando carta oferta en PDF...");
}
</script>
