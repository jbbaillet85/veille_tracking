--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-10-19 13:32:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE veille;
--
-- TOC entry 3529 (class 1262 OID 16395)
-- Name: veille; Type: DATABASE; Schema: -; Owner: veille
--

CREATE DATABASE veille WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';


ALTER DATABASE veille OWNER TO veille;

\connect veille

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 16540)
-- Name: app_books_author; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.app_books_author (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    lastname character varying(100) NOT NULL,
    contact character varying(200) NOT NULL,
    slug character varying(255) NOT NULL
);


ALTER TABLE public.app_books_author OWNER TO veille;

--
-- TOC entry 227 (class 1259 OID 16539)
-- Name: app_books_author_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.app_books_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_books_author_id_seq OWNER TO veille;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 227
-- Name: app_books_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.app_books_author_id_seq OWNED BY public.app_books_author.id;


--
-- TOC entry 230 (class 1259 OID 16551)
-- Name: app_books_book; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.app_books_book (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    count_pages integer NOT NULL,
    current_page integer NOT NULL,
    "ISBN" character varying(13) NOT NULL,
    more_infos character varying(200) NOT NULL,
    slug character varying(255) NOT NULL,
    couverture character varying(200) NOT NULL,
    author_id bigint,
    edition_id bigint
);


ALTER TABLE public.app_books_book OWNER TO veille;

--
-- TOC entry 229 (class 1259 OID 16550)
-- Name: app_books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.app_books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_books_book_id_seq OWNER TO veille;

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 229
-- Name: app_books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.app_books_book_id_seq OWNED BY public.app_books_book.id;


--
-- TOC entry 234 (class 1259 OID 16575)
-- Name: app_books_category; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.app_books_category (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL
);


ALTER TABLE public.app_books_category OWNER TO veille;

--
-- TOC entry 236 (class 1259 OID 16588)
-- Name: app_books_category_category; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.app_books_category_category (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    book_id bigint NOT NULL
);


ALTER TABLE public.app_books_category_category OWNER TO veille;

--
-- TOC entry 235 (class 1259 OID 16587)
-- Name: app_books_category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.app_books_category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_books_category_category_id_seq OWNER TO veille;

--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 235
-- Name: app_books_category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.app_books_category_category_id_seq OWNED BY public.app_books_category_category.id;


--
-- TOC entry 233 (class 1259 OID 16574)
-- Name: app_books_category_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.app_books_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_books_category_id_seq OWNER TO veille;

--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 233
-- Name: app_books_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.app_books_category_id_seq OWNED BY public.app_books_category.id;


--
-- TOC entry 232 (class 1259 OID 16562)
-- Name: app_books_edition; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.app_books_edition (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL
);


ALTER TABLE public.app_books_edition OWNER TO veille;

--
-- TOC entry 231 (class 1259 OID 16561)
-- Name: app_books_edition_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.app_books_edition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_books_edition_id_seq OWNER TO veille;

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 231
-- Name: app_books_edition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.app_books_edition_id_seq OWNED BY public.app_books_edition.id;


