--
-- PostgreSQL database dump
--

\restrict PLiQBNvyPvKdcDLSK1YYgc94kbnuU1LW6pcbFy391TnuprEcGsS3pz7o9r2pmmd

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-12-10 15:03:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 6079 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 282 (class 1255 OID 18951)
-- Name: update_modified_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_modified_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_modified_column() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 281 (class 1259 OID 45056)
-- Name: Resoluciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Resoluciones" (
    id integer NOT NULL,
    carta_oferta_id integer NOT NULL,
    estado_id integer
);


ALTER TABLE public."Resoluciones" OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 45055)
-- Name: Resoluciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Resoluciones_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Resoluciones_id_seq" OWNER TO postgres;

--
-- TOC entry 6081 (class 0 OID 0)
-- Dependencies: 280
-- Name: Resoluciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Resoluciones_id_seq" OWNED BY public."Resoluciones".id;


--
-- TOC entry 217 (class 1259 OID 18952)
-- Name: candidatos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidatos (
    id integer NOT NULL,
    rut character varying(12) NOT NULL,
    nombre_completo character varying(100) NOT NULL,
    titulo_profesional_id integer,
    telefono character varying(15),
    correo character varying(100),
    estado_candidato_id integer DEFAULT 1,
    nacionalidad_id integer,
    estado_civil_id integer,
    direccion character varying(255),
    comuna_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    usuario_id integer NOT NULL,
    presentacion character varying(1000),
    fecha_nacimiento date,
    categoria_funcionaria_id integer,
    nivel_educacion_id integer,
    tipo_vacante_nuevo boolean,
    tipo_vacante_reemplazo boolean,
    especialidad text,
    CONSTRAINT candidatos_correo_check CHECK (((correo)::text ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text)),
    CONSTRAINT candidatos_rut_check CHECK (((rut)::text ~ '^\d{7,8}-[\dkK]$'::text)),
    CONSTRAINT candidatos_telefono_check CHECK (((telefono)::text ~ '^\+?\d{8,12}$'::text))
);


ALTER TABLE public.candidatos OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18961)
-- Name: candidatos_cargos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidatos_cargos (
    candidato_id integer NOT NULL,
    cargo_id integer NOT NULL
);


ALTER TABLE public.candidatos_cargos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18964)
-- Name: candidatos_ciudades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidatos_ciudades (
    id integer NOT NULL,
    candidato_id integer NOT NULL,
    ciudades_id integer NOT NULL
);


ALTER TABLE public.candidatos_ciudades OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18967)
-- Name: candidatos_ciudades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.candidatos_ciudades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.candidatos_ciudades_id_seq OWNER TO postgres;

--
-- TOC entry 6082 (class 0 OID 0)
-- Dependencies: 220
-- Name: candidatos_ciudades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.candidatos_ciudades_id_seq OWNED BY public.candidatos_ciudades.id;


--
-- TOC entry 221 (class 1259 OID 18968)
-- Name: candidatos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.candidatos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.candidatos_id_seq OWNER TO postgres;

--
-- TOC entry 6083 (class 0 OID 0)
-- Dependencies: 221
-- Name: candidatos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.candidatos_id_seq OWNED BY public.candidatos.id;


--
-- TOC entry 222 (class 1259 OID 18969)
-- Name: candidatos_jornadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidatos_jornadas (
    id integer NOT NULL,
    candidato_id integer NOT NULL,
    jornada_id integer
);


ALTER TABLE public.candidatos_jornadas OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18972)
-- Name: candidatos_jornadas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.candidatos_jornadas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.candidatos_jornadas_id_seq OWNER TO postgres;

--
-- TOC entry 6084 (class 0 OID 0)
-- Dependencies: 223
-- Name: candidatos_jornadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.candidatos_jornadas_id_seq OWNED BY public.candidatos_jornadas.id;


--
-- TOC entry 224 (class 1259 OID 18973)
-- Name: candidatos_modalidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidatos_modalidades (
    id integer NOT NULL,
    candidato_id integer NOT NULL,
    modalidad_horaria_id integer NOT NULL
);


ALTER TABLE public.candidatos_modalidades OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18976)
-- Name: candidatos_modalidades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.candidatos_modalidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.candidatos_modalidades_id_seq OWNER TO postgres;

--
-- TOC entry 6085 (class 0 OID 0)
-- Dependencies: 225
-- Name: candidatos_modalidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.candidatos_modalidades_id_seq OWNED BY public.candidatos_modalidades.id;


--
-- TOC entry 226 (class 1259 OID 18977)
-- Name: cargos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cargos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    tipo_cargo_id integer
);


ALTER TABLE public.cargos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18980)
-- Name: cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cargos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cargos_id_seq OWNER TO postgres;

--
-- TOC entry 6086 (class 0 OID 0)
-- Dependencies: 227
-- Name: cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cargos_id_seq OWNED BY public.cargos.id;


--
-- TOC entry 273 (class 1259 OID 20402)
-- Name: cartas_ofertas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cartas_ofertas (
    id integer NOT NULL,
    convocatoria_id integer NOT NULL,
    candidato_id integer NOT NULL,
    institucion_id integer,
    cargo_id integer,
    jornada_id integer,
    fecha_ingreso date,
    estado integer,
    fecha_apr_director timestamp with time zone,
    fecha_envio_dir timestamp with time zone,
    glosa_remuneracion text,
    horas_pactadas integer,
    fecha_apr_candidato timestamp with time zone,
    fecha_envio_candidato timestamp with time zone,
    created_at timestamp with time zone,
    cod_director integer,
    cod_candidato integer
);


ALTER TABLE public.cartas_ofertas OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 20401)
-- Name: cartas_ofertas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cartas_ofertas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cartas_ofertas_id_seq OWNER TO postgres;

--
-- TOC entry 6087 (class 0 OID 0)
-- Dependencies: 272
-- Name: cartas_ofertas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cartas_ofertas_id_seq OWNED BY public.cartas_ofertas.id;


--
-- TOC entry 228 (class 1259 OID 18981)
-- Name: categoria_cargos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria_cargos (
    id integer NOT NULL,
    nombre text
);


ALTER TABLE public.categoria_cargos OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18986)
-- Name: categoria_cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_cargos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_cargos_id_seq OWNER TO postgres;

--
-- TOC entry 6088 (class 0 OID 0)
-- Dependencies: 229
-- Name: categoria_cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_cargos_id_seq OWNED BY public.categoria_cargos.id;


--
-- TOC entry 230 (class 1259 OID 18987)
-- Name: ciudades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudades (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.ciudades OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18992)
-- Name: ciudades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ciudades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ciudades_id_seq OWNER TO postgres;

--
-- TOC entry 6089 (class 0 OID 0)
-- Dependencies: 231
-- Name: ciudades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ciudades_id_seq OWNED BY public.ciudades.id;


--
-- TOC entry 232 (class 1259 OID 18993)
-- Name: comentarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentarios (
    id integer NOT NULL,
    candidato_id integer NOT NULL,
    descripcion text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    creador_id integer
);


ALTER TABLE public.comentarios OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18998)
-- Name: comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comentarios_id_seq OWNER TO postgres;

--
-- TOC entry 6090 (class 0 OID 0)
-- Dependencies: 233
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comentarios.id;


--
-- TOC entry 234 (class 1259 OID 18999)
-- Name: comunas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comunas (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.comunas OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 19002)
-- Name: comunas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comunas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comunas_id_seq OWNER TO postgres;

--
-- TOC entry 6091 (class 0 OID 0)
-- Dependencies: 235
-- Name: comunas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comunas_id_seq OWNED BY public.comunas.id;


--
-- TOC entry 279 (class 1259 OID 45049)
-- Name: contratos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contratos (
    id integer NOT NULL,
    carta_oferta_id integer NOT NULL,
    estado_id integer
);


ALTER TABLE public.contratos OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 45048)
-- Name: contratos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contratos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contratos_id_seq OWNER TO postgres;

--
-- TOC entry 6092 (class 0 OID 0)
-- Dependencies: 278
-- Name: contratos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contratos_id_seq OWNED BY public.contratos.id;


--
-- TOC entry 236 (class 1259 OID 19003)
-- Name: convocatorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.convocatorias (
    id integer NOT NULL,
    codigo text,
    cargo_id integer,
    ciudad_id integer,
    institucion_id integer,
    fecha_cierre date,
    descripcion text,
    requisitos text,
    created_at timestamp with time zone DEFAULT now(),
    estado_id integer DEFAULT 1,
    modalidad_id integer,
    tipo_vacante_id integer,
    jornada_id integer,
    categoria_cargo_id integer
);


ALTER TABLE public.convocatorias OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 19010)
-- Name: convocatorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.convocatorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.convocatorias_id_seq OWNER TO postgres;

--
-- TOC entry 6093 (class 0 OID 0)
-- Dependencies: 237
-- Name: convocatorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.convocatorias_id_seq OWNED BY public.convocatorias.id;


--
-- TOC entry 271 (class 1259 OID 20122)
-- Name: directores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directores (
    id integer NOT NULL,
    rut text NOT NULL,
    nombre text,
    correo text,
    estado boolean DEFAULT true
);


ALTER TABLE public.directores OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 20121)
-- Name: directores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directores_id_seq OWNER TO postgres;

--
-- TOC entry 6094 (class 0 OID 0)
-- Dependencies: 270
-- Name: directores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directores_id_seq OWNED BY public.directores.id;


--
-- TOC entry 238 (class 1259 OID 19011)
-- Name: documentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documentos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fase_candidato integer
);


ALTER TABLE public.documentos OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 19014)
-- Name: documentos_candidatos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documentos_candidatos (
    id integer NOT NULL,
    documento_id integer NOT NULL,
    candidato_id integer NOT NULL,
    ruta character varying(255) NOT NULL,
    nombre text,
    created_at timestamp with time zone NOT NULL,
    nombre_para_mostrar text
);


ALTER TABLE public.documentos_candidatos OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 19019)
-- Name: documentos_candidatos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documentos_candidatos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.documentos_candidatos_id_seq OWNER TO postgres;

--
-- TOC entry 6095 (class 0 OID 0)
-- Dependencies: 240
-- Name: documentos_candidatos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documentos_candidatos_id_seq OWNED BY public.documentos_candidatos.id;


--
-- TOC entry 241 (class 1259 OID 19020)
-- Name: documentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.documentos_id_seq OWNER TO postgres;

--
-- TOC entry 6096 (class 0 OID 0)
-- Dependencies: 241
-- Name: documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documentos_id_seq OWNED BY public.documentos.id;


--
-- TOC entry 242 (class 1259 OID 19021)
-- Name: estado_candidatos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_candidatos (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.estado_candidatos OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 19024)
-- Name: estado_candidatos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_candidatos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_candidatos_id_seq OWNER TO postgres;

--
-- TOC entry 6097 (class 0 OID 0)
-- Dependencies: 243
-- Name: estado_candidatos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_candidatos_id_seq OWNED BY public.estado_candidatos.id;


--
-- TOC entry 275 (class 1259 OID 20442)
-- Name: estado_carta_oferta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_carta_oferta (
    id integer NOT NULL,
    nombre text
);


ALTER TABLE public.estado_carta_oferta OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 20441)
-- Name: estado_carta_oferta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_carta_oferta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_carta_oferta_id_seq OWNER TO postgres;

--
-- TOC entry 6098 (class 0 OID 0)
-- Dependencies: 274
-- Name: estado_carta_oferta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_carta_oferta_id_seq OWNED BY public.estado_carta_oferta.id;


--
-- TOC entry 244 (class 1259 OID 19025)
-- Name: estado_convocatoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_convocatoria (
    id integer NOT NULL,
    nombre text
);


ALTER TABLE public.estado_convocatoria OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 19030)
-- Name: estado_convocatoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_convocatoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_convocatoria_id_seq OWNER TO postgres;

--
-- TOC entry 6099 (class 0 OID 0)
-- Dependencies: 245
-- Name: estado_convocatoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_convocatoria_id_seq OWNED BY public.estado_convocatoria.id;


--
-- TOC entry 246 (class 1259 OID 19031)
-- Name: estados_civiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estados_civiles (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.estados_civiles OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 19034)
-- Name: estados_civiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estados_civiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estados_civiles_id_seq OWNER TO postgres;

--
-- TOC entry 6100 (class 0 OID 0)
-- Dependencies: 247
-- Name: estados_civiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estados_civiles_id_seq OWNED BY public.estados_civiles.id;


--
-- TOC entry 277 (class 1259 OID 20473)
-- Name: firmantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firmantes (
    id integer NOT NULL,
    nombre text,
    rex text,
    cargo text,
    rut text
);


ALTER TABLE public.firmantes OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 20472)
-- Name: firmantes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.firmantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.firmantes_id_seq OWNER TO postgres;

--
-- TOC entry 6101 (class 0 OID 0)
-- Dependencies: 276
-- Name: firmantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.firmantes_id_seq OWNED BY public.firmantes.id;


--
-- TOC entry 248 (class 1259 OID 19035)
-- Name: instituciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instituciones (
    id integer NOT NULL,
    nombre text,
    correo text,
    ciudad_id integer,
    director_id integer,
    activo boolean
);


ALTER TABLE public.instituciones OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 19040)
-- Name: instituciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instituciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituciones_id_seq OWNER TO postgres;

--
-- TOC entry 6102 (class 0 OID 0)
-- Dependencies: 249
-- Name: instituciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instituciones_id_seq OWNED BY public.instituciones.id;


--
-- TOC entry 250 (class 1259 OID 19041)
-- Name: jornadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jornadas (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.jornadas OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 19046)
-- Name: jornadas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jornadas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jornadas_id_seq OWNER TO postgres;

--
-- TOC entry 6103 (class 0 OID 0)
-- Dependencies: 251
-- Name: jornadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jornadas_id_seq OWNED BY public.jornadas.id;


--
-- TOC entry 252 (class 1259 OID 19047)
-- Name: mensajes_web; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensajes_web (
    id integer NOT NULL,
    nombre text NOT NULL,
    correo text NOT NULL,
    mensaje text NOT NULL,
    rut character varying(10) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    estado boolean DEFAULT true NOT NULL
);


ALTER TABLE public.mensajes_web OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 19054)
-- Name: mensajes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mensajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mensajes_id_seq OWNER TO postgres;

--
-- TOC entry 6104 (class 0 OID 0)
-- Dependencies: 253
-- Name: mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensajes_id_seq OWNED BY public.mensajes_web.id;


--
-- TOC entry 254 (class 1259 OID 19055)
-- Name: modalidades_horarias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modalidades_horarias (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.modalidades_horarias OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 19060)
-- Name: modalidades_horarias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modalidades_horarias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modalidades_horarias_id_seq OWNER TO postgres;

--
-- TOC entry 6105 (class 0 OID 0)
-- Dependencies: 255
-- Name: modalidades_horarias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modalidades_horarias_id_seq OWNED BY public.modalidades_horarias.id;


--
-- TOC entry 256 (class 1259 OID 19061)
-- Name: nacionalidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nacionalidades (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.nacionalidades OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 19064)
-- Name: nacionalidades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nacionalidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nacionalidades_id_seq OWNER TO postgres;

--
-- TOC entry 6106 (class 0 OID 0)
-- Dependencies: 257
-- Name: nacionalidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nacionalidades_id_seq OWNED BY public.nacionalidades.id;


--
-- TOC entry 258 (class 1259 OID 19065)
-- Name: nivel_educacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nivel_educacion (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.nivel_educacion OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 19068)
-- Name: nivel_educacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nivel_educacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nivel_educacion_id_seq OWNER TO postgres;

--
-- TOC entry 6107 (class 0 OID 0)
-- Dependencies: 259
-- Name: nivel_educacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nivel_educacion_id_seq OWNED BY public.nivel_educacion.id;


--
-- TOC entry 260 (class 1259 OID 19069)
-- Name: postulaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.postulaciones (
    id integer NOT NULL,
    candidato_id integer,
    convocatoria_id integer,
    created_at timestamp with time zone DEFAULT now(),
    estado boolean DEFAULT false,
    estado_candidato integer DEFAULT 1
);


ALTER TABLE public.postulaciones OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 19074)
-- Name: postulaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.postulaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.postulaciones_id_seq OWNER TO postgres;

--
-- TOC entry 6108 (class 0 OID 0)
-- Dependencies: 261
-- Name: postulaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.postulaciones_id_seq OWNED BY public.postulaciones.id;


--
-- TOC entry 262 (class 1259 OID 19075)
-- Name: regiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regiones (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.regiones OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 19078)
-- Name: regiones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regiones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regiones_id_seq OWNER TO postgres;

--
-- TOC entry 6109 (class 0 OID 0)
-- Dependencies: 263
-- Name: regiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regiones_id_seq OWNED BY public.regiones.id;


--
-- TOC entry 264 (class 1259 OID 19079)
-- Name: tipo_vacantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_vacantes (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.tipo_vacantes OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 19084)
-- Name: tipo_vacante_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_vacante_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_vacante_id_seq OWNER TO postgres;

--
-- TOC entry 6110 (class 0 OID 0)
-- Dependencies: 265
-- Name: tipo_vacante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_vacante_id_seq OWNED BY public.tipo_vacantes.id;


--
-- TOC entry 266 (class 1259 OID 19085)
-- Name: titulos_profesionales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titulos_profesionales (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.titulos_profesionales OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 19088)
-- Name: titulos_profesionales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.titulos_profesionales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.titulos_profesionales_id_seq OWNER TO postgres;

--
-- TOC entry 6111 (class 0 OID 0)
-- Dependencies: 267
-- Name: titulos_profesionales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.titulos_profesionales_id_seq OWNED BY public.titulos_profesionales.id;


--
-- TOC entry 268 (class 1259 OID 19089)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    usuario text NOT NULL,
    password text NOT NULL,
    estado boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    rol character varying(50) DEFAULT USER NOT NULL,
    uid text
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 19095)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 6112 (class 0 OID 0)
-- Dependencies: 269
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4943 (class 2604 OID 45059)
-- Name: Resoluciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Resoluciones" ALTER COLUMN id SET DEFAULT nextval('public."Resoluciones_id_seq"'::regclass);


--
-- TOC entry 4902 (class 2604 OID 19096)
-- Name: candidatos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos ALTER COLUMN id SET DEFAULT nextval('public.candidatos_id_seq'::regclass);


--
-- TOC entry 4904 (class 2604 OID 19097)
-- Name: candidatos_ciudades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_ciudades ALTER COLUMN id SET DEFAULT nextval('public.candidatos_ciudades_id_seq'::regclass);


--
-- TOC entry 4905 (class 2604 OID 19098)
-- Name: candidatos_jornadas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_jornadas ALTER COLUMN id SET DEFAULT nextval('public.candidatos_jornadas_id_seq'::regclass);


--
-- TOC entry 4906 (class 2604 OID 19099)
-- Name: candidatos_modalidades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_modalidades ALTER COLUMN id SET DEFAULT nextval('public.candidatos_modalidades_id_seq'::regclass);


--
-- TOC entry 4907 (class 2604 OID 19100)
-- Name: cargos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargos ALTER COLUMN id SET DEFAULT nextval('public.cargos_id_seq'::regclass);


--
-- TOC entry 4939 (class 2604 OID 20405)
-- Name: cartas_ofertas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartas_ofertas ALTER COLUMN id SET DEFAULT nextval('public.cartas_ofertas_id_seq'::regclass);


--
-- TOC entry 4908 (class 2604 OID 19101)
-- Name: categoria_cargos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_cargos ALTER COLUMN id SET DEFAULT nextval('public.categoria_cargos_id_seq'::regclass);


--
-- TOC entry 4909 (class 2604 OID 19102)
-- Name: ciudades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades ALTER COLUMN id SET DEFAULT nextval('public.ciudades_id_seq'::regclass);


