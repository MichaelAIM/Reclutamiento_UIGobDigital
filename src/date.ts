// plugins/date.ts
import type { App } from "vue";

export default {
  install: (app: App) => {
    app.config.globalProperties.$date = {
      format: (date: Date | string): string => {
        if (typeof date === "string" && date.includes("-")) {
          const [year, month, day] = date.split("T")[0].split("-");
          return `${day.padStart(2, "0")}/${month.padStart(2, "0")}/${year}`;
        }

        const fecha = typeof date === "string" ? new Date(date) : date;
        return fecha.toLocaleDateString("es-CL", {
          timeZone: "America/Santiago",
          day: "2-digit",
          month: "2-digit",
          year: "numeric",
        });
      },
    };
  },
};
