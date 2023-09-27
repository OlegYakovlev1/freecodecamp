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
    name character varying(255) NOT NULL,
    catalog_number character varying(255),
    galaxy_type_id integer,
    distance_in_pc integer,
    mass numeric,
    diameter numeric,
    constellation character varying(50),
    coordinates character varying(50) NOT NULL,
    redshift numeric,
    discoverer character varying(255),
    discovery_date date,
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    catalog_number character varying(255),
    mass numeric,
    radius numeric,
    distance_from_planet numeric NOT NULL,
    orbital_period numeric,
    description text,
    has_surface_water boolean,
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
    name character varying(255) NOT NULL,
    catalog_number character varying(255),
    planet_type_id integer,
    mass numeric,
    radius numeric,
    distance_from_star numeric NOT NULL,
    orbital_period numeric,
    description text,
    has_life boolean,
    has_atmosphere boolean,
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    catalog_number character varying(255),
    spectral_type character varying(10),
    temperature_in_k integer,
    mass numeric,
    radius numeric,
    luminosity numeric,
    constellation character varying(50),
    coordinates character varying(50) NOT NULL,
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'N/A', 1, 25000, 1500000000000, 100000, 'Sagittarius', '(12.0, -12.0)', 0.0, 'Various', '1750-01-01', 'The Milky Way is the galaxy that contains our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'M31', 1, 25000, 1500000000000, 220000, 'Andromeda', '(00.0, +41.0)', 0.00026, 'Simon Marius', '1612-01-01', 'The Andromeda Galaxy is the nearest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'M33', 1, 30000, 40000000000, 60000, 'Triangulum', '(01.0, +30.7)', 0.00005, 'Charles Messier', '1764-01-01', 'The Triangulum Galaxy is a smaller spiral galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'M104', 1, 29000, 860000000000, 50000, 'Virgo', '(12.4, -11.6)', 0.00377, 'Pierre Méchain', '1781-01-01', 'The Sombrero Galaxy is known for its prominent dust lane and disk-like appearance.');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'M87', 2, 54000, 6400000000000, 120000, 'Virgo', '(12.4, +12.4)', 0.00436, 'Charles Messier', '1781-01-01', 'Messier 87 is a giant elliptical galaxy in the Virgo Cluster.');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'LMC', 3, 160000, 1000000000, 14000, 'Dorado', '(05.5, -69.7)', 0.00006, 'Unknown', '1519-01-01', 'The Large Magellanic Cloud is a satellite galaxy of the Milky Way.');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Spiral galaxies are characterized by spiral arms radiating out from a central nucleus.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Elliptical galaxies have a smooth, ellipsoidal shape and lack spiral arms.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Irregular galaxies have irregular shapes and no distinct structure.');
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'Lenticular galaxies have a lens-like shape and combine features of both spiral and elliptical galaxies.');
INSERT INTO public.galaxy_type VALUES (5, 'Dwarf', 'Dwarf galaxies are small galaxies with lower mass and luminosity compared to larger galaxies.');
INSERT INTO public.galaxy_type VALUES (6, 'Barred Spiral', 'Barred spiral galaxies have a bar-shaped central region extending through the nucleus, with spiral arms.');
INSERT INTO public.galaxy_type VALUES (7, 'Ring', 'Ring galaxies have a bright ring-like structure surrounding a central core.');
INSERT INTO public.galaxy_type VALUES (8, 'Seyfert', 'Seyfert galaxies are characterized by active galactic nuclei (AGN) and strong emission lines in their spectra.');
INSERT INTO public.galaxy_type VALUES (9, 'Starburst', 'Starburst galaxies experience intense bursts of star formation, leading to a high rate of star production.');
INSERT INTO public.galaxy_type VALUES (10, 'Quasar Host', 'Quasar host galaxies are associated with extremely luminous and active galactic nuclei (quasars).');
INSERT INTO public.galaxy_type VALUES (11, 'Low Surface Brightness', 'Low surface brightness galaxies have a low overall brightness, making them challenging to observe.');
INSERT INTO public.galaxy_type VALUES (12, 'Ultra-Compact Dwarf', 'Ultra-compact dwarf galaxies are very small and dense galaxies, often found in galaxy clusters.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Luna', 0.0123, 0.273, 384400, 27.32, 'Earth''s natural satellite.', true, 24);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars I', 0.000000479, 0.1, 9378, 0.32, 'One of Mars'' two small moons.', false, 25);
INSERT INTO public.moon VALUES (3, 'Io', 'Jupiter I', 0.015, 0.286, 421700, 1.77, 'One of Jupiter''s Galilean moons.', false, 26);
INSERT INTO public.moon VALUES (4, 'Europa', 'Jupiter II', 0.008, 0.245, 671100, 3.55, 'Europa is known for its subsurface ocean and potential for life.', true, 26);
INSERT INTO public.moon VALUES (5, 'Titan', 'Saturn VI', 0.0225, 0.404, 1221860, 15.95, 'Titan is Saturn''s largest moon and has a thick atmosphere.', true, 28);
INSERT INTO public.moon VALUES (6, 'Triton', 'Neptune I', 0.00359, 0.211, 354760, -5.88, 'Triton is Neptune''s largest moon and orbits in a retrograde direction.', true, 29);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Jupiter III', 0.025, 0.413, 1070400, 7.16, 'Ganymede is the largest moon in the Solar System.', false, 26);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Jupiter IV', 0.018, 0.378, 1882700, 16.69, 'Callisto is one of Jupiter''s Galilean moons.', true, 26);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn II', 0.000011, 0.252, 237948, 1.37, 'Enceladus is known for its geysers of water ice.', true, 28);
INSERT INTO public.moon VALUES (10, 'Oberon', 'Uranus II', 0.0032, 0.34, 584300, 13.46, 'Oberon is one of Uranus'' moons.', false, 31);
INSERT INTO public.moon VALUES (11, 'Dione', 'Saturn IV', 0.00052, 0.273, 377400, 2.74, 'Dione is a moon of Saturn and has a heavily cratered surface.', false, 28);
INSERT INTO public.moon VALUES (12, 'Miranda', 'Uranus V', 0.000066, 0.235, 129390, 1.41, 'Miranda is the smallest of Uranus'' major moons.', false, 31);
INSERT INTO public.moon VALUES (13, 'Charon', 'Pluto I', 0.0001586, 0.606, 19591, 6.39, 'Charon is the largest moon of Pluto and orbits closely.', false, 32);
INSERT INTO public.moon VALUES (14, 'Phoebe', 'Saturn IX', 0.00000085, 0.1066, 12947660, 550.5, 'Phoebe is a distant irregular moon of Saturn.', false, 28);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'Saturn VIII', 0.000112, 0.735, 3560840, 79.33, 'Iapetus has a two-toned appearance with a dark leading hemisphere.', false, 28);
INSERT INTO public.moon VALUES (16, 'Tethys', 'Saturn III', 0.000062, 0.313, 294619, 1.89, 'Tethys is one of Saturn''s innermost major moons.', false, 28);
INSERT INTO public.moon VALUES (17, 'Mimas', 'Saturn I', 0.0000038, 0.198, 185520, 0.942, 'Mimas is known for its large impact crater, Herschel.', false, 28);
INSERT INTO public.moon VALUES (18, 'Hyperion', 'Saturn VII', 0.0000055, 0.138, 1481010, 21.28, 'Hyperion has an irregular shape and a sponge-like appearance.', false, 28);
INSERT INTO public.moon VALUES (19, 'Amalthea', 'Jupiter V', 0.00000085, 0.083, 181365, 0.498, 'Amalthea is one of Jupiter''s small inner moons.', false, 26);
INSERT INTO public.moon VALUES (20, 'Janus', 'Saturn X', 0.000000005, 0.089, 151472, 0.694, 'Janus is one of Saturn''s small inner moons.', false, 28);
INSERT INTO public.moon VALUES (21, 'Deimos', 'Mars II', 0.000000011, 0.0062, 23459, 1.26, 'Deimos is the smaller and outermost moon of Mars.', false, 25);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (24, 'Earth', 'Sol III', 1, 1.0, 1.0, 1.0, 365.25, 'Earth is the third planet from the Sun and the only known celestial body to support life.', true, true, 6);
INSERT INTO public.planet VALUES (25, 'Mars', 'Sol IV', 1, 0.107, 0.53, 1.52, 687.0, 'Mars is often called the "Red Planet" due to its reddish appearance.', true, false, 6);
INSERT INTO public.planet VALUES (26, 'Jupiter', 'Sol V', 2, 317.8, 11.2, 5.20, 4331.0, 'Jupiter is the largest planet in the Solar System.', false, true, 6);
INSERT INTO public.planet VALUES (27, 'Venus', 'Sol II', 1, 0.815, 0.95, 0.72, 224.7, 'Venus is known for its thick, toxic atmosphere and extreme surface temperatures.', false, true, 6);
INSERT INTO public.planet VALUES (28, 'Saturn', 'Sol VI', 2, 95.2, 9.45, 9.58, 10747.0, 'Saturn is famous for its stunning ring system.', false, true, 6);
INSERT INTO public.planet VALUES (29, 'Neptune', 'Sol VIII', 3, 17.1, 3.88, 30.05, 60189.0, 'Neptune is the farthest planet from the Sun and has a blue appearance.', false, true, 6);
INSERT INTO public.planet VALUES (30, 'Mercury', 'Sol I', 1, 0.055, 0.38, 0.39, 88.0, 'Mercury is the closest planet to the Sun.', false, true, 6);
INSERT INTO public.planet VALUES (31, 'Uranus', 'Sol VII', 3, 14.5, 4.0, 19.22, 30685.0, 'Uranus is unique for its tilted axis of rotation.', false, true, 6);
INSERT INTO public.planet VALUES (32, 'Pluto', '134340', 4, 0.0022, 0.18, 39.48, 90560.0, 'Pluto was formerly considered the ninth planet in the Solar System.', false, false, 6);
INSERT INTO public.planet VALUES (33, 'Kepler-186f', 'Kepler-186f', 9, 0.125, 1.0, 0.38, 130.0, 'Kepler-186f is an Earth-sized exoplanet located in the habitable zone of its star.', true, true, 7);
INSERT INTO public.planet VALUES (34, 'Gliese 581c', 'Gliese 581c', 1, 0.0156, 0.16, 0.073, 12.9, 'Gliese 581c is a potentially habitable exoplanet in the Gliese 581 system.', true, true, 7);
INSERT INTO public.planet VALUES (35, 'TRAPPIST-1d', 'TRAPPIST-1d', 1, 0.297, 0.77, 0.021, 4.05, 'TRAPPIST-1d is one of the planets in the TRAPPIST-1 system with potential for liquid water.', true, true, 8);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Terrestrial planets are rocky and similar in composition to Earth.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Gas giant planets are massive and primarily composed of hydrogen and helium.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Ice giant planets are also composed of hydrogen and helium but have icy components like water and methane.');
INSERT INTO public.planet_type VALUES (4, 'Dwarf Planet', 'Dwarf planets are spherical objects that have not cleared their orbits of other debris.');
INSERT INTO public.planet_type VALUES (5, 'Hot Planet', 'Hot planets are characterized by high surface temperatures, often due to their proximity to their stars.');
INSERT INTO public.planet_type VALUES (6, 'Cold Planet', 'Cold planets are located in the outer regions of their solar systems, where temperatures are extremely cold.');
INSERT INTO public.planet_type VALUES (7, 'Tidally Locked', 'Tidally locked planets have one side permanently facing their parent star due to tidal forces.');
INSERT INTO public.planet_type VALUES (8, 'Habitable Zone', 'Habitable zone planets are located in a region where conditions might support liquid water and potentially life.');
INSERT INTO public.planet_type VALUES (9, 'Super-Earth', 'Super-Earth exoplanets are larger and more massive than Earth but still have rocky surfaces. They may have a range of sizes and can be terrestrial in nature.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (6, 'Sun', 'Sol', 'G2V', 5778, 1.0, 1.0, 1.0, 'N/A', '(0.0, 0.0)', 'The Sun is the star at the center of the Solar System.', 1);
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 'HD 128620', 'G2V', 5790, 1.1, 1.22, 1.519, 'Centaurus', '(14.0, -60.0)', 'Alpha Centauri A is the closest star to the Sun.', 1);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 'Alpha Ori', 'M1I', 3600, 20.0, 950, 105000, 'Orion', '(5.9, +7.4)', 'Betelgeuse is a red supergiant in the constellation Orion.', 1);
INSERT INTO public.star VALUES (9, 'Sirius', 'Alpha CMa', 'A1V', 9940, 2.02, 1.711, 25.4, 'Canis Major', '(6.7, -16.7)', 'Sirius is the brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (10, 'Proxima Centauri', 'Alpha Cen C', 'M5.5V', 3042, 0.12, 0.141, 0.0017, 'Centaurus', '(14.0, -60.1)', 'Proxima Centauri is the closest known star to the Sun.', 1);
INSERT INTO public.star VALUES (11, 'Arcturus', 'Alpha Boo', 'K1.5III', 4286, 1.08, 25.7, 170, 'Boötes', '(14.3, +19.2)', 'Arcturus is a red giant star and the brightest in the constellation Boötes.', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 35, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 9, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: galaxy galaxy_coordinates_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_coordinates_key UNIQUE (coordinates);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_catalog_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_catalog_number_key UNIQUE (catalog_number);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_catalog_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_catalog_number_key UNIQUE (catalog_number);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_coordinates_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_coordinates_key UNIQUE (coordinates);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

