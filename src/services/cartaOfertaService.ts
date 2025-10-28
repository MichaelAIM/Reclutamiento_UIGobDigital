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
    horas_pactadas: number;
  }>
) => {
  return api.put(`${baseURL}/${id}`, data);
};

export async function obtenerCartaPorToken(token: string) {
  const res = await api.get(`${baseURL}/aprobacion/${token}`);
  return res.data;
}

export async function aprobarCartaOferta(
  token: string,
  payload?: {
    fecha_ingreso?: string;
    horas_pactadas?: number;
  }
) {
  const res = await api.post(`${baseURL}/aprobacion/${token}`, payload);
  return res.data;
}

export const eliminarCartaOferta = (id: number) => {
  return api.delete(`${baseURL}/${id}`);
};
