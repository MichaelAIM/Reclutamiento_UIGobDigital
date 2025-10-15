import api from "../services/apiService";
import type { Convocatoria } from "../types";

export const fetchConvocatorias = async (est: any) => {
  let url = "/convocatorias";
  if (est) {
    url = "/convocatorias?estado_id=" + est;
  }

  try {
    const response = await api.get<Convocatoria[]>(url);
    return response.data;
  } catch (error) {
    console.error("Error al cargar convocatorias:", error);
  }
};

export const fetchCountConvocatorias = async () => {
  try {
    const response = await api.get("/convocatorias/indices");
    return response.data;
  } catch (error) {
    console.error("Error al cargar convocatorias:", error);
  }
};

export const fetchConvocatoriaById = (id: number) =>
  api.get(`/convocatorias/${id}`);

export const seleccionarCandidato = (postulacionId: number) =>
  api.post(`/postulaciones/${postulacionId}/seleccionar`);

export const rechazarCandidato = (postulacionId: number) =>
  api.post(`/postulaciones/${postulacionId}/rechazar`);

export const fetchCandidatoById = (id: number) => api.get(`/candidatos/${id}`);

export const fetchCargos = async () => {
  const response = await api.get("/cargos");
  return response.data;
};
export const fetchEstadosConvocatoria = async () => {
  const response = await api.get("/estados_convocatoria");
  return response.data;
};
export const fetchInstituciones = async () => {
  const response = await api.get("/instituciones");
  return response.data;
};
export const fetchCiudades = async () => {
  const response = await api.get("/ciudades");
  return response.data;
};

export const fetchJornadas = async () => {
  const response = await api.get("/jornadas");
  return response.data;
};

export const fetchCategoriaCargos = async () => {
  const response = await api.get("/categoria_cargos");
  return response.data;
};

export const fetchModalidades = async () => {
  const response = await api.get("/modalidades");
  return response.data;
};

export const fetchTipo_vacante = async () => {
  const response = await api.get("/tipo_vacantes");
  return response.data;
};

export const crear_convocatoria = async (datos: any) => {
  const response = await api.post("/convocatorias", datos);
  return response.data;
};

export const update_convocatoria = async (id: number, datos: any) => {
  const response = await api.put("/convocatorias/" + id, datos);
  return response.data;
};
