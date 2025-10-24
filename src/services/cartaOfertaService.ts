import api from "./apiService";

const baseURL = "/cartas_ofertas";

export const listarCartasOfertas = async () => {
  const response = await api.get(baseURL);
  return response.data;
};

export const obtenerCartaOfertaPorId = async (id: number) => {
  const response = await api.get(`${baseURL}/${id}`);
  return response.data;
};

export const crearCartaOferta = (data: {
  convocatoria_id?: number;
  candidato_id?: number;
  institucion_id?: number;
  cargo_id?: number;
  jornada_id?: number;
  fecha_ingreso?: string;
  estado?: number;
  fecha_apr_director?: string;
  fecha_envio_dir?: string;
  glosa_remuneracion?: string;
}) => {
  return api.post(baseURL, data);
};

export const actualizarCartaOferta = (
  id: number,
  data: Partial<{
    convocatoria_id: number;
    candidato_id: number;
    institucion_id: number;
    cargo_id: number;
    jornada_id: number;
    fecha_ingreso: string;
    estado: number;
    fecha_apr_director: string;
    fecha_envio_dir: string;
    glosa_remuneracion: string;
  }>
) => {
  return api.put(`${baseURL}/${id}`, data);
};

export const eliminarCartaOferta = (id: number) => {
  return api.delete(`${baseURL}/${id}`);
};
