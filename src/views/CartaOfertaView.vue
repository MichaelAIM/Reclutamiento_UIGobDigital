<template>
  <div class="container-fluid py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="h4 mb-0 text-secondary fw-semibold">
        Cartas Oferta Aprobadas
      </h2>
      <!--       <button class="btn btn-outline-success" @click="exportarExcel">
        <i class="bi bi-file-earmark-excel me-1"></i> Exportar a Excel
      </button> -->
    </div>

    <div class="table-responsive">
      <table
        ref="tabla"
        class="table table-striped table-bordered align-middle"
      >
        <thead class="table-light">
          <tr>
            <th>Institución</th>
            <th>Cargo</th>
            <th>Candidato</th>
            <th>Estado</th>
            <th>Fecha de Igreso</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="c in cartasOferta" :key="c.id">
            <td>{{ c.institucione.nombre }}</td>
            <td>{{ c.cargo.nombre }}</td>
            <td>{{ c.Candidato.nombre_completo }}</td>
            <td>{{ c.estado_carta_ofertum.nombre }}</td>
            <td>{{ c.fecha_ingreso }}</td>
            <td>
              <button
                class="btn btn-sm btn-outline-info me-1"
                title="Ver perfil"
                @click="verCartaoferta(c.id)"
              >
                <i class="bi bi-eye"></i>
              </button>
              <button
                v-if="c.estado_carta_ofertum.id === 3"
                class="btn btn-sm btn-outline-primary me-1"
                title="Generar Documento"
                @click="generarDocumento(c.id, c.cargo.tipo_cargo_id)"
              >
                <i class="bi bi-file-earmark-text"></i>
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <ModalCartaOferta
    v-model:visible="mostrarmodalCartaOferta"
    :oferta_id="cartaOfertaId"
    :authStore="null"
  />
</template>

<script setup>
import { onMounted, ref, nextTick } from "vue";
import DataTable from "datatables.net-bs5";
import ExcelJS from "exceljs";
import { listarCartasOfertas } from "../services/cartaOfertaService";
import ModalCartaOferta from "../components/modal/ModalCartaOferta.vue";
import { router } from "../router";

const dataTableInstance = ref(null); // Referencia a la instancia de DataTable
const tabla = ref(null);
const cartasOferta = ref([]);
const cartaOfertaId = ref(null);
const mostrarmodalCartaOferta = ref(false);

function verCartaoferta(oferta) {
  cartaOfertaId.value = oferta;
  mostrarmodalCartaOferta.value = true;
}

function generarDocumento(id, tipo) {
  cartaOfertaId.value = id;
  if (tipo === 5) {
    router.push({ name: "borradorRex", params: { id } });
  } else {
    router.push({ name: "borradorContrato", params: { id } });
  }
}

async function exportarExcel() {
  try {
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("cartasOferta");

    // Definir columnas
    worksheet.columns = [
      { header: "Institucion", key: "Institucion", width: 20 },
      { header: "Cargo", key: "Cargo", width: 20 },
      { header: "Candidato", key: "Candidato", width: 20 },
      { header: "Estado", key: "Estadi", width: 20 },
      { header: "Fecha de Ingreso", key: "fIngreso", width: 20 },
    ];

    // Añadir datos
    const datos = cartasOferta.value.map((c) => ({
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
    link.download = "BancocartasOferta.xlsx";
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
    const data = await listarCartasOfertas("1,2,3");
    cartasOferta.value = data;

    await nextTick(); // Espera a que el DOM se actualice con los datos
    console.log("cartasOferta", cartasOferta.value);

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
          info: "Mostrando _START_ a _END_ de _TOTAL_ Cartas Oferta",
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
