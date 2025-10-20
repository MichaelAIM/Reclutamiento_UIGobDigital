import { defineStore } from "pinia";
import { loginUsuario, registrarUsuario } from "../services/authservice";
import type { Candidato, Usuario } from "../types";

export const useAuthStore = defineStore("auth", {
  state: () => ({
    user: {} as Usuario,
    candidato: {} as Candidato,
  }),

  getters: {
    getNombreUsuario(): any {
      return this.candidato.nombre_completo || null;
    },
  },

  actions: {
    async login(payload: {
      usuario: string;
      password: string;
      recaptcha: string;
    }) {
      const res = await loginUsuario(payload);
      this.user = res.user;
      const candidatoFormateado = await this.formatearCandidato(res.candidato);
      this.candidato = candidatoFormateado;
    },
    async registrar(payload: {
      nombre: string;
      rut: string;
      correo: string;
      password: string;
      recaptcha: string;
    }) {
      const res = await registrarUsuario({
        usuario: payload.rut,
        nombre: payload.nombre,
        email: payload.correo,
        password: payload.password,
        recaptcha: payload.recaptcha,
      });

      this.user = res.user;
      const candidatoFormateado = await this.formatearCandidato(res.candidato);
      this.candidato = candidatoFormateado;
    },

    logout() {
      (Object.keys(this.user) as Array<keyof Usuario>).forEach((key) => {
        delete this.user[key];
      });
      (Object.keys(this.candidato) as Array<keyof Candidato>).forEach((key) => {
        delete this.candidato[key];
      });
      localStorage.removeItem("auth");
    },

    async formatearCandidato(candidato: any) {
      let region_id = null;
      if (candidato.comuna) {
        region_id = candidato.comuna.regione.id;
      }

      return {
        id: candidato.id,
        rut: candidato.rut,
        nombre_completo: candidato.nombre_completo,
        titulo_profesional_id: candidato.titulo_profesional_id,
        telefono: candidato.telefono,
        correo: candidato.correo,
        estado_candidato_id: candidato.estado_candidato_id,
        nacionalidad_id: candidato.nacionalidad_id,
        estado_civil_id: candidato.estado_civil_id,
        direccion: candidato.direccion,
        comuna_id: candidato.comuna_id,
        usuario_id: candidato.usuario_id,
        fecha_nacimiento: candidato.fecha_nacimiento,
        presentacion: candidato.presentacion,
        region_id,
        cargos: candidato.cargos ? candidato.cargos.map((c: any) => c.id) : [],
        jornadas_seleccionadas: candidato.jornadas
          ? candidato.jornadas.map((c: any) => c.id)
          : [],
        ciudades_seleccionadas: candidato.ciudades
          ? candidato.ciudades.map((c: any) => c.id)
          : [],
        modalidades_seleccionadas: candidato.modalidades_horarias
          ? candidato.modalidades_horarias.map((c: any) => c.id)
          : [],
        categoria_funcionaria_id: candidato.categoria_funcionaria_id,
        nivel_educacion_id: candidato.nivel_educacion_id,
        especialidad: candidato.especialidad,
        tipo_vacante_nuevo: candidato.tipo_vacante_nuevo,
        tipo_vacante_reemplazo: candidato.tipo_vacante_reemplazo,
      };
    },
  },

  persist: {
    storage: sessionStorage,
  },
});
