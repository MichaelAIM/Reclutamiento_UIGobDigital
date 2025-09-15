<template>
  <div class="relative">
    <button
      class="flex items-center gap-2 px-3 py-1 text-sm text-cyan-700 hover:bg-cyan-50 rounded transition"
      @click="mostrarMenu = !mostrarMenu"
    >
      <i class="pi pi-user text-base"></i>
      <span class="truncate max-w-[150px] md:max-w-[300px]">{{ nombre }}</span>
      <i class="pi pi-chevron-down text-xs"></i>
    </button>

    <div
      v-if="mostrarMenu"
      class="absolute right-0 mt-2 w-40 bg-white border border-gray-200 rounded shadow-md z-50"
    >
      <button
        class="w-full text-left px-3 py-2 text-sm text-red-600 hover:bg-red-50"
        @click="onCerrarSesion"
      >
        <i class="pi pi-sign-out mr-2"></i> Cerrar sesión
      </button>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";

const { nombre, onCerrarSesion } = defineProps({
  nombre: String,
  onCerrarSesion: Function,
});

const mostrarMenu = ref(false);
</script>
