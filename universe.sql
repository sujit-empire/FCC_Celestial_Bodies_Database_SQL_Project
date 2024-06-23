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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(90) NOT NULL,
    description text,
    num_of_moons integer NOT NULL,
    star_id integer
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(90) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    distance_from_earth_kpl double precision
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
    name character varying(90) NOT NULL,
    description text,
    rotate_around character varying(90),
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
    name character varying(90) NOT NULL,
    complete_revolution_in_earth_days integer NOT NULL,
    one_rotation_in_earth_days integer NOT NULL,
    type_of_planet character varying(120),
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(90) NOT NULL,
    description text,
    distance_from_earth_ly numeric(10,2),
    has_life boolean NOT NULL,
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
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Ceres', NULL, 0, 1);
INSERT INTO public.dwarf_planet VALUES (2, 'Orcus', NULL, 0, 1);
INSERT INTO public.dwarf_planet VALUES (3, 'Pluto', NULL, 0, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda is the closest big galaxy to the Milky Way.', false, 19);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', 'Two colliding galaxies', false, 16);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'The galaxy containing the Sun and its Solar System, and therefore Earth.', true, 9);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw Galaxy', 'Also known as Bear Claw Galaxy', false, 15);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 'Also known as sleeping beauty galaxy', false, 95);
INSERT INTO public.galaxy VALUES (6, 'Butterfly Galaxies', NULL, false, 45);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Natural satellite of Earth', 'Earth', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Natural satellite of Mars', 'Mars', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Natural satellite of Mars', 'Mars', 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Natural satellite of Jupiter', 'Jupiter', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Natural satellite of Jupiter', 'Jupiter', 5);
INSERT INTO public.moon VALUES (6, 'Lo', 'Natural satellite of Jupiter', 'Jupiter', 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Natural satellite of Jupiter', 'Jupiter', 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Natural satellite of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Natural satellite of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 'Natural satellite of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'Natural satellite of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (12, 'Calypso', 'Natural Trojan moon of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (13, 'Telesto', 'Natural trojan moon of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (14, 'Helen', 'Natural satellite of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (15, 'Polydeuces', 'Natural satellite of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (16, 'Rhea', 'Natural satellite of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (17, 'Titan', 'Natural satellite of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (18, 'Hyperion', 'Natural satellite of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (19, 'Lapetus', 'Natural satellite of Saturn', 'Saturn', 6);
INSERT INTO public.moon VALUES (20, 'Phoebe', 'Natural satellite of Saturn', 'Saturn', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 88, 59, 'Solar system', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 225, 243, 'Solar system', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 365, 1, 'Solar system', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 687, 10, 'Solar system', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4380, 10, 'Solar system', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 10585, 10, 'Solar system', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 30660, 17, 'Solar system', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 60225, 16, 'Solar system', 1);
INSERT INTO public.planet VALUES (9, 'HD 114386 b', 9865, 25, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (10, 'HD 103197 b', 7856, 26, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (11, 'Centauri b', 8965, 365, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri', 458, 659, 'Exoplanet', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the star at the center of the Solar System. It is a massive, nearly perfect sphere of hot plasma, heated to incandescence by nuclear fusion reactions in its core, radiating the energy from its surface mainly as visible light and infrared radiation with 10% at ultraviolet energies.', 14.96, true, 3);
INSERT INTO public.star VALUES (2, 'BPM 37093', 'BPM 37093 is a variable white dwarf star of the DAV, with a hydrogen atmosphere and an unusually high mass of approximately 1.1 times of the sun.', 14.00, false, 3);
INSERT INTO public.star VALUES (3, 'Cygnus x-1', 'Is a galactic X-ray source in the constellation Cygnus', 190.00, false, 3);
INSERT INTO public.star VALUES (4, 'Gy Andromedae', 'Canum Venaticorum type variable star in the northern constellation Andromeda.', 25000000.00, false, 3);
INSERT INTO public.star VALUES (5, 'P Cygni', 'P Cygni is a variable star in the constellation Cygnus.', 69.00, false, 3);
INSERT INTO public.star VALUES (6, 'Zeta Bootis', 'Is a binary star system in the constellation of Bootes', 490.00, false, 3);
INSERT INTO public.star VALUES (7, 'Winnecke 4', 'is an optical double start consisting of two unrelated stars in a northerly zone of the sky', 89.00, false, 3);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


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
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- Name: star star_from_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_from_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

