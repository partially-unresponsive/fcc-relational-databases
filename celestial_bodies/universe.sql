--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(60) NOT NULL,
    distance numeric(5,1) NOT NULL
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    distance numeric(3,1),
    description text,
    name character varying(40) NOT NULL,
    num_planets integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    size integer,
    shape text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    is_habitable boolean,
    star_id integer,
    water boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    mass_in_suns integer NOT NULL,
    luminosity integer NOT NULL,
    temperature_k numeric(5,1),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'Cockster', 55.0);
INSERT INTO public.cluster VALUES (2, 'Cockster2', 556.0);
INSERT INTO public.cluster VALUES (3, 'Cockster Galacticus', 420.0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 0.0, 'The origin of life in the universe.', 'Milky Way', NULL);
INSERT INTO public.galaxy VALUES (3, 38.5, 'Disp fx of r tibial tuberosity, 7thJ', 'ETHYL ALCOHOL', 53257);
INSERT INTO public.galaxy VALUES (4, 20.1, 'Displ spiral fx shaft of humer, unsp arm, 7thG', 'Labetalol Hydrochloride', 40);
INSERT INTO public.galaxy VALUES (5, 71.9, 'Calcification and ossification of muscle, unspecified', 'Avobenzone, Octisalate', 4);
INSERT INTO public.galaxy VALUES (6, 21.9, 'Traum rupt of collat ligmt of finger at MCP/IP jt, sequela', 'Morphine Sulfate', 40);
INSERT INTO public.galaxy VALUES (7, 69.0, 'Displacmnt of unsp cardiac and vasc devices and implnt, subs', 'Phenytoin', 9813);
INSERT INTO public.galaxy VALUES (8, 13.6, 'Toxic effect of formaldehyde, accidental, sequela', 'Selan Antifungal', 721);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'placeholder', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'placeholder2', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'placeholder3', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'placeholder4', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'placeholder5', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'placeholder6', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'placeholder7', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'placeholder8', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'placeholder9', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'placeholder10', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'placeholder11', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'placeholder12', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'placeholder13', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'placeholder43', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'placeholder73', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'placeholder764', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'placeholder76244', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'placeholder7624452', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'placeholder762442', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'placeholder762421342', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'placeholder7624212', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'placeholder7624217f2', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'placeholder7624217f2sa', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'placeholder7624217f211sa', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'placeholder7624217f21a', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'placeholder7624217f2ffa', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'placeholder7624217f2ff535a', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (30, 'placeholder7624217f2ff53135a', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (31, 'placeholder7624217f2ff53132445a', NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1, true);
INSERT INTO public.planet VALUES (2, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (3, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (4, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (5, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (6, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (7, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (8, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (9, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (10, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (11, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (12, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (13, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (14, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (15, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (16, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (17, NULL, NULL, NULL, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 5778.0, 1);
INSERT INTO public.star VALUES (2, 'Diphenhydramine Hydrochloride', 95, 39, 1643.1, NULL);
INSERT INTO public.star VALUES (3, 'eucalyptol, menthol', 143, 63, 1646.1, NULL);
INSERT INTO public.star VALUES (4, 'CHLOROXYLENOL, TRICLOSAN', 115, 7, 7239.9, NULL);
INSERT INTO public.star VALUES (5, 'Amoxicillin and Clavulanate', 211, 19, 7737.2, NULL);
INSERT INTO public.star VALUES (6, 'Acetaminophen, Dextromethorphan HBr', 30, 86, 1077.2, NULL);
INSERT INTO public.star VALUES (7, 'BISACODYL', 64, 51, 7509.3, NULL);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

