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
  });

  const documentoCandidato = reactive({
    documento_id: null as number | null,
    candidato_id: null as number | null,
    archivo: null as File | null,
  });

  // 🔧 Helpers
  function setLoading(val: boolean) {
    loading.value = val;
  }

  function setError(msg: string | null) {
    error.value = msg;
  }

  async function loadCatalogos(idCandidato?: number | null) {
    if (idCandidato) {
      setLoading(true);
      setError(null);
      try {
        const [reg, nac, est, tit, carg, docs] = await service.fetchCatalogos();
        estados.regiones = reg.data ?? [];
        estados.nacionalidades = nac.data ?? [];
        estados.estadosCiviles = est.data ?? [];
        estados.titulos = tit.data ?? [];
        estados.cargos = carg.data ?? [];

        if (idCandidato) {
          const docsResponse = await loadDocumentosCandidatos(idCandidato);
          let docsCandidato: any[] = [];

          if (Array.isArray(docsResponse)) {
            docsCandidato = docsResponse;
          } else if (docsResponse && typeof docsResponse === "object") {
            docsCandidato = [docsResponse];
          }

          estados.documentos = (docs.data ?? []).map((doc: any) => {
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
      console.log("updateCandidato: datos actualizados", data);

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
    documentoCandidato,
    // Métodos
    setLoading,
    setError,
    loadCatalogos,
    loadComunas,
    updateCandidato,
    loadDocumentosCandidatos,
  };
});
