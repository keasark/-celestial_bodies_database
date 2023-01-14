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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_types character varying(120),
    description text,
    distance_from_earth_in_light_years numeric(100,15)
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
    name character varying(60),
    description text,
    distance_from_earth numeric(100,15),
    age_in_millions_of_years integer,
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
    name character varying(60),
    planet_types character varying(120),
    is_spherical boolean,
    has_life boolean,
    description text,
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
    name character varying(60),
    description text,
    distance_from_earth numeric(100,15),
    age_in_millions_of_years integer,
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
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    planet_id integer
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


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
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral galaxy', 'it includes our solar system', 26670.000000000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda galaxy', 'spiral galaxy', 'it is also known as Messier 31, M31, or NGC 224', 2537000.000000000000000);
INSERT INTO public.galaxy VALUES (3, 'Wolf-Lundmark-Melotte', 'lonely dwarf galaxy', 'it is barred irregular galaxy discovered in 1909 by Max Wolf', 3000000.000000000000000);
INSERT INTO public.galaxy VALUES (4, 'Circinus galaxy', 'type 2 Seyfert galaxy', 'it is one of the closest known active galaxies to the Milky Way', 13050000.000000000000000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum galaxy', 'spiral galaxy', 'there is a nebula at the Triangulum galaxy core filled with dust and gas called an HII region', 2723000.000000000000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel galaxy', 'spiral galaxy', 'it is discovered by Pierre Mechain in 1781', 20870000.000000000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'deimos', 'it is the outer and smaller of Mars two moons', 77790000.000000000000000, 4503, 2);
INSERT INTO public.moon VALUES (3, 'europa', 'it is the smallest of the four Galilean moons orbiting Jupiter and the sixth-closest to the planet of all the 80 known moons of Jupiter', 628300000.000000000000000, 4503, 4);
INSERT INTO public.moon VALUES (1, 'phobos', 'it is the innermost and and larger of the two natural satellites of Mars', 77790000.000000000000000, 4503, 2);
INSERT INTO public.moon VALUES (4, 'io', 'it is the innermost and third-largest of the four Galilean moons of the planet Jupiter', 628300000.000000000000000, 4500, 4);
INSERT INTO public.moon VALUES (5, 'ganymede', 'it is the largest and most massive of the solar system moons', 628300000.000000000000000, 4503, 4);
INSERT INTO public.moon VALUES (6, 'callisto', 'it is the second largest moon of Jupiter, after Ganymede', 628300000.000000000000000, 4503, 4);
INSERT INTO public.moon VALUES (7, 'amalthea', 'it has the third closest orbit around Jupiter among known moons and also the fifth largest moon of Jupiter', 628300000.000000000000000, 4503, 4);
INSERT INTO public.moon VALUES (8, 'thebe', 'it is the fourth of Jupiter moons by distance from the planet', NULL, NULL, 4);
INSERT INTO public.moon VALUES (9, 'moon', 'it is the Earth only natural satellite', 385000.000000000000000, 4510, 1);
INSERT INTO public.moon VALUES (10, 'himalia', 'it is the largest irregular satellite of Jupiter, also called Jupiter VI', NULL, NULL, 4);
INSERT INTO public.moon VALUES (11, 'valetudo', 'it is known as Jupiter LXII, and a moon of Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (12, 'lysithea', 'it is a prograde irregular satellite of Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (13, 'carme', 'it is retrograde irregular satellite of Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (14, 'harpalyke', 'it is known as Jupiter XXII, and a retrograde irregular satellite of Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (15, 'erinome', 'it is known as Jupiter XXV, and a retrograde irregular satellite of Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (16, 'hermippe', 'it is known as Jupiter XXX, and a natural satellite of Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (17, 'elara', 'it is a prograde irregular satellite of Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (18, 'autonoe', 'it is known as Jupiter XXVIII, and a natural satellite of Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (19, 'megaclite', 'it is known as Jupiter XIX, and a natural satellite of Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (20, 'chaldene', 'it is known as Jupiter XXI, and a retrograde irregular satellite of Jupiter', NULL, NULL, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 'rocky planet', false, true, 'it is an ellipsoid with a circumference of about 40,000 km', 1);
INSERT INTO public.planet VALUES (2, 'mars', 'rocky planet', false, false, 'it is the fourth planet from the sun and the second-smallest planet in the solar system', 1);
INSERT INTO public.planet VALUES (3, 'venus', 'rocky planet', true, false, 'it is the second planet from the sun and is the closest planetary neighbor to the earth', 1);
INSERT INTO public.planet VALUES (4, 'jupiter', 'gas giant planet', true, false, 'it is the fifth planet from our sun and is, by far, the largest planet in the solar system', 1);
INSERT INTO public.planet VALUES (5, 'madalitso', 'rocky planet', NULL, NULL, 'it is the celestial body orbiting closest to Abeni', 4);
INSERT INTO public.planet VALUES (6, 'bao', 'gas giant planet', NULL, NULL, 'it is the largest planet in the antares system', 4);
INSERT INTO public.planet VALUES (7, 'hai', NULL, NULL, NULL, 'it is covered in a vast ocean-dotted with a collection of smaller islands', 4);
INSERT INTO public.planet VALUES (8, 'nakiska', NULL, NULL, false, 'it is the sixth planet orbiting Abeni, a cold but not entirely inhospitable world of great mountain chains and vast alien forests', 4);
INSERT INTO public.planet VALUES (9, 'masozi', NULL, NULL, NULL, 'it is the seventh planet orbiting Abeni in the Antares system and has no major moons', 4);
INSERT INTO public.planet VALUES (10, 'kito', NULL, NULL, NULL, 'it is the ninth planet orbiting Abeni in the Antares system and has no major moons', 4);
INSERT INTO public.planet VALUES (11, 'kanika', NULL, NULL, NULL, 'it is the eighth planet orbiting Abeni and has no major moons', 4);
INSERT INTO public.planet VALUES (12, 'njeri', NULL, NULL, NULL, 'it is the first planet orbiting Dejen in the Altares system and has no major moons', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'it is the brightest star in the night sky', 8.611000000000000, 250, 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 'it is the brightest star in the constellation of Andromeda galaxy', 96.870000000000000, 60, 2);
INSERT INTO public.star VALUES (3, 'UY Scuti', 'it is a red supergiant star located in the constellation Scutum', 5219.000000000000000, 3, 1);
INSERT INTO public.star VALUES (4, 'Antares', 'it is the brightest star in the constellation of Scorpius', 554.500000000000000, 11, 1);
INSERT INTO public.star VALUES (5, 'Mirach', 'it is a moderately bright star in the constellation Andromeda', 199.000000000000000, 5, 2);
INSERT INTO public.star VALUES (6, 'Almach', 'it is one of the finest double stars in the sky', 355.500000000000000, 7, 2);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'sol', 'it is 4.5 billion-of-year-old yellow dwarf star - a hot glowing ball of hydrogen and helium - at the center of our solar system', 1);
INSERT INTO public.sun VALUES (2, 'sol', 'it is 4.5 billion-of-year-old yellow dwarf star - a hot glowing ball of hydrogen and helium - at the center of sour solar system', 2);
INSERT INTO public.sun VALUES (3, 'sol', 'it is 4.5 billion-of-year-old yellow dwarf star - a hot glowing ball of hydrogen and helium - at the center of our solar system', 4);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: sun sun_sun_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_sun_id_key UNIQUE (sun_id);


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
-- Name: sun sun_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

