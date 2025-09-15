// Opcional: si prefieres separar la lógica de UI específica del store
import { useCandidatoStore } from "../store/candidatoStore";

export async function useCandidato() {
  const store = useCandidatoStore();
  await store.loadCatalogos(); // espera la carga
  return store;
}