--
-- TOC entry 238 (class 1259 OID 16627)
-- Name: app_library_library; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.app_library_library (
    id bigint NOT NULL,
    current_page integer NOT NULL,
    book_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.app_library_library OWNER TO veille;

--
-- TOC entry 237 (class 1259 OID 16626)
-- Name: app_library_library_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.app_library_library_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_library_library_id_seq OWNER TO veille;

--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 237
-- Name: app_library_library_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.app_library_library_id_seq OWNED BY public.app_library_library.id;


--
-- TOC entry 220 (class 1259 OID 16464)
-- Name: app_user_user; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.app_user_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE public.app_user_user OWNER TO veille;

--
-- TOC entry 222 (class 1259 OID 16475)
-- Name: app_user_user_groups; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.app_user_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.app_user_user_groups OWNER TO veille;

--
-- TOC entry 221 (class 1259 OID 16474)
-- Name: app_user_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.app_user_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_user_groups_id_seq OWNER TO veille;

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 221
-- Name: app_user_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.app_user_user_groups_id_seq OWNED BY public.app_user_user_groups.id;


--
-- TOC entry 219 (class 1259 OID 16463)
-- Name: app_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.app_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_user_id_seq OWNER TO veille;

--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 219
-- Name: app_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.app_user_user_id_seq OWNED BY public.app_user_user.id;


--
-- TOC entry 224 (class 1259 OID 16482)
-- Name: app_user_user_user_permissions; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.app_user_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.app_user_user_user_permissions OWNER TO veille;

--
-- TOC entry 223 (class 1259 OID 16481)
-- Name: app_user_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.app_user_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_user_user_permissions_id_seq OWNER TO veille;

--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 223
-- Name: app_user_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.app_user_user_user_permissions_id_seq OWNED BY public.app_user_user_user_permissions.id;


--
-- TOC entry 216 (class 1259 OID 16422)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO veille;

--
-- TOC entry 215 (class 1259 OID 16421)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO veille;

--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 215
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 218 (class 1259 OID 16431)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO veille;

--
-- TOC entry 217 (class 1259 OID 16430)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO veille;

--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 214 (class 1259 OID 16415)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO veille;

--
-- TOC entry 213 (class 1259 OID 16414)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO veille;

--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 226 (class 1259 OID 16518)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO veille;

--
-- TOC entry 225 (class 1259 OID 16517)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO veille;

--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 225
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 212 (class 1259 OID 16406)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO veille;

--
-- TOC entry 211 (class 1259 OID 16405)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO veille;

--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 211
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 210 (class 1259 OID 16397)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO veille;

--
-- TOC entry 209 (class 1259 OID 16396)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: veille
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO veille;

--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 209
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: veille
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 239 (class 1259 OID 16645)
-- Name: django_session; Type: TABLE; Schema: public; Owner: veille
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO veille;

--
-- TOC entry 3248 (class 2604 OID 16543)
-- Name: app_books_author id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_author ALTER COLUMN id SET DEFAULT nextval('public.app_books_author_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 16554)
-- Name: app_books_book id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_book ALTER COLUMN id SET DEFAULT nextval('public.app_books_book_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 16578)
-- Name: app_books_category id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_category ALTER COLUMN id SET DEFAULT nextval('public.app_books_category_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 16591)
-- Name: app_books_category_category id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_category_category ALTER COLUMN id SET DEFAULT nextval('public.app_books_category_category_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 16565)
-- Name: app_books_edition id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_edition ALTER COLUMN id SET DEFAULT nextval('public.app_books_edition_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 16630)
-- Name: app_library_library id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_library_library ALTER COLUMN id SET DEFAULT nextval('public.app_library_library_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 16467)
-- Name: app_user_user id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user ALTER COLUMN id SET DEFAULT nextval('public.app_user_user_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 16478)
-- Name: app_user_user_groups id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user_groups ALTER COLUMN id SET DEFAULT nextval('public.app_user_user_groups_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 16485)
-- Name: app_user_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.app_user_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 16425)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 16434)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 16418)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 16521)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 16409)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 16400)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3512 (class 0 OID 16540)
-- Dependencies: 228
-- Data for Name: app_books_author; Type: TABLE DATA; Schema: public; Owner: veille
--

INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (1, 'C. Martin', 'Robert', '', 'c-martin-robert');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (2, 'Jacobson', 'Ivar', '', 'jacobson-ivar');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (3, 'Sztandarowski', 'Lucas', 'https://twitter.com/lsztandarowski', 'sztandarowski-lucas');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (4, 'Ziadé', 'Tarek', 'https://www.linkedin.com/in/tarekziade/', 'ziade-tarek');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (5, 'Prieur', 'Benoit', 'https://www.linkedin.com/in/benoitprieur/', 'prieur-benoit');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (6, 'Boucheny', 'Vincent', '', 'boucheny-vincent');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (7, 'Lardiere', 'Sébastien', 'https://www.linkedin.com/in/s%C3%A9bastien-lardi%C3%A8re-8381a814/', 'lardiere-sebastien');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (8, 'Caliendo', 'Julien', 'https://www.linkedin.com/in/caliendojulien/', 'caliendo-julien');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (9, 'Debrauwer', 'Laurent', 'https://www.linkedin.com/in/laurent-debrauwer-a111b810/', 'debrauwer-laurent');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (10, 'Bornet', 'Martial', 'https://www.linkedin.com/in/martial-bornet-9834421/', 'bornet-martial');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (11, 'Rohaut', 'Sébastien', 'https://www.linkedin.com/in/s%C3%A9bastien-rohaut-808a4366/', 'rohaut-sebastien');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (12, 'Dordoigne', 'José', 'https://www.linkedin.com/in/jose-dordoigne-06452410/', 'dordoigne-jose');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (13, 'Schalkwijk', 'Laurent', 'https://www.linkedin.com/in/laurentschalkwijk/', 'schalkwijk-laurent');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (14, 'La Lau', 'Robert', '', 'la-lau-robert');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (15, 'Cizault', 'Gisèle', '', 'cizault-gisele');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (16, 'Leite', 'Ernesto', 'https://www.linkedin.com/in/ernestoleite/', 'leite-ernesto');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (17, 'Dauzon', 'Samuel', 'https://www.linkedin.com/in/samuel-dauzon-4ab1715b/', 'dauzon-samuel');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (18, 'Perré', 'Yannig', 'https://www.linkedin.com/in/yannigperre/', 'perre-yannig');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (19, 'Rosard', 'Frédéric', 'https://www.linkedin.com/in/jp-gouigoux/', 'frederic-rosard');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (20, 'Bonnet', 'Christophe', '', 'bonnet-christophe');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (21, 'Samson', 'Patrick', 'https://www.linkedin.com/in/patrick-samson-2093451aa/', 'samson-patrick');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (22, 'Baud', 'Jean-Luc', '', 'baud-jean-luc');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (23, 'Poggioli', 'Jean-Paul', 'https://www.linkedin.com/in/jean-paul-poggioli/', 'poggioli-jean-paul');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (24, 'Clave', 'Antoine', 'https://www.linkedin.com/in/antoine-clave-55965510/', 'clave-antoine');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (25, 'Bailet', 'Thomas', 'https://www.linkedin.com/in/thomas-bailet-95aa598/', 'bailet-thomas');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (26, 'Macé', 'Noel', 'https://www.linkedin.com/in/noelmace/', 'mace-noel');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (27, 'Haro', 'Christophe', '', 'haro-christophe');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (28, 'KOKAINA', 'Sallah', 'https://www.linkedin.com/in/sallah-k/', 'kokaina-sallah');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (29, 'Fowler', 'Martin', 'https://martinfowler.com/', 'fowler-martin');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (30, 'Patton', 'Jeff', 'https://www.jpattonassociates.com/', 'patton-jeff');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (31, 'Nebra', 'Mathieu', 'https://www.linkedin.com/in/mathieunebra/', 'nebra-mathieu');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (32, 'Le Goff', 'Vincent', '', 'le-goff-vincent');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (33, 'Thuillier', 'Victor', '', 'thuillier-victor');
INSERT INTO public.app_books_author (id, name, lastname, contact, slug) VALUES (34, 'Gribaumont', 'Chantal', 'https://www.linkedin.com/in/cgribaumont/', 'gribaumont-chantal');


--
-- TOC entry 3514 (class 0 OID 16551)
-- Dependencies: 230
-- Data for Name: app_books_book; Type: TABLE DATA; Schema: public; Owner: veille
--

INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (1, 'Manuel de l''autodidacte en informatique', 370, 0, '0244878013', 'https://www.amazon.fr/Manuel-lautodidacte-informatique-Lucas-Sztandarowski/dp/0244878013', 'manuel-de-lautodidacte-en-informatique', 'https://m.media-amazon.com/images/P/0244878013.01._SCLZZZZZZZ_SX500_.jpg', 3, 1);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (2, 'Le génie logiciel orienté objet: Une approche fondée sur les cas d''utilisation', 536, 0, '2879080428', 'https://www.amazon.fr/g%C3%A9nie-logiciel-orient%C3%A9-objet-dutilisation/dp/2879080428', 'le-genie-logiciel-oriente-objet-une-approche-fondee-sur-les-cas-dutilisation', 'https://m.media-amazon.com/images/I/5184v2dPsjL._SX338_BO1,204,203,200_.jpg', 2, 2);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (3, 'CommitStrip - Le Livre des Codeurs', 128, 0, '2954706201', 'https://www.amazon.fr/CommitStrip-Livre-Codeurs-Issartial/dp/2954706201', 'commitstrip-le-livre-des-codeurs', 'https://m.media-amazon.com/images/I/41DrLuK12fL._SX414_BO1,204,203,200_.jpg', NULL, NULL);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (4, 'GESTION DE PROJET EXTREME PROGRAMMING', 310, 0, '221211561X', 'https://www.amazon.fr/Gestion-projet-Programming-Jean-Louis-B%C3%A9nard/dp/221211561X', 'gestion-de-projet-extreme-programming', 'https://m.media-amazon.com/images/I/41PxnNbWjML._SX420_BO1,204,203,200_.jpg', NULL, NULL);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (5, 'Scrum, de la théorie à la pratique: Initiation. Perfectionnement. Agilité.', 248, 0, '2212144709', 'https://www.amazon.fr/Scrum-th%C3%A9orie-pratique-Initiation-Perfectionnement/dp/2212144709', 'scrum-de-la-theorie-a-la-pratique-initiation-perfectionnement-agilite', 'https://m.media-amazon.com/images/I/41gNKt0+9cL._SX410_BO1,204,203,200_.jpg', NULL, NULL);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (6, 'Architecture logicielle propre', 336, 0, '2326002679', 'https://www.amazon.fr/Architecture-logicielle-propre-Robert-C-Martin/dp/2326002679', 'architecture-logicielle-propre', 'https://m.media-amazon.com/images/P/B08P7H2WHN.01._SCLZZZZZZZ_SX500_.jpg', 1, 4);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (7, 'CODER PROPREMENT', 457, 0, '232600227X', 'https://www.amazon.fr/Coder-proprement-Robert-C-Martin/dp/232600227X', 'coder-proprement', 'https://m.media-amazon.com/images/I/417hCFT+RqL._SX406_BO1,204,203,200_.jpg', 1, 4);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (8, 'Proprement Codeur. Code de conduite pour développeur professionnel', 199, 0, '232600289X', 'https://www.amazon.fr/Proprement-Codeur-conduite-d%C3%A9veloppeur-professionnel/dp/232600289X/ref=pd_bxgy_sccl_2/262-5604381-8597241?pd_rd_w=xNExZ&content-id=amzn1.sym.3e903e31-26aa-46b7-bc9c-c2062226', 'proprement-codeur-code-de-conduite-pour-developpeur-professionnel', 'https://m.media-amazon.com/images/P/B09RT9153J.01._SCLZZZZZZZ_SX500_.jpg', 1, 4);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (9, 'Agile proprement. Retour à l''essentiel', 175, 0, '2326002865', 'https://www.pearson.fr/fr/book/?GCOI=27440100017670', 'agile-proprement-retour-a-lessentiel', 'https://m.media-amazon.com/images/I/4160clbbm8L._SX411_BO1,204,203,200_.jpg', 1, 4);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (10, 'Installation et configuration d''un serveur internet (BIND, Apache, Nginx, Dovecot, Postfix...)', 453, 0, '978-2-409-026', 'https://www.editions-eni.fr/livre/installation-et-configuration-d-un-serveur-internet-bind-apache-nginx-dovecot-postfix-9782409026027?gclid=Cj0KCQjw4omaBhDqARIsADXULuXprWT4wHSUlOiYgEwAACj7BCwD5W-nmTHs', 'installation-et-configuration-dun-serveur-internet-bind-apache-nginx-dovecot-postfix', 'https://www.editions-eni.fr/livre/installation-et-configuration-d-un-serveur-internet-bind-apache-nginx-dovecot-postfix-9782409026027_XL.jpg', 14, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (11, 'Les réseaux avec Cisco Connaissances approfondies sur les réseaux', 542, 0, '978-2-409-02', 'https://www.editions-eni.fr/livre/les-reseaux-avec-cisco-connaissances-approfondies-sur-les-reseaux-4e-edition-9782409026690', 'les-reseaux-avec-cisco-connaissances-approfondies-sur-les-reseaux', 'https://www.editions-eni.fr/livre/les-reseaux-avec-cisco-connaissances-approfondies-sur-les-reseaux-4e-edition-9782409026690_XL.jpg', 13, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (12, 'Réseaux informatiques Notions fondamentales (9e édition) - (Protocoles, Architectures, Réseaux sans fil...)', 804, 0, '978-2-409-035', 'https://www.editions-eni.fr/livre/reseaux-informatiques-notions-fondamentales-9e-edition-protocoles-architectures-reseaux-sans-fil-9782409035173', 'reseaux-informatiques-notions-fondamentales-9e-edition-protocoles-architectures-reseaux-sans-fil', 'https://www.editions-eni.fr/livre/reseaux-informatiques-notions-fondamentales-9e-edition-protocoles-architectures-reseaux-sans-fil-9782409035173_XL.jpg', 12, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (13, 'LINUX Maîtrisez l''administration du système (6e édition)', 826, 0, '978-2-409-025', 'https://www.editions-eni.fr/livre/linux-maitrisez-l-administration-du-systeme-6e-edition-9782409025716', 'linux-maitrisez-ladministration-du-systeme-6e-edition', 'https://www.editions-eni.fr/livre/linux-maitrisez-l-administration-du-systeme-6e-edition-9782409025716_XL.jpg', 11, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (14, 'Expressions régulières Syntaxe et mise en oeuvre (avec exercices et corrigés)', 465, 0, '978-2-7460-9', 'https://www.editions-eni.fr/livre/expressions-regulieres-syntaxe-et-mise-en-oeuvre-avec-exercices-et-corriges-9782746097124', 'expressions-regulieres-syntaxe-et-mise-en-oeuvre-avec-exercices-et-corriges', 'https://www.editions-eni.fr/livre/expressions-regulieres-syntaxe-et-mise-en-oeuvre-avec-exercices-et-corriges-9782746097124_XL.jpg', 10, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (15, 'UML 2.5 Initiation, exemples et exercices corrigés (5e édition)', 341, 0, '978-2-409-024', 'https://www.editions-eni.fr/livre/uml-2-5-initiation-exemples-et-exercices-corriges-5e-edition-9782409024085', 'uml-25-initiation-exemples-et-exercices-corriges-5e-edition', 'https://www.editions-eni.fr/livre/uml-2-5-initiation-exemples-et-exercices-corriges-5e-edition-9782409024085_XL.jpg', 9, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (16, 'JavaScript et Angular Des bases du langage au développement d''une application web', 413, 0, '978-2-409-024', 'https://www.editions-eni.fr/livre/javascript-et-angular-des-bases-du-langage-au-developpement-d-une-application-web-9782409024702', 'javascript-et-angular-des-bases-du-langage-au-developpement-dune-application-web', 'https://www.editions-eni.fr/livre/javascript-et-angular-des-bases-du-langage-au-developpement-d-une-application-web-9782409024702_XL.jpg', 8, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (17, 'PostgreSQL Principes de base de l''utilisation de la base de données', 254, 0, '978-2-409-024', 'https://www.editions-eni.fr/livre/postgresql-principes-de-base-de-l-utilisation-de-la-base-de-donnees-9782409024504', 'postgresql-principes-de-base-de-lutilisation-de-la-base-de-donnees', 'https://www.editions-eni.fr/livre/postgresql-principes-de-base-de-l-utilisation-de-la-base-de-donnees-9782409024504_XL.jpg', 7, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (18, 'Apprendre la Programmation Orientée Objet avec le langage Python (avec exercices pratiques et corrigés) (2e édition)', 282, 0, '978-2-409-026', 'https://www.editions-eni.fr/livre/apprendre-la-programmation-orientee-objet-avec-le-langage-python-avec-exercices-pratiques-et-corriges-2e-edition-9782409026539', 'apprendre-la-programmation-orientee-objet-avec-le-langage-python-avec-exercices-pratiques-et-corriges-2e-edition', 'https://www.editions-eni.fr/livre/apprendre-la-programmation-orientee-objet-avec-le-langage-python-avec-exercices-pratiques-et-corriges-2e-edition-9782409026539_XL.jpg', 6, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (19, 'Pygame Initiez-vous au développement de jeux vidéo en Python', 20, 0, '978-2-409-021', 'https://www.editions-eni.fr/livre/pygame-initiez-vous-au-developpement-de-jeux-video-en-python-9782409021688', 'pygame-initiez-vous-au-developpement-de-jeux-video-en-python', 'https://www.editions-eni.fr/livre/pygame-initiez-vous-au-developpement-de-jeux-video-en-python-9782409021688_XL.jpg', 5, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (20, 'Python Petit guide à l''usage du développeur agile', 192, 0, '9782100508839', 'https://www.dunod.com/sciences-techniques/python-petit-guide-usage-du-developpeur-agile', 'python-petit-guide-a-lusage-du-developpeur-agile', 'https://www.dunod.com/sites/default/files/styles/principal_desktop/public/thumbnails/image/9782100508839-T.jpg', 4, 5);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (21, 'Django Développez vos applications web en Python (fonctionnalités essentielles et bonnes pratiques)', 388, 0, '978-2-409-024', 'https://www.editions-eni.fr/livre/django-developpez-vos-applications-web-en-python-fonctionnalites-essentielles-et-bonnes-pratiques-9782409024177', 'django-developpez-vos-applications-web-en-python-fonctionnalites-essentielles-et-bonnes-pratiques', 'https://www.editions-eni.fr/livre/django-developpez-vos-applications-web-en-python-fonctionnalites-essentielles-et-bonnes-pratiques-9782409024177_XL.jpg', 21, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (22, 'Scripting Python sous Linux Développez vos outils système', 763, 0, '978-2-409-02', 'https://www.editions-eni.fr/livre/scripting-python-sous-linux-developpez-vos-outils-systeme-9782409025679', 'scripting-python-sous-linux-developpez-vos-outils-systeme', 'https://www.editions-eni.fr/livre/scripting-python-sous-linux-developpez-vos-outils-systeme-9782409025679_XL.jpg', 20, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (23, 'Docker Concepts fondamentaux et déploiement d''applications distribuées', 667, 0, '978-2-409-028', 'https://www.editions-eni.fr/livre/docker-concepts-fondamentaux-et-deploiement-d-applications-distribuees-9782409028588', 'docker-concepts-fondamentaux-et-deploiement-dapplications-distribuees', 'https://www.editions-eni.fr/livre/docker-concepts-fondamentaux-et-deploiement-d-applications-distribuees-9782409028588_XL.jpg', NULL, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (24, 'Lexipro ; les mots clés de l''informatique et d''Internet ; BTS, IUT, licence (édition bilingue français/anglais)', 123, 0, '9782749539072', 'https://www.librairie-levrailieu.fr/livre/9782749539072-lexipro-les-mots-cles-de-l-informatique-et-d-internet-bts-iut-licence-frederic-rosard/', 'lexipro-les-mots-cles-de-linformatique-et-dinternet-bts-iut-licence-edition-bilingue-francaisanglais', 'https://cdn.shopify.com/s/files/1/0277/1481/4041/products/41MapJK_rJL._SL800_321x.jpg?v=1663865351', 19, NULL);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (25, 'Ansible Gérez la configuration de vos serveurs et le déploiement de vos applications (2e édition)', 529, 0, '978-2-409-025', 'https://www.editions-eni.fr/livre/ansible-gerez-la-configuration-de-vos-serveurs-et-le-deploiement-de-vos-applications-2e-edition-9782409025259', 'ansible-gerez-la-configuration-de-vos-serveurs-et-le-deploiement-de-vos-applications-2e-edition', 'https://www.editions-eni.fr/livre/ansible-gerez-la-configuration-de-vos-serveurs-et-le-deploiement-de-vos-applications-2e-edition-9782409025259_XL.jpg', 18, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (26, 'Git Maîtrisez la gestion de vos versions (concepts, utilisation et cas pratiques)', 395, 0, '978-2-409-031', 'https://www.editions-eni.fr/livre/git-maitrisez-la-gestion-de-vos-versions-concepts-utilisation-et-cas-pratiques-3e-edition-9782409031052', 'git-maitrisez-la-gestion-de-vos-versions-concepts-utilisation-et-cas-pratiques', 'https://www.editions-eni.fr/livre/git-maitrisez-la-gestion-de-vos-versions-concepts-utilisation-et-cas-pratiques-3e-edition-9782409031052_XL.jpg', 17, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (27, 'DevOps Intégrez et déployez en continu (avec exemple clés en main)', 364, 0, '978-2-409-017', 'https://www.editions-eni.fr/livre/devops-integrez-et-deployez-en-continu-avec-exemple-cles-en-main-9782409017155', 'devops-integrez-et-deployez-en-continu-avec-exemple-cles-en-main', 'https://www.editions-eni.fr/livre/devops-integrez-et-deployez-en-continu-avec-exemple-cles-en-main-9782409017155_XL.jpg', 16, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (28, 'Les réseaux (2° Éd.) Principes fondamentaux', 208, 0, '2746246597', 'https://www.lavoisier.fr/livre/informatique/les-reseaux-principes-fondamentaux-2e-ed/rolin/descriptif-9782746246591', 'les-reseaux-2-ed-principes-fondamentaux', 'https://images.lavoisier.net/couvertures/1316942826.jpg', NULL, 7);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (29, 'IPv6 - Théorie et pratique', 467, 0, '284177337X', 'https://www.amazon.fr/IPv6-Th%C3%A9orie-pratique-Gis%C3%A8le-Cizault/dp/284177337X', 'ipv6-theorie-et-pratique', 'https://m.media-amazon.com/images/I/41JX4JG8RQL._SX341_BO1,204,203,200_.jpg', 15, NULL);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (30, 'Apprendre la programmation web avec Python et Django: Principes et bonnes pratiques pour les sites web dynamiques', 368, 0, '2212675151', 'https://www.amazon.fr/Apprendre-programmation-avec-Python-Django/dp/2212675151/ref=asc_df_2212675151/?tag=googshopfr-21&linkCode=df0&hvadid=227996157743&hvpos=&hvnetw=g&hvrand=13494519384469402903&hvp', 'apprendre-la-programmation-web-avec-python-et-django-principes-et-bonnes-pratiques-pour-les-sites-web-dynamiques', 'https://m.media-amazon.com/images/P/B078WHRJPB.01._SCLZZZZZZZ_SX500_.jpg', NULL, 3);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (31, 'Software Craftsmanship L''art du code et de l''agilité technique en entreprise', 282, 0, '978-2-409-021', 'https://www.editions-eni.fr/livre/software-craftsmanship-l-art-du-code-et-de-l-agilite-technique-en-entreprise-9782409021534', 'software-craftsmanship-lart-du-code-et-de-lagilite-technique-en-entreprise', 'https://www.editions-eni.fr/livre/software-craftsmanship-l-art-du-code-et-de-l-agilite-technique-en-entreprise-9782409021534_XL.jpg', 28, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (32, 'Algorithmique Raisonner pour concevoir', 585, 0, '978-2-409-024', 'https://www.editions-eni.fr/livre/algorithmique-raisonner-pour-concevoir-3e-edition-9782409024412', 'algorithmique-raisonner-pour-concevoir', 'https://www.editions-eni.fr/livre/algorithmique-raisonner-pour-concevoir-3e-edition-9782409024412_XL.jpg', 27, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (33, 'Développement et architecture des Applications Web Modernes Retrouver les fondamentaux', 608, 0, '978-2-409-029', 'https://www.editions-eni.fr/livre/developpement-et-architecture-des-applications-web-modernes-retrouver-les-fondamentaux-9782409029523', 'developpement-et-architecture-des-applications-web-modernes-retrouver-les-fondamentaux', 'https://www.editions-eni.fr/livre/developpement-et-architecture-des-applications-web-modernes-retrouver-les-fondamentaux-9782409029523_XL.jpg', 26, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (34, 'Architecture logicielle Pour une approche organisationnelle, fonctionnelle et technique', 474, 0, '978-2-7460-9', 'https://www.editions-eni.fr/livre/architecture-logicielle-pour-une-approche-organisationnelle-fonctionnelle-et-technique-2e-edition-9782746099210', 'architecture-logicielle-pour-une-approche-organisationnelle-fonctionnelle-et-technique', 'https://www.editions-eni.fr/livre/architecture-logicielle-pour-une-approche-organisationnelle-fonctionnelle-et-technique-2e-edition-9782746099210_XL.jpg', 25, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (35, 'UML au service de l''analyse des métiers (Business Analysis)', 0, 0, '978-2-409-000', 'https://www.editions-eni.fr/livre/uml-au-service-de-l-analyse-des-metiers-business-analysis-9782409000973', 'uml-au-service-de-lanalyse-des-metiers-business-analysis', 'https://www.editions-eni.fr/livre/uml-au-service-de-l-analyse-des-metiers-business-analysis-9782409000973_XL.jpg', 24, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (36, 'Pilotage d''un système d''information Méthode et bonnes pratiques', 270, 0, '978-2-409-029', 'https://www.editions-eni.fr/livre/pilotage-d-un-systeme-d-information-methode-et-bonnes-pratiques-2e-edition-9782409029059', 'pilotage-dun-systeme-dinformation-methode-et-bonnes-pratiques', 'https://www.editions-eni.fr/livre/pilotage-d-un-systeme-d-information-methode-et-bonnes-pratiques-2e-edition-9782409029059_XL.jpg', 23, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (37, 'ITIL® 4 Comprendre la démarche et adopter les bonnes pratiques', 400, 0, '978-2-409-036', 'https://www.editions-eni.fr/livre/itil-4-comprendre-la-demarche-et-adopter-les-bonnes-pratiques-2e-edition-9782409036354', 'itil-4-comprendre-la-demarche-et-adopter-les-bonnes-pratiques', 'https://www.editions-eni.fr/livre/itil-4-comprendre-la-demarche-et-adopter-les-bonnes-pratiques-2e-edition-9782409036354_XL.jpg', 22, 6);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (38, 'Refactoring Comment améliorer le code existant', 432, 0, '9782100801169', 'https://www.dunod.com/sciences-techniques/refactoring-comment-ameliorer-code-existant?gclid=Cj0KCQjw4omaBhDqARIsADXULuUII19okyMaBDqyVrAO6yKMizqcgwSB1KLgtjnspgFgUjt5jl5Z_EEaAuoUEALw_wcB', 'refactoring-comment-ameliorer-le-code-existant', 'https://www.dunod.com/sites/default/files/styles/principal_desktop/public/thumbnails/image/9782100801169-001-X.jpeg', 29, 5);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (39, 'Le story mapping Visualisez vos user stories pour développer le bon produit', 0, 0, '9782100810284', 'https://www.dunod.com/sciences-techniques/story-mapping-visualisez-vos-user-stories-pour-developper-bon-produit-0', 'le-story-mapping-visualisez-vos-user-stories-pour-developper-le-bon-produit', 'https://www.dunod.com/sites/default/files/styles/principal_desktop/public/thumbnails/image/9782100810284-001-X.jpeg', 30, 5);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (40, 'Le web sémantique Comment lier les données et les schémas sur le web ?', 224, 0, '9782100572946', 'https://www.dunod.com/sciences-techniques/web-semantique-comment-lier-donnees-et-schemas-sur-web', 'le-web-semantique-comment-lier-les-donnees-et-les-schemas-sur-le-web', 'https://www.dunod.com/sites/default/files/styles/principal_desktop/public/thumbnails/image/9782100572946-T.jpg', NULL, 5);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (41, 'Programmez en orienté objet en PHP', 474, 0, '2212144725', 'https://www.editions-eyrolles.com/Livre/9782212144727/programmez-en-oriente-objet-en-php', 'programmez-en-oriente-objet-en-php', 'https://servimg.eyrolles.com/static/media/4727/9782212144727_internet_w290.jpg', 33, 3);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (42, 'Apprenez à  programmer en Python', 520, 0, '241600655X', 'https://www.editions-eyrolles.com/Livre/9782416006555/apprenez-a-programmer-en-python', 'apprenez-a-programmer-en-python', 'https://servimg.eyrolles.com/static/media/6555/9782416006555_internet_w290.jpg', 32, 3);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (43, 'Réalisez votre site web avec HTML 5 et CSS 3', 364, 0, '2-212-67476-7', 'https://www.editions-eyrolles.com/Livre/9782212674767/realisez-votre-site-web-avec-html-5-et-css-3', 'realisez-votre-site-web-avec-html-5-et-css-3', 'https://servimg.eyrolles.com/static/media/4767/9782212674767_internet_w290.jpg', 31, 3);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (44, 'Apprenez à programmer en C', 528, 0, '10-90085-87-7', 'https://www.editions-eyrolles.com/Livre/9791090085879/apprenez-a-programmer-en-c', 'apprenez-a-programmer-en-c', 'https://servimg.eyrolles.com/static/media/5879/9791090085879_internet_w290.jpg', 31, 3);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (45, 'Administrez vos bases de données avec MySQL', 502, 0, '979-109008567', 'https://www.amazon.fr/Administrez-bases-donn%C3%A9es-avec-MySQL/dp/B00KR7SI3C/ref=sr_1_1?qid=1665334348&refinements=p_27%3AChantal+Gribaumont&s=books&sr=1-1', 'administrez-vos-bases-de-donnees-avec-mysql', 'https://m.media-amazon.com/images/I/31MfJsXLVSL._SX346_BO1,204,203,200_.jpg', 34, 3);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (46, 'Programmer en s''amusant avec Python 2e édition Pour les Nuls', 320, 0, '9782412039564', 'https://www.pourlesnuls.fr/livres/informatique/programmer-en-s-amusant-avec-python-2e-edition-pour-les-nuls-9782412039564', 'programmer-en-samusant-avec-python-2e-edition-pour-les-nuls', 'https://www.pourlesnuls.fr/sites/pourlesnuls.edinul-pw01.msp.fr.clara.net/files/styles/visuel_fiche_livre/public/9782412039564.jpg?itok=Co6xWVhH', NULL, NULL);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (47, 'Python & JavaScript pour les Nuls, mégapoche', 704, 0, '9782412057919', 'https://www.pourlesnuls.fr/livres/informatique/python-javascript-pour-les-nuls-megapoche-9782412057919', 'python-javascript-pour-les-nuls-megapoche', 'https://www.pourlesnuls.fr/sites/pourlesnuls.edinul-pw01.msp.fr.clara.net/files/styles/visuel_fiche_livre/public/9782412057919.jpg?itok=QLG6qFtA', NULL, NULL);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (48, 'Programmer en s''amusant avec JavaScript 2e éd pour les Nuls', 360, 0, '9782412045152', 'https://www.pourlesnuls.fr/livres/informatique/programmer-en-s-amusant-avec-javascript-2e-ed-pour-les-nuls-9782412045152', 'programmer-en-samusant-avec-javascript-2e-ed-pour-les-nuls', 'https://www.pourlesnuls.fr/sites/pourlesnuls.edinul-pw01.msp.fr.clara.net/files/styles/visuel_fiche_livre/public/9782412045152.jpg?itok=7j8Mau6Z', NULL, NULL);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (49, 'WordPress pour les Nuls, grand format', 384, 0, '9782412068762', 'https://www.pourlesnuls.fr/livres/informatique/wordpress-pour-les-nuls-grand-format-5-ed-9782412068762', 'wordpress-pour-les-nuls-grand-format', 'https://www.pourlesnuls.fr/sites/pourlesnuls.edinul-pw01.msp.fr.clara.net/files/styles/visuel_fiche_livre/public/9782412068762.jpg?itok=64hPCLqt', NULL, NULL);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (51, 'HTML avec CSS et XHTML Tête la première', 657, 0, '2841774139', 'https://www.amazon.fr/HTML-avec-XHTML-T%C3%AAte-premi%C3%A8re/dp/2841774139/ref=sr_1_7?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=VTK02PTQY0MA&keywords=html+t%C3%AAte+la+premi%C3%A8re&qid=1665335', 'html-avec-css-et-xhtml-tete-la-premiere', 'https://m.media-amazon.com/images/I/51CZinTfREL._SX426_BO1,204,203,200_.jpg', NULL, 8);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (50, 'Design patterns Tête la première', 639, 0, '2841773507', 'https://www.amazon.fr/Design-patterns-Eric-Freeman/dp/2841773507/ref=sr_1_13?keywords=Design+patterns+t%C3%AAte+la+premi%C3%A8re&qid=1665335070&qu=eyJxc2MiOiIxLjIzIiwicXNhIjoiMS4wMCIsInFzcCI6IjAuMDAif', 'design-patterns', 'https://m.media-amazon.com/images/I/516XECZXY3L._SX403_BO1,204,203,200_.jpg', NULL, 8);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (52, 'SQL Tête la première', 574, 0, '2841774708', 'https://www.amazon.fr/SQL-Lynn-Beighley/dp/2841774708/ref=sr_1_20?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=2KK5GFDQA3BOS&keywords=sql+t%C3%AAte+la+premi%C3%A8re&qid=1665335392&qu=eyJxc2MiOiIwLj', 'sql-tete-la-rpemiere', 'https://m.media-amazon.com/images/I/51f36gvhaZL._SX427_BO1,204,203,200_.jpg', NULL, 8);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (53, 'Le web mobile tête la première', 468, 0, '2100581791', 'https://www.amazon.fr/web-mobile-t%C3%AAte-premi%C3%A8re/dp/2100581791/ref=sr_1_1?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=2L5IJVRYSF27Q&keywords=web+mobile+t%C3%AAte+la+premi%C3%A8re&qid=16653', 'le-web-mobile-tete-la-premiere', 'https://m.media-amazon.com/images/I/51u3qOd2QjL._SX394_BO1,204,203,200_.jpg', NULL, 8);
INSERT INTO public.app_books_book (id, title, count_pages, current_page, "ISBN", more_infos, slug, couverture, author_id, edition_id) VALUES (54, 'Analyse et conception orientées objet Tête la première', 600, 0, '2841774317', 'https://www.amazon.fr/Analyse-conception-orient%C3%A9es-objet-McLaughlin/dp/2841774317/ref=sr_1_27?__mk_fr_FR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=LAMU7EXR4VIC&keywords=analyse+et+conception+t%C3%AAte', 'analyse-et-conception-orientees-objet-tete-la-premiere', 'https://m.media-amazon.com/images/I/51tN+T0B9VL._SX430_BO1,204,203,200_.jpg', NULL, 8);


--
-- TOC entry 3518 (class 0 OID 16575)
-- Dependencies: 234
-- Data for Name: app_books_category; Type: TABLE DATA; Schema: public; Owner: veille
--

INSERT INTO public.app_books_category (id, name, slug) VALUES (1, 'langage', 'langage');
INSERT INTO public.app_books_category (id, name, slug) VALUES (2, 'python', 'python');
INSERT INTO public.app_books_category (id, name, slug) VALUES (3, 'reseaux', 'reseaux');
INSERT INTO public.app_books_category (id, name, slug) VALUES (4, 'linux', 'linux');


--
-- TOC entry 3520 (class 0 OID 16588)
-- Dependencies: 236
-- Data for Name: app_books_category_category; Type: TABLE DATA; Schema: public; Owner: veille
--

INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (3, 1, 19);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (4, 2, 42);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (5, 2, 46);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (6, 2, 18);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (7, 2, 19);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (8, 2, 21);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (9, 2, 30);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (10, 3, 10);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (11, 3, 11);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (12, 3, 12);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (13, 3, 28);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (14, 3, 29);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (15, 4, 13);
INSERT INTO public.app_books_category_category (id, category_id, book_id) VALUES (16, 4, 22);


--
-- TOC entry 3516 (class 0 OID 16562)
-- Dependencies: 232
-- Data for Name: app_books_edition; Type: TABLE DATA; Schema: public; Owner: veille
--

INSERT INTO public.app_books_edition (id, name, slug) VALUES (1, 'Editions Cyberdéfenseur', 'editions-cyberdefenseur');
INSERT INTO public.app_books_edition (id, name, slug) VALUES (2, 'editions addison-wesley', 'editions-addison-wesley');
INSERT INTO public.app_books_edition (id, name, slug) VALUES (3, 'Eyrolles', 'eyrolles');
INSERT INTO public.app_books_edition (id, name, slug) VALUES (4, 'Pearson', 'pearson');
INSERT INTO public.app_books_edition (id, name, slug) VALUES (5, 'Dunod', 'dunod');
INSERT INTO public.app_books_edition (id, name, slug) VALUES (6, 'ENI', 'eni');
INSERT INTO public.app_books_edition (id, name, slug) VALUES (7, 'Editions Lavoisier', 'editions-lavoisier');
INSERT INTO public.app_books_edition (id, name, slug) VALUES (8, 'O''REILLY', 'oreilly');


--
-- TOC entry 3522 (class 0 OID 16627)
-- Dependencies: 238
-- Data for Name: app_library_library; Type: TABLE DATA; Schema: public; Owner: veille
--



--
-- TOC entry 3504 (class 0 OID 16464)
-- Dependencies: 220
-- Data for Name: app_user_user; Type: TABLE DATA; Schema: public; Owner: veille
--

INSERT INTO public.app_user_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, email) VALUES (1, 'pbkdf2_sha256$320000$kBU5AFeRSt3vQ2WALBZunC$cCAFFJWrFbQsiQLRrmIycHyo2/btacxTZ6x3+9lWfI0=', '2022-10-06 06:38:58.913207+02', true, '', '', true, true, '2022-10-06 06:13:46.361444+02', 'test@test.com');


--
-- TOC entry 3506 (class 0 OID 16475)
-- Dependencies: 222
-- Data for Name: app_user_user_groups; Type: TABLE DATA; Schema: public; Owner: veille
--



--
-- TOC entry 3508 (class 0 OID 16482)
-- Dependencies: 224
-- Data for Name: app_user_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: veille
--



--
-- TOC entry 3500 (class 0 OID 16422)
-- Dependencies: 216
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: veille
--



--
-- TOC entry 3502 (class 0 OID 16431)
-- Dependencies: 218
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: veille
--



--
-- TOC entry 3498 (class 0 OID 16415)
-- Dependencies: 214
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: veille
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add Auteur(e)', 6, 'add_author');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change Auteur(e)', 6, 'change_author');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete Auteur(e)', 6, 'delete_author');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view Auteur(e)', 6, 'view_author');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add Livre', 7, 'add_book');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change Livre', 7, 'change_book');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete Livre', 7, 'delete_book');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view Livre', 7, 'view_book');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add Editeur', 8, 'add_edition');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change Editeur', 8, 'change_edition');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete Editeur', 8, 'delete_edition');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view Editeur', 8, 'view_edition');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add Catégorie', 9, 'add_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change Catégorie', 9, 'change_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete Catégorie', 9, 'delete_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view Catégorie', 9, 'view_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add user', 10, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change user', 10, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete user', 10, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view user', 10, 'view_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can add library', 11, 'add_library');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can change library', 11, 'change_library');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can delete library', 11, 'delete_library');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can view library', 11, 'view_library');


--
-- TOC entry 3510 (class 0 OID 16518)
-- Dependencies: 226
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: veille
--

INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2022-10-09 13:16:42.247277+02', '1', 'editions-cyberdefenseur', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2022-10-09 13:19:26.046305+02', '2', 'editions-addison-wesley', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2022-10-09 13:19:45.203396+02', '3', 'eyrolles', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2022-10-09 13:20:02.532155+02', '4', 'pearson', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2022-10-09 13:21:35.592708+02', '1', 'c-martin-robert', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2022-10-09 13:22:06.95403+02', '2', 'jacobson-ivar', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2022-10-09 13:26:43.388812+02', '3', 'sztandarowski-lucas', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2022-10-09 13:30:55.687005+02', '1', 'manuel-de-lautodidacte-en-informatique', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2022-10-09 13:36:27.20475+02', '2', 'le-genie-logiciel-oriente-objet-une-approche-fondee-sur-les-cas-dutilisation', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2022-10-09 13:39:38.999679+02', '3', 'commitstrip-le-livre-des-codeurs', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2022-10-09 13:41:36.045607+02', '4', 'gestion-de-projet-extreme-programming', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2022-10-09 13:43:50.106892+02', '5', 'scrum-de-la-theorie-a-la-pratique-initiation-perfectionnement-agilite', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2022-10-09 13:53:44.079543+02', '6', 'architecture-logicielle-propre', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2022-10-09 13:55:38.298153+02', '7', 'coder-proprement', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (15, '2022-10-09 13:57:26.222782+02', '8', 'proprement-codeur-code-de-conduite-pour-developpeur-professionnel', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (16, '2022-10-09 14:01:03.891316+02', '9', 'agile-proprement-retour-a-lessentiel', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (17, '2022-10-09 14:03:40.735889+02', '5', 'dunod', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (18, '2022-10-09 14:03:50.606191+02', '6', 'eni', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (19, '2022-10-09 14:07:22.777017+02', '4', 'ziade-tarek', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (20, '2022-10-09 14:08:33.579929+02', '5', 'prieur-benoit', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (21, '2022-10-09 14:10:23.336562+02', '6', 'boucheny-vincent', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (22, '2022-10-09 14:11:14.583667+02', '7', 'lardiere-sebastien', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (23, '2022-10-09 14:13:56.939891+02', '8', 'caliendo-julien', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (24, '2022-10-09 14:14:23.123078+02', '9', 'debrauwer-laurent', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (25, '2022-10-09 14:16:56.356854+02', '10', 'bornet-martial', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (26, '2022-10-09 14:17:20.533311+02', '11', 'rohaut-sebastien', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (27, '2022-10-09 14:18:18.323529+02', '12', 'dordoigne-jose', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (28, '2022-10-09 14:19:25.705442+02', '13', 'schalkwijk-laurent', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (29, '2022-10-09 14:20:42.973487+02', '14', 'la-lau-robert', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (30, '2022-10-09 14:23:50.732362+02', '10', 'installation-et-configuration-dun-serveur-internet-bind-apache-nginx-dovecot-postfix', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (31, '2022-10-09 14:26:37.473771+02', '11', 'les-reseaux-avec-cisco-connaissances-approfondies-sur-les-reseaux', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (32, '2022-10-09 14:28:50.157205+02', '12', 'reseaux-informatiques-notions-fondamentales-9e-edition-protocoles-architectures-reseaux-sans-fil', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (33, '2022-10-09 14:30:49.534456+02', '13', 'linux-maitrisez-ladministration-du-systeme-6e-edition', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (34, '2022-10-09 14:32:25.246942+02', '14', 'expressions-regulieres-syntaxe-et-mise-en-oeuvre-avec-exercices-et-corriges', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (35, '2022-10-09 14:34:00.717349+02', '15', 'uml-25-initiation-exemples-et-exercices-corriges-5e-edition', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (36, '2022-10-09 14:36:25.963659+02', '16', 'javascript-et-angular-des-bases-du-langage-au-developpement-dune-application-web', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (37, '2022-10-09 16:51:02.701843+02', '17', 'postgresql-principes-de-base-de-lutilisation-de-la-base-de-donnees', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (38, '2022-10-09 16:53:46.122623+02', '18', 'apprendre-la-programmation-orientee-objet-avec-le-langage-python-avec-exercices-pratiques-et-corriges-2e-edition', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (39, '2022-10-09 16:55:19.85137+02', '19', 'pygame-initiez-vous-au-developpement-de-jeux-video-en-python', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (40, '2022-10-09 16:57:34.621782+02', '20', 'python-petit-guide-a-lusage-du-developpeur-agile', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (41, '2022-10-09 17:00:53.62317+02', '15', 'cizault-gisele', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (42, '2022-10-09 17:01:25.770688+02', '7', 'editions-lavoisier', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (43, '2022-10-09 17:02:53.138274+02', '16', 'leite-ernesto', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (44, '2022-10-09 17:03:42.600803+02', '17', 'dauzon-samuel', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (45, '2022-10-09 17:05:03.628919+02', '18', 'perre-yannig', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (46, '2022-10-09 17:06:42.71508+02', '19', 'frederic-rosard', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (47, '2022-10-09 17:07:15.189862+02', '19', 'frederic-rosard', 2, '[{"changed": {"fields": ["Nom", "Pr\u00e9nom"]}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (48, '2022-10-09 17:09:09.431289+02', '20', 'bonnet-christophe', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (49, '2022-10-09 17:09:51.947216+02', '21', 'samson-patrick', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (50, '2022-10-09 17:12:44.977174+02', '21', 'django-developpez-vos-applications-web-en-python-fonctionnalites-essentielles-et-bonnes-pratiques', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (51, '2022-10-09 17:14:10.765529+02', '22', 'scripting-python-sous-linux-developpez-vos-outils-systeme', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (52, '2022-10-09 17:16:24.321665+02', '23', 'docker-concepts-fondamentaux-et-deploiement-dapplications-distribuees', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (53, '2022-10-09 17:22:05.371693+02', '24', 'lexipro-les-mots-cles-de-linformatique-et-dinternet-bts-iut-licence-edition-bilingue-francaisanglais', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (54, '2022-10-09 17:23:40.060791+02', '25', 'ansible-gerez-la-configuration-de-vos-serveurs-et-le-deploiement-de-vos-applications-2e-edition', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (55, '2022-10-09 17:25:11.243782+02', '26', 'git-maitrisez-la-gestion-de-vos-versions-concepts-utilisation-et-cas-pratiques', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (56, '2022-10-09 17:27:08.896627+02', '27', 'devops-integrez-et-deployez-en-continu-avec-exemple-cles-en-main', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (57, '2022-10-09 17:31:40.458217+02', '28', 'les-reseaux-2-ed-principes-fondamentaux', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (58, '2022-10-09 17:35:12.38427+02', '29', 'ipv6-theorie-et-pratique', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (59, '2022-10-09 17:40:45.223975+02', '30', 'apprendre-la-programmation-web-avec-python-et-django-principes-et-bonnes-pratiques-pour-les-sites-web-dynamiques', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (60, '2022-10-09 17:42:12.558593+02', '22', 'baud-jean-luc', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (61, '2022-10-09 17:43:10.116299+02', '23', 'poggioli-jean-paul', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (62, '2022-10-09 17:43:56.006307+02', '24', 'clave-antoine', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (63, '2022-10-09 17:45:05.409639+02', '25', 'bailet-thomas', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (64, '2022-10-09 17:45:43.753165+02', '26', 'mace-noel', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (65, '2022-10-09 17:46:38.328003+02', '27', 'haro-christophe', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (66, '2022-10-09 17:47:49.109259+02', '28', 'kokaina-sallah', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (67, '2022-10-09 17:49:24.483496+02', '31', 'software-craftsmanship-lart-du-code-et-de-lagilite-technique-en-entreprise', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (68, '2022-10-09 17:51:01.781959+02', '32', 'algorithmique-raisonner-pour-concevoir', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (69, '2022-10-09 17:53:20.562568+02', '33', 'developpement-et-architecture-des-applications-web-modernes-retrouver-les-fondamentaux', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (70, '2022-10-09 17:54:56.385845+02', '34', 'architecture-logicielle-pour-une-approche-organisationnelle-fonctionnelle-et-technique', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (71, '2022-10-09 17:56:34.651133+02', '35', 'uml-au-service-de-lanalyse-des-metiers-business-analysis', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (72, '2022-10-09 18:00:17.295966+02', '36', 'pilotage-dun-systeme-dinformation-methode-et-bonnes-pratiques', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (73, '2022-10-09 18:01:33.504714+02', '37', 'itil-4-comprendre-la-demarche-et-adopter-les-bonnes-pratiques', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (74, '2022-10-09 18:29:27.632229+02', '29', 'fowler-martin', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (75, '2022-10-09 18:30:21.474021+02', '30', 'patton-jeff', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (76, '2022-10-09 18:32:37.114441+02', '38', 'refactoring-comment-ameliorer-le-code-existant', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (77, '2022-10-09 18:34:01.749272+02', '39', 'le-story-mapping-visualisez-vos-user-stories-pour-developper-le-bon-produit', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (78, '2022-10-09 18:35:44.894515+02', '40', 'le-web-semantique-comment-lier-les-donnees-et-les-schemas-sur-le-web', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (79, '2022-10-09 18:37:33.464432+02', '31', 'nebra-mathieu', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (80, '2022-10-09 18:38:56.400595+02', '32', 'le-goff-vincent', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (81, '2022-10-09 18:40:03.170836+02', '33', 'thuillier-victor', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (82, '2022-10-09 18:41:07.343035+02', '34', 'gribaumont-chantal', 1, '[{"added": {}}]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (83, '2022-10-09 18:45:36.534374+02', '41', 'programmez-en-oriente-objet-en-php', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (84, '2022-10-09 18:47:29.06668+02', '42', 'apprenez-a-programmer-en-python', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (85, '2022-10-09 18:48:54.038196+02', '43', 'realisez-votre-site-web-avec-html-5-et-css-3', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (86, '2022-10-09 18:50:19.387262+02', '44', 'apprenez-a-programmer-en-c', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (87, '2022-10-09 18:53:35.471293+02', '45', 'administrez-vos-bases-de-donnees-avec-mysql', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (88, '2022-10-09 18:57:00.78568+02', '46', 'programmer-en-samusant-avec-python-2e-edition-pour-les-nuls', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (89, '2022-10-09 18:58:37.024526+02', '47', 'python-javascript-pour-les-nuls-megapoche', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (90, '2022-10-09 19:00:22.37179+02', '48', 'programmer-en-samusant-avec-javascript-2e-ed-pour-les-nuls', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (91, '2022-10-09 19:01:52.708721+02', '49', 'wordpress-pour-les-nuls-grand-format', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (92, '2022-10-09 19:03:46.52944+02', '8', 'oreilly', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (93, '2022-10-09 19:05:52.692362+02', '50', 'design-patterns', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (94, '2022-10-09 19:08:53.146267+02', '51', 'html-avec-css-et-xhtml-tete-la-premiere', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (95, '2022-10-09 19:09:14.03072+02', '50', 'design-patterns', 2, '[{"changed": {"fields": ["Titre", "Edition"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (96, '2022-10-09 19:11:05.375294+02', '52', 'sql-tete-la-rpemiere', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (97, '2022-10-09 19:11:55.87439+02', '52', 'sql-tete-la-rpemiere', 2, '[{"changed": {"fields": ["Titre"]}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (98, '2022-10-09 19:12:44.437235+02', '53', 'le-web-mobile-tete-la-premiere', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (99, '2022-10-09 19:14:24.506495+02', '54', 'analyse-et-conception-orientees-objet-tete-la-premiere', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (100, '2022-10-17 12:27:05.666687+02', '1', 'langage', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (101, '2022-10-17 12:27:36.824224+02', '1', 'langage', 2, '[{"changed": {"fields": ["Livre"]}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (102, '2022-10-17 12:28:49.795611+02', '1', 'langage', 2, '[]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (103, '2022-10-17 12:29:05.565414+02', '1', 'langage', 2, '[{"changed": {"fields": ["Livre"]}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (104, '2022-10-17 12:30:59.445156+02', '2', 'python', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (105, '2022-10-17 12:33:01.095275+02', '3', 'reseaux', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (106, '2022-10-17 12:33:43.764672+02', '4', 'linux', 1, '[{"added": {}}]', 9, 1);


--
-- TOC entry 3496 (class 0 OID 16406)
-- Dependencies: 212
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: veille
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'app_books', 'author');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'app_books', 'book');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'app_books', 'edition');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'app_books', 'category');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'app_user', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'app_library', 'library');


--
-- TOC entry 3494 (class 0 OID 16397)
-- Dependencies: 210
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: veille
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2022-10-06 06:12:24.550663+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2022-10-06 06:12:24.573663+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'auth', '0001_initial', '2022-10-06 06:12:24.706666+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2022-10-06 06:12:24.721662+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2022-10-06 06:12:24.731662+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'auth', '0004_alter_user_username_opts', '2022-10-06 06:12:24.741662+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2022-10-06 06:12:24.753662+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2022-10-06 06:12:24.756662+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2022-10-06 06:12:24.766661+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0008_alter_user_username_max_length', '2022-10-06 06:12:24.775662+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2022-10-06 06:12:24.784663+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0010_alter_group_name_max_length', '2022-10-06 06:12:24.79566+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0011_update_proxy_permissions', '2022-10-06 06:12:24.805684+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2022-10-06 06:12:24.813664+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'app_user', '0001_initial', '2022-10-06 06:12:24.936669+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'admin', '0001_initial', '2022-10-06 06:12:24.998661+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2022-10-06 06:12:25.011662+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2022-10-06 06:12:25.021661+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'app_books', '0001_initial', '2022-10-06 06:12:25.21066+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'app_library', '0001_initial', '2022-10-06 06:12:25.245672+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'app_library', '0002_initial', '2022-10-06 06:12:25.289663+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'app_user', '0002_alter_user_managers_alter_user_groups_and_more', '2022-10-06 06:12:25.347659+02');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (23, 'sessions', '0001_initial', '2022-10-06 06:12:25.371662+02');


--
-- TOC entry 3523 (class 0 OID 16645)
-- Dependencies: 239
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: veille
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('3ug35fq4g9r1um57n0r9kv3vu2esae4m', '.eJxVjEEOwiAQRe_C2hAGhCku3XsGAjNUqgaS0q6Md7dNutDtf-_9twhxXUpYe57DxOIiQJx-txTpmesO-BHrvUlqdZmnJHdFHrTLW-P8uh7u30GJvWx1Iu_dmLTFBGwtm5QhkwMm4wAQs9dkBt6gZ63OSjmFEUejBiRjNYnPF-x9N5g:1ogIew:DvBgmbas3iLea538rjcL2qPUcL80AFv_oOacH7Cnslw', '2022-10-20 06:38:58.915208+02');


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 227
-- Name: app_books_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.app_books_author_id_seq', 34, true);


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 229
-- Name: app_books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.app_books_book_id_seq', 54, true);


--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 235
-- Name: app_books_category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.app_books_category_category_id_seq', 16, true);


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 233
-- Name: app_books_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.app_books_category_id_seq', 4, true);


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 231
-- Name: app_books_edition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.app_books_edition_id_seq', 8, true);


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 237
-- Name: app_library_library_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.app_library_library_id_seq', 1, false);


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 221
-- Name: app_user_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.app_user_user_groups_id_seq', 1, false);


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 219
-- Name: app_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.app_user_user_id_seq', 1, true);


--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 223
-- Name: app_user_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.app_user_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 215
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 225
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 106, true);


--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 211
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 209
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: veille
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- TOC entry 3298 (class 2606 OID 16547)
-- Name: app_books_author app_books_author_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_author
    ADD CONSTRAINT app_books_author_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 16549)
-- Name: app_books_author app_books_author_slug_key; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_author
    ADD CONSTRAINT app_books_author_slug_key UNIQUE (slug);


--
-- TOC entry 3305 (class 2606 OID 16558)
-- Name: app_books_book app_books_book_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_book
    ADD CONSTRAINT app_books_book_pkey PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 16560)
-- Name: app_books_book app_books_book_slug_key; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_book
    ADD CONSTRAINT app_books_book_slug_key UNIQUE (slug);


--
-- TOC entry 3328 (class 2606 OID 16612)
-- Name: app_books_category_category app_books_category_category_category_id_book_id_4d79122c_uniq; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_category_category
    ADD CONSTRAINT app_books_category_category_category_id_book_id_4d79122c_uniq UNIQUE (category_id, book_id);


--
-- TOC entry 3330 (class 2606 OID 16593)
-- Name: app_books_category_category app_books_category_category_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_category_category
    ADD CONSTRAINT app_books_category_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 16584)
-- Name: app_books_category app_books_category_name_key; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_category
    ADD CONSTRAINT app_books_category_name_key UNIQUE (name);


--
-- TOC entry 3321 (class 2606 OID 16582)
-- Name: app_books_category app_books_category_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_category
    ADD CONSTRAINT app_books_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 16586)
-- Name: app_books_category app_books_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_category
    ADD CONSTRAINT app_books_category_slug_key UNIQUE (slug);


--
-- TOC entry 3311 (class 2606 OID 16571)
-- Name: app_books_edition app_books_edition_name_key; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_edition
    ADD CONSTRAINT app_books_edition_name_key UNIQUE (name);


--
-- TOC entry 3313 (class 2606 OID 16569)
-- Name: app_books_edition app_books_edition_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_edition
    ADD CONSTRAINT app_books_edition_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 16573)
-- Name: app_books_edition app_books_edition_slug_key; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_edition
    ADD CONSTRAINT app_books_edition_slug_key UNIQUE (slug);


--
-- TOC entry 3333 (class 2606 OID 16632)
-- Name: app_library_library app_library_library_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_library_library
    ADD CONSTRAINT app_library_library_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 16473)
-- Name: app_user_user app_user_user_email_key; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user
    ADD CONSTRAINT app_user_user_email_key UNIQUE (email);


--
-- TOC entry 3283 (class 2606 OID 16480)
-- Name: app_user_user_groups app_user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user_groups
    ADD CONSTRAINT app_user_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 16490)
-- Name: app_user_user_groups app_user_user_groups_user_id_group_id_388f2ef0_uniq; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user_groups
    ADD CONSTRAINT app_user_user_groups_user_id_group_id_388f2ef0_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3280 (class 2606 OID 16471)
-- Name: app_user_user app_user_user_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user
    ADD CONSTRAINT app_user_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 16504)
-- Name: app_user_user_user_permissions app_user_user_user_permi_user_id_permission_id_fb4c25eb_uniq; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user_user_permissions
    ADD CONSTRAINT app_user_user_user_permi_user_id_permission_id_fb4c25eb_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3291 (class 2606 OID 16487)
-- Name: app_user_user_user_permissions app_user_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user_user_permissions
    ADD CONSTRAINT app_user_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 16461)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3272 (class 2606 OID 16447)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3275 (class 2606 OID 16436)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 16427)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 16438)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3264 (class 2606 OID 16420)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 16526)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 16413)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3259 (class 2606 OID 16411)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 16404)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 16651)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3299 (class 1259 OID 16599)
-- Name: app_books_author_slug_f3adaf11_like; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_books_author_slug_f3adaf11_like ON public.app_books_author USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3302 (class 1259 OID 16606)
-- Name: app_books_book_author_id_bcd17dc5; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_books_book_author_id_bcd17dc5 ON public.app_books_book USING btree (author_id);


--
-- TOC entry 3303 (class 1259 OID 16625)
-- Name: app_books_book_edition_id_5380124f; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_books_book_edition_id_5380124f ON public.app_books_book USING btree (edition_id);


--
-- TOC entry 3306 (class 1259 OID 16605)
-- Name: app_books_book_slug_66104be1_like; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_books_book_slug_66104be1_like ON public.app_books_book USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3325 (class 1259 OID 16624)
-- Name: app_books_category_category_book_id_5e31b7b8; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_books_category_category_book_id_5e31b7b8 ON public.app_books_category_category USING btree (book_id);


--
-- TOC entry 3326 (class 1259 OID 16623)
-- Name: app_books_category_category_category_id_0dbd5cb5; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_books_category_category_category_id_0dbd5cb5 ON public.app_books_category_category USING btree (category_id);


--
-- TOC entry 3317 (class 1259 OID 16609)
-- Name: app_books_category_name_31f647ae_like; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_books_category_name_31f647ae_like ON public.app_books_category USING btree (name varchar_pattern_ops);


--
-- TOC entry 3322 (class 1259 OID 16610)
-- Name: app_books_category_slug_60708bc8_like; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_books_category_slug_60708bc8_like ON public.app_books_category USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3309 (class 1259 OID 16607)
-- Name: app_books_edition_name_8dfdad1c_like; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_books_edition_name_8dfdad1c_like ON public.app_books_edition USING btree (name varchar_pattern_ops);


--
-- TOC entry 3314 (class 1259 OID 16608)
-- Name: app_books_edition_slug_1fe07435_like; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_books_edition_slug_1fe07435_like ON public.app_books_edition USING btree (slug varchar_pattern_ops);


--
-- TOC entry 3331 (class 1259 OID 16638)
-- Name: app_library_library_book_id_64a9087e; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_library_library_book_id_64a9087e ON public.app_library_library USING btree (book_id);


--
-- TOC entry 3334 (class 1259 OID 16644)
-- Name: app_library_library_user_id_edfba2b4; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_library_library_user_id_edfba2b4 ON public.app_library_library USING btree (user_id);


--
-- TOC entry 3276 (class 1259 OID 16488)
-- Name: app_user_user_email_620c8e79_like; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_user_user_email_620c8e79_like ON public.app_user_user USING btree (email varchar_pattern_ops);


--
-- TOC entry 3281 (class 1259 OID 16502)
-- Name: app_user_user_groups_group_id_8dcca2f2; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_user_user_groups_group_id_8dcca2f2 ON public.app_user_user_groups USING btree (group_id);


--
-- TOC entry 3284 (class 1259 OID 16501)
-- Name: app_user_user_groups_user_id_d117580e; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_user_user_groups_user_id_d117580e ON public.app_user_user_groups USING btree (user_id);


--
-- TOC entry 3289 (class 1259 OID 16516)
-- Name: app_user_user_user_permissions_permission_id_6ce37997; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_user_user_user_permissions_permission_id_6ce37997 ON public.app_user_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3292 (class 1259 OID 16515)
-- Name: app_user_user_user_permissions_user_id_ec2823c7; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX app_user_user_user_permissions_user_id_ec2823c7 ON public.app_user_user_user_permissions USING btree (user_id);


--
-- TOC entry 3265 (class 1259 OID 16462)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3270 (class 1259 OID 16458)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3273 (class 1259 OID 16459)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3260 (class 1259 OID 16444)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3293 (class 1259 OID 16537)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3296 (class 1259 OID 16538)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3335 (class 1259 OID 16653)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3338 (class 1259 OID 16652)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: veille
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3349 (class 2606 OID 16600)
-- Name: app_books_book app_books_book_author_id_bcd17dc5_fk_app_books_author_id; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_book
    ADD CONSTRAINT app_books_book_author_id_bcd17dc5_fk_app_books_author_id FOREIGN KEY (author_id) REFERENCES public.app_books_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3348 (class 2606 OID 16594)
-- Name: app_books_book app_books_book_edition_id_5380124f_fk_app_books_edition_id; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_book
    ADD CONSTRAINT app_books_book_edition_id_5380124f_fk_app_books_edition_id FOREIGN KEY (edition_id) REFERENCES public.app_books_edition(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3351 (class 2606 OID 16618)
-- Name: app_books_category_category app_books_category_c_book_id_5e31b7b8_fk_app_books; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_category_category
    ADD CONSTRAINT app_books_category_c_book_id_5e31b7b8_fk_app_books FOREIGN KEY (book_id) REFERENCES public.app_books_book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3350 (class 2606 OID 16613)
-- Name: app_books_category_category app_books_category_c_category_id_0dbd5cb5_fk_app_books; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_books_category_category
    ADD CONSTRAINT app_books_category_c_category_id_0dbd5cb5_fk_app_books FOREIGN KEY (category_id) REFERENCES public.app_books_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3352 (class 2606 OID 16633)
-- Name: app_library_library app_library_library_book_id_64a9087e_fk_app_books_book_id; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_library_library
    ADD CONSTRAINT app_library_library_book_id_64a9087e_fk_app_books_book_id FOREIGN KEY (book_id) REFERENCES public.app_books_book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3353 (class 2606 OID 16639)
-- Name: app_library_library app_library_library_user_id_edfba2b4_fk_app_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_library_library
    ADD CONSTRAINT app_library_library_user_id_edfba2b4_fk_app_user_user_id FOREIGN KEY (user_id) REFERENCES public.app_user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3343 (class 2606 OID 16496)
-- Name: app_user_user_groups app_user_user_groups_group_id_8dcca2f2_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user_groups
    ADD CONSTRAINT app_user_user_groups_group_id_8dcca2f2_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3342 (class 2606 OID 16491)
-- Name: app_user_user_groups app_user_user_groups_user_id_d117580e_fk_app_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user_groups
    ADD CONSTRAINT app_user_user_groups_user_id_d117580e_fk_app_user_user_id FOREIGN KEY (user_id) REFERENCES public.app_user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3345 (class 2606 OID 16510)
-- Name: app_user_user_user_permissions app_user_user_user_p_permission_id_6ce37997_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user_user_permissions
    ADD CONSTRAINT app_user_user_user_p_permission_id_6ce37997_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3344 (class 2606 OID 16505)
-- Name: app_user_user_user_permissions app_user_user_user_p_user_id_ec2823c7_fk_app_user_; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.app_user_user_user_permissions
    ADD CONSTRAINT app_user_user_user_p_user_id_ec2823c7_fk_app_user_ FOREIGN KEY (user_id) REFERENCES public.app_user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3341 (class 2606 OID 16453)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3340 (class 2606 OID 16448)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3339 (class 2606 OID 16439)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3346 (class 2606 OID 16527)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3347 (class 2606 OID 16532)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_app_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: veille
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_app_user_user_id FOREIGN KEY (user_id) REFERENCES public.app_user_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2022-10-19 13:32:33

--
-- PostgreSQL database dump complete
--

