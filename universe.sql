--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    num_of_suns integer,
    age_in_million_years integer,
    rotation_time_in_earth_days numeric(8,1),
    discovered_by character varying(50),
    inside_milky_way boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    num_of_craters integer,
    age_in_million_years integer,
    rotation_time_in_earth_days numeric(8,1),
    discovered_by character varying(50),
    inside_milky_way boolean NOT NULL,
    description text,
    planet_id integer
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
    num_of_moons integer,
    age_in_million_years integer,
    rotation_time_in_earth_days numeric(8,1),
    discovered_by character varying(50),
    inside_milky_way boolean NOT NULL,
    description text,
    star_id integer
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
-- Name: relation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.relation (
    relation_id integer NOT NULL,
    name character varying(10) NOT NULL,
    kind boolean NOT NULL
);


ALTER TABLE public.relation OWNER TO freecodecamp;

--
-- Name: relation_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.relation_relation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relation_relation_id_seq OWNER TO freecodecamp;

--
-- Name: relation_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.relation_relation_id_seq OWNED BY public.relation.relation_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    num_of_atoms integer,
    age_in_million_years integer,
    rotation_time_in_earth_days numeric(8,1),
    discovered_by character varying(50),
    inside_milky_way boolean NOT NULL,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: relation relation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation ALTER COLUMN relation_id SET DEFAULT nextval('public.relation_relation_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', NULL, 14000, NULL, 'USA', true, NULL);
