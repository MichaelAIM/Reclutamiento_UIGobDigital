<template>
  <div class="d-flex vh-100 bg-light">
    <!-- Sidebar -->
    <aside
      class="bg-gradient-primary text-white p-3 shadow-sm"
      style="width: 260px"
    >
      <h4 class="mb-4">SLEP Chinchorro</h4>
      <nav aria-label="Menú principal">
        <ul class="nav flex-column gap-2">
          <li>
            <a
              class="nav-link text-white-50 d-flex align-items-center gap-2"
              href="#"
            >
              <i class="bi bi-person mr-2"></i> Perfil
            </a>
          </li>
          <li>
            <a
              class="nav-link text-white-50 d-flex align-items-center gap-2"
              href="#"
            >
              <i class="bi bi-clipboard2-check mr-2"></i> Convocatorias
            </a>
          </li>
          <li>
            <a
              class="nav-link text-white-50 d-flex align-items-center gap-2"
              href="#"
            >
              <i class="bi bi-person mr-2"></i> Ingresar
            </a>
          </li>
          <li>
            <a
              class="nav-link text-white-50 d-flex align-items-center gap-2"
              href="#"
            >
              <i class="bi bi-clipboard2-check mr-2"></i> Registrar
            </a>
          </li>
          <li>
            <a
              class="nav-link text-white d-flex align-items-center gap-2 active"
              href="#"
            >
              <i class="bi bi-file-earmark-plus mr-2"></i> Nueva Convocatoria
            </a>
          </li>
          <li>
            <a
              class="nav-link text-white-50 d-flex align-items-center gap-2"
              href="#"
            >
              <i class="bi bi-list-task mr-2"></i> Listado de Postulaciones
            </a>
          </li>
        </ul>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-grow-1 p-4 overflow-auto">
      <div class="container-xl">
        <h2 class="mb-4 text-secondary fw-semibold">
          Registro de Nueva Convocatoria
        </h2>

        <form v-if="showForm" @submit.prevent="submitForm">
          <!-- Sección: Datos Generales -->
          <div class="card border-0 shadow-sm mb-4">
            <div class="card-header bg-light fw-semibold">Datos Generales</div>
            <div class="card-body">
              <div class="row gy-4 gx-5">
                <div class="col-md-6">
                  <label class="form-label">Nombre del Cargo</label>
                  <input
                    v-model="form.cargo"
                    type="text"
                    class="form-control form-control-lg"
                    placeholder="Ej: Profesor de Matemáticas"
                    required
                  />
                </div>
                <div class="col-md-6">
                  <label class="form-label">Código de Convocatoria</label>
                  <input
                    :value="form.codigo"
                    type="text"
                    class="form-control form-control-lg"
                    readonly
                  />
                </div>
                <div class="col-md-6">
                  <label class="form-label">Tipo de Vacante</label>
                  <select
                    v-model="form.tipo"
                    class="form-select form-select-lg"
                    required
                  >
                    <option disabled value="">Seleccione</option>
                    <option>Docente</option>
                    <option>Administrativa</option>
                    <option>Técnica</option>
                  </select>
                </div>
                <div class="col-md-6">
                  <label class="form-label">Ciudad</label>
                  <input
                    v-model="form.ciudad"
                    type="text"
                    class="form-control form-control-lg"
                    placeholder="Ej: Arica"
                    required
                  />
                </div>
                <div class="col-md-6">
                  <label class="form-label">Institución</label>
                  <input
                    v-model="form.institucion"
                    type="text"
                    class="form-control form-control-lg"
                    placeholder="Ej: Escuela Chinchorro"
                    required
                  />
                </div>
                <div class="col-md-6">
                  <label class="form-label">Fecha de Cierre</label>
                  <input
                    v-model="form.fechaCierre"
                    type="date"
                    class="form-control form-control-lg"
                    required
                  />
                </div>
              </div>
            </div>
          </div>

          <!-- Sección: Descripción y Requisitos -->
          <div class="card border-0 shadow-sm mb-4">
            <div class="card-header bg-light fw-semibold">
              Descripción y Requisitos
            </div>
            <div class="card-body row g-4">
              <div class="col-12">
                <label class="form-label">Descripción</label>
                <textarea
                  v-model="form.descripcion"
                  class="form-control"
                  rows="3"
                  placeholder="Describe brevemente el cargo y sus funciones"
                  required
                ></textarea>
              </div>
              <div class="col-12">
                <label class="form-label">Requisitos</label>
                <textarea
                  v-model="form.requisitos"
                  class="form-control"
                  rows="3"
                  placeholder="Lista de requisitos académicos, técnicos o experiencia"
                  required
                ></textarea>
              </div>
            </div>
          </div>

          <!-- Sección: Adjuntos y Envío -->
          <div class="card border-0 shadow-sm mb-4">
            <div class="card-header bg-light fw-semibold">Adjuntar Archivo</div>
            <div class="card-body row g-4">
              <div class="col-12">
                <label class="form-label"
                  >Convocatoria en documento (PDF)</label
                >
                <input
                  type="file"
                  class="form-control"
                  @change="handleFileUpload"
                  accept=".pdf"
                />
                <small class="form-text text-muted">
                  Solo se permite un archivo PDF. Tamaño máximo: 5MB.
                </small>
              </div>
              <div class="col-12 text-end">
                <button type="submit" class="btn btn-success px-4 shadow-sm">
                  <i class="bi bi-check-circle"></i> Guardar Convocatoria
                </button>
              </div>
            </div>
          </div>
        </form>

        <div v-else class="text-muted">
          <p>
            Selecciona “Nueva Convocatoria” en el menú lateral para comenzar.
          </p>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, watch } from "vue";

const showForm = ref(true);

const form = ref({
  cargo: "",
  codigo: "",
  tipo: "",
  ciudad: "",
  institucion: "",
  descripcion: "",
  requisitos: "",
  fechaCierre: "",
  archivo: null,
});

watch(
  () => form.value.cargo,
  (nuevoCargo) => {
    const timestamp = Date.now().toString().slice(-5);
    form.value.codigo = `CV-${nuevoCargo
      .slice(0, 3)
      .toUpperCase()}-${timestamp}`;
  }
);

const handleFileUpload = (event) => {
  const file = event.target.files[0];
  if (file && file.type === "application/pdf") {
    form.value.archivo = file;
  } else {
    alert("Solo se permiten archivos PDF.");
  }
};

const submitForm = () => {
  console.log("Convocatoria enviada:", form.value);
  alert("Convocatoria registrada correctamente");
};
</script>

<style scoped>
body {
  margin: 0;
}
aside {
  min-height: 100vh;
}
.card {
  border-radius: 0.75rem;
}
.card-header {
  border-bottom: 1px solid #dee2e6;
}
.bg-gradient-primary {
  background: linear-gradient(135deg, #0056b3, #007bff);
}
.nav-link.active {
  font-weight: 600;
  opacity: 1;
}
.nav-link:hover {
  opacity: 0.85;
}
.form-control-lg,
.form-select-lg {
  min-height: 48px;
}
</style>
