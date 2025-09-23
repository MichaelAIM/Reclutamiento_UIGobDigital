<template>
  <nav class="navbar navbar-expand-lg bg-dark shadow-sm border-bottom">
    <div class="container-fluid px-4">
      <div class="d-flex align-items-center">
        <div>
          <img
            src="../assets/img/Logotipo-Chinchorro-web-02.png"
            alt=""
            srcset=""
            width="150"
          />
        </div>
      </div>

      <div class="d-flex align-items-center custom-gap-3">
        <button
          class="btn btn-outline-secondary btn-sm rounded-circle"
          style="width: 40px; height: 40px"
        >
          <i class="bi bi-bell"></i>
        </button>
        <button
          class="btn btn-outline-secondary btn-sm rounded-circle"
          style="width: 40px; height: 40px"
        >
          <i class="bi bi-gear"></i>
        </button>
        <div
          class="bg-primary rounded-circle d-flex align-items-center justify-content-center text-white"
          style="width: 40px; height: 40px"
        >
          <i class="bi bi-person-fill"></i>
        </div>
      </div>
    </div>
  </nav>
  <!-- Aside Layout -->
  <div class="container-fluid px-0">
    <div class="row g-0">
      <div class="col-12 col-md-3 col-lg-2 bg-accent-primary">
        <div class="sidebar p-4">
          <nav class="nav flex-column">
            <a class="nav-link d-flex align-items-center">
              <i class="bi bi-graph-up mr-3"></i>
              Dashboard
            </a>
            <a
              class="nav-link d-flex align-items-center pointer"
              :class="{ active: activeTab === 'reportes' }"
              @click="Go('/perfil')"
            >
              <i class="bi bi-person mr-3"></i>
              Perfil
            </a>
            <a
              class="nav-link d-flex align-items-center pointer"
              :class="{ active: activeTab === 'convocatorias' }"
              @click="Go('/convocatorias')"
            >
              <i class="bi bi-file-earmark-text mr-3"></i>
              Convocatorias disponibles
            </a>
            <a
              class="nav-link d-flex align-items-center pointer"
              :class="{ active: activeTab === 'postulantes' }"
              @click="Go('/postulaciones')"
            >
              <i class="bi bi-people mr-3"></i>
              Postulantes
            </a>
            <a
              class="nav-link d-flex align-items-center pointer"
              :class="{ active: activeTab === 'postulantes' }"
              @click="Go('/candidatos')"
            >
              <i class="bi bi-people mr-3"></i>
              Candidatos
            </a>
            <a
              class="nav-link d-flex align-items-center pointer"
              @click="cerrarSesion()"
            >
              <i class="bi bi-box-arrow-right mr-3"></i>
              Cerrar Sesión
            </a>
          </nav>
        </div>
      </div>
      <!-- Aside Layout -->

      <div class="col-12 col-md-9 col-lg-10">
        <main class="p-4">
          <router-view />
        </main>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-12 bg-dark text-white py-3">
      <p class="mb-0 py-2 font-level-7 text-center text-white">
        &copy;
        {{ anio }} - Servicio Local de Educación Pública Chinchorro. Todos los
        derechos reservados.
      </p>
    </div>
  </div>
</template>
<script lang="ts" setup>
import { onMounted, ref } from "vue";
import Swal from "sweetalert2";
import { useRouter } from "vue-router";
import { useAuthStore } from "../store/authStore";

const anio = new Date().getFullYear();
const activeTab = ref("dashboard");
const selectedPeriod = ref("mes");
const authStore = useAuthStore();

const router = useRouter();

function Go(URL: string) {
  router.push(URL);
}

const stats = ref([
  {
    title: "Convocatorias Activas",
    value: "24",
    change: "+12%",
    icon: "bi-file-earmark-text",
    colorClass: "bg-primary",
  },
  {
    title: "Postulaciones Totales",
    value: "1,247",
    change: "+8%",
    icon: "bi-people",
    colorClass: "bg-success",
  },
  {
    title: "En Proceso",
    value: "156",
    change: "+15%",
    icon: "bi-clock",
    colorClass: "bg-warning",
  },
  {
    title: "Contratados",
    value: "89",
    change: "+22%",
    icon: "bi-award",
    colorClass: "bg-info",
  },
]);

