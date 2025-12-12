<template>
  <div class="container my-4">
    <h3 class="text-center mb-4">Detalle de la solicitud de reemplazo</h3>

    <form @submit.prevent="handleSubmit" class="needs-validation" novalidate>
      <!-- Detalle de la solicitud -->
      <fieldset class="border p-3 mb-4">
        <legend class="w-auto px-2">Detalle de la solicitud</legend>
        <div class="form-row">
          <div class="form-group col-md-4">
            <label for="establecimiento">Establecimiento</label>
            <input
              id="establecimiento"
              type="text"
              class="form-control"
              v-model="form.establecimiento"
              required
            />
          </div>
          <div class="form-group col-md-4">
            <label for="fechaSolicitud">Fecha solicitud</label>
            <input
              id="fechaSolicitud"
              type="datetime-local"
              class="form-control"
              v-model="form.fechaSolicitud"
              required
            />
            <small class="form-text text-muted">Ej: 2025-12-09T13:59</small>
          </div>
          <div class="form-group col-md-4">
            <label for="enviadoPor">Enviado por</label>
            <input
              id="enviadoPor"
              type="text"
              class="form-control"
              v-model="form.enviadoPor"
              required
            />
          </div>
        </div>
      </fieldset>

      <!-- Información general -->
      <fieldset class="border p-3 mb-4">
        <legend class="w-auto px-2">Información general</legend>
        <div class="form-row">
          <div class="form-group col-md-3">
            <label for="folio">Folio Nº</label>
            <input
              id="folio"
              type="number"
              class="form-control"
              v-model.number="form.folio"
              required
            />
          </div>
          <div class="form-group col-md-3">
            <label for="cargoSolicitado">Cargo solicitado</label>
            <input
              id="cargoSolicitado"
              type="text"
              class="form-control"
              v-model="form.cargoSolicitado"
              required
            />
          </div>
          <div class="form-group col-md-3">
            <label for="asignatura">Asignatura</label>
            <input
              id="asignatura"
              type="text"
              class="form-control"
              v-model="form.asignatura"
              required
            />
          </div>
          <div class="form-group col-md-3">
            <label for="subvencion">Subvención</label>
            <input
              id="subvencion"
              type="text"
              class="form-control"
              v-model="form.subvencion"
              required
            />
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-3">
            <label for="estatuto">Estatuto</label>
            <select
              id="estatuto"
              class="form-control"
              v-model="form.estatuto"
              required
            >
              <option value="">Seleccione…</option>
              <option>Docente</option>
              <option>Asistente de la Educación</option>
              <option>Administrativo</option>
              <option>Profesional</option>
              <option>Técnico</option>
            </select>
          </div>
          <div class="form-group col-md-3">
            <label for="tipoJornada">Tipo de jornada</label>
            <select
              id="tipoJornada"
              class="form-control"
              v-model="form.tipoJornada"
              required
            >
              <option value="">Seleccione…</option>
              <option>Diurna</option>
              <option>Vespertina</option>
              <option>Nocturna</option>
              <option>Mixta</option>
            </select>
          </div>
          <div class="form-group col-md-3">
            <label for="fechaSeleccion">Fecha de selección</label>
            <input
              id="fechaSeleccion"
              type="date"
              class="form-control"
              v-model="form.fechaSeleccion"
              required
            />
          </div>
          <div class="form-group col-md-3">
            <label for="tipoSolicitud">Tipo de solicitud</label>
            <select
              id="tipoSolicitud"
              class="form-control"
              v-model="form.tipoSolicitud"
              required
            >
              <option value="">Seleccione…</option>
              <option>Reemplazo</option>
              <option>Suplencia</option>
              <option>Contrata</option>
              <option>Honorarios</option>
            </select>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="requisitos">Requisitos</label>
            <textarea
              id="requisitos"
              class="form-control"
              rows="2"
              v-model="form.requisitos"
            ></textarea>
          </div>
          <div class="form-group col-md-6">
            <label for="otrasObservaciones">Otras observaciones</label>
            <textarea
              id="otrasObservaciones"
              class="form-control"
              rows="2"
              v-model="form.otrasObservaciones"
            ></textarea>
          </div>
        </div>
      </fieldset>

      <!-- Información sobre el reemplazo -->
      <fieldset class="border p-3 mb-4">
        <legend class="w-auto px-2">Información sobre el reemplazo</legend>
        <div class="form-row">
          <div class="form-group col-md-3">
            <label for="rutReemplazado">RUT funcionario a reemplazar</label>
            <input
              id="rutReemplazado"
              type="text"
              class="form-control"
              v-model="form.rutReemplazado"
              placeholder="13.637.475-3"
              required
            />
          </div>
          <div class="form-group col-md-5">
            <label for="nombreReemplazado"
              >Nombre del funcionario a reemplazar</label
            >
            <input
              id="nombreReemplazado"
              type="text"
              class="form-control"
              v-model="form.nombreReemplazado"
              required
            />
          </div>
          <div class="form-group col-md-4">
            <label for="motivoReemplazo">Motivo del reemplazo</label>
            <input
              id="motivoReemplazo"
              type="text"
              class="form-control"
              v-model="form.motivoReemplazo"
              placeholder="Licencia médica 11 días"
              required
            />
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-3">
            <label for="fechaInicioReemplazo">Fecha de inicio</label>
            <input
              id="fechaInicioReemplazo"
              type="date"
              class="form-control"
              v-model="form.fechaInicioReemplazo"
              required
            />
          </div>
          <div class="form-group col-md-3">
            <label for="fechaTerminoReemplazo">Fecha de término</label>
            <input
              id="fechaTerminoReemplazo"
              type="date"
              class="form-control"
              v-model="form.fechaTerminoReemplazo"
              required
            />
          </div>
        </div>
      </fieldset>

      <!-- Distribución horaria dinámica -->
      <fieldset class="border p-3 mb-4">
        <legend class="w-auto px-2">Distribución horaria</legend>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead class="thead-light">
              <tr>
                <th>Fuente de financiamiento</th>
                <th>Nivel</th>
                <th>Horas</th>
                <th>Asignatura / Función</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(item, index) in form.distribucion" :key="index">
                <td>
                  <select
                    class="form-control form-control-sm"
                    v-model="item.fuente"
                    required
                  >
                    <option value="">Seleccione…</option>
                    <option>A CONTRATA SUBV. NORMAL</option>
                    <option>JORNADA ESCOLAR COMPLETA</option>
                    <option>SUBVENCIÓN PIE D.170</option>
                    <option>SUBVENCIÓN PIE</option>
                    <option>SUBVENCIÓN SEP</option>
                  </select>
                </td>
                <td>
                  <select
                    class="form-control form-control-sm"
                    v-model="item.nivel"
                    required
                  >
                    <option value="">Seleccione…</option>
                    <option>Basica</option>
                    <option>Media</option>
                  </select>
                </td>
                <td>
                  <input
                    type="number"
                    class="form-control form-control-sm"
                    v-model.number="item.horas"
                    min="1"
                    max="44"
                    required
                  />
                </td>
                <td>
                  <input
                    type="text"
                    class="form-control form-control-sm"
                    v-model="item.funcion"
                    required
                  />
                </td>
                <td>
                  <button
                    type="button"
                    class="btn btn-sm btn-danger"
                    @click="removeRow(index)"
                  >
                    Eliminar
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <button type="button" class="btn btn-sm btn-secondary" @click="addRow">
          Agregar fila
        </button>

        <!-- Totales -->
        <div class="mt-3">
          <p><strong>Total horas Básica:</strong> {{ totalHorasBasica }}</p>
          <p><strong>Total horas Media:</strong> {{ totalHorasMedia }}</p>
          <p><strong>Total horas Global:</strong> {{ totalHorasTotal }}</p>
          <small class="text-muted"
            >El total debe estar entre 1 y 44 horas.</small
          >
        </div>
      </fieldset>

      <!-- Acciones -->
      <div class="d-flex justify-content-end">
        <button
          type="button"
          class="btn btn-outline-secondary mr-2"
          @click="handleReset"
        >
          Limpiar
        </button>
        <button type="submit" class="btn btn-primary">Guardar</button>
      </div>
    </form>
  </div>
