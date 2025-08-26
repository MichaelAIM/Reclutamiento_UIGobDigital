import { createApp } from "vue";
import "./style.css";
import App from "./App.vue";
import router from "./router";
import { createPinia } from "pinia";

import "@gobdigital-cl/gob.cl/dist/css/gob.cl.css";

// Opcional: JS de Bootstrap (para modales, dropdowns, tooltips, etc.)
import "bootstrap-icons/font/bootstrap-icons.css";
import "bootstrap/dist/js/bootstrap.bundle.min.js";

const app = createApp(App);

app.use(createPinia()); //
app.use(router);
app.mount("#app");