const recentConvocatorias = ref([
  {
    id: 1,
    titulo: "Profesor de Matemáticas - Enseñanza Media",
    establecimiento: "Liceo Técnico Profesional Chinchorro",
    fechaPublicacion: "2024-09-08",
    fechaCierre: "2024-09-22",
    postulaciones: 45,
    estado: "Activa",
  },
  {
    id: 2,
    titulo: "Educadora de Párvulos",
    establecimiento: "Jardín Infantil Los Aromos",
    fechaPublicacion: "2024-09-05",
    fechaCierre: "2024-09-19",
    postulaciones: 32,
    estado: "Activa",
  },
  {
    id: 3,
    titulo: "Asistente de la Educación",
    establecimiento: "Escuela Básica República de Chile",
    fechaPublicacion: "2024-09-03",
    fechaCierre: "2024-09-17",
    postulaciones: 78,
    estado: "En Revisión",
  },
  {
    id: 4,
    titulo: "Inspector General",
    establecimiento: "Colegio San José",
    fechaPublicacion: "2024-08-30",
    fechaCierre: "2024-09-15",
    postulaciones: 23,
    estado: "Próxima a Cerrar",
  },
]);

function formatDate(dateString: any) {
  return new Date(dateString).toLocaleDateString("es-CL");
}

function getStatusClass(estado: any) {
  if (estado === "Activa") {
    return "bg-success-subtle text-success border border-success-subtle";
  } else if (estado === "En Revisión") {
    return "bg-primary-subtle text-primary border border-primary-subtle";
  } else if (estado === "Próxima a Cerrar") {
    return "bg-warning-subtle text-warning border border-warning-subtle";
  } else {
    return "bg-secondary-subtle text-secondary border border-secondary-subtle";
  }
}

function cerrarSesion() {
  Swal.fire({
    title: "¿Cerrar sesión?",
    text: "¿Está seguro que desea cerrar sesión?",
    icon: "warning",
    showCancelButton: true,
    confirmButtonText: "Sí, salir",
    cancelButtonText: "Cancelar",
    confirmButtonColor: "#d33",
    cancelButtonColor: "#6c757d",
  }).then((result) => {
    if (result.isConfirmed) {
      authStore.logout();
      Swal.fire("Vuelve pronto!", "Nos vemos en próxima visita", "success");
      router.push("/");
    }
  });
}

onMounted(function () {
  console.log("SLEP Chinchorro Dashboard iniciado correctamente");
});
</script>
<style scoped>
:root {
  --slep-primary: #0056b3;
  --slep-secondary: #6c757d;
  --slep-success: #198754;
  --slep-warning: #ffc107;
  --slep-danger: #dc3545;
  --slep-info: #0dcaf0;
}

body {
  background-color: #f8f9fa;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

.sidebar {
  min-height: 100vh;
  background: linear-gradient(135deg, var(--slep-primary) 0%, #004494 100%);
  color: white;
}

.sidebar .nav-link {
  color: rgba(255, 255, 255, 0.8);
  padding: 0.75rem 1rem;
  margin: 0.25rem 0;
  border-radius: 0.5rem;
  transition: all 0.3s ease;
  text-decoration: none;
}

.sidebar .nav-link:hover,
.sidebar .nav-link.active {
  color: white;
  background-color: rgba(255, 255, 255, 0.1);
  transform: translateX(5px);
}

.stat-card {
  background: white;
  border-radius: 1rem;
  box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
  transition: all 0.3s ease;
  border: 1px solid rgba(0, 0, 0, 0.05);
}

.stat-card:hover {
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
  transform: translateY(-2px);
}

.stat-icon {
  width: 3rem;
  height: 3rem;
  border-radius: 0.75rem;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.25rem;
  color: white;
}

.table-card {
  background: white;
  border-radius: 1rem;
  box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
  border: 1px solid rgba(0, 0, 0, 0.05);
  overflow: hidden;
}

.table-header {
  background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
  border-bottom: 1px solid #dee2e6;
}

.action-card {
  border-radius: 1rem;
  color: white;
  transition: transform 0.3s ease;
}

.action-card:hover {
  transform: translateY(-3px);
}

.action-card-blue {
  background: linear-gradient(135deg, #0d6efd 0%, #0056b3 100%);
}

.action-card-green {
  background: linear-gradient(135deg, #198754 0%, #146c43 100%);
}

.action-card-purple {
  background: linear-gradient(135deg, #6f42c1 0%, #5a2d91 100%);
}

.status-badge {
  font-size: 0.75rem;
  padding: 0.375rem 0.75rem;
  border-radius: 50px;
}

.brand-logo {
  width: 2.5rem;
  height: 2.5rem;
  background: linear-gradient(135deg, var(--slep-primary) 0%, #004494 100%);
  border-radius: 0.5rem;
}

.search-input {
  border-radius: 0.75rem;
  padding: 0.75rem 2.5rem;
}

.btn-action {
  border-radius: 0.5rem;
  padding: 0.5rem 1rem;
  font-weight: 500;
}

.nav-pills .nav-link {
  border-radius: 0.75rem;
}

.custom-gap-3 > * + * {
  margin-left: 1rem;
}

.custom-gap-2 > * + * {
  margin-left: 0.5rem;
}

.custom-gap-1 > * + * {
  margin-left: 0.25rem;
}

@media (max-width: 768px) {
  .sidebar {
    min-height: auto;
  }
}
</style>