INSERT INTO public.galaxy VALUES (2, 'NGC 4656', NULL, 12500, NULL, 'USA', false, NULL);
INSERT INTO public.galaxy VALUES (3, 'NGC 4631', NULL, 10000, NULL, 'UK', false, NULL);
INSERT INTO public.galaxy VALUES (4, 'NGC 4627', NULL, 14500, NULL, 'FRANCE', false, NULL);
INSERT INTO public.galaxy VALUES (5, 'MAGALLANES CLOUD', NULL, 12500, NULL, 'ITALY', false, NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 4248', NULL, 9700, NULL, 'CHINA', false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 1000, NULL, 'ITALY', true, NULL, 1);
INSERT INTO public.moon VALUES (2, 'DEIMOS', NULL, 1200, NULL, 'ITALY', true, NULL, 2);
INSERT INTO public.moon VALUES (3, 'FOBOS', NULL, 1400, NULL, 'ITALY', true, NULL, 2);
INSERT INTO public.moon VALUES (4, 'EUROPE', NULL, 2400, NULL, 'GERMANY', true, NULL, 3);
INSERT INTO public.moon VALUES (5, 'GANIMEDES', NULL, 3400, NULL, 'GERMANY', true, NULL, 3);
INSERT INTO public.moon VALUES (6, 'CALLISTO', NULL, 3400, NULL, 'GERMANY', true, NULL, 3);
INSERT INTO public.moon VALUES (7, 'AMALTEA', NULL, 4400, NULL, 'GERMANY', true, NULL, 3);
INSERT INTO public.moon VALUES (8, 'HIMALIA', NULL, 4400, NULL, 'GERMANY', true, NULL, 3);
INSERT INTO public.moon VALUES (9, 'ELARA', NULL, 4300, NULL, 'GERMANY', true, NULL, 3);
INSERT INTO public.moon VALUES (10, 'YOCASTA', NULL, 4300, NULL, 'RUSSIA', true, NULL, 3);
INSERT INTO public.moon VALUES (11, 'ARCE', NULL, 4300, NULL, 'RUSSIA', true, NULL, 3);
INSERT INTO public.moon VALUES (12, 'MIMAS', NULL, 2300, NULL, 'RUSSIA', true, NULL, 4);
INSERT INTO public.moon VALUES (13, 'DIONE', NULL, 2300, NULL, 'RUSSIA', true, NULL, 4);
INSERT INTO public.moon VALUES (14, 'REA', NULL, 2300, NULL, 'RUSSIA', true, NULL, 4);
INSERT INTO public.moon VALUES (15, 'TITAN', NULL, 6300, NULL, 'RUSSIA', true, NULL, 4);
INSERT INTO public.moon VALUES (16, 'JAPETO', NULL, 6300, NULL, 'RUSSIA', true, NULL, 4);
INSERT INTO public.moon VALUES (18, 'JANO', NULL, 6300, NULL, 'RUSSIA', true, NULL, 4);
INSERT INTO public.moon VALUES (19, 'HELENA', NULL, 4300, NULL, 'RUSSIA', true, NULL, 4);
INSERT INTO public.moon VALUES (20, 'ATLAS', NULL, 4300, NULL, 'RUSSIA', true, NULL, 4);
INSERT INTO public.moon VALUES (21, 'YMIR', NULL, 4300, NULL, 'RUSSIA', true, NULL, 4);
INSERT INTO public.moon VALUES (22, 'SKADI', NULL, 4300, NULL, 'RUSSIA', true, NULL, 4);
INSERT INTO public.moon VALUES (23, 'AEGIR', NULL, 4400, NULL, 'RUSSIA', true, NULL, 4);
INSERT INTO public.moon VALUES (24, 'FENRIR', NULL, 2400, NULL, 'RUSSIA', true, NULL, 6);
INSERT INTO public.moon VALUES (25, 'SKOLL', NULL, 5400, NULL, 'USA', true, NULL, 7);
INSERT INTO public.moon VALUES (26, 'ARIEL', NULL, 6400, NULL, 'USA', true, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'EARTH', NULL, 6400, NULL, 'USA', true, NULL, 1);
INSERT INTO public.planet VALUES (3, 'MARS', NULL, 6700, NULL, 'USA', true, NULL, 1);
INSERT INTO public.planet VALUES (4, 'VENUS', NULL, 6400, NULL, 'CHINA', true, NULL, 1);
INSERT INTO public.planet VALUES (5, 'MERCURY', NULL, 2700, NULL, 'CHINA', true, NULL, 2);
INSERT INTO public.planet VALUES (6, 'SATURN', NULL, 8400, NULL, 'CHINA', true, NULL, 1);
INSERT INTO public.planet VALUES (7, 'JUPYTER', NULL, 3700, NULL, 'CHINA', true, NULL, 2);
INSERT INTO public.planet VALUES (8, 'NEPTUNE', NULL, 2400, NULL, 'UK', true, NULL, 4);
INSERT INTO public.planet VALUES (9, 'URANUS', NULL, 3800, NULL, 'UK', true, NULL, 4);
INSERT INTO public.planet VALUES (10, 'K2-72 E', NULL, 2400, NULL, 'UK', false, NULL, 3);
INSERT INTO public.planet VALUES (11, 'KOI 4878.01', NULL, 4800, NULL, 'UK', false, NULL, 3);
INSERT INTO public.planet VALUES (12, 'KEPLER 452B', NULL, 6400, NULL, 'RUSSIA', false, NULL, 6);
INSERT INTO public.planet VALUES (13, 'PROXIMA CENTAURI', NULL, 4800, NULL, 'JAPAN', false, NULL, 5);
INSERT INTO public.planet VALUES (1, 'Namek', NULL, 1000, NULL, 'ITALY', true, NULL, 4);


--
-- Data for Name: relation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.relation VALUES (1, 'Monotonic', true);
INSERT INTO public.relation VALUES (2, 'ZEROTONIC', true);
INSERT INTO public.relation VALUES (3, 'BIMODAL', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SIRIUS', NULL, 400, NULL, 'USA', true, NULL, 1);
INSERT INTO public.star VALUES (2, 'CANOPUS', NULL, 1400, NULL, 'CHINA', true, NULL, 1);
INSERT INTO public.star VALUES (3, 'ARCTURUS', NULL, 2400, NULL, 'CHINA', false, NULL, 2);
INSERT INTO public.star VALUES (4, 'VEGA', NULL, 4400, NULL, 'FRANCE', true, NULL, 4);
INSERT INTO public.star VALUES (5, 'BETELGEUSE', NULL, 5400, NULL, 'FRANCE', false, NULL, 5);
INSERT INTO public.star VALUES (6, 'ALDEBARAN', NULL, 6400, NULL, 'ITALY', false, NULL, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: relation_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.relation_relation_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: relation relation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_name_key UNIQUE (name);


--
-- Name: relation relation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_pkey PRIMARY KEY (relation_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

