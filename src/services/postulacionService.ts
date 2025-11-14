import api from "../services/apiService";

export const fetchPostulaciones = async () => {
  try {
    const response = await api.get("/postulaciones");
    return response.data;
  } catch (error) {
    console.error("Error al cargar convocatorias:", error);
  }
};

export const fetchPostulacionesVigentes = async (estado: number) => {
  try {
    const response = await api.get("/postulaciones/agrupadas/" + estado);
    return response;
  } catch (error) {
    console.error("Error al cargar convocatorias:", error);
  }
};

export const putPostulacionCandidato = async (
  postulacioId: number,
  nuevoEstadoId: number
) => {
  try {
    const response = await api.put("/postulaciones/candidato/" + postulacioId, {
      estado_candidato: nuevoEstadoId,
    });
    return response.data;
  } catch (error) {
    console.error("Error al actualizar candidatos:", error);
  }
};

export const fetchPostulacionById = (id: number) =>
  api.get(`/postulaciones/${id}`);

export const postularCandidato = (
  convocatoria_id: number,
  candidato_id: number
) => api.post(`/postulaciones`, { candidato_id, convocatoria_id });

export const eliminarPostulacion = (postulacionId: number) =>
  api.delete(`/postulaciones/${postulacionId}`);
