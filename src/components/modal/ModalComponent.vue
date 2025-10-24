<template>
  <div class="modal-backdrop" @click.self="$emit('close')">
    <div class="modal-content">
      <header
        class="modal-header d-flex justify-content-between align-items-center"
      >
        <slot name="header" />
        <button
          type="button"
          class="btn-close"
          aria-label="Cerrar"
          @click="$emit('close')"
        ></button>
      </header>

      <section class="modal-body">
        <slot name="body" />
      </section>
      <footer class="modal-footer bg-white d-flex justify-content-end gap-2">
        <slot name="footer" />
      </footer>
    </div>
  </div>
</template>

<script setup>
// No necesitas props si usas v-if en el padre
</script>

<style scoped>
.modal-backdrop {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1050;
}
.modal-content {
  background: #fff;
  border-radius: 0.5rem;
  padding: 1.5rem;
  min-width: 320px;
  max-width: 80%;
  max-height: 99%;
  overflow-y: auto;
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
}
.modal-header {
  font-weight: 600;
  font-size: 1.1rem;
  margin-bottom: 1rem;
}
.modal-footer {
  margin-top: 1rem;
  min-height: 100px !important;
}
.modal-body {
  margin-bottom: 1rem;
}
</style>
