import { jwtDecode } from "jwt-decode";

interface JwtPayload {
  exp: number;
  [key: string]: any;
}

export function useSession(useAuthStore: any) {
  const auth = useAuthStore;

  function isTokenExpired(): boolean {
    try {
      const decoded = jwtDecode<JwtPayload>(auth.user.token);
      const now = Math.floor(Date.now() / 1000);
      return decoded.exp < now;
    } catch {
      return true;
    }
  }

  function init() {
    if (auth.user.token && isTokenExpired()) {
      auth.logout();
    }
  }

  function getTiempoRestante(): number | null {
    try {
      const decoded = jwtDecode<JwtPayload>(auth.user.token);
      const now = Math.floor(Date.now() / 1000);
      return decoded.exp - now;
    } catch {
      return null;
    }
  }

  return {
    isTokenExpired,
    init,
    getTiempoRestante,
  };
}
