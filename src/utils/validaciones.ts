// src/utils/validaciones.ts
import { jwtDecode } from "jwt-decode"; // ✅ correcto
import CryptoJS from "crypto-js";
import baseX from "base-x";
import { Buffer } from "buffer";
import dayjs from "dayjs";
import "dayjs/locale/es";

interface JwtPayload {
  exp: number;
  [key: string]: any;
}

export function isTokenExpired(token: string): boolean {
  try {
    const decoded = jwtDecode<JwtPayload>(token);
    const now = Math.floor(Date.now() / 1000);
    return decoded.exp < now;
  } catch {
    return true;
  }
}

export function validarRut(rut: string): boolean {
  const limpio = rut.replace(/\./g, "").replace(/-/g, "").toUpperCase();
  if (!/^\d{7,8}[0-9K]$/.test(limpio)) return false;

  const cuerpo = limpio.slice(0, -1);
  const dv = limpio.slice(-1);

  let suma = 0,
    multiplo = 2;
  for (let i = cuerpo.length - 1; i >= 0; i--) {
    suma += parseInt(cuerpo[i]) * multiplo;
    multiplo = multiplo < 7 ? multiplo + 1 : 2;
  }

  const resto = suma % 11;
  const dvEsperado = resto === 0 ? "0" : resto === 1 ? "K" : String(11 - resto);

  return dv === dvEsperado;
}

export function formatearRut(rut: string): string {
  const limpio = rut.replace(/[^\dkK]/g, "").toUpperCase();
  if (limpio.length < 2) return limpio;

  const cuerpo = limpio.slice(0, -1);
  const dv = limpio.slice(-1);

  const cuerpoFormateado = cuerpo
    .split("")
    .reverse()
    .reduce(
      (acc, char, i) =>
        acc + char + ((i + 1) % 3 === 0 && i + 1 !== cuerpo.length ? "." : ""),
      ""
    )
    .split("")
    .reverse()
    .join("");

  return `${cuerpoFormateado}-${dv}`;
}

export function validarCorreo(correo: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(correo);
}

export function validarPassword(pass: string): boolean {
  return /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$/.test(pass);
}

export function limpiarRut(rut: string): string {
  return rut.replace(/\./g, "").toUpperCase();
}

export function encryptId(id: number): string {
  const BASE62 =
    "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const base62 = baseX(BASE62);
  const secretKey = import.meta.env.VITE_KEY || "cL4v3-superS3cret4";
  const encrypted = CryptoJS.AES.encrypt(id.toString(), secretKey).toString(); // Base64
  const bytes = Buffer.from(encrypted, "utf8");
  return base62.encode(bytes); // Solo alfanumérico
}

