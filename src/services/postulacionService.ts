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
  console.log("entro al fetch de postulaciones");
  try {
    const response = await api.get("/postulaciones/agrupadas/" + estado);
    return response;
  } catch (error) {
    console.error("Error al cargar convocatorias:", error);
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
