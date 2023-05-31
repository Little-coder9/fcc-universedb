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
    name character varying NOT NULL,
    type character varying NOT NULL,
    has_black_hole boolean,
    age_in_billion_years numeric(4,2)
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
-- Name: luminosity_class_of_stars; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.luminosity_class_of_stars (
    luminosity_class_of_stars_id integer NOT NULL,
    name character varying NOT NULL,
    symbol character varying(5) NOT NULL,
    descripton text
);


ALTER TABLE public.luminosity_class_of_stars OWNER TO freecodecamp;

--
-- Name: luminosity_class_of_stars_luminosity_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.luminosity_class_of_stars_luminosity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.luminosity_class_of_stars_luminosity_id_seq OWNER TO freecodecamp;

--
-- Name: luminosity_class_of_stars_luminosity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.luminosity_class_of_stars_luminosity_id_seq OWNED BY public.luminosity_class_of_stars.luminosity_class_of_stars_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    radius numeric(7,2) NOT NULL,
    orbital_period numeric,
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
    name character varying(50) NOT NULL,
    star_system character varying(30) NOT NULL,
    no_of_moons integer NOT NULL,
    has_atmosphere boolean,
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
    name character varying NOT NULL,
    age numeric(4,2),
    no_of_planets integer NOT NULL,
    approximate_temp_in_c integer,
    luminosity_class_of_stars_id integer NOT NULL,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: luminosity_class_of_stars luminosity_class_of_stars_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.luminosity_class_of_stars ALTER COLUMN luminosity_class_of_stars_id SET DEFAULT nextval('public.luminosity_class_of_stars_luminosity_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MilkyWay', 'Spiral', true, 13.51);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', true, 10.83);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Lenticular', false, 9.75);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', false, 8.92);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', true, 12.68);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', false, 7.86);


--
-- Data for Name: luminosity_class_of_stars; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.luminosity_class_of_stars VALUES (1, 'Hypergiants', '0', 'These are extremely rare and extremely luminous stars, even more so than supergiants. They are sometimes included as an extension of Class I.');
INSERT INTO public.luminosity_class_of_stars VALUES (2, 'Supergiants', 'I', 'These are the most luminous stars, often with large radii. They are further divided into subclasses Ia (most luminous) and Ib (less luminous).');
INSERT INTO public.luminosity_class_of_stars VALUES (3, 'Bright Giants', 'II', ' Stars in this class are less luminous than supergiants but still more luminous than main sequence stars.');
INSERT INTO public.luminosity_class_of_stars VALUES (4, 'Giants', 'III', 'These stars have a moderate luminosity and are larger than main sequence stars.');
INSERT INTO public.luminosity_class_of_stars VALUES (5, 'Subgiants', 'IV', 'Stars in this class have started evolving away from the main sequence and are transitioning to the giant stage.');
INSERT INTO public.luminosity_class_of_stars VALUES (6, 'Dwarf', 'V', 'This class includes the majority of stars, including our Sun. They are in a stable phase of hydrogen fusion in their cores and have a range of spectral types (O, B, A, F, G, K, M) based on temperature.');
INSERT INTO public.luminosity_class_of_stars VALUES (7, 'Subdwarfs', 'VI', 'These are fainter and smaller than main sequence stars, with lower luminosity and surface temperature.');
INSERT INTO public.luminosity_class_of_stars VALUES (8, 'White dwarfs', 'VII', 'White dwarfs are thought to be the final evolutionary state of stars whose mass is not high enough to become a neutron star or black hole. ');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1737.10, 1, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 111.10, 32, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 60.20, 1, 2);
INSERT INTO public.moon VALUES (4, 'Io', 1821.60, 1.77, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.80, 3.55, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.10, 7.16, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.30, 16.69, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 2575.50, 4, 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252.10, 1.4, 4);
INSERT INTO public.moon VALUES (10, 'Rhea', 764.00, 4, 4);
INSERT INTO public.moon VALUES (11, 'Dione', 561.00, 2, 4);
INSERT INTO public.moon VALUES (12, 'Tethys', 531.00, 1, 4);
INSERT INTO public.moon VALUES (13, 'Prox', 123.00, 1, 5);
INSERT INTO public.moon VALUES (14, 'Bet', 234.00, 5, 6);
INSERT INTO public.moon VALUES (15, 'Ius', 456.00, 7, 7);
INSERT INTO public.moon VALUES (16, 'Pha', 567.00, 6, 8);
INSERT INTO public.moon VALUES (17, 'ilson', 890.00, 20, 9);
INSERT INTO public.moon VALUES (18, 'aris', 621.00, 25, 10);
INSERT INTO public.moon VALUES (19, 'sira', 1334.00, 9, 10);
INSERT INTO public.moon VALUES (20, 'bolp', 1897.00, 10, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Solar system', 1, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Solar system', 2, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Solar system', 79, true, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Solar system', 124, true, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Solar system', 14, false, 1);
INSERT INTO public.planet VALUES (6, 'Ima', 'Alpha system', 3, true, 4);
INSERT INTO public.planet VALUES (7, 'Geuse', 'Betelgeuse system', 7, false, 4);
INSERT INTO public.planet VALUES (8, 'Sirius B', 'Sirius system', 9, true, 4);
INSERT INTO public.planet VALUES (9, 'Alpha B', 'Alpha system', 10, true, 5);
INSERT INTO public.planet VALUES (10, 'Epilson B', 'Epilson system', 4, true, 6);
INSERT INTO public.planet VALUES (11, 'Yaris', 'Polaris system', 20, true, 6);
INSERT INTO public.planet VALUES (12, 'Vega b', 'Vega', 0, false, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.60, 8, 5778, 6, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.80, 0, 3042, 6, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8.60, 0, 3540, 2, 2);
INSERT INTO public.star VALUES (4, 'Sirius', 0.20, 3, 9940, 2, 3);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 6.10, 1, 5790, 6, 4);
INSERT INTO public.star VALUES (6, 'Epilson Eridani', 0.80, 2, 5080, 6, 5);
INSERT INTO public.star VALUES (7, 'Polaris', 7.50, 0, 5820, 2, 1);
INSERT INTO public.star VALUES (8, 'Vega', 0.45, 1, 9602, 6, 2);
INSERT INTO public.star VALUES (9, 'Antares', 12.40, 0, 3580, 2, 4);
INSERT INTO public.star VALUES (10, 'Rigel', 10.60, 0, 11000, 2, 6);
INSERT INTO public.star VALUES (11, 'Deneb', 8.70, 0, 8520, 2, 2);
INSERT INTO public.star VALUES (12, 'Aldebaran', 6.70, 0, 3910, 3, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: luminosity_class_of_stars_luminosity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.luminosity_class_of_stars_luminosity_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: luminosity_class_of_stars luminosity_class_of_stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.luminosity_class_of_stars
    ADD CONSTRAINT luminosity_class_of_stars_name_key UNIQUE (name);


--
-- Name: luminosity_class_of_stars luminosity_class_of_stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.luminosity_class_of_stars
    ADD CONSTRAINT luminosity_class_of_stars_pkey PRIMARY KEY (luminosity_class_of_stars_id);


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
-- Name: star star_luminosity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_luminosity_id_fkey FOREIGN KEY (luminosity_class_of_stars_id) REFERENCES public.luminosity_class_of_stars(luminosity_class_of_stars_id);


--
-- PostgreSQL database dump complete
--

