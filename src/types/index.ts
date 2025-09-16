export interface Estado {
  id: number;
  nombre: string;
}

export interface DocumentoEsperado {
  id: number;
  nombre: string;
  archivo?: {
    id?: number;
    nombre: string;
    nombre_para_mostrar: string;
    guardado: boolean;
  } | null;
}

export interface documentoCandidato {
  tipo: number | null;
  archivo: File | null;
}

export interface CandidatoPayload {
  id: number | null;
  rut: string;
  nombre_completo: string;
  telefono: string;
  correo: string;
  titulo_profesional_id: number | null;
  nacionalidad_id: number | null;
  estado_civil_id: number | null;
  direccion: string;
  region_id: number | null;
  comuna_id: number | null;
  usuario_id?: number | null;
  presentacion?: string | null;
  fecha_nacimiento?: Date | null;
  estado_candidato_id: number;
}

export interface Candidato extends CandidatoPayload {
  cargos: number[];
}

export interface Usuario {
  id: number | null;
  idCandidato: number | null;
  usuario: string;
  token: string;
  nombre: string;
  email: string;
}

export type CatalogosResponse = [
  { data: Estado[] },
  { data: Estado[] },
  { data: Estado[] },
  { data: Estado[] },
  { data: Estado[] },
  { data: Estado[] }
];

export interface Institucion {
  id: number;
  nombre: string;
}

export interface Ciudad {
  id: number;
  nombre: string;
}

export interface EstadoConvocatoria {
  id: number;
  nombre: string;
}

export interface Cargo {
  id: number;
  nombre: string;
}

export interface Convocatoria {
  id: number;
  codigo: string;
  cargo_id: number;
  cuidad_id: number;
  institucion_id: number;
  fecha_cierre: string; // formato ISO: "YYYY-MM-DD"
  descripcion: string;
  requisitos: string;
  created_at: string; // formato ISO: "YYYY-MM-DDTHH:mm:ss.sssZ"
  estado_id: number;
  institucione: Institucion | null;
  ciudade: Ciudad;
  estado_convocatorium: EstadoConvocatoria;
  cargo: Cargo | null;
}
