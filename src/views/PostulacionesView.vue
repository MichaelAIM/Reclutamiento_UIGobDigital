<template>
  <div class="container-xl py-4">
    <h2 class="h4 text-secondary fw-semibold mb-4">
      Postulaciones por Convocatoria
    </h2>

    <div v-for="(c, index) in convocatorias" :key="index" class="mb-3">
      <!-- Tarjeta de convocatoria -->
      <div
        class="card border-0 shadow-sm"
        @click="toggle(index)"
        style="cursor: pointer"
      >
        <div
          class="card-body d-flex justify-content-between align-items-center"
        >
          <div>
            <h5 class="mb-1 text-dark fw-semibold">
              {{ c.convocatoria.cargo.nombre }}
            </h5>
            <div class="small text-muted">
              <div><strong>Código:</strong> {{ c.convocatoria.codigo }}</div>
              <div>
                <strong>Dirección:</strong>
                {{ c.convocatoria.institucione.nombre }}
              </div>
            </div>
          </div>
          <i
            class="bi"
            :class="expanded[index] ? 'bi-chevron-up' : 'bi-chevron-down'"
            style="font-size: 1.2rem"
          ></i>
        </div>
      </div>

      <!-- Contenido colapsable -->
      <div v-if="expanded[index]" class="mt-2">
        <div class="table-responsive">
          <table
            class="table table-bordered table-striped table-hover align-middle shadow-sm"
          >
            <thead class="table-light">
              <tr class="text-center">
                <th>#</th>
                <th>Nombre</th>
                <th>Rut</th>
                <th>Email</th>
                <th>Especialidad</th>
                <th>Estado</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(p, i) in c.candidatos" :key="i">
                <td class="text-center">{{ i + 1 }}</td>
                <td>{{ p.nombre_completo }}</td>
                <td class="text-nowrap">{{ p.rut }}</td>
                <td>{{ p.correo }}</td>
                <td>{{ p.especialidad }}</td>
                <td>
                  <div class="d-flex align-items-center gap-2">
                    <div class="form-check form-switch m-0">
                      <input
                        class="form-check-input"
                        type="checkbox"
                        :id="`estado-${index}-${i}`"
                        v-model="p.estado"
                        @change="actualizarEstado(convocatoria.id, p)"
                      />
                    </div>
                    <span
                      :class="[
                        'badge px-3 py-1',
                        p.estado
                          ? 'bg-success text-white'
                          : 'bg-warning text-dark',
                      ]"
                    >
                      {{ p.estado ? "Revisado" : "Pendiente" }}
                    </span>
                  </div>
                </td>
                <td class="text-center">
                  <button
                    class="btn btn-sm btn-outline-info me-1"
                    title="Ver perfil"
                  >
                    <i class="bi bi-eye"></i>
                  </button>
                  <button
                    class="btn btn-sm btn-outline-primary"
                    title="Seleccionar"
                  >
                    <i class="bi bi-check-all"></i>
                  </button>
                </td>
              </tr>
              <tr v-if="c.candidatos.length === 0">
                <td colspan="7" class="text-center text-muted py-3">
                  No hay postulaciones registradas.
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref } from "vue";
import { fetchPostulacionesVigentes } from "../services/postulacionService";

const convocatorias = ref([]);

/* const convocatorias = ref([
  {
    codigo: "20231178TH001",
    direccion: "Liceo Politécnico Bicentenario de Excelencia",
    cargo: "Profesor de Historia",
    postulaciones: [
      {
        nombre: "Juan Pérez",
        email: "juan.perez@email.com",
        especialidad: "Historia",
        fecha: "2025-08-30",
        estado: "Pendiente",
      },
      {
        nombre: "Ana Contreras",
        email: "ana.contreras@email.com",
        especialidad: "Historia",
        fecha: "2025-08-25",
        estado: "Pendiente",
      },
    ],
  },
  {
    codigo: "20231178TH002",
    direccion: "Liceo B-4 Antonio Varas de la Barra de Arica",
    cargo: "Encargado de Biblioteca",
    postulaciones: [
      {
        nombre: "María González",
        email: "maria.gonzalez@email.com",
        especialidad: "Gestión documental",
        fecha: "2025-08-28",
        estado: "Pendiente",
      },
      {
        nombre: "Carlos Ramirez",
        email: "carlos.ramirez@email.com",
        especialidad: "Ingeniero en Administración",
        fecha: "2025-08-28",
        estado: "Revisado",
      },
      {
        nombre: "María González",
        email: "maria.gonzalez@email.com",
        especialidad: "Gestión de RRHH",
        fecha: "2025-08-27",
        estado: "Pendiente",
      },
    ],
  },
]); */

const expanded = ref(convocatorias.value.map(() => false));

function toggle(index) {
  expanded.value[index] = !expanded.value[index];
}

function actualizarEstado(codigoConvocatoria, postulante) {
  console.log(
    `Estado actualizado para ${postulante.nombre} en ${codigoConvocatoria}: ${postulante.estado}`
  );
}

onMounted(async () => {
  convocatorias.value = await fetchPostulacionesVigentes(4);
});
</script>

<style scoped>
.table th,
.table td {
  vertical-align: middle;
}
.badge {
  font-size: 0.85rem;
  border-radius: 0.5rem;
  min-width: 90px;
  text-align: center;
}
.form-check-input {
  cursor: pointer;
  position: relative;
}
.card:hover {
  box-shadow: 0 0 0.25rem rgba(0, 0, 0, 0.1);
}
</style>
