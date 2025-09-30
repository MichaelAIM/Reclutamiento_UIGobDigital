<template>
  <div class="container-fluid py-4">
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
            <th>Especialidad</th>
            <th>Cargo</th>
            <th>Ubicación</th>
            <th>Tipo de Cargo</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="c in candidatos" :key="c.id">
            <td>{{ c.nombre_completo }}</td>
            <td>{{ c.especialidad }}</td>
            <td>
              <span v-for="cargo in c.cargos"> - {{ cargo.nombre }}</span>
            </td>
            <td>
              <span v-for="ciu in c.ciudades"> - {{ ciu.nombre }} </span>
            </td>
            <td>
              <p v-if="c.tipo_vacante_nuevo">Vacante Nueva</p>
              <p v-if="c.tipo_vacante_reemplazo">Vacante de Reemplazo</p>
            </td>
            <td>
              <button
                class="btn btn-sm btn-outline-info me-1"
                title="Ver perfil"
                @click="verCandidato(c)"
              >
                <i class="bi bi-eye"></i>
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <ModalCandidato
    v-model:visible="mostrarModalCandidato"
    :datos="candidatoActivo"
  />
</template>

<script setup>
import { onMounted, ref, nextTick } from "vue";
import DataTable from "datatables.net-bs5";
import ExcelJS from "exceljs";
import { fetchCandidatos } from "../services/candidatoService";
import ModalCandidato from "../components/modal/ModalCandidato.vue";

const dataTableInstance = ref(null); // Referencia a la instancia de DataTable
const tabla = ref(null);
const candidatos = ref([]);
const mostrarModalCandidato = ref(false);
const candidatoActivo = ref(null);

function verCandidato(candidato) {
  candidatoActivo.value = candidato;
  mostrarModalCandidato.value = true;
}

async function exportarExcel() {
  try {
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("Candidatos");

    // Definir columnas
    worksheet.columns = [
      { header: "Nombre", key: "Nombre", width: 20 },
      { header: "Cargo", key: "Cargo", width: 20 },
      { header: "Especialidad", key: "Especialidad", width: 20 },
      { header: "Ubicación", key: "Ubicación", width: 20 },
      { header: "Disponibilidad", key: "Disponibilidad", width: 20 },
    ];

    // Añadir datos
    const datos = candidatos.value.map((c) => ({
      Nombre: c.nombre,
      Cargo: c.cargo,
      Especialidad: c.especialidad,
      Ubicación: c.ubicacion,
      Disponibilidad: c.disponibilidad,
    }));

    worksheet.addRows(datos);

    // Estilizar encabezados
    worksheet.getRow(1).eachCell((cell) => {
      cell.font = { bold: true };
      cell.fill = {
        type: "pattern",
        pattern: "solid",
        fgColor: { argb: "FFE0E0E0" },
      };
    });

    // Escribir archivo
    const buffer = await workbook.xlsx.writeBuffer();
    const blob = new Blob([buffer], {
      type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = "BancoCandidatos.xlsx";
    link.click();
    URL.revokeObjectURL(url);
  } catch (error) {
    console.error("Error al exportar a Excel:", error);
    alert(
      "Ocurrió un error al exportar el archivo. Por favor, intenta nuevamente."
    );
  }
}

onMounted(async () => {
  try {
    const data = await fetchCandidatos();
    candidatos.value = data;

    await nextTick(); // Espera a que el DOM se actualice con los datos
    console.log("Candidatos", candidatos.value);

    if (tabla.value) {
      dataTableInstance.value = new DataTable(tabla.value, {
        paging: true,
        searching: true,
        info: true,
        responsive: true,
        pageLength: 50,
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
    } else {
      console.warn("La tabla no está disponible en el DOM.");
    }
  } catch (error) {
    console.error("Error loading candidates:", error);
  }
});
</script>

<style scoped>
.table th,
.table td {
  vertical-align: middle;
}
</style>
