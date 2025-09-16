// composables/useRecaptchaV3.js
import { useReCaptcha } from "vue-recaptcha-v3";

export function useRecaptchaV3(action = "login") {
  const recaptcha = useReCaptcha();
  if (!recaptcha) throw new Error("ReCaptcha not properly initialized");
  const { executeRecaptcha } = recaptcha;

  async function getToken() {
    try {
      const token = await executeRecaptcha(action);
      return token;
    } catch (error) {
      console.error("Error al ejecutar reCAPTCHA:", error);
      return null;
    }
  }

  return { getToken };
}
