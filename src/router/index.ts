import { createRouter, createWebHistory } from "vue-router";
import SimpleLayout from "../layouts/SimpleLayout.vue";
import DashboardLayout from "../layouts/DashboardLayout.vue";
import StarterView from "../views/HomeView.vue";

import LoginView from "../views/LoginView.vue";
import RegisterView from "../views/RegistrarView.vue";

import FormularioView from "../views/FormularioView.vue";
import DashboardView from "../views/DashboardView.vue";
import ConvocatoriasView from "../views/ConvocatoriaView.vue";
import PostulacionesView from "../views/PostulacionesView.vue";
import CandidatosView from "../views/CandidatosView.vue";

import { useAuthStore } from "../store/authStore";
import { isTokenExpired } from "../utils/validaciones";

const routes = [
  {
    path: "/",
    name: "starter",
    component: StarterView,
  },
  {
    path: "/simple",
    component: SimpleLayout,
    children: [
      {
        path: "/login", // ruta por defecto
        name: "simple.login",
        component: LoginView,
      },
      {
        path: "/register",
        name: "simple.registrar",
        component: RegisterView,
      },
    ],
  },
  {
    path: "/dashboard",
    component: DashboardLayout,
    children: [
      {
        path: "/perfil", // ruta por defecto
        name: "dashboard.perfil",
        component: FormularioView,
        meta: { requiresAuth: true },
      },
      {
        path: "/convocatorias",
        name: "dashboard.convocatorias",
        component: ConvocatoriasView,
        meta: { requiresAuth: true },
      },
      {
        path: "/postulaciones",
        name: "dashboard.postulaciones",
        component: PostulacionesView,
        meta: { requiresAuth: true },
      },
      {
        path: "/candidatos",
        name: "bancoCandidatos",
        component: CandidatosView,
        meta: { requiresAuth: true },
      },
    ],
  },
  {
    path: "/formulario",
    name: "formulario",
    component: FormularioView,
    //meta: { requiresAuth: true },
  },
  {
    path: "/dashboard2",
    name: "dashboard2",
    component: DashboardView,
    meta: { requiresAuth: true },
  },
  {
    path: "/convocatoriasView",
    name: "convocatoriasView",
    component: ConvocatoriasView,
    meta: { requiresAuth: true },
  },
];

export const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach((to, from, next) => {
  const auth = useAuthStore();
  if (
    to.meta.requiresAuth &&
    (!auth.user.token || isTokenExpired(auth.user.token))
  ) {
    auth.logout();
    next("/login");
  } else {
    next();
  }
});