--
-- TOC entry 4910 (class 2604 OID 19103)
-- Name: comentarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios ALTER COLUMN id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);


--
-- TOC entry 4911 (class 2604 OID 19104)
-- Name: comunas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunas ALTER COLUMN id SET DEFAULT nextval('public.comunas_id_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 45052)
-- Name: contratos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contratos ALTER COLUMN id SET DEFAULT nextval('public.contratos_id_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 19105)
-- Name: convocatorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatorias ALTER COLUMN id SET DEFAULT nextval('public.convocatorias_id_seq'::regclass);


--
-- TOC entry 4937 (class 2604 OID 20125)
-- Name: directores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directores ALTER COLUMN id SET DEFAULT nextval('public.directores_id_seq'::regclass);


--
-- TOC entry 4915 (class 2604 OID 19106)
-- Name: documentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos ALTER COLUMN id SET DEFAULT nextval('public.documentos_id_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 19107)
-- Name: documentos_candidatos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_candidatos ALTER COLUMN id SET DEFAULT nextval('public.documentos_candidatos_id_seq'::regclass);


--
-- TOC entry 4917 (class 2604 OID 19108)
-- Name: estado_candidatos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos ALTER COLUMN id SET DEFAULT nextval('public.estado_candidatos_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 20445)
-- Name: estado_carta_oferta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_carta_oferta ALTER COLUMN id SET DEFAULT nextval('public.estado_carta_oferta_id_seq'::regclass);


--
-- TOC entry 4918 (class 2604 OID 19109)
-- Name: estado_convocatoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_convocatoria ALTER COLUMN id SET DEFAULT nextval('public.estado_convocatoria_id_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 19110)
-- Name: estados_civiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles ALTER COLUMN id SET DEFAULT nextval('public.estados_civiles_id_seq'::regclass);


--
-- TOC entry 4941 (class 2604 OID 20476)
-- Name: firmantes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firmantes ALTER COLUMN id SET DEFAULT nextval('public.firmantes_id_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 19111)
-- Name: instituciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituciones ALTER COLUMN id SET DEFAULT nextval('public.instituciones_id_seq'::regclass);


--
-- TOC entry 4921 (class 2604 OID 19112)
-- Name: jornadas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jornadas ALTER COLUMN id SET DEFAULT nextval('public.jornadas_id_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 19113)
-- Name: mensajes_web id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes_web ALTER COLUMN id SET DEFAULT nextval('public.mensajes_id_seq'::regclass);


--
-- TOC entry 4925 (class 2604 OID 19114)
-- Name: modalidades_horarias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modalidades_horarias ALTER COLUMN id SET DEFAULT nextval('public.modalidades_horarias_id_seq'::regclass);


--
-- TOC entry 4926 (class 2604 OID 19115)
-- Name: nacionalidades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades ALTER COLUMN id SET DEFAULT nextval('public.nacionalidades_id_seq'::regclass);


--
-- TOC entry 4927 (class 2604 OID 19116)
-- Name: nivel_educacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nivel_educacion ALTER COLUMN id SET DEFAULT nextval('public.nivel_educacion_id_seq'::regclass);


--
-- TOC entry 4928 (class 2604 OID 19117)
-- Name: postulaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postulaciones ALTER COLUMN id SET DEFAULT nextval('public.postulaciones_id_seq'::regclass);


--
-- TOC entry 4932 (class 2604 OID 19118)
-- Name: regiones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones ALTER COLUMN id SET DEFAULT nextval('public.regiones_id_seq'::regclass);


--
-- TOC entry 4933 (class 2604 OID 19119)
-- Name: tipo_vacantes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_vacantes ALTER COLUMN id SET DEFAULT nextval('public.tipo_vacante_id_seq'::regclass);


--
-- TOC entry 4934 (class 2604 OID 19120)
-- Name: titulos_profesionales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales ALTER COLUMN id SET DEFAULT nextval('public.titulos_profesionales_id_seq'::regclass);


--
-- TOC entry 4935 (class 2604 OID 19121)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 6073 (class 0 OID 45056)
-- Dependencies: 281
-- Data for Name: Resoluciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Resoluciones" (id, carta_oferta_id, estado_id) FROM stdin;
\.


--
-- TOC entry 6009 (class 0 OID 18952)
-- Dependencies: 217
-- Data for Name: candidatos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.candidatos (id, rut, nombre_completo, titulo_profesional_id, telefono, correo, estado_candidato_id, nacionalidad_id, estado_civil_id, direccion, comuna_id, created_at, updated_at, usuario_id, presentacion, fecha_nacimiento, categoria_funcionaria_id, nivel_educacion_id, tipo_vacante_nuevo, tipo_vacante_reemplazo, especialidad) FROM stdin;
2	20217385-3	Isabel Yesenia Zapata Maldonado	\N	\N	isabel.zapatama@epchinchorro.cl	1	\N	\N	\N	\N	2025-10-22 11:12:57.161-03	2025-10-22 11:12:57.161-03	2	\N	\N	\N	\N	\N	\N	\N
4	12607595-2	Roberto Fuentes	\N	\N	roberto.fuentes@epchinchorro.cl	1	\N	\N	\N	\N	2025-10-22 11:25:49.465-03	2025-10-22 11:25:49.465-03	4	\N	\N	\N	\N	\N	\N	\N
3	16469777-0	Yasna Vildoso Barbieri	\N	\N	yas.vildoso.b@gmail.com	2	\N	\N	\N	\N	2025-10-22 11:24:38.9-03	2025-10-27 17:19:07.501179-03	3	\N	\N	\N	\N	\N	\N	\N
5	13637586-5	Paola Gonzalez Rodriguez	9	\N	m14gs4@gmail.com	1	\N	\N	\N	\N	2025-11-19 09:10:47.755-03	2025-11-20 10:59:03.797128-03	5	\N	\N	5	9	t	t	\N
1	16467222-2	Juan Pérez Pereira	15	959292849	michael.aguirre@epchinchorro.cl	3	1	1	Linderos Central n° 4984	1	2025-10-22 11:09:50.85-03	2025-12-05 10:56:56.678171-03	1	\N	1998-11-18	3	9	t	f	Tecnologías e Innovación
\.


--
-- TOC entry 6010 (class 0 OID 18961)
-- Dependencies: 218
-- Data for Name: candidatos_cargos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.candidatos_cargos (candidato_id, cargo_id) FROM stdin;
1	10
5	34
\.


--
-- TOC entry 6011 (class 0 OID 18964)
-- Dependencies: 219
-- Data for Name: candidatos_ciudades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.candidatos_ciudades (id, candidato_id, ciudades_id) FROM stdin;
1	1	1
2	1	3
3	5	1
4	5	2
5	5	3
6	5	4
7	5	6
8	5	7
\.


--
-- TOC entry 6014 (class 0 OID 18969)
-- Dependencies: 222
-- Data for Name: candidatos_jornadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.candidatos_jornadas (id, candidato_id, jornada_id) FROM stdin;
1	1	1
2	1	3
3	5	1
4	5	2
\.


--
-- TOC entry 6016 (class 0 OID 18973)
-- Dependencies: 224
-- Data for Name: candidatos_modalidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.candidatos_modalidades (id, candidato_id, modalidad_horaria_id) FROM stdin;
1	1	1
2	5	1
3	5	3
\.


--
-- TOC entry 6018 (class 0 OID 18977)
-- Dependencies: 226
-- Data for Name: cargos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cargos (id, nombre, tipo_cargo_id) FROM stdin;
1	Inspector(a) de patio	1
2	Portero(a)	1
3	Secretario(a)	1
4	Auxiliar de Aseo	2
5	Chofer / Conductor Escolar	2
6	Vigilante nocturno	2
7	Fonoaudiólogo(a)	3
8	Psicólogo(a)	3
9	Terapeuta Ocupacional	3
10	Trabajador(a) Social	3
11	Técnico en Atención de Párvulos	4
12	Técnico en Educación Especial	4
13	Asistente Informático / Soporte TIC	4
14	Educador(a) de Párvulos	5
15	Docente Diferencial	5
16	Docente de Artes Visuales	5
17	Docente de Biología	5
18	Docente de Ciencias Naturales	5
19	Docente de Educación Física	5
20	Docente de Física	5
21	Docente de Filosofía	5
22	Docente de Historia	5
23	Docente de Inglés	5
24	Educador(a) Tradicional	5
25	Docente de Lenguaje	5
26	Docente CRA	5
27	Docente de Enlace	5
28	Docente de Matemática	5
29	Docente de Música	5
30	Docente de Química	5
31	Docente de Religión	5
32	Docente Explotación Minera (Técnico Profesional)	5
33	Docente Enfermería (Técnico Profesional)	5
34	Docente Administración (Técnico Profesional)	5
35	Docente Electricidad (Técnico Profesional)	5
36	Docente Gastronomía (Técnico Profesional)	5
37	Docente Atención de Párvulos (Técnico Profesional)	5
38	Docente Construcciones Metálicas (Técnico Profesional)	5
39	Docente Mecánica Automotriz (Técnico Profesional)	5
40	Docente Electrónica (Técnico Profesional)	5
41	Docente Contabilidad (Técnico Profesional)	5
42	Docente Conectividad y Redes (Técnico Profesional)	5
43	Docente Mecánica Industrial (Técnico Profesional)	5
44	Docente Agronomía (Técnico Profesional)	5
\.


--
-- TOC entry 6065 (class 0 OID 20402)
-- Dependencies: 273
-- Data for Name: cartas_ofertas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cartas_ofertas (id, convocatoria_id, candidato_id, institucion_id, cargo_id, jornada_id, fecha_ingreso, estado, fecha_apr_director, fecha_envio_dir, glosa_remuneracion, horas_pactadas, fecha_apr_candidato, fecha_envio_candidato, created_at, cod_director, cod_candidato) FROM stdin;
54	1	2	76	8	4	\N	4	\N	\N	\N	\N	\N	\N	2025-11-25 09:13:37.910624-03	\N	\N
52	3	5	76	34	1	\N	4	\N	\N	\N	\N	\N	\N	2025-11-25 09:12:48.26946-03	\N	\N
53	3	5	76	34	1	2025-11-27	1	\N	\N	\N	\N	\N	\N	2025-11-25 09:13:37.910624-03	\N	\N
56	1	2	76	8	4	\N	4	\N	\N	\N	44	\N	\N	2025-11-25 09:13:37.910624-03	\N	\N
55	1	1	76	8	4	2025-11-26	4	\N	\N	$1200000	44	2025-12-01 15:23:33.617-03	2025-12-01 10:43:35.31-03	2025-11-25 09:13:37.910624-03	776400	526556
57	1	2	76	8	4	\N	4	\N	\N	\N	\N	\N	\N	2025-12-04 12:17:33.707-03	\N	\N
58	1	1	76	8	4	\N	1	\N	\N	\N	\N	\N	\N	2025-12-05 10:54:38.013-03	\N	\N
\.


--
-- TOC entry 6020 (class 0 OID 18981)
-- Dependencies: 228
-- Data for Name: categoria_cargos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria_cargos (id, nombre) FROM stdin;
1	Asistente de la Educación / Administrativo
2	Asistente de la Educación / Auxiliar
3	Asistente de la Educación / Profesional
4	Asistente de la Educación / Técnico
5	Docente
\.


--
-- TOC entry 6022 (class 0 OID 18987)
-- Dependencies: 230
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ciudades (id, nombre) FROM stdin;
1	Arica
2	Putre
3	Valle de Azapa
4	Valle de Lluta
5	General Lagos
6	Camarones
7	Valle de Chaca
\.


--
-- TOC entry 6024 (class 0 OID 18993)
-- Dependencies: 232
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentarios (id, candidato_id, descripcion, created_at, creador_id) FROM stdin;
\.


--
-- TOC entry 6026 (class 0 OID 18999)
-- Dependencies: 234
-- Data for Name: comunas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comunas (id, nombre, region_id) FROM stdin;
1	Arica	1
2	Camarones	1
3	Putre	1
4	General Lagos	1
5	Iquique	2
6	Alto Hospicio	2
7	Pozo Almonte	2
8	Camiña	2
9	Colchane	2
10	Huara	2
11	Pica	2
12	Antofagasta	3
13	Mejillones	3
14	Sierra Gorda	3
15	Taltal	3
16	Calama	3
17	Ollagüe	3
18	San Pedro de Atacama	3
19	Tocopilla	3
20	María Elena	3
21	Copiapó	4
22	Caldera	4
23	Tierra Amarilla	4
24	Chañaral	4
25	Diego de Almagro	4
26	Vallenar	4
27	Alto del Carmen	4
28	Freirina	4
29	Huasco	4
30	La Serena	5
31	Coquimbo	5
32	Andacollo	5
33	La Higuera	5
34	Paiguano	5
35	Vicuña	5
36	Illapel	5
37	Canela	5
38	Los Vilos	5
39	Salamanca	5
40	Ovalle	5
41	Combarbalá	5
42	Monte Patria	5
43	Punitaqui	5
44	Río Hurtado	5
45	Valparaíso	6
46	Casablanca	6
47	Concón	6
48	Juan Fernández	6
49	Puchuncaví	6
50	Quintero	6
51	Viña del Mar	6
52	Isla de Pascua	6
53	Los Andes	6
54	Calle Larga	6
55	Rinconada	6
56	San Esteban	6
57	La Ligua	6
58	Cabildo	6
59	Papudo	6
60	Petorca	6
61	Zapallar	6
62	Quillota	6
63	Calera	6
64	Hijuelas	6
65	La Cruz	6
66	Nogales	6
67	San Antonio	6
68	Algarrobo	6
69	Cartagena	6
70	El Quisco	6
71	El Tabo	6
72	Santo Domingo	6
73	San Felipe	6
74	Catemu	6
75	Llaillay	6
76	Panquehue	6
77	Putaendo	6
78	Santa María	6
79	Quilpué	6
80	Limache	6
81	Olmué	6
82	Villa Alemana	6
83	Santiago	7
84	Cerrillos	7
85	Cerro Navia	7
86	Conchalí	7
87	El Bosque	7
88	Estación Central	7
89	Huechuraba	7
90	Independencia	7
91	La Cisterna	7
92	La Florida	7
93	La Granja	7
94	La Pintana	7
95	La Reina	7
96	Las Condes	7
97	Lo Barnechea	7
98	Lo Espejo	7
99	Lo Prado	7
100	Macul	7
101	Maipú	7
102	Ñuñoa	7
103	Pedro Aguirre Cerda	7
104	Peñalolén	7
105	Providencia	7
106	Pudahuel	7
107	Quilicura	7
108	Quinta Normal	7
109	Recoleta	7
110	Renca	7
111	San Joaquín	7
112	San Miguel	7
113	San Ramón	7
114	Vitacura	7
115	Puente Alto	7
116	Pirque	7
117	San José de Maipo	7
118	Colina	7
119	Lampa	7
120	Tiltil	7
121	San Bernardo	7
122	Buin	7
123	Calera de Tango	7
124	Paine	7
125	Melipilla	7
126	Alhué	7
127	Curacaví	7
128	María Pinto	7
129	San Pedro	7
130	Talagante	7
131	El Monte	7
132	Isla de Maipo	7
133	Padre Hurtado	7
134	Peñaflor	7
135	Rancagua	8
136	Codegua	8
137	Coinco	8
138	Coltauco	8
139	Doñihue	8
140	Graneros	8
141	Las Cabras	8
142	Machalí	8
143	Malloa	8
144	Mostazal	8
145	Olivar	8
146	Peumo	8
147	Pichidegua	8
148	Quinta de Tilcoco	8
149	Rengo	8
150	Requínoa	8
151	San Vicente	8
152	Pichilemu	8
153	La Estrella	8
154	Litueche	8
155	Marchihue	8
156	Navidad	8
157	Paredones	8
158	San Fernando	8
159	Chépica	8
160	Chimbarongo	8
161	Lolol	8
162	Nancagua	8
163	Palmilla	8
164	Peralillo	8
165	Placilla	8
166	Pumanque	8
167	Santa Cruz	8
168	Talca	9
169	Constitución	9
170	Curepto	9
171	Empedrado	9
172	Maule	9
173	Pelarco	9
174	Pencahue	9
175	Río Claro	9
176	San Clemente	9
177	San Rafael	9
178	Cauquenes	9
179	Chanco	9
180	Pelluhue	9
181	Curicó	9
182	Hualañé	9
183	Licantén	9
184	Molina	9
185	Rauco	9
186	Romeral	9
187	Sagrada Familia	9
188	Teno	9
189	Vichuquén	9
190	Linares	9
191	Colbún	9
192	Longaví	9
193	Parral	9
194	Retiro	9
195	San Javier	9
196	Villa Alegre	9
197	Yerbas Buenas	9
198	Chillán	10
199	Bulnes	10
200	Chillán Viejo	10
201	El Carmen	10
202	Pemuco	10
203	Pinto	10
204	Quillón	10
205	San Ignacio	10
206	Yungay	10
207	Cobquecura	10
208	Coelemu	10
209	Ninhue	10
210	Portezuelo	10
211	Quirihue	10
212	Ránquil	10
213	Treguaco	10
214	Coihueco	10
215	Ñiquén	10
216	San Carlos	10
217	San Fabián	10
218	San Nicolás	10
219	Concepción	11
220	Coronel	11
221	Chiguayante	11
222	Florida	11
223	Hualpén	11
224	Hualqui	11
225	Lota	11
226	Penco	11
227	San Pedro de la Paz	11
228	Santa Juana	11
229	Talcahuano	11
230	Tomé	11
231	Lebu	11
232	Arauco	11
233	Cañete	11
234	Contulmo	11
235	Curanilahue	11
236	Los Álamos	11
237	Tirúa	11
238	Los Ángeles	11
239	Antuco	11
240	Cabrero	11
241	Laja	11
242	Mulchén	11
243	Nacimiento	11
244	Negrete	11
245	Quilaco	11
246	Quilleco	11
247	San Rosendo	11
248	Santa Bárbara	11
249	Tucapel	11
250	Yumbel	11
251	Alto Biobío	11
252	Temuco	12
253	Carahue	12
254	Cunco	12
255	Curarrehue	12
256	Freire	12
257	Galvarino	12
258	Gorbea	12
259	Lautaro	12
260	Loncoche	12
261	Melipeuco	12
262	Nueva Imperial	12
263	Padre las Casas	12
264	Perquenco	12
265	Pitrufquén	12
266	Pucón	12
267	Saavedra	12
268	Teodoro Schmidt	12
269	Toltén	12
270	Vilcún	12
271	Villarrica	12
272	Angol	12
273	Collipulli	12
274	Curacautín	12
275	Ercilla	12
276	Lonquimay	12
277	Los Sauces	12
278	Lumaco	12
279	Purén	12
280	Renaico	12
281	Traiguén	12
282	Victoria	12
283	Valdivia	13
284	Corral	13
285	Lanco	13
286	Los Lagos	13
287	Máfil	13
288	Mariquina	13
289	Paillaco	13
290	Panguipulli	13
291	La Unión	13
292	Futrono	13
293	Lago Ranco	13
294	Río Bueno	13
295	Puerto Montt	14
296	Calbuco	14
297	Cochamó	14
298	Fresia	14
299	Frutillar	14
300	Los Muermos	14
301	Llanquihue	14
302	Maullín	14
303	Puerto Varas	14
304	Castro	14
305	Ancud	14
306	Chonchi	14
307	Curaco de Vélez	14
308	Dalcahue	14
309	Puqueldón	14
310	Queilén	14
311	Quellón	14
312	Quemchi	14
313	Quinchao	14
314	Osorno	14
315	Puerto Octay	14
316	Purranque	14
317	Puyehue	14
318	Río Negro	14
319	San Juan de la Costa	14
320	San Pablo	14
321	Chaitén	14
322	Futaleufú	14
323	Hualaihué	14
324	Palena	14
325	Coihaique	15
326	Lago Verde	15
327	Aysén	15
328	Cisnes	15
329	Guaitecas	15
330	Cochrane	15
331	O'Higgins	15
332	Tortel	15
333	Chile Chico	15
334	Río Ibáñez	15
335	Punta Arenas	16
336	Laguna Blanca	16
337	Río Verde	16
338	San Gregorio	16
339	Cabo de Hornos	16
340	Antártica	16
341	Porvenir	16
342	Primavera	16
343	Timaukel	16
344	Natales	16
345	Torres del Paine	16
\.


--
-- TOC entry 6071 (class 0 OID 45049)
-- Dependencies: 279
-- Data for Name: contratos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contratos (id, carta_oferta_id, estado_id) FROM stdin;
\.


--
-- TOC entry 6028 (class 0 OID 19003)
-- Dependencies: 236
-- Data for Name: convocatorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.convocatorias (id, codigo, cargo_id, ciudad_id, institucion_id, fecha_cierre, descripcion, requisitos, created_at, estado_id, modalidad_id, tipo_vacante_id, jornada_id, categoria_cargo_id) FROM stdin;
2	SLEP-DOC-6018-2025	28	3	67	2025-11-19	9srhrtn	hmndtyhmdt	2025-11-18 11:44:36.679178-03	4	1	1	1	5
1	SLEP-ASI-5031-2025	8	1	76	2025-11-12	convocatoria de prueba	convocatoria de prueba	2025-11-11 10:32:25.604673-03	4	1	1	4	3
3	SLEP-DOC-9042-2025	34	1	76	2025-11-21	trabajo de prueba de sistema	trabajo de prueba de sistema	2025-11-19 09:15:59.355483-03	2	1	1	1	5
\.


--
-- TOC entry 6063 (class 0 OID 20122)
-- Dependencies: 271
-- Data for Name: directores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directores (id, rut, nombre, correo, estado) FROM stdin;
1	10226593-9	PABLO ORNALDO VALENZUELA HUANCA	pablo.valenzuela@epchinchorro.cl	t
2	15008899-2	VERÓNICA ISABEL MONTENEGRO PINTO	veronica.montenegro@epchinchorro.cl	t
3	15420433-4	PABLO EMILIO CÁDIZ CHACÓN	pablo.cadizch@slepchinchorro.cl	t
4	9633161-4	NELSON EDUARDO CABEZAS MELLER	nelson.cabezas@epchinchorro.cl	t
5	10684126-8	MAYCOLE FRANCOISE SALAMANCA WELSCH	maycole.salamanca@epchinchorro.cl	t
6	6800995-2	NICOLAS MONTECINOS GONZALEZ	nicolas.montecinos@epchinchorro.cl	t
7	10213659-4	XIMENA ELOÍSA SÁNCHEZ CARVAJAL	ximena.sanchez@epchinchorro.cl	t
8	9532014-7	MOIRA ALEJANDRA DONOSO MALUF	moira.donoso@epchinchorro.cl	t
9	12436803-0	PAMELA DEL CARMEN VILLEGAS MELGAREJO	pamela.villegasme@slepchinchorro.cl	t
10	9374262-1	ROSS MARIE ARLETTE DÍAZ TABILO	ross.diaz@epchinchorro.cl	t
11	13212667-4	ALEJANDRA CARMEN ESPINOZA DIAZ	alejandra.espinoza@epchinchorro.cl	t
12	9068699-2	ISABEL DEL PILAR GARCÍA NÚÑEZ	isabel.garcia@epchinchorro.cl	t
13	9730512-9	MONICA HERNANDEZ VARAS	monica.hernandez@epchinchorro.cl	t
14	15008136-K	ALONSO JAVIER CARREÑO SÁEZ	alonso.carreno@epchinchorro.cl	t
15	10393102-9	ALICIA MAURA ARANCIBIA RIVEROS	alicia.arancibiari@slepchinchorro.cl	t
16	17011741-7	RICARDO FAVIO RAMIREZ CHOQUE	ricardo.ramirez@epchinchorro.cl	t
17	10769856-6	ANÍBAL ALEJANDRO COFRÉ MORALES	anibal.cofre@epchinchorro.cl	t
18	9020152-2	LEONTINA DEL CARMEN LOPEZ NAVARRO	leontina.lopez@epchinchorro.cl	t
19	15511158-5	FELIPE FABIAN JERIA ACOSTA	felipe.jeria@epchinchorro.cl	t
20	17552835-0	JOSÉ IGNACIO ANDRÉS FERNÁNDEZ GALLEGOS	jose.fernandez@epchinchorro.cl	t
21	15003307-1	ANGGIE ELIZABETH CASTILLO CARTER	anggie.castillo@epchinchorro.cl	t
22	13219634-6	LJUBICA DENISSE DEFINIS CASTILLO	ljubica.definis@epchinchorro.cl	t
23	14341517-1	FRESIA CAROLINA ARREDONDO DÍAZ	fresia.arredondo@epchinchorro.cl	t
24	9666841-4	IVAN ARANCIBIA MUÑOZ	ivan.arancibia@epchinchorro.cl	t
25	8290280-5	JUAN GUILLERMO JORDÁN ARIAS	juan.jordan@epchinchorro.cl	t
26	8568846-4	JACQUELINE DEL ROSARIO RETAMALES ESPINOZA	jacqueline.retamales@epchinchorro.cl	t
27	9648471-2	EMMA VASQUEZ ACUÑA	emma.vasquez@epchinchorro.cl	t
28	7627891-1	ORLANDO AMARO SANTIBÁÑEZ FERREIRA	orlando.santibanezfe@slepchinchorro.cl	t
29	15002172-3	JUAN ANTONIO ZAMORA BERRIOS	juan.zamora@epchinchorro.cl	t
30	7211902-9	JULIO ORLANDO VARGAS LOBOS	julio.vargas@epchinchorro.cl	t
31	10431970-K	CÉSAR ROY CASO CASO	cesar.caso@epchinchorro.cl	t
32	9954258-6	PAMELA LIDIA FIGUEROA PIZARRO	pamela.figueroa@epchinchorro.cl	t
33	7068874-3	RUTH DINI VALENZUELA	ruth.dini@epchinchorro.cl	t
34	6641819-7	MARIA ISABEL ALVAREZ HERNANDEZ	maria.alvarez@epchinchorro.cl	t
35	8806971-4	LUIS HERNAN BARNAO ASTUDILLO	luis.barnao@epchinchorro.cl	t
36	12833494-7	GABRIELA MARIA MARTINEZ LORETO	gabriela.martinez@epchinchorro.cl	t
37	10050423-5	RICHARD CLAUDIO MORALES CAMPUSANO	richard.morales@epchinchorro.cl	t
38	14103080-9	RAUL ADRIAN HUENTECURA CONDORI	raul.huentecura@epchinchorro.cl	t
39	9272619-3	ORIETA LORENA GARCIA ORE	orieta.garcia@epchinchorro.cl	t
40	13412492-K	IVONETT DEL PILAR BARRIOS JORQUERA	ivonett.barrios@epchinchorro.cl	t
41	12437652-1	MARIANELLA GOMEZ ALVARADO	marianella.gomez@epchinchorro.cl	t
42	12834843-3	MABEL JACQUELINE HIDALGO DÍAZ	ljubica.definis@epchinchorro.cl	t
43	13007009-4	MACARENA MILENKA CÁCERES ROMERO	macarena.caceres@epchinchorro.cl	t
44	10994717-2	LEONOR ELISA CAÑIPA PONCE	leonor.canipa@epchinchorro.cl	t
45	14104976-3	JOANA SYLVIA ESPINOZA VARGAS	joana.espinoza@epchinchorro.cl	t
46	14105096-6	CAROLINA ALEJANDRA DÍAZ VON FURSTENBERG	carolina.diaz@epchinchorro.cl	t
47	16225165-1	CARLA NAIR COFRÉ MÁNQUEZ	carla.cofre@epchinchorro.cl	t
48	8956041-1	PAOLA GEMITA PÉREZ PIZARRO	paola.perez@epchinchorro.cl	t
49	14103120-1	CAROLINA CRISTINA VALDEBENITO ZAMBRANO	carolina.valdebenito@epchinchorro.cl	t
50	10808456-1	DANIEL JUAN VILLEGAS HERRERA	daniel.villegas@epchinchorro.cl	t
51	9369989-0	RAÚL GONZALO VÁSQUEZ FLORES	raul.vasquez@epchinchorro.cl	t
52	6639275-9	LUIS RAMOS ÁLVAREZ	luis.ramos@epchinchorro.cl	t
53	15008543-8	ALVARO IVAN CAÑIPA PACHA	alvaro.canipa@epchinchorro.cl	t
54	10662941-2	RÓMULO PAUL MALDONADO ÁLVAREZ	romulo.maldonado@epchinchorro.cl	t
55	8285797-4	MARIO STEWARD GUTIERREZ CAÑIPA	mario.gutierrez@epchinchorro.cl	t
56	12611016-2	JHOEL CÁCERES ROMERO	jhoel.caceres@epchinchorro.cl	t
57	10019190-3	GIULLIA ANTONIETA OLIVERA LEON	giullia.olivera@epchinchorro.cl	t
58	19494122-6	JAIME DOMÉNICO EUGENIO APATA GALLEGOS	jaime.apata@epchinchorro.cl	t
59	14104621-7	MARJORIE PRISCILLA APAZ SAMIT	marjorie.apaz@epchinchorro.cl	t
60	9450061-3	LORELIA ZENIS OYARZO	lorelia.zenis@epchinchorro.cl	t
61	9640249-K	MARCELA ROJAS CASTRO	marcela.rojas@epchinchorro.cl	t
62	5769684-2	FERNANDO FERNÁNDEZ OLIVARES	fernando.fernandez@epchinchorro.cl	t
63	9475926-9	RENATO VALENTINO DEL ROSARIO BRITO GAVILÁN	renato.brito@epchinchorro.cl	t
64	7045842-K	MANUEL RIOS BENAVENTE	manuel.rios@epchinchorro.cl	t
65	11506485-1	MARIA ALICIA MUGUEÑO MUÑOZ	maria.mugueno@epchinchorro.cl	t
66	9284047-6	LUIS MERINO JARA	luis.merino@epchinchorro.cl	t
67	16911371-8	RODRIGO ANDRES FIERRO ACEITUNO	rodrigo.fierro@epchinchorro.cl	t
68	19493098-4	HANS IVAN GREGORIO BELTRAN	hans.gregorio@epchinchorro.cl	t
69	10500599-7	CARMEN CONDORE CALLE	carmen.condore@epchinchorro.cl	t
70	9331140-K	HUGO LLERENA PÉREZ	hugo.llerena@epchinchorro.cl	t
71	7665677-0	HÉCTOR CHOQUE SANTOS	hector.choque@epchinchorro.cl	t
72	16467901-2	Director de prueba (Slep Chinchorro)	michael.aguirre.saavedra@gmail.com	t
\.


--
-- TOC entry 6030 (class 0 OID 19011)
-- Dependencies: 238
-- Data for Name: documentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documentos (id, nombre, fase_candidato) FROM stdin;
1	CURRICULUM VITAE	1
2	CERTIFICADO DE NACIMIENTO	2
3	FOTOCOPIA CÉDULA IDENTIDAD	1
4	CERTIFICADO AFILIACIÓN SISTEMA DE SALUD	2
5	CERTIFICADO DE AFILIACIÓN AFP	2
6	CERTIFICADO DE TÍTULO	1
7	CERTIFICADO DE INHABILIDADES PARA TRABAJAR CON MENORES DE EDAD	1
8	CERTIFICADO DE MALTRATO RELEVANTE	1
9	DECLARACIÓN JURADA SOBRE PENSIÓN DE ALIMENTOS	2
12	CERTIFICADO NACIMIENTO HIJOS	2
13	CERTIFICADO MATRIMONIO	2
14	CERTIFICADO APV	2
15	DECLARACIÓN JURADA SIMPLE	2
11	POSTÍTULO (opcional)	1
16	CERTIFICADO DE ANTECEDENTES PARA FINES ESPECIALES	1
17	CERTIFICADO DE EXPERIENCIA LABORAL (opcional)	1
\.


--
-- TOC entry 6031 (class 0 OID 19014)
-- Dependencies: 239
-- Data for Name: documentos_candidatos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documentos_candidatos (id, documento_id, candidato_id, ruta, nombre, created_at, nombre_para_mostrar) FROM stdin;
1	1	5	/uploads/136375865/file-1763555477996-646108280.pdf	file-1763555477996-646108280.pdf	2025-11-19 09:31:17.998-03	CV_Michael.pdf
2	3	5	/uploads/136375865/file-1763555487282-390103952.pdf	file-1763555487282-390103952.pdf	2025-11-19 09:31:27.284-03	CV_Michael.pdf
3	6	5	/uploads/136375865/file-1763555492609-400663450.pdf	file-1763555492609-400663450.pdf	2025-11-19 09:31:32.612-03	CV_Michael.pdf
4	7	5	/uploads/136375865/file-1763555497401-466088110.pdf	file-1763555497401-466088110.pdf	2025-11-19 09:31:37.401-03	CV_Michael.pdf
5	11	5	/uploads/136375865/file-1763555506002-844100331.pdf	file-1763555506002-844100331.pdf	2025-11-19 09:31:46.003-03	CV_Michael.pdf
6	16	5	/uploads/136375865/file-1763555515717-53706007.pdf	file-1763555515717-53706007.pdf	2025-11-19 09:31:55.718-03	CV_Michael.pdf
7	8	5	/uploads/136375865/file-1763555532018-510060589.pdf	file-1763555532018-510060589.pdf	2025-11-19 09:32:12.019-03	CV_Michael.pdf
8	17	5	/uploads/136375865/file-1763555536826-752550520.pdf	file-1763555536826-752550520.pdf	2025-11-19 09:32:16.827-03	CV_Michael.pdf
9	1	1	/uploads/164679012/file-1764620513948-310928463.docx	file-1764620513948-310928463.docx	2025-12-01 17:21:53.952-03	CV_Michael.docx
\.


--
-- TOC entry 6034 (class 0 OID 19021)
-- Dependencies: 242
-- Data for Name: estado_candidatos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado_candidatos (id, nombre) FROM stdin;
1	Nuevo
2	En revisión
3	Calificado
4	Descartado
\.


--
-- TOC entry 6067 (class 0 OID 20442)
-- Dependencies: 275
-- Data for Name: estado_carta_oferta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado_carta_oferta (id, nombre) FROM stdin;
1	creada
2	enviada al director
3	aprobada
4	anulada
5	Archivada
\.


--
-- TOC entry 6036 (class 0 OID 19025)
-- Dependencies: 244
-- Data for Name: estado_convocatoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado_convocatoria (id, nombre) FROM stdin;
1	Nuevo
3	Queda 1 día
4	Finalizada
5	Proceso Cerrado
2	Abierta
\.


--
-- TOC entry 6038 (class 0 OID 19031)
-- Dependencies: 246
-- Data for Name: estados_civiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estados_civiles (id, nombre) FROM stdin;
1	Soltero
2	Casado
3	Divorciado
4	Viudo
\.


--
-- TOC entry 6069 (class 0 OID 20473)
-- Dependencies: 277
-- Data for Name: firmantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firmantes (id, nombre, rex, cargo, rut) FROM stdin;
1	JULIO VERDEJO AQUEVEQUE	123456/123/2025	DIRECTOR EJECUTIVO (S)	9.520.079-6
2	JHON SMITH SMITH	654321/654/2025	DIRECTOR EJECUTIVO	12.345.678-9
\.


--
-- TOC entry 6040 (class 0 OID 19035)
-- Dependencies: 248
-- Data for Name: instituciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instituciones (id, nombre, correo, ciudad_id, director_id, activo) FROM stdin;
76	Colegio de pruebas (Slep Chinchorro)	desarrollo@epchinchorro.cl	1	72	t
3	Colegio Eduardo Frei Montalva	lic.cief@epchinchorro.cl	1	5	t
1	Centro de Capacitación Reino de Bélgica	ccl.belgica@epchinchorro.cl	1	7	t
2	Colegio Centenario Arica	esc.centenario@epchinchorro.cl	1	8	t
4	Escuela Alcérreca	esc.alcerreca@epchinchorro.cl	1	\N	t
5	Escuela América (E-26)	esc.america@epchinchorro.cl	1	2	t
6	Escuela Ancolacane	esc.ancolacane@epchinchorro.cl	5	64	t
7	Escuela Carlos Condell de la Haza (G-8)	esc.ccondell@epchinchorro.cl	1	6	t
8	Escuela Chaca (G-55)	esc.chaca@epchinchorro.cl	6	9	t
9	Escuela Chislluma	esc.chislluma@epchinchorro.cl	5	68	t
10	Escuela Chujlluta	esc.chujlluta@epchinchorro.cl	4	69	t
11	Escuela Colpitas	esc.colpitas@epchinchorro.cl	4	71	t
12	Escuela Comandante Juan José San Martín (D-17)	esc.jjsanmartin@epchinchorro.cl	1	21	t
13	Escuela Cosapilla	esc.cosapilla@epchinchorro.cl	5	67	t
14	Escuela Cotacotani	esc.cotacotani@epchinchorro.cl	5	\N	t
15	Escuela Darío Salas (F-3)	esc.dariosalas@epchinchorro.cl	1	10	t
16	Escuela Doctor Ricardo Olea Guerra	esc.roleaguerra@epchinchorro.cl	1	34	t
17	Escuela El Marquez	esc.ticnamar@epchinchorro.cl	6	50	t
18	Escuela Esmeralda (E-5)	esc.esmeralda@epchinchorro.cl	1	11	t
19	Escuela España (G-28)	esc.espana@epchinchorro.cl	1	12	t
20	Escuela Gabriela Mistral (D-24)	esc.gmistral@epchinchorro.cl	1	11	t
21	Escuela General José Miguel Carrera (D-10)	esc.jmcarrera@epchinchorro.cl	1	19	t
22	Escuela General Manuel Baquedano (G-20)	esc.gbaquedano@epchinchorro.cl	1	13	t
23	Escuela General Pedro Lagos Marchant (D-7)	esc.glagos@epchinchorro.cl	1	14	t
24	Escuela Guacoyo	esc.guacoyo@epchinchorro.cl	5	70	t
25	Escuela Humberto Valenzuela García (D-18)	esc.hvalenzuelag@epchinchorro.cl	1	15	t
26	Escuela Humapalca	esc.humapalca@epchinchorro.cl	5	65	t
27	Escuela Ignacio Carrera Pinto (G-27)	esc.icarrerap@epchinchorro.cl	1	16	t
28	Escuela Internado de Visviri	esc.visviri@epchinchorro.cl	5	66	t
29	Escuela Jorge Alessandri Rodríguez	esc.jalessandrir@epchinchorro.cl	1	18	t
30	Escuela Los Álamos	esc.murmuntani@epchinchorro.cl	4	53	t
31	Escuela Manuel Rodríguez Erdoyza (D-11)	esc.mrodrigueze@epchinchorro.cl	1	23	t
32	Escuela Molinos (G-117)	esc.molinos@epchinchorro.cl	4	24	t
33	Escuela Pampa Algodonal (G-31)	esc.palgodonal@epchinchorro.cl	3	27	t
34	Escuela Payachatas	esc.payachatas@epchinchorro.cl	5	51	t
35	Escuela Pedro Gutiérrez Torres (E-93)	esc.pgutierrezt@epchinchorro.cl	1	28	t
36	Escuela Regimiento Rancagua (D-14)	esc.regrancagua@epchinchorro.cl	1	30	t
37	Escuela República Argentina (E-1)	esc.argentina@epchinchorro.cl	1	31	t
38	Escuela República de Francia (D-6)	esc.repfrancia@epchinchorro.cl	1	32	t
39	Escuela República de Israel (D-4)	esc.israel@epchinchorro.cl	1	33	t
40	Escuela Ricardo Silva Arriagada (E-15)	esc.rsilvaarriaguda@epchinchorro.cl	1	35	t
41	Escuela Rómulo Peña Maturana (D-12)	esc.rpenam@epchinchorro.cl	1	36	t
42	Escuela San Francisco de Asís	esc.franciscodeasis@epchinchorro.cl	1	52	t
43	Escuela San Santiago de Belén	esc.belen@epchinchorro.cl	5	55	t
44	Escuela Subteniente Luis Cruz Martínez (D-16)	esc.lcruzm@epchinchorro.cl	1	37	t
45	Escuela Tucapel (D-21)	esc.tucapel@epchinchorro.cl	1	38	t
46	Escuela Valle de Camarones	esc.vallecamarones@epchinchorro.cl	6	59	t
47	Escuela Valle de Chitita	esc.chitita@epchinchorro.cl	4	62	t
48	Escuela Valle de Cobija	esc.cobija@epchinchorro.cl	5	58	t
49	Escuela Valle de Codpa	lic.codpa@epchinchorro.cl	6	57	t
50	Escuela Valle de Cuya	esc.cuya@epchinchorro.cl	6	61	t
51	Escuela Valle de Esquiña	esc.esquina@epchinchorro.cl	6	56	t
52	Escuela Valle de Guañacagua	esc.guanacagua@epchinchorro.cl	5	60	t
53	Escuela Valle de Illapata	esc.illapata@epchinchorro.cl	5	63	t
54	Escuela Valle de Parcohaylla	esc.parcohaylla@epchinchorro.cl	5	\N	t
55	Instituto Comercial de Arica	lic.comercial@epchinchorro.cl	1	17	t
56	Jardín Infantil Arcoiris	jar.arcoiris@epchinchorro.cl	1	39	t
57	Jardín Infantil Caritas de Sol	jar.caritadesol@epchinchorro.cl	1	40	t
58	Jardín Infantil Estrellitas del Saber	jar.estrellitasdelsaber@epchinchorro.cl	1	41	t
59	Jardín Infantil Inti Jalsu	jar.intijalsu@epchinchorro.cl	1	49	t
60	Jardín Infantil Mazorquita	jar.mazorquita@epchinchorro.cl	1	48	t
61	Jardín Infantil Mi Rinconcito Feliz	jar.rinconcitofeliz@epchinchorro.cl	1	42	t
62	Jardín Infantil Mis Primeros Pasos	jar.primerospasos@epchinchorro.cl	1	43	t
63	Jardín Infantil Payachatas	jar.payachatas@epchinchorro.cl	5	44	t
64	Jardín Infantil Suma Panqaritas	jar.sumapanqaritas@epchinchorro.cl	1	46	t
65	Jardín Infantil Sueños de Angelitos	jar.suenosdeangelitos@epchinchorro.cl	1	45	t
66	Jardín Infantil Uruchi Amaya	jar.uruchiamaya@epchinchorro.cl	6	47	t
67	Liceo Agrícola José Abelardo Núñez	lic.agricolajan@epchinchorro.cl	3	1	t
68	Liceo Antonio Varas de la Barra (B-4)	lic.antoniovaras@epchinchorro.cl	1	3	t
69	Liceo Artístico Doctor Juan Noé Crevani	lic.artistico@epchinchorro.cl	1	4	t
70	Liceo Bicentenario Jovina Naranjo Fernández (A-5)	lic.jovinanaranjo@epchinchorro.cl	1	20	t
71	Liceo Bicentenario Pablo Neruda	lic.pabloneruda@epchinchorro.cl	1	26	t
72	Liceo Octavio Palma Pérez (A-1)	lic.opalmaperez@epchinchorro.cl	1	25	t
73	Liceo Politécnico (A-2)	lic.politecnico@epchinchorro.cl	1	29	t
74	Liceo Técnico Profesional Granaderos de Putre	lic.putre@epchinchorro.cl	2	54	t
75	Liceo Valle de Codpa	lic.codpa@epchinchorro.cl	6	57	t
\.


--
-- TOC entry 6042 (class 0 OID 19041)
-- Dependencies: 250
-- Data for Name: jornadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jornadas (id, nombre) FROM stdin;
4	Por Hora
1	Jornada Completa (44 Hrs.)
2	Jornada Parcial (menor a 22 Hrs.)
3	Media Jornada (22 Hrs.)
5	3/4 de Jornada (33Hrs)
\.


--
-- TOC entry 6044 (class 0 OID 19047)
-- Dependencies: 252
-- Data for Name: mensajes_web; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mensajes_web (id, nombre, correo, mensaje, rut, created_at, estado) FROM stdin;
\.


--
-- TOC entry 6046 (class 0 OID 19055)
-- Dependencies: 254
-- Data for Name: modalidades_horarias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modalidades_horarias (id, nombre) FROM stdin;
1	Jornada Escolar Completa
3	Jornada Vespertina / Nocturna
4	Jornadas Especiales o Flexibles
2	Media Jornada Escolar 
\.


--
-- TOC entry 6048 (class 0 OID 19061)
-- Dependencies: 256
-- Data for Name: nacionalidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nacionalidades (id, nombre) FROM stdin;
1	Chilena
2	Argentina
3	Peruana
4	Colombiana
5	Venezolana
6	Francesa
7	Cubana
8	Dominicana
9	Española
10	Ecuatoriana
11	Brasileña
12	Haitiana
13	Boliviana
14	Italiana
15	Alemana
16	Mexicana
17	Uruguaya
18	Estadounidense
19	Británica
20	Paraguaya
21	Canadiense
22	China (minoritaria)
\.


--
-- TOC entry 6050 (class 0 OID 19065)
-- Dependencies: 258
-- Data for Name: nivel_educacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nivel_educacion (id, nombre) FROM stdin;
1	Sin estudios formales
2	Educación básica / primaria incompleta
3	Educación básica / primaria completa
4	Educación media / secundaria incompleta
5	Educación media / secundaria completa
6	Educación técnico-profesional incompleta
7	Educación técnico-profesional completa
8	Educación universitaria incompleta
9	Educación universitaria completa
10	Postgrado incompleto (Diplomado/Magíster/Doctorado)
11	Postgrado completo (Diplomado/Magíster/Doctorado)
\.


--
-- TOC entry 6052 (class 0 OID 19069)
-- Dependencies: 260
-- Data for Name: postulaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.postulaciones (id, candidato_id, convocatoria_id, created_at, estado, estado_candidato) FROM stdin;
5	2	1	2025-11-11 12:12:18.010397-03	f	1
1	1	1	2025-11-11 10:34:36.625432-03	f	3
6	1	2	2025-11-18 11:45:17.870155-03	f	1
7	5	3	2025-11-19 09:32:24.705-03	f	1
\.


--
-- TOC entry 6054 (class 0 OID 19075)
-- Dependencies: 262
-- Data for Name: regiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regiones (id, nombre) FROM stdin;
1	Arica y Parinacota
2	Tarapacá
3	Antofagasta
4	Atacama
5	Coquimbo
6	Valparaíso
7	Metropolitana de Santiago
8	Libertador General Bernardo O'Higgins
9	Maule
10	Ñuble
11	Biobío
12	La Araucanía
13	Los Ríos
14	Los Lagos
15	Aysén del General Carlos Ibáñez del Campo
16	Magallanes y de la Antártica Chilena
\.


--
-- TOC entry 6056 (class 0 OID 19079)
-- Dependencies: 264
-- Data for Name: tipo_vacantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_vacantes (id, nombre) FROM stdin;
1	Cargo Vacante
2	Reemplazo
\.


--
-- TOC entry 6058 (class 0 OID 19085)
-- Dependencies: 266
-- Data for Name: titulos_profesionales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.titulos_profesionales (id, nombre) FROM stdin;
1	Asistente Social
2	Contador Auditor
3	Educación Parvularia
4	Enfermero(a)
5	Fonoaudiólogo
6	Ingeniero Civil en Minas
7	Ingeniero Comercial
8	Ingeniero de Ejecución en Minas
9	Ingeniero en Administración de Empresas
10	Ingeniero en Computación
11	Ingeniero en Construcción
12	Ingeniero Agrónomo
13	Ingeniero en Ejecución Mecánica
14	Ingeniero en Electrónica / Electricidad
15	Ingeniero en Informática
16	Ingeniero en Mecánica
17	Ingeniero en Metalurgia
18	Ingeniero Mecánico Automotriz
19	Kinesiólogo
20	Matrona
21	Profesor de Artes Visuales
22	Profesor de Educación Diferencial
23	Profesor de Educación Física
24	Profesor de Educación General Básica
25	Profesor de Educación Media en Biología
26	Profesor de Educación Media en Física
27	Profesor de Educación Media en Inglés
28	Profesor de Educación Media en Lenguaje y Comunicación
29	Profesor de Educación Media en Matemática
30	Profesor de Educación Media en Química
31	Profesor de Historia y Ciencias Sociales
32	Profesor de Música
33	Profesor General Básico con mención en Ciencias
34	Profesor General Básico con mención en Lenguaje
35	Profesor General Básico con mención en Matemática
36	Psicólogo
37	Psicopedagogo
38	Técnico de Nivel Superior en Electricidad
39	Técnico en Administración
40	Técnico en Deportes y Recreación
41	Técnico en Conectividad y Redes
42	Técnico en Educación Especial
43	Técnico en Enfermería
44	Técnico en Gastronomía
45	Técnico en Parvularia
46	Técnico en Turismo
47	Terapeuta Ocupacional
48	Trabajador Social
49	Director de Establecimiento Educacional
50	Inspector General
51	Jefe de Unidad Técnico Pedagógica (UTP)
52	Orientador Educacional
53	Coordinador PIE
54	Especialista en Currículum
55	Especialista en Evaluación Educativa
56	Gestor Educacional
57	Administrador Educacional
58	Coordinador de Convivencia Escolar
59	Especialista en Inclusión Educativa
60	Técnico en Bibliotecología
61	Asistente de la Educación
62	Monitor Educativo
63	Coordinador de Talleres Extraescolares
64	Especialista en Tecnología Educativa
65	Coordinador de Recursos Humanos en Educación
66	Especialista en Finanzas Educacionales
67	Coordinador de Infraestructura Escolar
68	Especialista en Mantenimiento de Establecimientos Educacionales
69	Técnico en Administración Educacional
70	Técnico en Trabajo Social
71	Técnico en Psicopedagogía
72	Técnico en Integración Social
73	Técnico en Atención de Párvulos
74	Técnico en Educación Básica
75	Técnico en Recreación y Deportes
76	Abogado
77	Administrador Público
78	Arquitecto
79	Asistente Administrativo
80	Auxiliar de Servicios
81	Bibliotecólogo
82	Comunicador Social
83	Community Manager
84	Diseñador Gráfico
85	Especialista en Compras Públicas
86	Especialista en Proyectos Educativos
87	Gestor Cultural
88	Prevencionista de Riesgos
89	Programador
90	Secretario Administrativo
91	Sociólogo
92	Otro (especificar)
\.


--
-- TOC entry 6060 (class 0 OID 19089)
-- Dependencies: 268
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, usuario, password, estado, created_at, rol, uid) FROM stdin;
3	16469777-0	$2b$10$wOIdEohRaI0eNFvcrVI7ROVkhC9X4Ol24jWnkW9S0eaLDjwCbaPQG	t	2025-10-22 11:24:38.898-03	user	f53ce587-701a-4107-8218-c634b6bfdc6e
4	12607595-2	$2b$10$C8Wp1RBDPGudOIuhR4z4c.NeKgdc7p34actwkd5H44oIuDT9bKnhC	t	2025-10-22 11:25:49.464-03	user	c6bdc5e6-f535-43e8-b6c9-18693b61c319
1	16467901-2	$2b$10$Y/rwzHN.OZsOv04.p5PuduYBYCgRroMnPOCTWShRlbKCg6xDzjApi	t	2025-10-22 11:09:50.84-03	admin	ddec413c-e7c2-4191-b33e-bfd8d45086a1
2	20217385-3	$2b$10$IJedtjCGkB5w5s7ZbchskuOKbJ/BnxCjP1YODIuoVXY9zcPzMlwbu	t	2025-10-22 11:12:57.16-03	reclutador	2f0105e2-090c-4f1a-91c3-8ca57b106489
5	13637586-5	$2b$10$hYC1l.wESIqdah0fknegPOV3CxGeOmQeV5rPXGAMgnAy1/53ew16G	t	2025-11-19 09:10:47.747-03	user	a1b19978-fc63-4433-b0b6-8ee64e2aedcb
\.


--
-- TOC entry 6113 (class 0 OID 0)
-- Dependencies: 280
-- Name: Resoluciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Resoluciones_id_seq"', 1, false);


--
-- TOC entry 6114 (class 0 OID 0)
-- Dependencies: 220
-- Name: candidatos_ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.candidatos_ciudades_id_seq', 8, true);


--
-- TOC entry 6115 (class 0 OID 0)
-- Dependencies: 221
-- Name: candidatos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.candidatos_id_seq', 5, true);


--
-- TOC entry 6116 (class 0 OID 0)
-- Dependencies: 223
-- Name: candidatos_jornadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.candidatos_jornadas_id_seq', 4, true);


--
-- TOC entry 6117 (class 0 OID 0)
-- Dependencies: 225
-- Name: candidatos_modalidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.candidatos_modalidades_id_seq', 3, true);


--
-- TOC entry 6118 (class 0 OID 0)
-- Dependencies: 227
-- Name: cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cargos_id_seq', 44, true);


--
-- TOC entry 6119 (class 0 OID 0)
-- Dependencies: 272
-- Name: cartas_ofertas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cartas_ofertas_id_seq', 58, true);


--
-- TOC entry 6120 (class 0 OID 0)
-- Dependencies: 229
-- Name: categoria_cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_cargos_id_seq', 5, true);


--
-- TOC entry 6121 (class 0 OID 0)
-- Dependencies: 231
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ciudades_id_seq', 7, true);


--
-- TOC entry 6122 (class 0 OID 0)
-- Dependencies: 233
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentarios_id_seq', 1, false);


--
-- TOC entry 6123 (class 0 OID 0)
-- Dependencies: 235
-- Name: comunas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comunas_id_seq', 345, true);


--
-- TOC entry 6124 (class 0 OID 0)
-- Dependencies: 278
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contratos_id_seq', 1, false);


--
-- TOC entry 6125 (class 0 OID 0)
-- Dependencies: 237
-- Name: convocatorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.convocatorias_id_seq', 3, true);


--
-- TOC entry 6126 (class 0 OID 0)
-- Dependencies: 270
-- Name: directores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directores_id_seq', 72, true);


--
-- TOC entry 6127 (class 0 OID 0)
-- Dependencies: 240
-- Name: documentos_candidatos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documentos_candidatos_id_seq', 9, true);


--
-- TOC entry 6128 (class 0 OID 0)
-- Dependencies: 241
-- Name: documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documentos_id_seq', 17, true);


--
-- TOC entry 6129 (class 0 OID 0)
-- Dependencies: 243
-- Name: estado_candidatos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_candidatos_id_seq', 4, true);


--
-- TOC entry 6130 (class 0 OID 0)
-- Dependencies: 274
-- Name: estado_carta_oferta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_carta_oferta_id_seq', 5, true);


--
-- TOC entry 6131 (class 0 OID 0)
-- Dependencies: 245
-- Name: estado_convocatoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_convocatoria_id_seq', 5, true);


--
-- TOC entry 6132 (class 0 OID 0)
-- Dependencies: 247
-- Name: estados_civiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_civiles_id_seq', 4, true);


--
-- TOC entry 6133 (class 0 OID 0)
-- Dependencies: 276
-- Name: firmantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firmantes_id_seq', 2, true);


--
-- TOC entry 6134 (class 0 OID 0)
-- Dependencies: 249
-- Name: instituciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instituciones_id_seq', 1, true);


--
-- TOC entry 6135 (class 0 OID 0)
-- Dependencies: 251
-- Name: jornadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jornadas_id_seq', 5, true);


--
-- TOC entry 6136 (class 0 OID 0)
-- Dependencies: 253
-- Name: mensajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensajes_id_seq', 1, false);


--
-- TOC entry 6137 (class 0 OID 0)
-- Dependencies: 255
-- Name: modalidades_horarias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modalidades_horarias_id_seq', 4, true);


--
-- TOC entry 6138 (class 0 OID 0)
-- Dependencies: 257
-- Name: nacionalidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nacionalidades_id_seq', 22, true);


--
-- TOC entry 6139 (class 0 OID 0)
-- Dependencies: 259
-- Name: nivel_educacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nivel_educacion_id_seq', 11, true);


--
-- TOC entry 6140 (class 0 OID 0)
-- Dependencies: 261
-- Name: postulaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.postulaciones_id_seq', 7, true);


--
-- TOC entry 6141 (class 0 OID 0)
-- Dependencies: 263
-- Name: regiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regiones_id_seq', 16, true);


--
-- TOC entry 6142 (class 0 OID 0)
-- Dependencies: 265
-- Name: tipo_vacante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_vacante_id_seq', 2, true);


--
-- TOC entry 6143 (class 0 OID 0)
-- Dependencies: 267
-- Name: titulos_profesionales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.titulos_profesionales_id_seq', 92, true);


--
-- TOC entry 6144 (class 0 OID 0)
-- Dependencies: 269
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 5, true);


--
-- TOC entry 5824 (class 2606 OID 45061)
-- Name: Resoluciones Resoluciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Resoluciones"
    ADD CONSTRAINT "Resoluciones_pkey" PRIMARY KEY (id);


--
-- TOC entry 4957 (class 2606 OID 19123)
-- Name: candidatos_cargos candidatos_cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_cargos
    ADD CONSTRAINT candidatos_cargos_pkey PRIMARY KEY (candidato_id, cargo_id);


--
-- TOC entry 4959 (class 2606 OID 19125)
-- Name: candidatos_ciudades candidatos_ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_ciudades
    ADD CONSTRAINT candidatos_ciudades_pkey PRIMARY KEY (id);


--
-- TOC entry 4948 (class 2606 OID 19127)
-- Name: candidatos candidatos_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos
    ADD CONSTRAINT candidatos_correo_key UNIQUE (correo);


--
-- TOC entry 4961 (class 2606 OID 19129)
-- Name: candidatos_jornadas candidatos_jornadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_jornadas
    ADD CONSTRAINT candidatos_jornadas_pkey PRIMARY KEY (id);


--
-- TOC entry 4963 (class 2606 OID 19131)
-- Name: candidatos_modalidades candidatos_modalidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_modalidades
    ADD CONSTRAINT candidatos_modalidades_pkey PRIMARY KEY (id);


--
-- TOC entry 4950 (class 2606 OID 19133)
-- Name: candidatos candidatos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos
    ADD CONSTRAINT candidatos_pkey PRIMARY KEY (id);


--
-- TOC entry 4952 (class 2606 OID 19135)
-- Name: candidatos candidatos_rut_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos
    ADD CONSTRAINT candidatos_rut_key UNIQUE (rut);


--
-- TOC entry 4965 (class 2606 OID 19137)
-- Name: cargos cargos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_nombre_key UNIQUE (nombre);


--
-- TOC entry 4967 (class 2606 OID 19139)
-- Name: cargos cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (id);


--
-- TOC entry 5816 (class 2606 OID 20409)
-- Name: cartas_ofertas cartas_ofertas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartas_ofertas
    ADD CONSTRAINT cartas_ofertas_pkey PRIMARY KEY (id);


--
-- TOC entry 4969 (class 2606 OID 19141)
-- Name: categoria_cargos categoria_cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_cargos
    ADD CONSTRAINT categoria_cargos_pkey PRIMARY KEY (id);


--
-- TOC entry 4971 (class 2606 OID 19143)
-- Name: ciudades ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (id);


--
-- TOC entry 4973 (class 2606 OID 19145)
-- Name: comentarios comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4975 (class 2606 OID 19147)
-- Name: comunas comunas_nombre_region_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunas
    ADD CONSTRAINT comunas_nombre_region_id_key UNIQUE (nombre, region_id);


--
-- TOC entry 4977 (class 2606 OID 19149)
-- Name: comunas comunas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunas
    ADD CONSTRAINT comunas_pkey PRIMARY KEY (id);


--
-- TOC entry 5822 (class 2606 OID 45054)
-- Name: contratos contratos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contratos
    ADD CONSTRAINT contratos_pkey PRIMARY KEY (id);


--
-- TOC entry 4980 (class 2606 OID 19151)
-- Name: convocatorias convocatorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatorias
    ADD CONSTRAINT convocatorias_pkey PRIMARY KEY (id);


--
-- TOC entry 5814 (class 2606 OID 20130)
-- Name: directores directores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directores
    ADD CONSTRAINT directores_pkey PRIMARY KEY (id);


--
-- TOC entry 5072 (class 2606 OID 19153)
-- Name: documentos_candidatos documentos_candidatos_documento_id_candidato_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_candidatos
    ADD CONSTRAINT documentos_candidatos_documento_id_candidato_id_key UNIQUE (documento_id, candidato_id);


--
-- TOC entry 5074 (class 2606 OID 19155)
-- Name: documentos_candidatos documentos_candidatos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_candidatos
    ADD CONSTRAINT documentos_candidatos_pkey PRIMARY KEY (id);


--
-- TOC entry 4982 (class 2606 OID 19157)
-- Name: documentos documentos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key UNIQUE (nombre);


--
-- TOC entry 4984 (class 2606 OID 19159)
-- Name: documentos documentos_nombre_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key1 UNIQUE (nombre);


--
-- TOC entry 4986 (class 2606 OID 19161)
-- Name: documentos documentos_nombre_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key10 UNIQUE (nombre);


--
-- TOC entry 4988 (class 2606 OID 19163)
-- Name: documentos documentos_nombre_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key11 UNIQUE (nombre);


--
-- TOC entry 4990 (class 2606 OID 19165)
-- Name: documentos documentos_nombre_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key12 UNIQUE (nombre);


--
-- TOC entry 4992 (class 2606 OID 19167)
-- Name: documentos documentos_nombre_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key13 UNIQUE (nombre);


--
-- TOC entry 4994 (class 2606 OID 19169)
-- Name: documentos documentos_nombre_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key14 UNIQUE (nombre);


--
-- TOC entry 4996 (class 2606 OID 19171)
-- Name: documentos documentos_nombre_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key15 UNIQUE (nombre);


--
-- TOC entry 4998 (class 2606 OID 19173)
-- Name: documentos documentos_nombre_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key16 UNIQUE (nombre);


--
-- TOC entry 5000 (class 2606 OID 19175)
-- Name: documentos documentos_nombre_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key17 UNIQUE (nombre);


--
-- TOC entry 5002 (class 2606 OID 19177)
-- Name: documentos documentos_nombre_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key18 UNIQUE (nombre);


--
-- TOC entry 5004 (class 2606 OID 19179)
-- Name: documentos documentos_nombre_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key19 UNIQUE (nombre);


--
-- TOC entry 5006 (class 2606 OID 19181)
-- Name: documentos documentos_nombre_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key2 UNIQUE (nombre);


--
-- TOC entry 5008 (class 2606 OID 19183)
-- Name: documentos documentos_nombre_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key20 UNIQUE (nombre);


--
-- TOC entry 5010 (class 2606 OID 19185)
-- Name: documentos documentos_nombre_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key21 UNIQUE (nombre);


--
-- TOC entry 5012 (class 2606 OID 19187)
-- Name: documentos documentos_nombre_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key22 UNIQUE (nombre);


--
-- TOC entry 5014 (class 2606 OID 19189)
-- Name: documentos documentos_nombre_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key23 UNIQUE (nombre);


--
-- TOC entry 5016 (class 2606 OID 19191)
-- Name: documentos documentos_nombre_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key24 UNIQUE (nombre);


--
-- TOC entry 5018 (class 2606 OID 19193)
-- Name: documentos documentos_nombre_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key25 UNIQUE (nombre);


--
-- TOC entry 5020 (class 2606 OID 19195)
-- Name: documentos documentos_nombre_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key26 UNIQUE (nombre);


--
-- TOC entry 5022 (class 2606 OID 19197)
-- Name: documentos documentos_nombre_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key27 UNIQUE (nombre);


--
-- TOC entry 5024 (class 2606 OID 19199)
-- Name: documentos documentos_nombre_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key28 UNIQUE (nombre);


--
-- TOC entry 5026 (class 2606 OID 19201)
-- Name: documentos documentos_nombre_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key29 UNIQUE (nombre);


--
-- TOC entry 5028 (class 2606 OID 19203)
-- Name: documentos documentos_nombre_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key3 UNIQUE (nombre);


--
-- TOC entry 5030 (class 2606 OID 19205)
-- Name: documentos documentos_nombre_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key30 UNIQUE (nombre);


--
-- TOC entry 5032 (class 2606 OID 19207)
-- Name: documentos documentos_nombre_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key31 UNIQUE (nombre);


--
-- TOC entry 5034 (class 2606 OID 19209)
-- Name: documentos documentos_nombre_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key32 UNIQUE (nombre);


--
-- TOC entry 5036 (class 2606 OID 19211)
-- Name: documentos documentos_nombre_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key33 UNIQUE (nombre);


--
-- TOC entry 5038 (class 2606 OID 19213)
-- Name: documentos documentos_nombre_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key34 UNIQUE (nombre);


--
-- TOC entry 5040 (class 2606 OID 19215)
-- Name: documentos documentos_nombre_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key35 UNIQUE (nombre);


--
-- TOC entry 5042 (class 2606 OID 19217)
-- Name: documentos documentos_nombre_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key36 UNIQUE (nombre);


--
-- TOC entry 5044 (class 2606 OID 19219)
-- Name: documentos documentos_nombre_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key37 UNIQUE (nombre);


--
-- TOC entry 5046 (class 2606 OID 19221)
-- Name: documentos documentos_nombre_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key38 UNIQUE (nombre);


--
-- TOC entry 5048 (class 2606 OID 19223)
-- Name: documentos documentos_nombre_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key39 UNIQUE (nombre);


--
-- TOC entry 5050 (class 2606 OID 19225)
-- Name: documentos documentos_nombre_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key4 UNIQUE (nombre);


--
-- TOC entry 5052 (class 2606 OID 19227)
-- Name: documentos documentos_nombre_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key40 UNIQUE (nombre);


--
-- TOC entry 5054 (class 2606 OID 19229)
-- Name: documentos documentos_nombre_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key41 UNIQUE (nombre);


--
-- TOC entry 5056 (class 2606 OID 19231)
-- Name: documentos documentos_nombre_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key42 UNIQUE (nombre);


--
-- TOC entry 5058 (class 2606 OID 19233)
-- Name: documentos documentos_nombre_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key43 UNIQUE (nombre);


--
-- TOC entry 5060 (class 2606 OID 19235)
-- Name: documentos documentos_nombre_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key5 UNIQUE (nombre);


--
-- TOC entry 5062 (class 2606 OID 19237)
-- Name: documentos documentos_nombre_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key6 UNIQUE (nombre);


--
-- TOC entry 5064 (class 2606 OID 19239)
-- Name: documentos documentos_nombre_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key7 UNIQUE (nombre);


--
-- TOC entry 5066 (class 2606 OID 19241)
-- Name: documentos documentos_nombre_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key8 UNIQUE (nombre);


--
-- TOC entry 5068 (class 2606 OID 19243)
-- Name: documentos documentos_nombre_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_nombre_key9 UNIQUE (nombre);


--
-- TOC entry 5070 (class 2606 OID 19245)
-- Name: documentos documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_pkey PRIMARY KEY (id);


--
-- TOC entry 5076 (class 2606 OID 19247)
-- Name: estado_candidatos estado_candidatos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key UNIQUE (nombre);


--
-- TOC entry 5078 (class 2606 OID 19249)
-- Name: estado_candidatos estado_candidatos_nombre_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key1 UNIQUE (nombre);


--
-- TOC entry 5080 (class 2606 OID 19251)
-- Name: estado_candidatos estado_candidatos_nombre_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key10 UNIQUE (nombre);


--
-- TOC entry 5082 (class 2606 OID 19253)
-- Name: estado_candidatos estado_candidatos_nombre_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key11 UNIQUE (nombre);


--
-- TOC entry 5084 (class 2606 OID 19255)
-- Name: estado_candidatos estado_candidatos_nombre_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key12 UNIQUE (nombre);


--
-- TOC entry 5086 (class 2606 OID 19257)
-- Name: estado_candidatos estado_candidatos_nombre_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key13 UNIQUE (nombre);


--
-- TOC entry 5088 (class 2606 OID 19259)
-- Name: estado_candidatos estado_candidatos_nombre_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key14 UNIQUE (nombre);


--
-- TOC entry 5090 (class 2606 OID 19261)
-- Name: estado_candidatos estado_candidatos_nombre_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key15 UNIQUE (nombre);


--
-- TOC entry 5092 (class 2606 OID 19263)
-- Name: estado_candidatos estado_candidatos_nombre_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key16 UNIQUE (nombre);


--
-- TOC entry 5094 (class 2606 OID 19265)
-- Name: estado_candidatos estado_candidatos_nombre_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key17 UNIQUE (nombre);


--
-- TOC entry 5096 (class 2606 OID 19267)
-- Name: estado_candidatos estado_candidatos_nombre_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key18 UNIQUE (nombre);


--
-- TOC entry 5098 (class 2606 OID 19269)
-- Name: estado_candidatos estado_candidatos_nombre_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key19 UNIQUE (nombre);


--
-- TOC entry 5100 (class 2606 OID 19271)
-- Name: estado_candidatos estado_candidatos_nombre_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key2 UNIQUE (nombre);


--
-- TOC entry 5102 (class 2606 OID 19273)
-- Name: estado_candidatos estado_candidatos_nombre_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key20 UNIQUE (nombre);


--
-- TOC entry 5104 (class 2606 OID 19275)
-- Name: estado_candidatos estado_candidatos_nombre_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key21 UNIQUE (nombre);


--
-- TOC entry 5106 (class 2606 OID 19277)
-- Name: estado_candidatos estado_candidatos_nombre_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key22 UNIQUE (nombre);


--
-- TOC entry 5108 (class 2606 OID 19279)
-- Name: estado_candidatos estado_candidatos_nombre_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key23 UNIQUE (nombre);


--
-- TOC entry 5110 (class 2606 OID 19281)
-- Name: estado_candidatos estado_candidatos_nombre_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key24 UNIQUE (nombre);


--
-- TOC entry 5112 (class 2606 OID 19283)
-- Name: estado_candidatos estado_candidatos_nombre_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key25 UNIQUE (nombre);


--
-- TOC entry 5114 (class 2606 OID 19285)
-- Name: estado_candidatos estado_candidatos_nombre_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key26 UNIQUE (nombre);


--
-- TOC entry 5116 (class 2606 OID 19287)
-- Name: estado_candidatos estado_candidatos_nombre_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key27 UNIQUE (nombre);


--
-- TOC entry 5118 (class 2606 OID 19289)
-- Name: estado_candidatos estado_candidatos_nombre_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key28 UNIQUE (nombre);


--
-- TOC entry 5120 (class 2606 OID 19291)
-- Name: estado_candidatos estado_candidatos_nombre_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key29 UNIQUE (nombre);


--
-- TOC entry 5122 (class 2606 OID 19293)
-- Name: estado_candidatos estado_candidatos_nombre_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key3 UNIQUE (nombre);


--
-- TOC entry 5124 (class 2606 OID 19295)
-- Name: estado_candidatos estado_candidatos_nombre_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key30 UNIQUE (nombre);


--
-- TOC entry 5126 (class 2606 OID 19297)
-- Name: estado_candidatos estado_candidatos_nombre_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key31 UNIQUE (nombre);


--
-- TOC entry 5128 (class 2606 OID 19299)
-- Name: estado_candidatos estado_candidatos_nombre_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key32 UNIQUE (nombre);


--
-- TOC entry 5130 (class 2606 OID 19301)
-- Name: estado_candidatos estado_candidatos_nombre_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key33 UNIQUE (nombre);


--
-- TOC entry 5132 (class 2606 OID 19303)
-- Name: estado_candidatos estado_candidatos_nombre_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key34 UNIQUE (nombre);


--
-- TOC entry 5134 (class 2606 OID 19305)
-- Name: estado_candidatos estado_candidatos_nombre_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key35 UNIQUE (nombre);


--
-- TOC entry 5136 (class 2606 OID 19307)
-- Name: estado_candidatos estado_candidatos_nombre_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key36 UNIQUE (nombre);


--
-- TOC entry 5138 (class 2606 OID 19309)
-- Name: estado_candidatos estado_candidatos_nombre_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key37 UNIQUE (nombre);


--
-- TOC entry 5140 (class 2606 OID 19311)
-- Name: estado_candidatos estado_candidatos_nombre_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key38 UNIQUE (nombre);


--
-- TOC entry 5142 (class 2606 OID 19313)
-- Name: estado_candidatos estado_candidatos_nombre_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key39 UNIQUE (nombre);


--
-- TOC entry 5144 (class 2606 OID 19315)
-- Name: estado_candidatos estado_candidatos_nombre_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key4 UNIQUE (nombre);


--
-- TOC entry 5146 (class 2606 OID 19317)
-- Name: estado_candidatos estado_candidatos_nombre_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key40 UNIQUE (nombre);


--
-- TOC entry 5148 (class 2606 OID 19319)
-- Name: estado_candidatos estado_candidatos_nombre_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key41 UNIQUE (nombre);


--
-- TOC entry 5150 (class 2606 OID 19321)
-- Name: estado_candidatos estado_candidatos_nombre_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key42 UNIQUE (nombre);


--
-- TOC entry 5152 (class 2606 OID 19323)
-- Name: estado_candidatos estado_candidatos_nombre_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key43 UNIQUE (nombre);


--
-- TOC entry 5154 (class 2606 OID 19325)
-- Name: estado_candidatos estado_candidatos_nombre_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key44 UNIQUE (nombre);


--
-- TOC entry 5156 (class 2606 OID 19327)
-- Name: estado_candidatos estado_candidatos_nombre_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key45 UNIQUE (nombre);


--
-- TOC entry 5158 (class 2606 OID 19329)
-- Name: estado_candidatos estado_candidatos_nombre_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key46 UNIQUE (nombre);


--
-- TOC entry 5160 (class 2606 OID 19331)
-- Name: estado_candidatos estado_candidatos_nombre_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key47 UNIQUE (nombre);


--
-- TOC entry 5162 (class 2606 OID 19333)
-- Name: estado_candidatos estado_candidatos_nombre_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key48 UNIQUE (nombre);


--
-- TOC entry 5164 (class 2606 OID 19335)
-- Name: estado_candidatos estado_candidatos_nombre_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key49 UNIQUE (nombre);


--
-- TOC entry 5166 (class 2606 OID 19337)
-- Name: estado_candidatos estado_candidatos_nombre_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key5 UNIQUE (nombre);


--
-- TOC entry 5168 (class 2606 OID 19339)
-- Name: estado_candidatos estado_candidatos_nombre_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key50 UNIQUE (nombre);


--
-- TOC entry 5170 (class 2606 OID 19341)
-- Name: estado_candidatos estado_candidatos_nombre_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key51 UNIQUE (nombre);


--
-- TOC entry 5172 (class 2606 OID 19343)
-- Name: estado_candidatos estado_candidatos_nombre_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key52 UNIQUE (nombre);


--
-- TOC entry 5174 (class 2606 OID 19345)
-- Name: estado_candidatos estado_candidatos_nombre_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key53 UNIQUE (nombre);


--
-- TOC entry 5176 (class 2606 OID 19347)
-- Name: estado_candidatos estado_candidatos_nombre_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key54 UNIQUE (nombre);


--
-- TOC entry 5178 (class 2606 OID 19349)
-- Name: estado_candidatos estado_candidatos_nombre_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key55 UNIQUE (nombre);


--
-- TOC entry 5180 (class 2606 OID 19351)
-- Name: estado_candidatos estado_candidatos_nombre_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key56 UNIQUE (nombre);


--
-- TOC entry 5182 (class 2606 OID 19353)
-- Name: estado_candidatos estado_candidatos_nombre_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key57 UNIQUE (nombre);


--
-- TOC entry 5184 (class 2606 OID 19355)
-- Name: estado_candidatos estado_candidatos_nombre_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key58 UNIQUE (nombre);


--
-- TOC entry 5186 (class 2606 OID 19357)
-- Name: estado_candidatos estado_candidatos_nombre_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key59 UNIQUE (nombre);


--
-- TOC entry 5188 (class 2606 OID 19359)
-- Name: estado_candidatos estado_candidatos_nombre_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key6 UNIQUE (nombre);


--
-- TOC entry 5190 (class 2606 OID 19361)
-- Name: estado_candidatos estado_candidatos_nombre_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key60 UNIQUE (nombre);


--
-- TOC entry 5192 (class 2606 OID 19363)
-- Name: estado_candidatos estado_candidatos_nombre_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key61 UNIQUE (nombre);


--
-- TOC entry 5194 (class 2606 OID 19365)
-- Name: estado_candidatos estado_candidatos_nombre_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key62 UNIQUE (nombre);


--
-- TOC entry 5196 (class 2606 OID 19367)
-- Name: estado_candidatos estado_candidatos_nombre_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key63 UNIQUE (nombre);


--
-- TOC entry 5198 (class 2606 OID 19369)
-- Name: estado_candidatos estado_candidatos_nombre_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key64 UNIQUE (nombre);


--
-- TOC entry 5200 (class 2606 OID 19371)
-- Name: estado_candidatos estado_candidatos_nombre_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key65 UNIQUE (nombre);


--
-- TOC entry 5202 (class 2606 OID 19373)
-- Name: estado_candidatos estado_candidatos_nombre_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key66 UNIQUE (nombre);


--
-- TOC entry 5204 (class 2606 OID 19375)
-- Name: estado_candidatos estado_candidatos_nombre_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key67 UNIQUE (nombre);


--
-- TOC entry 5206 (class 2606 OID 19377)
-- Name: estado_candidatos estado_candidatos_nombre_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key68 UNIQUE (nombre);


--
-- TOC entry 5208 (class 2606 OID 19379)
-- Name: estado_candidatos estado_candidatos_nombre_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key69 UNIQUE (nombre);


--
-- TOC entry 5210 (class 2606 OID 19381)
-- Name: estado_candidatos estado_candidatos_nombre_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key7 UNIQUE (nombre);


--
-- TOC entry 5212 (class 2606 OID 19383)
-- Name: estado_candidatos estado_candidatos_nombre_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key70 UNIQUE (nombre);


--
-- TOC entry 5214 (class 2606 OID 19385)
-- Name: estado_candidatos estado_candidatos_nombre_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key8 UNIQUE (nombre);


--
-- TOC entry 5216 (class 2606 OID 19387)
-- Name: estado_candidatos estado_candidatos_nombre_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_nombre_key9 UNIQUE (nombre);


--
-- TOC entry 5218 (class 2606 OID 19389)
-- Name: estado_candidatos estado_candidatos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_candidatos
    ADD CONSTRAINT estado_candidatos_pkey PRIMARY KEY (id);


--
-- TOC entry 5818 (class 2606 OID 20449)
-- Name: estado_carta_oferta estado_carta_oferta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_carta_oferta
    ADD CONSTRAINT estado_carta_oferta_pkey PRIMARY KEY (id);


--
-- TOC entry 5220 (class 2606 OID 19391)
-- Name: estado_convocatoria estado_convocatoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_convocatoria
    ADD CONSTRAINT estado_convocatoria_pkey PRIMARY KEY (id);


--
-- TOC entry 5222 (class 2606 OID 19393)
-- Name: estados_civiles estados_civiles_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key UNIQUE (nombre);


--
-- TOC entry 5224 (class 2606 OID 19395)
-- Name: estados_civiles estados_civiles_nombre_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key1 UNIQUE (nombre);


--
-- TOC entry 5226 (class 2606 OID 19397)
-- Name: estados_civiles estados_civiles_nombre_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key10 UNIQUE (nombre);


--
-- TOC entry 5228 (class 2606 OID 19399)
-- Name: estados_civiles estados_civiles_nombre_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key11 UNIQUE (nombre);


--
-- TOC entry 5230 (class 2606 OID 19401)
-- Name: estados_civiles estados_civiles_nombre_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key12 UNIQUE (nombre);


--
-- TOC entry 5232 (class 2606 OID 19403)
-- Name: estados_civiles estados_civiles_nombre_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key13 UNIQUE (nombre);


--
-- TOC entry 5234 (class 2606 OID 19405)
-- Name: estados_civiles estados_civiles_nombre_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key14 UNIQUE (nombre);


--
-- TOC entry 5236 (class 2606 OID 19407)
-- Name: estados_civiles estados_civiles_nombre_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key15 UNIQUE (nombre);


--
-- TOC entry 5238 (class 2606 OID 19409)
-- Name: estados_civiles estados_civiles_nombre_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key16 UNIQUE (nombre);


--
-- TOC entry 5240 (class 2606 OID 19411)
-- Name: estados_civiles estados_civiles_nombre_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key17 UNIQUE (nombre);


--
-- TOC entry 5242 (class 2606 OID 19413)
-- Name: estados_civiles estados_civiles_nombre_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key18 UNIQUE (nombre);


--
-- TOC entry 5244 (class 2606 OID 19415)
-- Name: estados_civiles estados_civiles_nombre_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key19 UNIQUE (nombre);


--
-- TOC entry 5246 (class 2606 OID 19417)
-- Name: estados_civiles estados_civiles_nombre_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key2 UNIQUE (nombre);


--
-- TOC entry 5248 (class 2606 OID 19419)
-- Name: estados_civiles estados_civiles_nombre_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key20 UNIQUE (nombre);


--
-- TOC entry 5250 (class 2606 OID 19421)
-- Name: estados_civiles estados_civiles_nombre_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key21 UNIQUE (nombre);


--
-- TOC entry 5252 (class 2606 OID 19423)
-- Name: estados_civiles estados_civiles_nombre_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key22 UNIQUE (nombre);


--
-- TOC entry 5254 (class 2606 OID 19425)
-- Name: estados_civiles estados_civiles_nombre_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key23 UNIQUE (nombre);


--
-- TOC entry 5256 (class 2606 OID 19427)
-- Name: estados_civiles estados_civiles_nombre_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key24 UNIQUE (nombre);


--
-- TOC entry 5258 (class 2606 OID 19429)
-- Name: estados_civiles estados_civiles_nombre_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key25 UNIQUE (nombre);


--
-- TOC entry 5260 (class 2606 OID 19431)
-- Name: estados_civiles estados_civiles_nombre_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key26 UNIQUE (nombre);


--
-- TOC entry 5262 (class 2606 OID 19433)
-- Name: estados_civiles estados_civiles_nombre_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key27 UNIQUE (nombre);


--
-- TOC entry 5264 (class 2606 OID 19435)
-- Name: estados_civiles estados_civiles_nombre_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key28 UNIQUE (nombre);


--
-- TOC entry 5266 (class 2606 OID 19437)
-- Name: estados_civiles estados_civiles_nombre_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key29 UNIQUE (nombre);


--
-- TOC entry 5268 (class 2606 OID 19439)
-- Name: estados_civiles estados_civiles_nombre_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key3 UNIQUE (nombre);


--
-- TOC entry 5270 (class 2606 OID 19441)
-- Name: estados_civiles estados_civiles_nombre_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key30 UNIQUE (nombre);


--
-- TOC entry 5272 (class 2606 OID 19443)
-- Name: estados_civiles estados_civiles_nombre_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key31 UNIQUE (nombre);


--
-- TOC entry 5274 (class 2606 OID 19445)
-- Name: estados_civiles estados_civiles_nombre_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key32 UNIQUE (nombre);


--
-- TOC entry 5276 (class 2606 OID 19447)
-- Name: estados_civiles estados_civiles_nombre_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key33 UNIQUE (nombre);


--
-- TOC entry 5278 (class 2606 OID 19449)
-- Name: estados_civiles estados_civiles_nombre_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key34 UNIQUE (nombre);


--
-- TOC entry 5280 (class 2606 OID 19451)
-- Name: estados_civiles estados_civiles_nombre_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key35 UNIQUE (nombre);


--
-- TOC entry 5282 (class 2606 OID 19453)
-- Name: estados_civiles estados_civiles_nombre_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key36 UNIQUE (nombre);


--
-- TOC entry 5284 (class 2606 OID 19455)
-- Name: estados_civiles estados_civiles_nombre_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key37 UNIQUE (nombre);


--
-- TOC entry 5286 (class 2606 OID 19457)
-- Name: estados_civiles estados_civiles_nombre_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key38 UNIQUE (nombre);


--
-- TOC entry 5288 (class 2606 OID 19459)
-- Name: estados_civiles estados_civiles_nombre_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key39 UNIQUE (nombre);


--
-- TOC entry 5290 (class 2606 OID 19461)
-- Name: estados_civiles estados_civiles_nombre_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key4 UNIQUE (nombre);


--
-- TOC entry 5292 (class 2606 OID 19463)
-- Name: estados_civiles estados_civiles_nombre_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key40 UNIQUE (nombre);


--
-- TOC entry 5294 (class 2606 OID 19465)
-- Name: estados_civiles estados_civiles_nombre_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key41 UNIQUE (nombre);


--
-- TOC entry 5296 (class 2606 OID 19467)
-- Name: estados_civiles estados_civiles_nombre_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key42 UNIQUE (nombre);


--
-- TOC entry 5298 (class 2606 OID 19469)
-- Name: estados_civiles estados_civiles_nombre_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key43 UNIQUE (nombre);


--
-- TOC entry 5300 (class 2606 OID 19471)
-- Name: estados_civiles estados_civiles_nombre_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key44 UNIQUE (nombre);


--
-- TOC entry 5302 (class 2606 OID 19473)
-- Name: estados_civiles estados_civiles_nombre_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key45 UNIQUE (nombre);


--
-- TOC entry 5304 (class 2606 OID 19475)
-- Name: estados_civiles estados_civiles_nombre_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key46 UNIQUE (nombre);


--
-- TOC entry 5306 (class 2606 OID 19477)
-- Name: estados_civiles estados_civiles_nombre_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key47 UNIQUE (nombre);


--
-- TOC entry 5308 (class 2606 OID 19479)
-- Name: estados_civiles estados_civiles_nombre_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key48 UNIQUE (nombre);


--
-- TOC entry 5310 (class 2606 OID 19481)
-- Name: estados_civiles estados_civiles_nombre_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key49 UNIQUE (nombre);


--
-- TOC entry 5312 (class 2606 OID 19483)
-- Name: estados_civiles estados_civiles_nombre_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key5 UNIQUE (nombre);


--
-- TOC entry 5314 (class 2606 OID 19485)
-- Name: estados_civiles estados_civiles_nombre_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key50 UNIQUE (nombre);


--
-- TOC entry 5316 (class 2606 OID 19487)
-- Name: estados_civiles estados_civiles_nombre_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key51 UNIQUE (nombre);


--
-- TOC entry 5318 (class 2606 OID 19489)
-- Name: estados_civiles estados_civiles_nombre_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key52 UNIQUE (nombre);


--
-- TOC entry 5320 (class 2606 OID 19491)
-- Name: estados_civiles estados_civiles_nombre_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key53 UNIQUE (nombre);


--
-- TOC entry 5322 (class 2606 OID 19493)
-- Name: estados_civiles estados_civiles_nombre_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key54 UNIQUE (nombre);


--
-- TOC entry 5324 (class 2606 OID 19495)
-- Name: estados_civiles estados_civiles_nombre_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key55 UNIQUE (nombre);


--
-- TOC entry 5326 (class 2606 OID 19497)
-- Name: estados_civiles estados_civiles_nombre_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key56 UNIQUE (nombre);


--
-- TOC entry 5328 (class 2606 OID 19499)
-- Name: estados_civiles estados_civiles_nombre_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key57 UNIQUE (nombre);


--
-- TOC entry 5330 (class 2606 OID 19501)
-- Name: estados_civiles estados_civiles_nombre_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key58 UNIQUE (nombre);


--
-- TOC entry 5332 (class 2606 OID 19503)
-- Name: estados_civiles estados_civiles_nombre_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key59 UNIQUE (nombre);


--
-- TOC entry 5334 (class 2606 OID 19505)
-- Name: estados_civiles estados_civiles_nombre_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key6 UNIQUE (nombre);


--
-- TOC entry 5336 (class 2606 OID 19507)
-- Name: estados_civiles estados_civiles_nombre_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key60 UNIQUE (nombre);


--
-- TOC entry 5338 (class 2606 OID 19509)
-- Name: estados_civiles estados_civiles_nombre_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key61 UNIQUE (nombre);


--
-- TOC entry 5340 (class 2606 OID 19511)
-- Name: estados_civiles estados_civiles_nombre_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key62 UNIQUE (nombre);


--
-- TOC entry 5342 (class 2606 OID 19513)
-- Name: estados_civiles estados_civiles_nombre_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key63 UNIQUE (nombre);


--
-- TOC entry 5344 (class 2606 OID 19515)
-- Name: estados_civiles estados_civiles_nombre_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key64 UNIQUE (nombre);


--
-- TOC entry 5346 (class 2606 OID 19517)
-- Name: estados_civiles estados_civiles_nombre_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key65 UNIQUE (nombre);


--
-- TOC entry 5348 (class 2606 OID 19519)
-- Name: estados_civiles estados_civiles_nombre_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key66 UNIQUE (nombre);


--
-- TOC entry 5350 (class 2606 OID 19521)
-- Name: estados_civiles estados_civiles_nombre_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key67 UNIQUE (nombre);


--
-- TOC entry 5352 (class 2606 OID 19523)
-- Name: estados_civiles estados_civiles_nombre_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key68 UNIQUE (nombre);


--
-- TOC entry 5354 (class 2606 OID 19525)
-- Name: estados_civiles estados_civiles_nombre_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key69 UNIQUE (nombre);


--
-- TOC entry 5356 (class 2606 OID 19527)
-- Name: estados_civiles estados_civiles_nombre_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key7 UNIQUE (nombre);


--
-- TOC entry 5358 (class 2606 OID 19529)
-- Name: estados_civiles estados_civiles_nombre_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key70 UNIQUE (nombre);


--
-- TOC entry 5360 (class 2606 OID 19531)
-- Name: estados_civiles estados_civiles_nombre_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key8 UNIQUE (nombre);


--
-- TOC entry 5362 (class 2606 OID 19533)
-- Name: estados_civiles estados_civiles_nombre_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_nombre_key9 UNIQUE (nombre);


--
-- TOC entry 5364 (class 2606 OID 19535)
-- Name: estados_civiles estados_civiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_civiles
    ADD CONSTRAINT estados_civiles_pkey PRIMARY KEY (id);


--
-- TOC entry 5820 (class 2606 OID 20480)
-- Name: firmantes firmantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firmantes
    ADD CONSTRAINT firmantes_pkey PRIMARY KEY (id);


--
-- TOC entry 5366 (class 2606 OID 19537)
-- Name: instituciones instituciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituciones
    ADD CONSTRAINT instituciones_pkey PRIMARY KEY (id);


--
-- TOC entry 5368 (class 2606 OID 19539)
-- Name: jornadas jornadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jornadas
    ADD CONSTRAINT jornadas_pkey PRIMARY KEY (id);


--
-- TOC entry 5370 (class 2606 OID 19541)
-- Name: mensajes_web mensajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes_web
    ADD CONSTRAINT mensajes_pkey PRIMARY KEY (id);


--
-- TOC entry 5372 (class 2606 OID 19543)
-- Name: modalidades_horarias modalidades_horarias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modalidades_horarias
    ADD CONSTRAINT modalidades_horarias_pkey PRIMARY KEY (id);


--
-- TOC entry 5374 (class 2606 OID 19545)
-- Name: nacionalidades nacionalidades_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key UNIQUE (nombre);


--
-- TOC entry 5376 (class 2606 OID 19547)
-- Name: nacionalidades nacionalidades_nombre_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key1 UNIQUE (nombre);


--
-- TOC entry 5378 (class 2606 OID 19549)
-- Name: nacionalidades nacionalidades_nombre_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key10 UNIQUE (nombre);


--
-- TOC entry 5380 (class 2606 OID 19551)
-- Name: nacionalidades nacionalidades_nombre_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key11 UNIQUE (nombre);


--
-- TOC entry 5382 (class 2606 OID 19553)
-- Name: nacionalidades nacionalidades_nombre_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key12 UNIQUE (nombre);


--
-- TOC entry 5384 (class 2606 OID 19555)
-- Name: nacionalidades nacionalidades_nombre_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key13 UNIQUE (nombre);


--
-- TOC entry 5386 (class 2606 OID 19557)
-- Name: nacionalidades nacionalidades_nombre_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key14 UNIQUE (nombre);


--
-- TOC entry 5388 (class 2606 OID 19559)
-- Name: nacionalidades nacionalidades_nombre_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key15 UNIQUE (nombre);


--
-- TOC entry 5390 (class 2606 OID 19561)
-- Name: nacionalidades nacionalidades_nombre_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key16 UNIQUE (nombre);


--
-- TOC entry 5392 (class 2606 OID 19563)
-- Name: nacionalidades nacionalidades_nombre_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key17 UNIQUE (nombre);


--
-- TOC entry 5394 (class 2606 OID 19565)
-- Name: nacionalidades nacionalidades_nombre_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key18 UNIQUE (nombre);


--
-- TOC entry 5396 (class 2606 OID 19567)
-- Name: nacionalidades nacionalidades_nombre_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key19 UNIQUE (nombre);


--
-- TOC entry 5398 (class 2606 OID 19569)
-- Name: nacionalidades nacionalidades_nombre_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key2 UNIQUE (nombre);


--
-- TOC entry 5400 (class 2606 OID 19571)
-- Name: nacionalidades nacionalidades_nombre_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key20 UNIQUE (nombre);


--
-- TOC entry 5402 (class 2606 OID 19573)
-- Name: nacionalidades nacionalidades_nombre_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key21 UNIQUE (nombre);


--
-- TOC entry 5404 (class 2606 OID 19575)
-- Name: nacionalidades nacionalidades_nombre_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key22 UNIQUE (nombre);


--
-- TOC entry 5406 (class 2606 OID 19577)
-- Name: nacionalidades nacionalidades_nombre_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key23 UNIQUE (nombre);


--
-- TOC entry 5408 (class 2606 OID 19579)
-- Name: nacionalidades nacionalidades_nombre_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key24 UNIQUE (nombre);


--
-- TOC entry 5410 (class 2606 OID 19581)
-- Name: nacionalidades nacionalidades_nombre_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key25 UNIQUE (nombre);


--
-- TOC entry 5412 (class 2606 OID 19583)
-- Name: nacionalidades nacionalidades_nombre_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key26 UNIQUE (nombre);


--
-- TOC entry 5414 (class 2606 OID 19585)
-- Name: nacionalidades nacionalidades_nombre_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key27 UNIQUE (nombre);


--
-- TOC entry 5416 (class 2606 OID 19587)
-- Name: nacionalidades nacionalidades_nombre_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key28 UNIQUE (nombre);


--
-- TOC entry 5418 (class 2606 OID 19589)
-- Name: nacionalidades nacionalidades_nombre_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key29 UNIQUE (nombre);


--
-- TOC entry 5420 (class 2606 OID 19591)
-- Name: nacionalidades nacionalidades_nombre_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key3 UNIQUE (nombre);


--
-- TOC entry 5422 (class 2606 OID 19593)
-- Name: nacionalidades nacionalidades_nombre_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key30 UNIQUE (nombre);


--
-- TOC entry 5424 (class 2606 OID 19595)
-- Name: nacionalidades nacionalidades_nombre_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key31 UNIQUE (nombre);


--
-- TOC entry 5426 (class 2606 OID 19597)
-- Name: nacionalidades nacionalidades_nombre_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key32 UNIQUE (nombre);


--
-- TOC entry 5428 (class 2606 OID 19599)
-- Name: nacionalidades nacionalidades_nombre_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key33 UNIQUE (nombre);


--
-- TOC entry 5430 (class 2606 OID 19601)
-- Name: nacionalidades nacionalidades_nombre_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key34 UNIQUE (nombre);


--
-- TOC entry 5432 (class 2606 OID 19603)
-- Name: nacionalidades nacionalidades_nombre_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key35 UNIQUE (nombre);


--
-- TOC entry 5434 (class 2606 OID 19605)
-- Name: nacionalidades nacionalidades_nombre_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key36 UNIQUE (nombre);


--
-- TOC entry 5436 (class 2606 OID 19607)
-- Name: nacionalidades nacionalidades_nombre_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key37 UNIQUE (nombre);


--
-- TOC entry 5438 (class 2606 OID 19609)
-- Name: nacionalidades nacionalidades_nombre_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key38 UNIQUE (nombre);


--
-- TOC entry 5440 (class 2606 OID 19611)
-- Name: nacionalidades nacionalidades_nombre_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key39 UNIQUE (nombre);


--
-- TOC entry 5442 (class 2606 OID 19613)
-- Name: nacionalidades nacionalidades_nombre_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key4 UNIQUE (nombre);


--
-- TOC entry 5444 (class 2606 OID 19615)
-- Name: nacionalidades nacionalidades_nombre_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key40 UNIQUE (nombre);


--
-- TOC entry 5446 (class 2606 OID 19617)
-- Name: nacionalidades nacionalidades_nombre_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key41 UNIQUE (nombre);


--
-- TOC entry 5448 (class 2606 OID 19619)
-- Name: nacionalidades nacionalidades_nombre_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key42 UNIQUE (nombre);


--
-- TOC entry 5450 (class 2606 OID 19621)
-- Name: nacionalidades nacionalidades_nombre_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key43 UNIQUE (nombre);


--
-- TOC entry 5452 (class 2606 OID 19623)
-- Name: nacionalidades nacionalidades_nombre_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key44 UNIQUE (nombre);


--
-- TOC entry 5454 (class 2606 OID 19625)
-- Name: nacionalidades nacionalidades_nombre_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key45 UNIQUE (nombre);


--
-- TOC entry 5456 (class 2606 OID 19627)
-- Name: nacionalidades nacionalidades_nombre_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key46 UNIQUE (nombre);


--
-- TOC entry 5458 (class 2606 OID 19629)
-- Name: nacionalidades nacionalidades_nombre_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key47 UNIQUE (nombre);


--
-- TOC entry 5460 (class 2606 OID 19631)
-- Name: nacionalidades nacionalidades_nombre_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key48 UNIQUE (nombre);


--
-- TOC entry 5462 (class 2606 OID 19633)
-- Name: nacionalidades nacionalidades_nombre_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key49 UNIQUE (nombre);


--
-- TOC entry 5464 (class 2606 OID 19635)
-- Name: nacionalidades nacionalidades_nombre_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key5 UNIQUE (nombre);


--
-- TOC entry 5466 (class 2606 OID 19637)
-- Name: nacionalidades nacionalidades_nombre_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key50 UNIQUE (nombre);


--
-- TOC entry 5468 (class 2606 OID 19639)
-- Name: nacionalidades nacionalidades_nombre_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key51 UNIQUE (nombre);


--
-- TOC entry 5470 (class 2606 OID 19641)
-- Name: nacionalidades nacionalidades_nombre_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key52 UNIQUE (nombre);


--
-- TOC entry 5472 (class 2606 OID 19643)
-- Name: nacionalidades nacionalidades_nombre_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key53 UNIQUE (nombre);


--
-- TOC entry 5474 (class 2606 OID 19645)
-- Name: nacionalidades nacionalidades_nombre_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key54 UNIQUE (nombre);


--
-- TOC entry 5476 (class 2606 OID 19647)
-- Name: nacionalidades nacionalidades_nombre_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key55 UNIQUE (nombre);


--
-- TOC entry 5478 (class 2606 OID 19649)
-- Name: nacionalidades nacionalidades_nombre_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key56 UNIQUE (nombre);


--
-- TOC entry 5480 (class 2606 OID 19651)
-- Name: nacionalidades nacionalidades_nombre_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key57 UNIQUE (nombre);


--
-- TOC entry 5482 (class 2606 OID 19653)
-- Name: nacionalidades nacionalidades_nombre_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key58 UNIQUE (nombre);


--
-- TOC entry 5484 (class 2606 OID 19655)
-- Name: nacionalidades nacionalidades_nombre_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key59 UNIQUE (nombre);


--
-- TOC entry 5486 (class 2606 OID 19657)
-- Name: nacionalidades nacionalidades_nombre_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key6 UNIQUE (nombre);


--
-- TOC entry 5488 (class 2606 OID 19659)
-- Name: nacionalidades nacionalidades_nombre_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key60 UNIQUE (nombre);


--
-- TOC entry 5490 (class 2606 OID 19661)
-- Name: nacionalidades nacionalidades_nombre_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key61 UNIQUE (nombre);


--
-- TOC entry 5492 (class 2606 OID 19663)
-- Name: nacionalidades nacionalidades_nombre_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key62 UNIQUE (nombre);


--
-- TOC entry 5494 (class 2606 OID 19665)
-- Name: nacionalidades nacionalidades_nombre_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key63 UNIQUE (nombre);


--
-- TOC entry 5496 (class 2606 OID 19667)
-- Name: nacionalidades nacionalidades_nombre_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key64 UNIQUE (nombre);


--
-- TOC entry 5498 (class 2606 OID 19669)
-- Name: nacionalidades nacionalidades_nombre_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key65 UNIQUE (nombre);


--
-- TOC entry 5500 (class 2606 OID 19671)
-- Name: nacionalidades nacionalidades_nombre_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key66 UNIQUE (nombre);


--
-- TOC entry 5502 (class 2606 OID 19673)
-- Name: nacionalidades nacionalidades_nombre_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key67 UNIQUE (nombre);


--
-- TOC entry 5504 (class 2606 OID 19675)
-- Name: nacionalidades nacionalidades_nombre_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key68 UNIQUE (nombre);


--
-- TOC entry 5506 (class 2606 OID 19677)
-- Name: nacionalidades nacionalidades_nombre_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key69 UNIQUE (nombre);


--
-- TOC entry 5508 (class 2606 OID 19679)
-- Name: nacionalidades nacionalidades_nombre_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key7 UNIQUE (nombre);


--
-- TOC entry 5510 (class 2606 OID 19681)
-- Name: nacionalidades nacionalidades_nombre_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key70 UNIQUE (nombre);


--
-- TOC entry 5512 (class 2606 OID 19683)
-- Name: nacionalidades nacionalidades_nombre_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key8 UNIQUE (nombre);


--
-- TOC entry 5514 (class 2606 OID 19685)
-- Name: nacionalidades nacionalidades_nombre_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_nombre_key9 UNIQUE (nombre);


--
-- TOC entry 5516 (class 2606 OID 19687)
-- Name: nacionalidades nacionalidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_pkey PRIMARY KEY (id);


--
-- TOC entry 5518 (class 2606 OID 19689)
-- Name: nivel_educacion nivel_educacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nivel_educacion
    ADD CONSTRAINT nivel_educacion_pkey PRIMARY KEY (id);


--
-- TOC entry 5520 (class 2606 OID 19691)
-- Name: postulaciones postulaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postulaciones
    ADD CONSTRAINT postulaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 5522 (class 2606 OID 19693)
-- Name: regiones regiones_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key UNIQUE (nombre);


--
-- TOC entry 5524 (class 2606 OID 19695)
-- Name: regiones regiones_nombre_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key1 UNIQUE (nombre);


--
-- TOC entry 5526 (class 2606 OID 19697)
-- Name: regiones regiones_nombre_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key10 UNIQUE (nombre);


--
-- TOC entry 5528 (class 2606 OID 19699)
-- Name: regiones regiones_nombre_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key11 UNIQUE (nombre);


--
-- TOC entry 5530 (class 2606 OID 19701)
-- Name: regiones regiones_nombre_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key12 UNIQUE (nombre);


--
-- TOC entry 5532 (class 2606 OID 19703)
-- Name: regiones regiones_nombre_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key13 UNIQUE (nombre);


--
-- TOC entry 5534 (class 2606 OID 19705)
-- Name: regiones regiones_nombre_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key14 UNIQUE (nombre);


--
-- TOC entry 5536 (class 2606 OID 19707)
-- Name: regiones regiones_nombre_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key15 UNIQUE (nombre);


--
-- TOC entry 5538 (class 2606 OID 19709)
-- Name: regiones regiones_nombre_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key16 UNIQUE (nombre);


--
-- TOC entry 5540 (class 2606 OID 19711)
-- Name: regiones regiones_nombre_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key17 UNIQUE (nombre);


--
-- TOC entry 5542 (class 2606 OID 19713)
-- Name: regiones regiones_nombre_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key18 UNIQUE (nombre);


--
-- TOC entry 5544 (class 2606 OID 19715)
-- Name: regiones regiones_nombre_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key19 UNIQUE (nombre);


--
-- TOC entry 5546 (class 2606 OID 19717)
-- Name: regiones regiones_nombre_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key2 UNIQUE (nombre);


--
-- TOC entry 5548 (class 2606 OID 19719)
-- Name: regiones regiones_nombre_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key20 UNIQUE (nombre);


--
-- TOC entry 5550 (class 2606 OID 19721)
-- Name: regiones regiones_nombre_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key21 UNIQUE (nombre);


--
-- TOC entry 5552 (class 2606 OID 19723)
-- Name: regiones regiones_nombre_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key22 UNIQUE (nombre);


--
-- TOC entry 5554 (class 2606 OID 19725)
-- Name: regiones regiones_nombre_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key23 UNIQUE (nombre);


--
-- TOC entry 5556 (class 2606 OID 19727)
-- Name: regiones regiones_nombre_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key24 UNIQUE (nombre);


--
-- TOC entry 5558 (class 2606 OID 19729)
-- Name: regiones regiones_nombre_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key25 UNIQUE (nombre);


--
-- TOC entry 5560 (class 2606 OID 19731)
-- Name: regiones regiones_nombre_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key26 UNIQUE (nombre);


--
-- TOC entry 5562 (class 2606 OID 19733)
-- Name: regiones regiones_nombre_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key27 UNIQUE (nombre);


--
-- TOC entry 5564 (class 2606 OID 19735)
-- Name: regiones regiones_nombre_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key28 UNIQUE (nombre);


--
-- TOC entry 5566 (class 2606 OID 19737)
-- Name: regiones regiones_nombre_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key29 UNIQUE (nombre);


--
-- TOC entry 5568 (class 2606 OID 19739)
-- Name: regiones regiones_nombre_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key3 UNIQUE (nombre);


--
-- TOC entry 5570 (class 2606 OID 19741)
-- Name: regiones regiones_nombre_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key30 UNIQUE (nombre);


--
-- TOC entry 5572 (class 2606 OID 19743)
-- Name: regiones regiones_nombre_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key31 UNIQUE (nombre);


--
-- TOC entry 5574 (class 2606 OID 19745)
-- Name: regiones regiones_nombre_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key32 UNIQUE (nombre);


--
-- TOC entry 5576 (class 2606 OID 19747)
-- Name: regiones regiones_nombre_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key33 UNIQUE (nombre);


--
-- TOC entry 5578 (class 2606 OID 19749)
-- Name: regiones regiones_nombre_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key34 UNIQUE (nombre);


--
-- TOC entry 5580 (class 2606 OID 19751)
-- Name: regiones regiones_nombre_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key35 UNIQUE (nombre);


--
-- TOC entry 5582 (class 2606 OID 19753)
-- Name: regiones regiones_nombre_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key36 UNIQUE (nombre);


--
-- TOC entry 5584 (class 2606 OID 19755)
-- Name: regiones regiones_nombre_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key37 UNIQUE (nombre);


--
-- TOC entry 5586 (class 2606 OID 19757)
-- Name: regiones regiones_nombre_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key38 UNIQUE (nombre);


--
-- TOC entry 5588 (class 2606 OID 19759)
-- Name: regiones regiones_nombre_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key39 UNIQUE (nombre);


--
-- TOC entry 5590 (class 2606 OID 19761)
-- Name: regiones regiones_nombre_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key4 UNIQUE (nombre);


--
-- TOC entry 5592 (class 2606 OID 19763)
-- Name: regiones regiones_nombre_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key40 UNIQUE (nombre);


--
-- TOC entry 5594 (class 2606 OID 19765)
-- Name: regiones regiones_nombre_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key41 UNIQUE (nombre);


--
-- TOC entry 5596 (class 2606 OID 19767)
-- Name: regiones regiones_nombre_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key42 UNIQUE (nombre);


--
-- TOC entry 5598 (class 2606 OID 19769)
-- Name: regiones regiones_nombre_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key43 UNIQUE (nombre);


--
-- TOC entry 5600 (class 2606 OID 19771)
-- Name: regiones regiones_nombre_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key44 UNIQUE (nombre);


--
-- TOC entry 5602 (class 2606 OID 19773)
-- Name: regiones regiones_nombre_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key45 UNIQUE (nombre);


--
-- TOC entry 5604 (class 2606 OID 19775)
-- Name: regiones regiones_nombre_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key46 UNIQUE (nombre);


--
-- TOC entry 5606 (class 2606 OID 19777)
-- Name: regiones regiones_nombre_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key47 UNIQUE (nombre);


--
-- TOC entry 5608 (class 2606 OID 19779)
-- Name: regiones regiones_nombre_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key48 UNIQUE (nombre);


--
-- TOC entry 5610 (class 2606 OID 19781)
-- Name: regiones regiones_nombre_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key49 UNIQUE (nombre);


--
-- TOC entry 5612 (class 2606 OID 19783)
-- Name: regiones regiones_nombre_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key5 UNIQUE (nombre);


--
-- TOC entry 5614 (class 2606 OID 19785)
-- Name: regiones regiones_nombre_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key50 UNIQUE (nombre);


--
-- TOC entry 5616 (class 2606 OID 19787)
-- Name: regiones regiones_nombre_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key51 UNIQUE (nombre);


--
-- TOC entry 5618 (class 2606 OID 19789)
-- Name: regiones regiones_nombre_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key52 UNIQUE (nombre);


--
-- TOC entry 5620 (class 2606 OID 19791)
-- Name: regiones regiones_nombre_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key53 UNIQUE (nombre);


--
-- TOC entry 5622 (class 2606 OID 19793)
-- Name: regiones regiones_nombre_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key54 UNIQUE (nombre);


--
-- TOC entry 5624 (class 2606 OID 19795)
-- Name: regiones regiones_nombre_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key55 UNIQUE (nombre);


--
-- TOC entry 5626 (class 2606 OID 19797)
-- Name: regiones regiones_nombre_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key56 UNIQUE (nombre);


--
-- TOC entry 5628 (class 2606 OID 19799)
-- Name: regiones regiones_nombre_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key57 UNIQUE (nombre);


--
-- TOC entry 5630 (class 2606 OID 19801)
-- Name: regiones regiones_nombre_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key58 UNIQUE (nombre);


--
-- TOC entry 5632 (class 2606 OID 19803)
-- Name: regiones regiones_nombre_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key59 UNIQUE (nombre);


--
-- TOC entry 5634 (class 2606 OID 19805)
-- Name: regiones regiones_nombre_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key6 UNIQUE (nombre);


--
-- TOC entry 5636 (class 2606 OID 19807)
-- Name: regiones regiones_nombre_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key60 UNIQUE (nombre);


--
-- TOC entry 5638 (class 2606 OID 19809)
-- Name: regiones regiones_nombre_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key61 UNIQUE (nombre);


--
-- TOC entry 5640 (class 2606 OID 19811)
-- Name: regiones regiones_nombre_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key62 UNIQUE (nombre);


--
-- TOC entry 5642 (class 2606 OID 19813)
-- Name: regiones regiones_nombre_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key63 UNIQUE (nombre);


--
-- TOC entry 5644 (class 2606 OID 19815)
-- Name: regiones regiones_nombre_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key64 UNIQUE (nombre);


--
-- TOC entry 5646 (class 2606 OID 19817)
-- Name: regiones regiones_nombre_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key65 UNIQUE (nombre);


--
-- TOC entry 5648 (class 2606 OID 19819)
-- Name: regiones regiones_nombre_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key66 UNIQUE (nombre);


--
-- TOC entry 5650 (class 2606 OID 19821)
-- Name: regiones regiones_nombre_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key67 UNIQUE (nombre);


--
-- TOC entry 5652 (class 2606 OID 19823)
-- Name: regiones regiones_nombre_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key68 UNIQUE (nombre);


--
-- TOC entry 5654 (class 2606 OID 19825)
-- Name: regiones regiones_nombre_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key69 UNIQUE (nombre);


--
-- TOC entry 5656 (class 2606 OID 19827)
-- Name: regiones regiones_nombre_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key7 UNIQUE (nombre);


--
-- TOC entry 5658 (class 2606 OID 19829)
-- Name: regiones regiones_nombre_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key70 UNIQUE (nombre);


--
-- TOC entry 5660 (class 2606 OID 19831)
-- Name: regiones regiones_nombre_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key8 UNIQUE (nombre);


--
-- TOC entry 5662 (class 2606 OID 19833)
-- Name: regiones regiones_nombre_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_nombre_key9 UNIQUE (nombre);


--
-- TOC entry 5664 (class 2606 OID 19835)
-- Name: regiones regiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_pkey PRIMARY KEY (id);


--
-- TOC entry 5666 (class 2606 OID 19837)
-- Name: tipo_vacantes tipo_vacante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_vacantes
    ADD CONSTRAINT tipo_vacante_pkey PRIMARY KEY (id);


--
-- TOC entry 5668 (class 2606 OID 19839)
-- Name: titulos_profesionales titulos_profesionales_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key UNIQUE (nombre);


--
-- TOC entry 5670 (class 2606 OID 19841)
-- Name: titulos_profesionales titulos_profesionales_nombre_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key1 UNIQUE (nombre);


--
-- TOC entry 5672 (class 2606 OID 19843)
-- Name: titulos_profesionales titulos_profesionales_nombre_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key10 UNIQUE (nombre);


--
-- TOC entry 5674 (class 2606 OID 19845)
-- Name: titulos_profesionales titulos_profesionales_nombre_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key11 UNIQUE (nombre);


--
-- TOC entry 5676 (class 2606 OID 19847)
-- Name: titulos_profesionales titulos_profesionales_nombre_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key12 UNIQUE (nombre);


--
-- TOC entry 5678 (class 2606 OID 19849)
-- Name: titulos_profesionales titulos_profesionales_nombre_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key13 UNIQUE (nombre);


--
-- TOC entry 5680 (class 2606 OID 19851)
-- Name: titulos_profesionales titulos_profesionales_nombre_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key14 UNIQUE (nombre);


--
-- TOC entry 5682 (class 2606 OID 19853)
-- Name: titulos_profesionales titulos_profesionales_nombre_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key15 UNIQUE (nombre);


--
-- TOC entry 5684 (class 2606 OID 19855)
-- Name: titulos_profesionales titulos_profesionales_nombre_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key16 UNIQUE (nombre);


--
-- TOC entry 5686 (class 2606 OID 19857)
-- Name: titulos_profesionales titulos_profesionales_nombre_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key17 UNIQUE (nombre);


--
-- TOC entry 5688 (class 2606 OID 19859)
-- Name: titulos_profesionales titulos_profesionales_nombre_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key18 UNIQUE (nombre);


--
-- TOC entry 5690 (class 2606 OID 19861)
-- Name: titulos_profesionales titulos_profesionales_nombre_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key19 UNIQUE (nombre);


--
-- TOC entry 5692 (class 2606 OID 19863)
-- Name: titulos_profesionales titulos_profesionales_nombre_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key2 UNIQUE (nombre);


--
-- TOC entry 5694 (class 2606 OID 19865)
-- Name: titulos_profesionales titulos_profesionales_nombre_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key20 UNIQUE (nombre);


--
-- TOC entry 5696 (class 2606 OID 19867)
-- Name: titulos_profesionales titulos_profesionales_nombre_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key21 UNIQUE (nombre);


--
-- TOC entry 5698 (class 2606 OID 19869)
-- Name: titulos_profesionales titulos_profesionales_nombre_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key22 UNIQUE (nombre);


--
-- TOC entry 5700 (class 2606 OID 19871)
-- Name: titulos_profesionales titulos_profesionales_nombre_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key23 UNIQUE (nombre);


--
-- TOC entry 5702 (class 2606 OID 19873)
-- Name: titulos_profesionales titulos_profesionales_nombre_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key24 UNIQUE (nombre);


--
-- TOC entry 5704 (class 2606 OID 19875)
-- Name: titulos_profesionales titulos_profesionales_nombre_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key25 UNIQUE (nombre);


--
-- TOC entry 5706 (class 2606 OID 19877)
-- Name: titulos_profesionales titulos_profesionales_nombre_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key26 UNIQUE (nombre);


--
-- TOC entry 5708 (class 2606 OID 19879)
-- Name: titulos_profesionales titulos_profesionales_nombre_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key27 UNIQUE (nombre);


--
-- TOC entry 5710 (class 2606 OID 19881)
-- Name: titulos_profesionales titulos_profesionales_nombre_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key28 UNIQUE (nombre);


--
-- TOC entry 5712 (class 2606 OID 19883)
-- Name: titulos_profesionales titulos_profesionales_nombre_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key29 UNIQUE (nombre);


--
-- TOC entry 5714 (class 2606 OID 19885)
-- Name: titulos_profesionales titulos_profesionales_nombre_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key3 UNIQUE (nombre);


--
-- TOC entry 5716 (class 2606 OID 19887)
-- Name: titulos_profesionales titulos_profesionales_nombre_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key30 UNIQUE (nombre);


--
-- TOC entry 5718 (class 2606 OID 19889)
-- Name: titulos_profesionales titulos_profesionales_nombre_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key31 UNIQUE (nombre);


--
-- TOC entry 5720 (class 2606 OID 19891)
-- Name: titulos_profesionales titulos_profesionales_nombre_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key32 UNIQUE (nombre);


--
-- TOC entry 5722 (class 2606 OID 19893)
-- Name: titulos_profesionales titulos_profesionales_nombre_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key33 UNIQUE (nombre);


--
-- TOC entry 5724 (class 2606 OID 19895)
-- Name: titulos_profesionales titulos_profesionales_nombre_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key34 UNIQUE (nombre);


--
-- TOC entry 5726 (class 2606 OID 19897)
-- Name: titulos_profesionales titulos_profesionales_nombre_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key35 UNIQUE (nombre);


--
-- TOC entry 5728 (class 2606 OID 19899)
-- Name: titulos_profesionales titulos_profesionales_nombre_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key36 UNIQUE (nombre);


--
-- TOC entry 5730 (class 2606 OID 19901)
-- Name: titulos_profesionales titulos_profesionales_nombre_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key37 UNIQUE (nombre);


--
-- TOC entry 5732 (class 2606 OID 19903)
-- Name: titulos_profesionales titulos_profesionales_nombre_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key38 UNIQUE (nombre);


--
-- TOC entry 5734 (class 2606 OID 19905)
-- Name: titulos_profesionales titulos_profesionales_nombre_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key39 UNIQUE (nombre);


--
-- TOC entry 5736 (class 2606 OID 19907)
-- Name: titulos_profesionales titulos_profesionales_nombre_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key4 UNIQUE (nombre);


--
-- TOC entry 5738 (class 2606 OID 19909)
-- Name: titulos_profesionales titulos_profesionales_nombre_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key40 UNIQUE (nombre);


--
-- TOC entry 5740 (class 2606 OID 19911)
-- Name: titulos_profesionales titulos_profesionales_nombre_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key41 UNIQUE (nombre);


--
-- TOC entry 5742 (class 2606 OID 19913)
-- Name: titulos_profesionales titulos_profesionales_nombre_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key42 UNIQUE (nombre);


--
-- TOC entry 5744 (class 2606 OID 19915)
-- Name: titulos_profesionales titulos_profesionales_nombre_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key43 UNIQUE (nombre);


--
-- TOC entry 5746 (class 2606 OID 19917)
-- Name: titulos_profesionales titulos_profesionales_nombre_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key44 UNIQUE (nombre);


--
-- TOC entry 5748 (class 2606 OID 19919)
-- Name: titulos_profesionales titulos_profesionales_nombre_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key45 UNIQUE (nombre);


--
-- TOC entry 5750 (class 2606 OID 19921)
-- Name: titulos_profesionales titulos_profesionales_nombre_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key46 UNIQUE (nombre);


--
-- TOC entry 5752 (class 2606 OID 19923)
-- Name: titulos_profesionales titulos_profesionales_nombre_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key47 UNIQUE (nombre);


--
-- TOC entry 5754 (class 2606 OID 19925)
-- Name: titulos_profesionales titulos_profesionales_nombre_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key48 UNIQUE (nombre);


--
-- TOC entry 5756 (class 2606 OID 19927)
-- Name: titulos_profesionales titulos_profesionales_nombre_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key49 UNIQUE (nombre);


--
-- TOC entry 5758 (class 2606 OID 19929)
-- Name: titulos_profesionales titulos_profesionales_nombre_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key5 UNIQUE (nombre);


--
-- TOC entry 5760 (class 2606 OID 19931)
-- Name: titulos_profesionales titulos_profesionales_nombre_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key50 UNIQUE (nombre);


--
-- TOC entry 5762 (class 2606 OID 19933)
-- Name: titulos_profesionales titulos_profesionales_nombre_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key51 UNIQUE (nombre);


--
-- TOC entry 5764 (class 2606 OID 19935)
-- Name: titulos_profesionales titulos_profesionales_nombre_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key52 UNIQUE (nombre);


--
-- TOC entry 5766 (class 2606 OID 19937)
-- Name: titulos_profesionales titulos_profesionales_nombre_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key53 UNIQUE (nombre);


--
-- TOC entry 5768 (class 2606 OID 19939)
-- Name: titulos_profesionales titulos_profesionales_nombre_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key54 UNIQUE (nombre);


--
-- TOC entry 5770 (class 2606 OID 19941)
-- Name: titulos_profesionales titulos_profesionales_nombre_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key55 UNIQUE (nombre);


--
-- TOC entry 5772 (class 2606 OID 19943)
-- Name: titulos_profesionales titulos_profesionales_nombre_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key56 UNIQUE (nombre);


--
-- TOC entry 5774 (class 2606 OID 19945)
-- Name: titulos_profesionales titulos_profesionales_nombre_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key57 UNIQUE (nombre);


--
-- TOC entry 5776 (class 2606 OID 19947)
-- Name: titulos_profesionales titulos_profesionales_nombre_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key58 UNIQUE (nombre);


--
-- TOC entry 5778 (class 2606 OID 19949)
-- Name: titulos_profesionales titulos_profesionales_nombre_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key59 UNIQUE (nombre);


--
-- TOC entry 5780 (class 2606 OID 19951)
-- Name: titulos_profesionales titulos_profesionales_nombre_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key6 UNIQUE (nombre);


--
-- TOC entry 5782 (class 2606 OID 19953)
-- Name: titulos_profesionales titulos_profesionales_nombre_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key60 UNIQUE (nombre);


--
-- TOC entry 5784 (class 2606 OID 19955)
-- Name: titulos_profesionales titulos_profesionales_nombre_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key61 UNIQUE (nombre);


--
-- TOC entry 5786 (class 2606 OID 19957)
-- Name: titulos_profesionales titulos_profesionales_nombre_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key62 UNIQUE (nombre);


--
-- TOC entry 5788 (class 2606 OID 19959)
-- Name: titulos_profesionales titulos_profesionales_nombre_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key63 UNIQUE (nombre);


--
-- TOC entry 5790 (class 2606 OID 19961)
-- Name: titulos_profesionales titulos_profesionales_nombre_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key64 UNIQUE (nombre);


--
-- TOC entry 5792 (class 2606 OID 19963)
-- Name: titulos_profesionales titulos_profesionales_nombre_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key65 UNIQUE (nombre);


--
-- TOC entry 5794 (class 2606 OID 19965)
-- Name: titulos_profesionales titulos_profesionales_nombre_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key66 UNIQUE (nombre);


--
-- TOC entry 5796 (class 2606 OID 19967)
-- Name: titulos_profesionales titulos_profesionales_nombre_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key67 UNIQUE (nombre);


--
-- TOC entry 5798 (class 2606 OID 19969)
-- Name: titulos_profesionales titulos_profesionales_nombre_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key68 UNIQUE (nombre);


--
-- TOC entry 5800 (class 2606 OID 19971)
-- Name: titulos_profesionales titulos_profesionales_nombre_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key69 UNIQUE (nombre);


--
-- TOC entry 5802 (class 2606 OID 19973)
-- Name: titulos_profesionales titulos_profesionales_nombre_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key7 UNIQUE (nombre);


--
-- TOC entry 5804 (class 2606 OID 19975)
-- Name: titulos_profesionales titulos_profesionales_nombre_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key70 UNIQUE (nombre);


--
-- TOC entry 5806 (class 2606 OID 19977)
-- Name: titulos_profesionales titulos_profesionales_nombre_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key8 UNIQUE (nombre);


--
-- TOC entry 5808 (class 2606 OID 19979)
-- Name: titulos_profesionales titulos_profesionales_nombre_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_nombre_key9 UNIQUE (nombre);


--
-- TOC entry 5810 (class 2606 OID 19981)
-- Name: titulos_profesionales titulos_profesionales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos_profesionales
    ADD CONSTRAINT titulos_profesionales_pkey PRIMARY KEY (id);


--
-- TOC entry 5812 (class 2606 OID 19983)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4953 (class 1259 OID 19984)
-- Name: idx_candidatos_estado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_candidatos_estado ON public.candidatos USING btree (estado_candidato_id);


--
-- TOC entry 4954 (class 1259 OID 19985)
-- Name: idx_candidatos_nombre; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_candidatos_nombre ON public.candidatos USING btree (nombre_completo);


--
-- TOC entry 4955 (class 1259 OID 19986)
-- Name: idx_candidatos_rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_candidatos_rut ON public.candidatos USING btree (rut);


--
-- TOC entry 4978 (class 1259 OID 19987)
-- Name: idx_comunas_region; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_comunas_region ON public.comunas USING btree (region_id);


--
-- TOC entry 5862 (class 2620 OID 19988)
-- Name: candidatos update_candidatos_modtime; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_candidatos_modtime BEFORE UPDATE ON public.candidatos FOR EACH ROW EXECUTE FUNCTION public.update_modified_column();


--
-- TOC entry 5863 (class 2620 OID 19989)
-- Name: comentarios update_comentarios_modtime; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_comentarios_modtime BEFORE UPDATE ON public.comentarios FOR EACH ROW EXECUTE FUNCTION public.update_modified_column();


--
-- TOC entry 5836 (class 2606 OID 20289)
-- Name: candidatos_modalidades CModalidades_candidato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_modalidades
    ADD CONSTRAINT "CModalidades_candidato_id_fkey" FOREIGN KEY (candidato_id) REFERENCES public.candidatos(id) NOT VALID;


--
-- TOC entry 5837 (class 2606 OID 20294)
-- Name: candidatos_modalidades CModalidades_modalidad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_modalidades
    ADD CONSTRAINT "CModalidades_modalidad_id_fkey" FOREIGN KEY (modalidad_horaria_id) REFERENCES public.modalidades_horarias(id) NOT VALID;


--
-- TOC entry 5838 (class 2606 OID 19990)
-- Name: cargos Cargos_categoria_id_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT "Cargos_categoria_id_key" FOREIGN KEY (tipo_cargo_id) REFERENCES public.categoria_cargos(id) NOT VALID;


--
-- TOC entry 5831 (class 2606 OID 19995)
-- Name: candidatos_cargos candidatos_cargos_candidato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_cargos
    ADD CONSTRAINT candidatos_cargos_candidato_id_fkey FOREIGN KEY (candidato_id) REFERENCES public.candidatos(id) ON DELETE CASCADE;


--
-- TOC entry 5832 (class 2606 OID 20000)
-- Name: candidatos_ciudades candidatos_ciudades_candidatos_id_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_ciudades
    ADD CONSTRAINT candidatos_ciudades_candidatos_id_key FOREIGN KEY (candidato_id) REFERENCES public.candidatos(id) NOT VALID;


--
-- TOC entry 5833 (class 2606 OID 20005)
-- Name: candidatos_ciudades candidatos_ciudades_ciudad_id_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_ciudades
    ADD CONSTRAINT candidatos_ciudades_ciudad_id_key FOREIGN KEY (ciudades_id) REFERENCES public.ciudades(id) NOT VALID;


--
-- TOC entry 5825 (class 2606 OID 20010)
-- Name: candidatos candidatos_comuna_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos
    ADD CONSTRAINT candidatos_comuna_id_fkey FOREIGN KEY (comuna_id) REFERENCES public.comunas(id) ON UPDATE CASCADE;


--
-- TOC entry 5826 (class 2606 OID 20015)
-- Name: candidatos candidatos_estado_candidato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos
    ADD CONSTRAINT candidatos_estado_candidato_id_fkey FOREIGN KEY (estado_candidato_id) REFERENCES public.estado_candidatos(id) ON UPDATE CASCADE;


--
-- TOC entry 5827 (class 2606 OID 20020)
-- Name: candidatos candidatos_estado_civil_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos
    ADD CONSTRAINT candidatos_estado_civil_id_fkey FOREIGN KEY (estado_civil_id) REFERENCES public.estados_civiles(id) ON UPDATE CASCADE;


--
-- TOC entry 5834 (class 2606 OID 20207)
-- Name: candidatos_jornadas candidatos_jornadas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_jornadas
    ADD CONSTRAINT candidatos_jornadas_id_fkey FOREIGN KEY (jornada_id) REFERENCES public.jornadas(id) NOT VALID;


--
-- TOC entry 5828 (class 2606 OID 20025)
-- Name: candidatos candidatos_nacionalidad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos
    ADD CONSTRAINT candidatos_nacionalidad_id_fkey FOREIGN KEY (nacionalidad_id) REFERENCES public.nacionalidades(id) ON UPDATE CASCADE;


--
-- TOC entry 5829 (class 2606 OID 20030)
-- Name: candidatos candidatos_titulo_profesional_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos
    ADD CONSTRAINT candidatos_titulo_profesional_id_fkey FOREIGN KEY (titulo_profesional_id) REFERENCES public.titulos_profesionales(id) ON UPDATE CASCADE;


--
-- TOC entry 5830 (class 2606 OID 20035)
-- Name: candidatos candidatos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos
    ADD CONSTRAINT candidatos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) NOT VALID;


--
-- TOC entry 5857 (class 2606 OID 20415)
-- Name: cartas_ofertas carta_oferta_candidato_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartas_ofertas
    ADD CONSTRAINT carta_oferta_candidato_i_fkey FOREIGN KEY (candidato_id) REFERENCES public.candidatos(id) NOT VALID;


--
-- TOC entry 5858 (class 2606 OID 20430)
-- Name: cartas_ofertas carta_oferta_cargo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartas_ofertas
    ADD CONSTRAINT carta_oferta_cargo_id_fkey FOREIGN KEY (cargo_id) REFERENCES public.cargos(id) NOT VALID;


--
-- TOC entry 5859 (class 2606 OID 20410)
-- Name: cartas_ofertas carta_oferta_convocatoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartas_ofertas
    ADD CONSTRAINT carta_oferta_convocatoria_id_fkey FOREIGN KEY (convocatoria_id) REFERENCES public.convocatorias(id) NOT VALID;


--
-- TOC entry 5860 (class 2606 OID 20420)
-- Name: cartas_ofertas carta_oferta_institucion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartas_ofertas
    ADD CONSTRAINT carta_oferta_institucion_id_fkey FOREIGN KEY (institucion_id) REFERENCES public.instituciones(id) NOT VALID;


--
-- TOC entry 5861 (class 2606 OID 20425)
-- Name: cartas_ofertas carta_oferta_jornada_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartas_ofertas
    ADD CONSTRAINT carta_oferta_jornada_id_fkey FOREIGN KEY (jornada_id) REFERENCES public.jornadas(id) NOT VALID;


--
-- TOC entry 5839 (class 2606 OID 20040)
-- Name: comentarios comentarios_candidato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_candidato_id_fkey FOREIGN KEY (candidato_id) REFERENCES public.candidatos(id) ON UPDATE CASCADE;


--
-- TOC entry 5840 (class 2606 OID 20045)
-- Name: comentarios comentarios_creador_id_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_creador_id_key FOREIGN KEY (creador_id) REFERENCES public.candidatos(id) NOT VALID;


--
-- TOC entry 5841 (class 2606 OID 20050)
-- Name: comunas comunas_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunas
    ADD CONSTRAINT comunas_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regiones(id) ON UPDATE CASCADE;


--
-- TOC entry 5842 (class 2606 OID 20055)
-- Name: convocatorias convocatoria_ciudades_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatorias
    ADD CONSTRAINT convocatoria_ciudades_id_fkey FOREIGN KEY (ciudad_id) REFERENCES public.ciudades(id) NOT VALID;


--
-- TOC entry 5843 (class 2606 OID 20060)
-- Name: convocatorias convocatoria_jornada_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatorias
    ADD CONSTRAINT convocatoria_jornada_id_fkey FOREIGN KEY (jornada_id) REFERENCES public.jornadas(id) NOT VALID;


--
-- TOC entry 5844 (class 2606 OID 20065)
-- Name: convocatorias convocatoria_modalidad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatorias
    ADD CONSTRAINT convocatoria_modalidad_id_fkey FOREIGN KEY (modalidad_id) REFERENCES public.modalidades_horarias(id) NOT VALID;


--
-- TOC entry 5845 (class 2606 OID 20070)
-- Name: convocatorias convocatoria_tipo_vacante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatorias
    ADD CONSTRAINT convocatoria_tipo_vacante_id_fkey FOREIGN KEY (categoria_cargo_id) REFERENCES public.categoria_cargos(id) NOT VALID;


--
-- TOC entry 5846 (class 2606 OID 20075)
-- Name: convocatorias convocatorias_cargos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatorias
    ADD CONSTRAINT convocatorias_cargos_id_fkey FOREIGN KEY (cargo_id) REFERENCES public.cargos(id) NOT VALID;


--
-- TOC entry 5847 (class 2606 OID 20080)
-- Name: convocatorias convocatorias_categoria_cargo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatorias
    ADD CONSTRAINT convocatorias_categoria_cargo_id_fkey FOREIGN KEY (categoria_cargo_id) REFERENCES public.categoria_cargos(id) NOT VALID;


--
-- TOC entry 5848 (class 2606 OID 20085)
-- Name: convocatorias convocatorias_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatorias
    ADD CONSTRAINT convocatorias_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estado_convocatoria(id) NOT VALID;


--
-- TOC entry 5849 (class 2606 OID 20090)
-- Name: convocatorias convocatorias_institucion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatorias
    ADD CONSTRAINT convocatorias_institucion_id_fkey FOREIGN KEY (institucion_id) REFERENCES public.instituciones(id) NOT VALID;


--
-- TOC entry 5850 (class 2606 OID 20095)
-- Name: documentos_candidatos documentos_candidatos_candidato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_candidatos
    ADD CONSTRAINT documentos_candidatos_candidato_id_fkey FOREIGN KEY (candidato_id) REFERENCES public.candidatos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5851 (class 2606 OID 20100)
-- Name: documentos_candidatos documentos_candidatos_documento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_candidatos
    ADD CONSTRAINT documentos_candidatos_documento_id_fkey FOREIGN KEY (documento_id) REFERENCES public.documentos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5852 (class 2606 OID 20131)
-- Name: instituciones instituciones_ciudad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituciones
    ADD CONSTRAINT instituciones_ciudad_id_fkey FOREIGN KEY (ciudad_id) REFERENCES public.ciudades(id) NOT VALID;


--
-- TOC entry 5853 (class 2606 OID 20136)
-- Name: instituciones instituciones_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituciones
    ADD CONSTRAINT instituciones_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directores(id) NOT VALID;


--
-- TOC entry 5835 (class 2606 OID 20212)
-- Name: candidatos_jornadas jornadas_candidatos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidatos_jornadas
    ADD CONSTRAINT jornadas_candidatos_id_fkey FOREIGN KEY (candidato_id) REFERENCES public.candidatos(id) NOT VALID;


--
-- TOC entry 5854 (class 2606 OID 20105)
-- Name: postulaciones postulaciones_candidato_id_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postulaciones
    ADD CONSTRAINT postulaciones_candidato_id_key FOREIGN KEY (candidato_id) REFERENCES public.candidatos(id) NOT VALID;


--
-- TOC entry 5855 (class 2606 OID 20110)
-- Name: postulaciones postulaciones_convocatoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postulaciones
    ADD CONSTRAINT postulaciones_convocatoria_id_fkey FOREIGN KEY (convocatoria_id) REFERENCES public.convocatorias(id) NOT VALID;


--
-- TOC entry 5856 (class 2606 OID 20466)
-- Name: postulaciones postulaciones_estado_candidato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postulaciones
    ADD CONSTRAINT postulaciones_estado_candidato_id_fkey FOREIGN KEY (estado_candidato) REFERENCES public.estado_candidatos(id) NOT VALID;


--
-- TOC entry 6080 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-12-10 15:03:31

--
-- PostgreSQL database dump complete
--

\unrestrict PLiQBNvyPvKdcDLSK1YYgc94kbnuU1LW6pcbFy391TnuprEcGsS3pz7o9r2pmmd

