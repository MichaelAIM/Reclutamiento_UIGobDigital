import { ref } from "vue";
import html2pdf from "html2pdf.js";

/**
 * Composable para generar PDFs con html2pdf
 * Maneja la lógica de conversión, descarga y apertura en nueva pestaña
 */
export function usePDFGenerator() {
  const isGenerating = ref(false);
  const error = ref(null);
  const imageCache = new Map(); // Cache para evitar reconvertir imágenes

  /**
   * Espera a que todas las imágenes en un contenedor se carguen
   * @param {HTMLElement} containerEl - Elemento contenedor
   * @param {number} timeout - Tiempo máximo de espera en ms
   */
  const waitForImages = (containerEl: any, timeout = 5000) => {
    return new Promise((resolve: any) => {
      if (!containerEl) {
        resolve();
        return;
      }

      const images = Array.from(containerEl.querySelectorAll("img"));
      if (!images.length) return resolve();

      let loaded = 0;
      const onDone = () => {
        loaded += 1;
        if (loaded >= images.length) resolve();
      };

      images.forEach((img: any) => {
        if (img.complete && img.naturalWidth !== 0) return onDone();

        const handle = () => {
          img.removeEventListener("load", handle);
          img.removeEventListener("error", handle);
          onDone();
        };

        img.addEventListener("load", handle);
        img.addEventListener("error", handle);
      });

      setTimeout(resolve, timeout);
    });
  };

  /**
   * Convierte una imagen importada a base64 (con cache)
   * @param {string} imagePath - Ruta de la imagen importada
   */
  const getImageAsBase64 = (imagePath: any): Promise<string> => {
    return new Promise((resolve, reject) => {
      // Verificar cache
      if (imageCache.has(imagePath)) {
        resolve(imageCache.get(imagePath));
        return;
      }

      const img = new Image();
      img.crossOrigin = "anonymous";
      img.src = imagePath;

      img.onload = () => {
        try {
          const canvas = document.createElement("canvas");
          canvas.width = img.naturalWidth;
          canvas.height = img.naturalHeight;
          const ctx = canvas.getContext("2d");
          if (ctx) {
            ctx.drawImage(img, 0, 0);
          }
          const dataUrl = canvas.toDataURL("image/png");

          // Guardar en cache
          imageCache.set(imagePath, dataUrl);
          resolve(dataUrl);
        } catch (err: any) {
          reject(new Error(`Error al convertir imagen: ${err.message}`));
        }
      };

      img.onerror = () =>
        reject(new Error(`No se pudo cargar la imagen: ${imagePath}`));
    });
  };

  /**
   * Convierte un elemento DOM a base64
   * @param {HTMLImageElement} imgElement - Elemento imagen
   */
  const getElementAsBase64 = (imgElement: any) => {
    return new Promise((resolve, reject) => {
      if (!imgElement || !imgElement.complete) {
        reject(new Error("Imagen no cargada"));
        return;
      }

      try {
        const canvas = document.createElement("canvas");
        canvas.width = imgElement.naturalWidth;
        canvas.height = imgElement.naturalHeight;
        const ctx = canvas.getContext("2d");
        if (ctx) {
          ctx.drawImage(imgElement, 0, 0);
        }
        resolve(canvas.toDataURL("image/png"));
      } catch (err: any) {
        reject(new Error(`Error al procesar imagen: ${err.message}`));
      }
    });
  };

  /**
   * Configuración estándar para PDF
   * @param {string} filename - Nombre del archivo
   */
  const getPDFOptions = (filename = "documento.pdf") => ({
    margin: [25, 20, 30, 20],
    filename,
    image: { type: "jpeg", quality: 0.98 },
    html2canvas: {
      scale: 2,
      useCORS: true,
      logging: false,
      scrollY: 0,
    },
    jsPDF: {
      unit: "mm",
      format: [216, 330],
      orientation: "portrait",
    },
    pagebreak: { mode: ["css", "legacy"] },
  });

  /**
   * Agrega encabezados con logos a todas las páginas del PDF
   * @param {PDFDocument} pdf - Documento PDF
   * @param {Array<string>} logoImages - Array con [logoLeft, logoRight] en base64
   */
  const addHeadersToAllPages = async (pdf: any, logoImages: string[] = []) => {
    const totalPages = pdf.internal.getNumberOfPages();
    const pageWidth = pdf.internal.pageSize.getWidth();

    for (let i = 1; i <= totalPages; i++) {
      pdf.setPage(i);

      if (logoImages[0]) {
        pdf.addImage(logoImages[0], "PNG", 20, 5, 53, 8);
      }

      if (logoImages[1]) {
        pdf.addImage(logoImages[1], "PNG", pageWidth - 90, 5, 59, 16.5);
      }
    }
  };

  /**
   * Genera PDF y lo descarga
   * @param {HTMLElement} containerEl - Elemento a convertir
   * @param {string} filename - Nombre del archivo
   * @param {Array<string>} logoImages - Rutas de imágenes para logos
   */
  const generateAndDownload = async (
    containerEl: any,
    filename = "documento.pdf",
    logoImages: string[] = []
  ) => {
    if (!containerEl) {
      throw new Error("No se proporcionó un elemento para generar el PDF");
    }

    isGenerating.value = true;
    error.value = null;

    try {
      await waitForImages(containerEl, 5000);
      await new Promise((r) => setTimeout(r, 250));

      const options: any = getPDFOptions(filename);
      const worker = html2pdf().set(options).from(containerEl);
      const pdf = await worker.toPdf().get("pdf");

      // Procesar logos si se proporcionan
      if (logoImages.length >= 2) {
        try {
          const logoLeft = await getImageAsBase64(logoImages[0]);
          const logoRight = await getImageAsBase64(logoImages[1]);
          if (logoLeft && logoRight) {
            await addHeadersToAllPages(pdf, [logoLeft, logoRight]);
          }
        } catch (logoErr) {
          console.warn("Advertencia: No se pudieron agregar logos", logoErr);
        }
      }

      await worker.save();
    } catch (err: any) {
      error.value = err.message;
      console.error("Error generando PDF:", err);
      throw err;
    } finally {
      isGenerating.value = false;
    }
  };

  /**
   * Genera PDF y lo abre en nueva pestaña
   * @param {HTMLElement} containerEl - Elemento a convertir
   * @param {string} filename - Nombre del archivo
   * @param {Array<string>} logoImages - Rutas de imágenes para logos
   */
  const generateAndOpenInNewTab = async (
    containerEl: any,
    filename = "documento.pdf",
    logoImages: string[] = []
  ) => {
    if (!containerEl) {
      throw new Error("No se proporcionó un elemento para generar el PDF");
    }

    isGenerating.value = true;
    error.value = null;

    try {
      await waitForImages(containerEl, 5000);
      await new Promise((r) => setTimeout(r, 250));

      const options: any = getPDFOptions(filename);
      const worker = html2pdf().set(options).from(containerEl);
      const pdf = await worker.toPdf().get("pdf");

      // Procesar logos si se proporcionan
      if (logoImages.length >= 2) {
        try {
          const logoLeft = await getImageAsBase64(logoImages[0]);
          const logoRight = await getImageAsBase64(logoImages[1]);
          await addHeadersToAllPages(pdf, [logoLeft, logoRight]);
        } catch (logoErr) {
          console.warn("Advertencia: No se pudieron agregar logos", logoErr);
        }
      }

      // Generar blob y abrir en nueva pestaña
      const pdfBlob = pdf.output("blob");
      const pdfUrl = URL.createObjectURL(pdfBlob);
      window.open(pdfUrl, "_blank");

      // Limpiar URL después de un tiempo
      setTimeout(() => URL.revokeObjectURL(pdfUrl), 1000);
    } catch (err: any) {
      error.value = err.message;
      console.error("Error generando PDF:", err);
      throw err;
    } finally {
      isGenerating.value = false;
    }
  };

  const clearImageCache = () => {
    imageCache.clear();
  };

  return {
    isGenerating,
    error,
    generateAndDownload,
    generateAndOpenInNewTab,
    waitForImages,
    getImageAsBase64,
    getElementAsBase64,
    clearImageCache,
  };
}
