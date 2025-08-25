import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/about",
    name: "about",
    // Componente "lazy-loaded" (carga diferida)
    // Esto genera un archivo separado (about.[hash].js) para esta ruta
    // que se carga solo cuando se visita.
    component: () => import("../views/LoginView.vue"), // Asegúrate de tener este componente
  },
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
});

export default router;
