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

export async function recuperarPassword(rut: string) {
  const res: any = await api.post("/auth/register/recuperar-clave", {
    rut,
  });

  if (!res.data) {
    const error = await res.json();
    throw new Error(error.message || "Error al enviar rut de recuperación");
  }

  return res.data;
}

export async function cambiarPassword(datos: {
  token: string;
  newPassword: string;
}) {
  const res: any = await api.post("/auth/change-password", datos);

  if (!res.data) {
    const error = await res.json();
    throw new Error(error.message || "Error al cambiar la contraseña");
  }

  return res.data;
}