</template>

<script setup>
import { reactive, computed } from "vue";

const initialState = {
  // Detalle de la solicitud
  establecimiento: "Mazorquitas",
  fechaSolicitud: "", // '2025-12-09T13:59'
  enviadoPor: "PAOLA PÉREZ P.",
  // Información general
  folio: 1058,
  cargoSolicitado: "EDUCADORA",
  asignatura: "JARDIN INFANTIL",
  subvencion: "JUNJI",
  estatuto: "Docente",
  tipoJornada: "Diurna",
  fechaSeleccion: "2025-12-04",
  tipoSolicitud: "Reemplazo",
  requisitos: "",
  otrasObservaciones: "",
  // Reemplazo
  rutReemplazado: "13.637.475-3",
  nombreReemplazado: "PAOLA SANTELICES CRUZ",
  motivoReemplazo: "LICENCIA MEDICA 11 DIAS",
  fechaInicioReemplazo: "2025-12-03",
  fechaTerminoReemplazo: "2025-12-13",
  // Distribución dinámica
  distribucion: [],
};

const form = reactive({ ...initialState });

function addRow() {
  form.distribucion.push({ fuente: "", nivel: "", horas: 0, funcion: "" });
}

function removeRow(index) {
  form.distribucion.splice(index, 1);
}

