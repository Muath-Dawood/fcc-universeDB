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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km numeric NOT NULL,
    distance_from_sun_au numeric,
    orbit_period_years numeric,
    composition character varying(100),
    discovery_date date NOT NULL,
    discoverer character varying(100) NOT NULL,
    has_impact_hazard boolean,
    visible_from_earth boolean,
    notes text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    distance_light_years integer,
    size_light_years integer,
    age_years numeric
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
    name character varying(100) NOT NULL,
    planet_id integer,
    type text,
    diameter_km integer,
    gravity_m_s2 integer,
    orbital_period_days numeric
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
    name character varying(100) NOT NULL,
    star_id integer,
    type character varying(50),
    diameter_km integer,
    gravity_m_s2 integer,
    atmosphere character varying(100)
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    type character varying(50),
    mass_kg numeric,
    radius_km numeric,
    temperature_kelvin numeric
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.4, 2.767, 4.60, 'carbonaceous', '1801-01-01', 'Giuseppe Piazzi', false, true, 'Dwarf planet in the asteroid belt');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.4, 2.361, 3.63, 'basaltic', '1807-03-29', 'Heinrich Wilhelm Olbers', false, true, 'One of the largest objects in the asteroid belt');
INSERT INTO public.asteroid VALUES (3, 'Bennu', 490, 1.126, 1.20, 'carbonaceous', '1999-09-11', 'LINEAR', true, false, 'Near-Earth asteroid studied by OSIRIS-REx mission');
INSERT INTO public.asteroid VALUES (4, 'Apophis', 370, 0.922, 0.89, 'silicate', '2004-06-19', 'R. A. Tucker', true, false, 'Potentially hazardous asteroid, closely approached Earth in 2029');
INSERT INTO public.asteroid VALUES (5, 'Psyche', 226, 2.923, 4.73, 'metallic', '1852-03-17', 'Annibale de Gasparis', false, true, 'One of the largest M-type asteroids in the asteroid belt');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 100000, 100000, 13000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 2200000, 220000, 13000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'spiral', 3000000, 50000, 13000000000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'elliptical', 11000000, 150000, 13000000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'spiral', 29000000, 50000, 13000000000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'spiral', 23000000, 40000, 13000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (47, 'Moon', 1, 'natural satellite', 3475, 2, 27.32);
INSERT INTO public.moon VALUES (48, 'Phobos', 2, 'natural satellite', 22, 0, 0.3189);
INSERT INTO public.moon VALUES (49, 'Deimos', 2, 'natural satellite', 12, 0, 1.2624);
INSERT INTO public.moon VALUES (50, 'Ganymede', 3, 'natural satellite', 5262, 1, 7.155);
INSERT INTO public.moon VALUES (51, 'Europa', 3, 'natural satellite', 3122, 1, 3.551);
INSERT INTO public.moon VALUES (52, 'Io', 3, 'natural satellite', 3642, 2, 1.769);
INSERT INTO public.moon VALUES (53, 'Titan', 4, 'natural satellite', 5150, 1, 15.945);
INSERT INTO public.moon VALUES (54, 'Rhea', 4, 'natural satellite', 1527, 0, 4.518);
INSERT INTO public.moon VALUES (55, 'Mimas', 4, 'natural satellite', 396, 0, 0.942);
INSERT INTO public.moon VALUES (56, 'Triton (Neptune)', 5, 'natural satellite', 2706, 1, -5.877);
INSERT INTO public.moon VALUES (57, 'Nereid', 5, 'natural satellite', 340, 0, 360.13);
INSERT INTO public.moon VALUES (58, 'Charon', 9, 'natural satellite', 1207, 0, 6.387);
INSERT INTO public.moon VALUES (59, 'Nix', 9, 'natural satellite', 49, 0, 24.86);
INSERT INTO public.moon VALUES (60, 'Hydra', 9, 'natural satellite', 45, 0, 38.20);
INSERT INTO public.moon VALUES (61, 'Luna', 10, 'natural satellite', 1737, 2, 27.32);
INSERT INTO public.moon VALUES (62, 'Amalthea', 11, 'natural satellite', 250, 0, 0.4982);
INSERT INTO public.moon VALUES (63, 'Thebe', 11, 'natural satellite', 110, 0, 0.6745);
INSERT INTO public.moon VALUES (64, 'Ariel', 12, 'natural satellite', 1158, 0, 2.520);
INSERT INTO public.moon VALUES (65, 'Umbriel', 12, 'natural satellite', 1169, 0, 4.144);
INSERT INTO public.moon VALUES (66, 'Titania', 12, 'natural satellite', 1578, 0, 8.706);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'terrestrial', 12742, 10, 'nitrogen, oxygen');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'terrestrial', 6792, 4, 'carbon dioxide');
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'terrestrial', 12104, 9, 'carbon dioxide');
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 'terrestrial', 4879, 4, 'minimal');
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, 'gas giant', 139822, 25, 'hydrogen, helium');
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 'gas giant', 116464, 10, 'hydrogen, helium');
INSERT INTO public.planet VALUES (7, 'Uranus', 3, 'ice giant', 50724, 9, 'hydrogen, helium, methane');
INSERT INTO public.planet VALUES (8, 'Neptune', 3, 'ice giant', 49244, 11, 'hydrogen, helium, methane');
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 4, 'exoplanet', 11300, 2, 'unknown');
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 5, 'exoplanet', 78746, 9, 'unknown');
INSERT INTO public.planet VALUES (11, 'Gliese 581 c', 6, 'exoplanet', 15790, 2, 'unknown');
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 7, 'exoplanet', 20000, 6, 'unknown');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'main-sequence', 1989000000000000000000000000000, 695700, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 'main-sequence', 2020000000000000000000000000000, 1564000, 9940);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'main-sequence', 2200000000000000000000000000000, 1187000, 5790);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 1, 'main-sequence', 1800000000000000000000000000000, 863000, 5260);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 'red-dwarf', 123000000000000000000000000000, 200000, 3042);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 2, 'red-supergiant', 12000000000000000000000000000000, 1000000000, 3500);
INSERT INTO public.star VALUES (7, 'Rigel', 1, 'blue-supergiant', 21000000000000000000000000000000, 1200000000, 12100);
INSERT INTO public.star VALUES (8, 'Vega', 3, 'main-sequence', 2100000000000000000000000000000, 2119000, 9602);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 66, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

