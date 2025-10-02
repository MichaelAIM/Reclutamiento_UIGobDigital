import api from "../services/apiService";
import type { CatalogosResponse, CandidatoPayload } from "../types";

export const fetchCatalogos = (): Promise<CatalogosResponse> =>
  Promise.all([
    api.get("/regiones"),
    api.get("/nacionalidades"),
    api.get("/estado_civiles"),
    api.get("/titulos_profesionales"),
    api.get("/cargos"),
    api.get("/documentos"),
    api.get("/jornadas"),
    api.get("/modalidades"),
    api.get("/ciudades"),
    api.get("/nivel_educacion"),
  ]) as Promise<CatalogosResponse>;

export const createCandidato = (payload: CandidatoPayload) =>
  api.post("/candidatos", payload);

export const assignCargos = (id: number, cargos: number[]) =>
  api.post(`/candidatos/${id}/cargos`, { cargos });

export const updateCandidato = (id: number, datos: any) =>
  api.put(`/candidatos/${id}`, datos);

export const uploadDocumentoCandidato = (formData: FormData) =>
  api.post(`/upload_documentoCandidato`, formData, {
    headers: { "Content-Type": "multipart/form-data" },
  });
export const fetchComunas = (regionId: number) =>
  api.get(`/comunas?region_id=${regionId}`);

export const fetchDocumentos = async () => {
  try {
    const response = await api.get("/documentos");
    return response.data;
  } catch (error) {
    console.error("Error al cargar candidatos:", error);
  }
};

export const fetchDocumentosCandidato = (candidatoId: number) =>
  api.get(`/documentos_candidatos/candidato/${candidatoId}`);

export const fetchCandidato = (candidatoId: number) =>
  api.get(`/candidatos/${candidatoId}`);

export const deleteDocumentoCandidato = (id: string) =>
  api.delete(`/upload_documentoCandidato/${id}`);

export const fetchCandidatos = async () => {
  try {
    const response = await api.get("/candidatos");
    return response.data;
  } catch (error) {
    console.error("Error al cargar candidatos:", error);
  }
};
export const createComentario = (payload: any) =>
  api.post("/comentarios", payload);
