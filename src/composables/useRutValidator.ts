// composables/useRutValidator.ts
export function useRutValidator() {
  const cleanRut = (rut: string): string =>
    rut.replace(/[^0-9kK]/g, "").toUpperCase();

  const calculateDV = (rut: string): string => {
    let sum = 0;
    let multiplier = 2;

    for (let i = rut.length - 1; i >= 0; i--) {
      sum += parseInt(rut[i]) * multiplier;
      multiplier = multiplier === 7 ? 2 : multiplier + 1;
    }

    const remainder = 11 - (sum % 11);
    if (remainder === 11) return "0";
    if (remainder === 10) return "K";
    return remainder.toString();
  };

  const isValidRut = (rutCompleto: string): boolean => {
    const rut = cleanRut(rutCompleto);
    if (rut.length < 2) return false;

    const body = rut.slice(0, -1);
    const dv = rut.slice(-1);
    return calculateDV(body) === dv;
  };

  return { isValidRut };
}
export function calculateDV(rut: string) {
  let sum = 0;
  let multiplier = 2;

  for (let i = rut.length - 1; i >= 0; i--) {
    sum += parseInt(rut[i]) * multiplier;
    multiplier = multiplier === 7 ? 2 : multiplier + 1;
  }

  const remainder = 11 - (sum % 11);
  if (remainder === 11) return "0";
  if (remainder === 10) return "K";
  return remainder.toString();
}
