import { createRouter, createWebHistory } from "vue-router";
import SimpleLayout from "../layouts/SimpleLayout.vue";
import DashboardLayout from "../layouts/DashboardLayout.vue";
import StarterView from "../views/HomeView.vue";

import LoginView from "../views/LoginView.vue";
import RegisterView from "../views/RegistrarView.vue";
import RestablecerClaveView from "../views/RecuperarPassword.vue";
import AprobarCartaView from "../views/AprobarCartaView.vue";

import FormularioView from "../views/FormularioView.vue";
import DashboardView from "../views/DashboardView.vue";
import ConvocatoriasView from "../views/ConvocatoriaView.vue";
import PostulacionesView from "../views/PostulacionesView.vue";
import CandidatosView from "../views/CandidatosView.vue";
import CartasOfertaView from "../views/CartaOfertaView.vue";

import BorradorRexView from "../views/BorradorRexView.vue";
import DocumentoRexView from "../views/DocumentoRex.vue";
import ContratoAsistenteView from "../views/ContratoAsistenteView.vue";
import BorradorContratoView from "../views/BorradorContratoView.vue";
import NotFoundView from "../views/NotFoundView.vue";

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
        path: "/login",
        name: "simple.login",
        component: LoginView,
      },
      {
        path: "/register",
        name: "simple.registrar",
        component: RegisterView,
      },
      {
        path: "/restablecer-clave",
        name: "simple.restablecerClave",
        component: RestablecerClaveView,
      },
      {
        path: "/aprobar-carta",
        name: "simple.aprobarCarta",
        component: AprobarCartaView,
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
      {
        path: "/borrador-rex/:id",
        name: "borradorRex",
        component: BorradorRexView,
        meta: { requiresAuth: true },
      },
      {
        path: "/Documento-rex",
        name: "DocumentoRex",
        component: DocumentoRexView,
        meta: { requiresAuth: true },
      },
      {
        path: "/borrador-contrato/:id",
        name: "borradorContrato",
        component: BorradorContratoView,
        meta: { requiresAuth: true },
      },
      {
        path: "/Contrato-asistente",
        name: "ContratoAsistente",
        component: ContratoAsistenteView,
        meta: { requiresAuth: true },
      },
      {
        path: "/Cartas-ofertas",
        name: "CartasOferta",
        component: CartasOfertaView,
        meta: { requiresAuth: true },
      },
    ],
  },
  {
    path: "/formulario",
    name: "formulario",
    component: FormularioView,
    meta: { requiresAuth: true },
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
  {
    path: "/:pathMatch(.*)*",
    name: "not-found",
    component: NotFoundView,
  },
];

export const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach((to, _from, next) => {
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
