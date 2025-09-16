import api from "../services/apiService";
import type { Convocatoria } from "../types";

export const fetchConvocatorias = async () => {
  try {
    const response = await api.get<Convocatoria[]>("/convocatorias");
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

export const postularCandidato = (
  convocatoriaId: number,
  candidatoId: number
) => api.post(`/convocatorias/${convocatoriaId}/postular`, { candidatoId });

export const fetchPostulacionesCandidato = (candidatoId: number) =>
  api.get(`/postulaciones?candidato_id=${candidatoId}`);

export const eliminarPostulacion = (postulacionId: number) =>
  api.delete(`/postulaciones/${postulacionId}`);

export const fetchPostulaciones = () => api.get("/postulaciones");

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
