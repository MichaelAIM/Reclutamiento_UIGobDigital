import axios from "axios";

//if (!window.location.href.includes("localhost")) {
//import.meta.env.VITE_API_URL = "http://10.200.1.145:8000/api";
//}
console.log("API URL:", import.meta.env.VITE_API_URL);

const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL as string,
  headers: {
    "Content-Type": "application/json",
  },
});

export default api;
