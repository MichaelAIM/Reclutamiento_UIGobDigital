import { createApp } from "vue";
import "./style.css";
import App from "./App.vue";
import { router } from "./router";
import { createPinia } from "pinia";
import piniaPluginPersistedstate from "pinia-plugin-persistedstate";
import { Buffer } from "buffer";
import { VueReCaptcha } from "vue-recaptcha-v3";

declare global {
  interface Window {
    Buffer: typeof Buffer;
  }
}
window.Buffer = Buffer;

import "@gobdigital-cl/gob.cl/dist/css/gob.cl.css";

// Opcional: JS de Bootstrap (para modales, dropdowns, tooltips, etc.)
import "bootstrap-icons/font/bootstrap-icons.css";
import "bootstrap/dist/js/bootstrap.bundle.min.js";

import "datatables.net-bs5";
import "datatables.net-bs5/css/dataTables.bootstrap5.min.css";

const app = createApp(App);
const pinia = createPinia();
pinia.use(piniaPluginPersistedstate);
app.use(VueReCaptcha, {
  siteKey: "6LeLissrAAAAACL8UHvoJ_qIREtU8nZnsLuVyEol", // ← reemplaza con tu clave pública de reCAPTCHA v3
  loaderOptions: {
    autoHideBadge: true,
  },
});

app.use(pinia);
app.use(router);
app.mount("#app");
