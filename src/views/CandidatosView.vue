<template>
  <div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="h4 mb-0 text-secondary fw-semibold">Banco de Candidatos</h2>
      <button class="btn btn-outline-success" @click="exportarExcel">
        <i class="bi bi-file-earmark-excel me-1"></i> Exportar a Excel
      </button>
    </div>

    <div class="table-responsive">
      <table
        ref="tabla"
        class="table table-striped table-bordered align-middle"
      >
        <thead class="table-light">
          <tr>
            <th>Nombre</th>
            <th>Cargo</th>
            <th>Especialidad</th>
            <th>Ubicación</th>
            <th>Disponibilidad</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="c in candidatos" :key="c.id">
            <td>{{ c.nombre }}</td>
            <td>{{ c.cargo }}</td>
            <td>{{ c.especialidad }}</td>
            <td>{{ c.ubicacion }}</td>
            <td>{{ c.disponibilidad }}</td>
            <td>
              <button class="btn btn-sm btn-outline-primary me-2">
                Ver perfil
              </button>
              <button class="btn btn-sm btn-outline-success">Contactar</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
<script setup>
import { onMounted, ref } from "vue";
import DataTable from "datatables.net-bs5";
import * as XLSX from "xlsx";

const tabla = ref(null);

const candidatos = ref([
  {
    id: 1,
    nombre: "Carla Rivas",
    cargo: "Profesora de Matemáticas",
    especialidad: "Matemáticas",
    ubicacion: "Arica",
    disponibilidad: "Inmediata",
  },
  {
    id: 2,
    nombre: "Luis Torres",
    cargo: "Psicólogo Educacional",
    especialidad: "Psicología",
    ubicacion: "Putre",
    disponibilidad: "Próximo mes",
  },
  {
    id: 3,
    nombre: "Marcela Fuentes",
    cargo: "Educadora Diferencial",
    especialidad: "Inclusión escolar",
    ubicacion: "Iquique",
    disponibilidad: "Inmediata",
  },
  {
    id: 4,
    nombre: "Jorge Medina",
    cargo: "Profesor de Lenguaje",
    especialidad: "Lengua Castellana",
    ubicacion: "Antofagasta",
    disponibilidad: "Dos semanas",
  },
  {
    id: 5,
    nombre: "Sofía Contreras",
    cargo: "Profesora de Inglés",
    especialidad: "Idiomas",
    ubicacion: "Arica",
    disponibilidad: "Inmediata",
  },
  {
    id: 6,
    nombre: "Diego Paredes",
    cargo: "Encargado de Convivencia Escolar",
    especialidad: "Gestión educativa",
    ubicacion: "Calama",
    disponibilidad: "Próximo mes",
  },
  {
    id: 7,
    nombre: "Valentina Ruiz",
    cargo: "Profesora de Ciencias",
    especialidad: "Biología",
    ubicacion: "La Serena",
    disponibilidad: "Inmediata",
  },
  {
    id: 8,
    nombre: "Tomás Herrera",
    cargo: "Inspector General",
    especialidad: "Gestión escolar",
    ubicacion: "Coquimbo",
    disponibilidad: "Dos semanas",
  },
  {
    id: 9,
    nombre: "Camila Vargas",
    cargo: "Profesora de Historia",
    especialidad: "Historia y Geografía",
    ubicacion: "Arica",
    disponibilidad: "Inmediata",
  },
  {
    id: 10,
    nombre: "Felipe Navarro",
    cargo: "Encargado de Biblioteca",
    especialidad: "Gestión documental",
    ubicacion: "Putre",
    disponibilidad: "Próximo mes",
  },
  {
    id: 11,
    nombre: "Andrea Salinas",
    cargo: "Profesora de Educación Física",
    especialidad: "Actividad física",
    ubicacion: "Iquique",
    disponibilidad: "Inmediata",
  },
  {
    id: 12,
    nombre: "Ricardo Soto",
    cargo: "Profesor de Música",
    especialidad: "Educación artística",
    ubicacion: "Antofagasta",
    disponibilidad: "Próximo mes",
  },
  {
    id: 13,
    nombre: "Natalia Espinoza",
    cargo: "Psicopedagoga",
    especialidad: "Apoyo pedagógico",
    ubicacion: "Arica",
    disponibilidad: "Inmediata",
  },
  {
    id: 14,
    nombre: "Esteban Bravo",
    cargo: "Profesor de Tecnología",
    especialidad: "Informática educativa",
    ubicacion: "Calama",
    disponibilidad: "Dos semanas",
  },
  {
    id: 15,
    nombre: "Isidora León",
    cargo: "Profesora de Artes Visuales",
    especialidad: "Arte y diseño",
    ubicacion: "La Serena",
    disponibilidad: "Inmediata",
  },
]);

function exportarExcel() {
  const datos = candidatos.value.map((c) => ({
    Nombre: c.nombre,
    Cargo: c.cargo,
    Especialidad: c.especialidad,
    Ubicación: c.ubicacion,
    Disponibilidad: c.disponibilidad,
  }));

  const hoja = XLSX.utils.json_to_sheet(datos);
  const libro = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(libro, hoja, "Candidatos");

  XLSX.writeFile(libro, "BancoCandidatos.xlsx");
}

onMounted(() => {
  if (tabla.value) {
    new DataTable(tabla.value, {
      paging: true,
      searching: true,
      info: true,
      responsive: true,
      language: {
        search: "Buscar:",
        lengthMenu: "Mostrar _MENU_ registros",
        info: "Mostrando _START_ a _END_ de _TOTAL_ candidatos",
        paginate: {
          next: "Siguiente",
          previous: "Anterior",
        },
      },
    });
  }
});
</script>
<style scoped>
.table th,
.table td {
  vertical-align: middle;
}
</style>