const totalHorasBasica = computed(() =>
  form.distribucion
    .filter((item) => item.nivel === "Basica")
    .reduce((sum, item) => sum + (item.horas || 0), 0)
);

const totalHorasMedia = computed(() =>
  form.distribucion
    .filter((item) => item.nivel === "Media")
    .reduce((sum, item) => sum + (item.horas || 0), 0)
);

const totalHorasTotal = computed(
  () => totalHorasBasica.value + totalHorasMedia.value
);

function handleSubmit() {
  // Validación de campos obligatorios base
  const required = [
    "establecimiento",
    "fechaSolicitud",
    "enviadoPor",
    "folio",
    "cargoSolicitado",
    "asignatura",
    "subvencion",
    "estatuto",
    "tipoJornada",
    "fechaSeleccion",
    "tipoSolicitud",
    "rutReemplazado",
    "nombreReemplazado",
    "motivoReemplazo",
    "fechaInicioReemplazo",
    "fechaTerminoReemplazo",
  ];
  const missing = required.filter((k) => !form[k] && form[k] !== 0);
  if (missing.length) {
    alert(`Faltan campos obligatorios: ${missing.join(", ")}`);
    return;
  }

  // Validación RUT formato básico
  const rutRegex = /^\d{1,2}\.?\d{3}\.?\d{3}-[\dkK]$/;
  if (!rutRegex.test(form.rutReemplazado)) {
    alert(
      "RUT del funcionario a reemplazar no cumple formato (ej: 12.345.678-9)."
    );
    return;
  }

  // Distribución: al menos una fila y total entre 1 y 44
  if (!form.distribucion.length) {
    alert("Debe registrar al menos una fila en la distribución horaria.");
    return;
  }
  if (totalHorasTotal.value < 1 || totalHorasTotal.value > 44) {
    alert("El total de horas debe estar entre 1 y 44.");
    return;
  }

  // Consistencia fechas
  if (
    new Date(form.fechaInicioReemplazo) > new Date(form.fechaTerminoReemplazo)
  ) {
    alert("La fecha de inicio no puede ser posterior a la de término.");
    return;
  }

  // Validación filas de distribución
  const distInvalid = form.distribucion.find(
    (d) => !d.fuente || !d.nivel || !d.horas || !d.funcion
  );
  if (distInvalid) {
    alert(
      "Complete todos los campos en cada fila de la distribución (fuente, nivel, horas, función)."
    );
    return;
  }

  console.log(
    "Formulario válido:",
    JSON.parse(
      JSON.stringify({
        ...form,
        totalHorasBasica: totalHorasBasica.value,
        totalHorasMedia: totalHorasMedia.value,
        totalHorasTotal: totalHorasTotal.value,
      })
    )
  );
  alert("Formulario validado y listo para guardar.");
}

function handleReset() {
  Object.assign(form, { ...initialState, distribucion: [] });
}
</script>

<style>
h3 {
  font-weight: 600;
}
fieldset {
  border-radius: 6px;
}
legend {
  font-size: 1rem;
  font-weight: 600;
}
</style>
