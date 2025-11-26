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
        <div class="text-white">
          <span>{{ authStore.candidato.nombre_completo }}</span>
        </div>
      </div>
    </div>
  </nav>
  <!-- Aside Layout -->
  <div class="container-fluid px-0">
    <div class="row g-0">
      <div class="col-12 col-md-3 col-lg-2 bg-accent-primary">
        <div class="sidebar p-4">
          <div class="accordion" id="menuAccordion">
            <!-- Sección Navegación -->
            <div class="accordion-item bg-transparent border-0">
              <h2 class="accordion-header d-md-none" id="headingNav">
                <button
                  class="accordion-button text-white bg-transparent collapsed"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseNav"
                  aria-expanded="false"
                  aria-controls="collapseNav"
                >
                  <i class="bi bi-list me-2"></i> Menu
                </button>
              </h2>
              <div
                id="collapseNav"
                class="accordion-collapse collapse"
                :class="{ show: isMenuVisible }"
                aria-labelledby="headingNav"
                data-bs-parent="#menuAccordion"
              >
                <div class="accordion-body p-0">
                  <nav class="nav flex-column">
                    <!--                     <a
                      class="nav-link d-flex align-items-center pointer"
                      :class="{ active: activeTab === 'dashboard' }"
                      @click="Go('/dashboard')"
                    >
                      <i class="bi bi-graph-up me-2"></i> Dashboard
                    </a> -->
                    <a
                      class="nav-link d-flex align-items-center pointer"
                      :class="{ active: activeTab === 'dashboard' }"
                      @click="Go('/')"
                    >
                      <i class="bi bi-arrow-left-circle me-2"></i> Volver al
                      Inicio
                    </a>
                    <a
                      class="nav-link d-flex align-items-center pointer"
                      :class="{ active: activeTab === 'perfil' }"
                      @click="Go('/perfil')"
                    >
                      <i class="bi bi-person me-2"></i> Perfil
                    </a>
                    <a
                      class="nav-link d-flex align-items-center pointer"
                      :class="{ active: activeTab === 'convocatorias' }"
                      @click="Go('/convocatorias')"
                    >
                      <i class="bi bi-file-earmark-text me-2"></i> Convocatorias
                      disponibles
                    </a>
                    <a
                      v-if="
                        authStore.user.rol === 'admin' ||
                        authStore.user.rol === 'reclutador'
                      "
                      class="nav-link d-flex align-items-center pointer"
                      :class="{ active: activeTab === 'postulantes' }"
                      @click="Go('/postulaciones')"
                    >
                      <i class="bi bi-people me-2"></i> Postulantes
                    </a>
                    <a
                      v-if="
                        authStore.user.rol === 'admin' ||
                        authStore.user.rol === 'reclutador'
                      "
                      class="nav-link d-flex align-items-center pointer"
                      :class="{ active: activeTab === 'candidatos' }"
                      @click="Go('/candidatos')"
                    >
                      <i class="bi bi-person-lines-fill me-2"></i> Candidatos
                    </a>
                    <a
                      v-if="
                        authStore.user.rol === 'admin' ||
                        authStore.user.rol === 'reclutador'
                      "
                      class="nav-link d-flex align-items-center pointer"
                      :class="{ active: activeTab === 'postulantes' }"
                      @click="Go('/Cartas-ofertas')"
                    >
                      <i class="bi bi-people me-2"></i> Cartas Oferta
                    </a>
<!--                     <a
                      v-if="
                        authStore.user.rol === 'admin' ||
                        authStore.user.rol === 'reclutador'
                      "
                      class="nav-link d-flex align-items-center pointer"
                      :class="{ active: activeTab === 'postulantes' }"
                      @click="Go('/borrador-rex')"
                    >
                      <i class="bi bi-people me-2"></i> Resoluciones Docentes
                    </a>
                    <a
                      v-if="
                        authStore.user.rol === 'admin' ||
                        authStore.user.rol === 'reclutador'
                      "
                      class="nav-link d-flex align-items-center pointer"
                      :class="{ active: activeTab === 'postulantes' }"
                      @click="Go('/borrador-contrato')"
                    >
                      <i class="bi bi-people me-2"></i> Contratos Asistentes
                    </a>
                    <a
                      v-if="
                        authStore.user.rol === 'admin' ||
                        authStore.user.rol === 'reclutador'
                      "
                      class="nav-link d-flex align-items-center pointer"
                      :class="{ active: activeTab === 'postulantes' }"
                      @click="Go('/postulaciones')"
                    >
                      <i class="bi bi-people me-2"></i> Solicitudes
                    </a> -->
                    <a
                      class="nav-link d-flex align-items-center pointer"
                      @click="cerrarSesion()"
                    >
                      <i class="bi bi-box-arrow-right me-2"></i> Cerrar Sesión
                    </a>
                  </nav>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Aside Layout -->

      <div class="col-12 col-md-9 col-lg-10 px-0">
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
const authStore = useAuthStore();
const isMenuVisible = ref(false);

const router = useRouter();

function Go(URL: string) {
  router.push(URL);
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
  const screenWidth = window.innerWidth;
  isMenuVisible.value = screenWidth >= 992; // Bootstrap lg breakpoint

  console.log("user", authStore.user.rol);
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

.sidebar .nav-link.active {
  position: relative;
  background-color: rgba(255, 255, 255, 0.1);
  color: #fff;
  transform: translateX(5px);
}

.sidebar .nav-link.active::before {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 5px;
  height: 100%;
  background-color: #ffc107; /* o var(--slep-warning) para trazabilidad */
  border-radius: 0 4px 4px 0;
}
.sidebar .nav-link i {
  transition: transform 0.3s ease;
  margin-right: 10px;
}

.sidebar .nav-link:hover i {
  transform: scale(1.2);
}

.accordion-button {
  font-weight: 600;
  color: rgba(255, 255, 255, 0.85);
  background-color: transparent;
  border: none;
}

.accordion-button:not(.collapsed) {
  color: #fff;
  background-color: rgba(255, 255, 255, 0.1);
  box-shadow: none;
}

.accordion-body .nav-link {
  color: rgba(255, 255, 255, 0.75);
  padding: 0.75rem 1rem;
  margin: 0.25rem 0;
  border-radius: 0.5rem;
  transition: all 0.3s ease;
}

.accordion-body .nav-link:hover,
.accordion-body .nav-link.active {
  color: white;
  background-color: rgba(255, 255, 255, 0.1);
  transform: translateX(5px);
}
</style>
