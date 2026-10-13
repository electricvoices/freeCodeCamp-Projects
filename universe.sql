--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.element (
    element_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean
);


ALTER TABLE public.element OWNER TO freecodecamp;

--
-- Name: element_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.element_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.element_element_id_seq OWNER TO freecodecamp;

--
-- Name: element_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.element_element_id_seq OWNED BY public.element.element_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_millions_yrs numeric NOT NULL,
    has_life boolean,
    is_spherical boolean,
    dist_from_earth integer,
    description text,
    size integer
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
    name character varying(20) NOT NULL,
    age_millions_yrs numeric NOT NULL,
    has_life boolean,
    is_spherical boolean,
    dist_from_earth integer,
    description text,
    size integer,
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    age_millions_yrs numeric NOT NULL,
    has_life boolean,
    is_spherical boolean,
    dist_from_earth integer,
    description text,
    size integer,
    star_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    age_millions_yrs numeric NOT NULL,
    has_life boolean,
    is_spherical boolean,
    dist_from_earth integer,
    description text,
    size integer,
    galaxy_id integer NOT NULL
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
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.element_element_id_seq'::regclass);


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
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.element VALUES (1, 'Hydrogen', NULL, false);
INSERT INTO public.element VALUES (2, 'Helium', NULL, false);
INSERT INTO public.element VALUES (3, 'Carbon', NULL, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Milky Way', 13600, true, true, 0, 'Our home galaxy', 100000);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 10000, false, true, 2500000, 'Nearest spiral galaxy', 220000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 12000, false, true, 3000000, 'Member of the local group', 60000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 13000, false, true, 31000000, 'Unusual central bulge', 50000);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 400, false, true, 23000000, 'Grand design spiral galaxy', 60000);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel', 10000, false, true, 21000000, 'Face-on spiral galaxy', 170000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 4500, false, true, 0, 'Earth satellite', 3474, 27);
INSERT INTO public.moon VALUES (22, 'Phobos', 4500, false, false, 225, 'Mars moon 1', 22, 28);
INSERT INTO public.moon VALUES (23, 'Deimos', 4500, false, false, 225, 'Mars moon 2', 12, 28);
INSERT INTO public.moon VALUES (24, 'Io', 4500, false, true, 588, 'Jupiter moon 1', 3643, 29);
INSERT INTO public.moon VALUES (25, 'Europa', 4500, false, true, 588, 'Jupiter moon 2', 3122, 29);
INSERT INTO public.moon VALUES (26, 'Ganymede', 4500, false, true, 588, 'Jupiter moon 3', 5268, 29);
INSERT INTO public.moon VALUES (27, 'Callisto', 4500, false, true, 588, 'Jupiter moon 4', 4821, 29);
INSERT INTO public.moon VALUES (28, 'Amalthea', 4500, false, false, 588, 'Jupiter moon 5', 167, 29);
INSERT INTO public.moon VALUES (29, 'Himalia', 4500, false, false, 588, 'Jupiter moon 6', 170, 29);
INSERT INTO public.moon VALUES (30, 'Elara', 4500, false, false, 588, 'Jupiter moon 7', 86, 29);
INSERT INTO public.moon VALUES (31, 'Titan', 4500, false, true, 1200, 'Saturn moon 1', 5150, 30);
INSERT INTO public.moon VALUES (32, 'Rhea', 4500, false, true, 1200, 'Saturn moon 2', 1527, 30);
INSERT INTO public.moon VALUES (33, 'Iapetus', 4500, false, true, 1200, 'Saturn moon 3', 1469, 30);
INSERT INTO public.moon VALUES (34, 'Dione', 4500, false, true, 1200, 'Saturn moon 4', 1122, 30);
INSERT INTO public.moon VALUES (35, 'Tethys', 4500, false, true, 1200, 'Saturn moon 5', 1062, 30);
INSERT INTO public.moon VALUES (36, 'Titania', 4500, false, true, 2600, 'Uranus moon 1', 1577, 31);
INSERT INTO public.moon VALUES (37, 'Oberon', 4500, false, true, 2600, 'Uranus moon 2', 1522, 31);
INSERT INTO public.moon VALUES (38, 'Umbriel', 4500, false, true, 2600, 'Uranus moon 3', 1169, 31);
INSERT INTO public.moon VALUES (39, 'Triton', 4500, false, true, 4300, 'Neptune moon 1', 2706, 32);
INSERT INTO public.moon VALUES (40, 'Proteus', 4500, false, false, 4300, 'Neptune moon 2', 420, 32);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'Mercury', 4500, false, true, 77, 'Smallest planet', 4879, 13);
INSERT INTO public.planet VALUES (26, 'Venus', 4500, false, true, 61, 'Hottest planet', 12104, 13);
INSERT INTO public.planet VALUES (27, 'Earth', 4500, true, true, 0, 'Home planet', 12742, 13);
INSERT INTO public.planet VALUES (28, 'Mars', 4500, false, true, 225, 'Red planet', 6779, 13);
INSERT INTO public.planet VALUES (29, 'Jupiter', 4500, false, true, 588, 'Gas giant', 139820, 13);
INSERT INTO public.planet VALUES (30, 'Saturn', 4500, false, true, 1200, 'Ringed planet', 116460, 13);
INSERT INTO public.planet VALUES (31, 'Uranus', 4500, false, true, 2600, 'Ice giant', 50724, 13);
INSERT INTO public.planet VALUES (32, 'Neptune', 4500, false, true, 4300, 'Windy planet', 49244, 13);
INSERT INTO public.planet VALUES (33, 'Pluto', 4500, false, true, 5900, 'Dwarf planet', 2376, 13);
INSERT INTO public.planet VALUES (34, 'Proxima b', 4850, false, true, 4, 'Exoplanet', 14000, 14);
INSERT INTO public.planet VALUES (35, 'Proxima c', 4850, false, true, 4, 'Super Earth', 20000, 14);
INSERT INTO public.planet VALUES (36, 'Alpha b', 5000, false, true, 4, 'Terrestrial planet', 13000, 15);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (13, 'Sun', 4600, true, true, 0, 'G-type main-sequence star', 1392700, 3);
INSERT INTO public.star VALUES (14, 'Proxima Centauri', 4850, false, true, 4, 'Red dwarf star', 200000, 3);
INSERT INTO public.star VALUES (15, 'Alpha Centauri A', 5000, false, true, 4, 'Yellow dwarf star', 1700000, 3);
INSERT INTO public.star VALUES (16, 'Andromeda Star 1', 2000, false, true, 2500000, 'Bright blue giant', 5000000, 4);
INSERT INTO public.star VALUES (17, 'Triangulum Star 1', 3000, false, true, 3000000, 'Variable star', 3000000, 5);
INSERT INTO public.star VALUES (18, 'Sombrero Star 1', 1000, false, true, 31000000, 'Massive star', 8000000, 6);


--
-- Name: element_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.element_element_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: element element_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_name_key UNIQUE (name);


--
-- Name: element element_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_pkey PRIMARY KEY (element_id);


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

