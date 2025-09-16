// src/services/authService.js
import api from "../services/apiService";

export async function registrarUsuario(datos: {
  usuario: string;
  nombre: string;
  password: string;
  email: string;
  recaptcha: string;
}) {
  const res: any = await api.post("/auth/register", datos);

  if (!res.data) {
    const error = await res.json();
    throw new Error(error.message || "Error al registrar");
  }

  return res.data;
}

export async function loginUsuario(datos: {
  usuario: string;
  password: string;
  recaptcha: string;
}) {
  const res: any = await api.post("/auth/login", datos);

  if (!res.data) {
    const error = await res.json();
    throw new Error(error.message || "Credenciales inválidas");
  }

  return res.data;
}
