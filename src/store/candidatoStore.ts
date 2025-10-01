import { defineStore } from "pinia";
import { ref, reactive } from "vue";
import * as service from "../services/candidatoService";

import type { Estado, Candidato } from "../types";

export const useCandidatoStore = defineStore("formCandidato", () => {
  const loading = ref(false);
  const error = ref<string | null>(null);
  const estados = reactive<Record<string, Estado[]>>({
    regiones: [],
    comunas: [],
    nacionalidades: [],
    estadosCiviles: [],
    titulos: [],
    cargos: [],
    documentos: [],
    jornadas: [],
    ciudades: [],
    modalidades: [],
    nivelesEducacion: [],
  });

  // 🔧 Helpers
  function setLoading(val: boolean) {
    loading.value = val;
  }

  function setError(msg: string | null) {
    error.value = msg;
  }

  function setDocumentosCantidados(
    estado_candidato_id: number,
    docsCandidato: Array<any>,
    docs: Array<any>
  ) {
    // Filtrar documentos según fase y estado
    const documentosFiltrados = (docs ?? []).filter((doc: any) => {
      // Siempre incluir fase 1
      if (doc.fase_candidato === 1) return true;

      // Incluir fase_candidato 2 solo si estado es 3
      if (doc.fase_candidato === 2 && estado_candidato_id === 3) return true;

      return false;
    });

    // Mapear documentos con sus archivos si existen
    return documentosFiltrados.map((doc: any) => {
      const doctoBD = docsCandidato.find(
        (dh: any) => dh.documento_id === doc.id
      );

      return doctoBD
        ? {
            id: doc.id,
            nombre: doc.nombre,
            archivo: {
              id: doctoBD.id,
              nombre: doctoBD.nombre,
              nombre_para_mostrar: doctoBD.nombre_para_mostrar,
              guardado: true,
            },
          }
        : {
            id: doc.id,
            nombre: doc.nombre,
            nombre_para_mostrar: "",
            archivo: null,
          };
    });
  }

  async function loadCatalogos(idCandidato?: number | null) {
    if (idCandidato) {
      setLoading(true);
      setError(null);
      try {
        const [reg, nac, est, tit, carg, docs, jor, mod, ciu, nedu] =
          await service.fetchCatalogos();
        estados.regiones = reg.data ?? [];
        estados.nacionalidades = nac.data ?? [];
        estados.estadosCiviles = est.data ?? [];
        estados.titulos = tit.data ?? [];
        estados.cargos = carg.data ?? [];
        estados.jornadas = jor.data ?? [];
        estados.modalidades = mod.data ?? [];
        estados.ciudades = ciu.data ?? [];
        estados.nivelesEducacion = nedu.data ?? [];

        const docsResponse = await loadDocumentosCandidatos(idCandidato);
        const candidato = await service.fetchCandidato(idCandidato);

        estados.documentos = setDocumentosCantidados(
          candidato.data.estado_candidato_id,
          docsResponse,
          docs.data
        );
      } catch (e: any) {
        setError(e.message || "Error al cargar catálogos");
        console.error("loadCatalogos:", e);
      } finally {
        setLoading(false);
      }
    }
  }

  async function loadDocumentosCandidatos(candidatoId: number): Promise<any> {
    setLoading(true);
    setError(null);
    try {
      const res = await service.fetchDocumentosCandidato(candidatoId);

      // 4. Verificar estructura de respuesta
      if (Array.isArray(res.data)) {
        return res.data;
      }
      if (res.data && typeof res.data === "object") {
        // Si es un objeto único, devolverlo como está
        return res.data;
      }

      console.warn("Respuesta inesperada de documentos:", res);
      return null;
    } catch (e: any) {
      setError(e.message || "Error al cargar documentos");
      console.error("loadDocumentosCandidatos:", e);
      return null;
    } finally {
      setLoading(false);
    }
  }

  // 📍 Cargar comunas por región
  async function loadComunas(regionId: number) {
    setError(null);
    try {
      const { data } = await service.fetchComunas(regionId);
      estados.comunas = data ?? [];
    } catch (e: any) {
      setError(e.message || "Error al cargar comunas");
      console.error("loadComunas:", e);
    }
  }

  // 📝 Actualizar datos del candidato
  async function updateCandidato(candidato_id: number, datos: Candidato) {
    setLoading(true);
    setError(null);
    try {
      const { data } = await service.updateCandidato(candidato_id, datos);
      return data;
    } catch (e: any) {
      setError(e.message || "Error al actualizar candidato");
      console.error("updateCandidato:", e);
      return null;
    } finally {
      setLoading(false);
    }
  }

  return {
    // Estado
    loading,
    error,
    estados,
    // Métodos
    setLoading,
    setError,
    loadCatalogos,
    loadComunas,
    updateCandidato,
    loadDocumentosCandidatos,
    setDocumentosCantidados,
  };
});