export function numeroATexto(numero: number) {
  if (typeof numero !== "number" || isNaN(numero)) {
    throw new Error("Se requiere un número válido");
  }

  const unidades = [
    "",
    "un",
    "dos",
    "tres",
    "cuatro",
    "cinco",
    "seis",
    "siete",
    "ocho",
    "nueve",
  ];
  const decenas = [
    "",
    "",
    "veinte",
    "treinta",
    "cuarenta",
    "cincuenta",
    "sesenta",
    "setenta",
    "ochenta",
    "noventa",
  ];
  const especiales = [
    "diez",
    "once",
    "doce",
    "trece",
    "catorce",
    "quince",
    "dieciséis",
    "diecisiete",
    "dieciocho",
    "diecinueve",
  ];
  const veintis = [
    "veinte",
    "veintiuno",
    "veintidós",
    "veintitrés",
    "veinticuatro",
    "veinticinco",
    "veintiséis",
    "veintisiete",
    "veintiocho",
    "veintinueve",
  ];
  const centenas = [
    "",
    "ciento",
    "doscientos",
    "trescientos",
    "cuatrocientos",
    "quinientos",
    "seiscientos",
    "setecientos",
    "ochocientos",
    "novecientos",
  ];

  function convertirGrupo(num: number, esMiles = false) {
    if (num === 0) return "";
    if (num === 100) return "cien";

    let texto = "";
    const c = Math.floor(num / 100);
    const d = Math.floor((num % 100) / 10);
    const u = num % 10;

    // Centenas
    if (c > 0) {
      texto += centenas[c] + " ";
    }

    // Decenas y unidades
    const resto = num % 100;

    if (resto === 0) {
      // No hay decenas ni unidades
    } else if (resto < 10) {
      // Unidades simples (1-9)
      texto += esMiles && u === 1 ? "un" : unidades[u];
      texto += " ";
    } else if (resto < 16) {
      // Números especiales (10-15)
      texto += especiales[resto - 10] + " ";
    } else if (resto < 20) {
      // Dieciséis, diecisiete, etc. (16-19)
      texto += especiales[resto - 10] + " ";
    } else if (resto < 30) {
      // Veintis (20-29)
      texto += veintis[resto - 20] + " ";
    } else {
      // Decenas con "y" (30-99)
      texto += decenas[d];
      if (u > 0) {
        texto += " y " + unidades[u];
      }
      texto += " ";
    }

    return texto.trim();
  }

  if (numero === 0) return "Cero";
  if (numero > 999999999) throw new Error("Número demasiado grande");

  let textoFinal = "";
  const millones = Math.floor(numero / 1000000);
  const miles = Math.floor((numero % 1000000) / 1000);
  const unidadesGrupo = numero % 1000;

  // Millones
  if (millones > 0) {
    if (millones === 1) {
      textoFinal += "un millón ";
    } else {
      textoFinal += convertirGrupo(millones) + " millones ";
    }
  }

  // Miles
  if (miles > 0) {
    if (miles === 1) {
      textoFinal += "mil ";
    } else {
      textoFinal += convertirGrupo(miles, true) + " mil ";
    }
  }

  // Unidades
  if (unidadesGrupo > 0 || numero === 0) {
    textoFinal += convertirGrupo(unidadesGrupo);
  }

  // Convertir primera letra a mayúscula
  return textoFinal.trim().charAt(0).toUpperCase() + textoFinal.trim().slice(1);
}

// Función para formatear moneda
export function formatoMoneda(monto: number) {
  const numero = parseFloat(monto.toString().replace(/[$,]/g, ""));
  return numeroATexto(Math.floor(numero)) + " pesos";
}

export function formatearFechaHoy() {
  const fecha = new Date();
  const dia = fecha.getDate();
  const meses: string[] = [
    "enero",
    "febrero",
    "marzo",
    "abril",
    "mayo",
    "junio",
    "julio",
    "agosto",
    "septiembre",
    "octubre",
    "noviembre",
    "diciembre",
  ];
  const mes = meses[fecha.getMonth()];
  const año = fecha.getFullYear();

  return `${dia} de ${mes} de ${año}`;
}

export function FormatearFecha(fechaISO: any) {
  return dayjs(fechaISO).locale("es").format("D [de] MMMM [de] YYYY");
}

export function fechaFormateada(fechaISO: any) {
  return new Date(fechaISO).toLocaleString("es-CL", {
    dateStyle: "long",
    timeStyle: "short",
    timeZone: "America/Santiago",
  });
}

export function getSemana() {
  return ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];
}

export function formatDate(dateString: string) {
  if (!dateString) return "";

  // Tomar solo la parte de la fecha (antes de T o espacio)
  const datePart = dateString.split("T")[0].split(" ")[0];
  const [year, month, day] = datePart.split("-");

  return `${day.padStart(2, "0")}/${month.padStart(2, "0")}/${year}`;
}

export const formatDateTime = (dateTimeString: string): string => {
  return formatDate(dateTimeString);
};

export function formatoFechaHora(fechaISO: any) {
  const fecha = new Date(fechaISO);
  const dia = fecha.getDate().toString().padStart(2, "0");
  const mes = (fecha.getMonth() + 1).toString().padStart(2, "0");
  const año = fecha.getFullYear().toString().slice(-2);
  const horas = fecha.getHours().toString().padStart(2, "0");
  const minutos = fecha.getMinutes().toString().padStart(2, "0");
  const segundos = fecha.getSeconds().toString().padStart(2, "0");

  return `${dia}/${mes}/${año} ${horas}:${minutos}:${segundos}`;
}
