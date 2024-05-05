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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 10);
INSERT INTO public.games VALUES (2, 1, 8);
INSERT INTO public.games VALUES (3, 2, 919);
INSERT INTO public.games VALUES (4, 3, 903);
INSERT INTO public.games VALUES (5, 2, 784);
INSERT INTO public.games VALUES (6, 2, 502);
INSERT INTO public.games VALUES (7, 2, 848);
INSERT INTO public.games VALUES (8, 15, 638);
INSERT INTO public.games VALUES (9, 16, 371);
INSERT INTO public.games VALUES (10, 15, 867);
INSERT INTO public.games VALUES (11, 15, 22);
INSERT INTO public.games VALUES (12, 15, 766);
INSERT INTO public.games VALUES (13, 17, 849);
INSERT INTO public.games VALUES (14, 18, 422);
INSERT INTO public.games VALUES (15, 17, 812);
INSERT INTO public.games VALUES (16, 17, 229);
INSERT INTO public.games VALUES (17, 17, 766);
INSERT INTO public.games VALUES (18, 1, 8);
INSERT INTO public.games VALUES (19, 20, 8);
INSERT INTO public.games VALUES (20, 21, 21);
INSERT INTO public.games VALUES (21, 21, 614);
INSERT INTO public.games VALUES (22, 22, 427);
INSERT INTO public.games VALUES (23, 22, 647);
INSERT INTO public.games VALUES (24, 21, 725);
INSERT INTO public.games VALUES (25, 21, 897);
INSERT INTO public.games VALUES (26, 21, 91);
INSERT INTO public.games VALUES (27, 23, 607);
INSERT INTO public.games VALUES (28, 23, 602);
INSERT INTO public.games VALUES (29, 24, 557);
INSERT INTO public.games VALUES (30, 24, 642);
INSERT INTO public.games VALUES (31, 23, 992);
INSERT INTO public.games VALUES (32, 23, 241);
INSERT INTO public.games VALUES (33, 23, 624);
INSERT INTO public.games VALUES (34, 25, 210);
INSERT INTO public.games VALUES (35, 25, 701);
INSERT INTO public.games VALUES (36, 26, 673);
INSERT INTO public.games VALUES (37, 26, 817);
INSERT INTO public.games VALUES (38, 25, 152);
INSERT INTO public.games VALUES (39, 25, 158);
INSERT INTO public.games VALUES (40, 25, 114);
INSERT INTO public.games VALUES (41, 27, 411);
INSERT INTO public.games VALUES (42, 27, 382);
INSERT INTO public.games VALUES (43, 28, 612);
INSERT INTO public.games VALUES (44, 28, 4);
INSERT INTO public.games VALUES (45, 27, 107);
INSERT INTO public.games VALUES (46, 27, 615);
INSERT INTO public.games VALUES (47, 27, 497);
INSERT INTO public.games VALUES (48, 29, 453);
INSERT INTO public.games VALUES (49, 29, 729);
INSERT INTO public.games VALUES (50, 30, 368);
INSERT INTO public.games VALUES (51, 30, 114);
INSERT INTO public.games VALUES (52, 29, 353);
INSERT INTO public.games VALUES (53, 29, 1001);
INSERT INTO public.games VALUES (54, 29, 352);
INSERT INTO public.games VALUES (55, 31, 367);
INSERT INTO public.games VALUES (56, 31, 10);
INSERT INTO public.games VALUES (57, 32, 192);
INSERT INTO public.games VALUES (58, 32, 325);
INSERT INTO public.games VALUES (59, 31, 706);
INSERT INTO public.games VALUES (60, 31, 855);
INSERT INTO public.games VALUES (61, 31, 648);
INSERT INTO public.games VALUES (62, 41, 849);
INSERT INTO public.games VALUES (63, 41, 454);
INSERT INTO public.games VALUES (64, 42, 379);
INSERT INTO public.games VALUES (65, 42, 788);
INSERT INTO public.games VALUES (66, 41, 483);
INSERT INTO public.games VALUES (67, 41, 554);
INSERT INTO public.games VALUES (68, 41, 934);
INSERT INTO public.games VALUES (69, 1, 7);
INSERT INTO public.games VALUES (70, 43, 484);
INSERT INTO public.games VALUES (71, 43, 377);
INSERT INTO public.games VALUES (72, 44, 979);
INSERT INTO public.games VALUES (73, 44, 741);
INSERT INTO public.games VALUES (74, 43, 149);
INSERT INTO public.games VALUES (75, 43, 146);
INSERT INTO public.games VALUES (76, 43, 983);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Sarah');
INSERT INTO public.users VALUES (2, 'user_1714883574296');
INSERT INTO public.users VALUES (3, 'user_1714883574295');
INSERT INTO public.users VALUES (4, 'user_1714883652753');
INSERT INTO public.users VALUES (5, 'user_1714883652752');
INSERT INTO public.users VALUES (6, 'Test');
INSERT INTO public.users VALUES (7, 'user_1714885629651');
INSERT INTO public.users VALUES (8, 'user_1714885629650');
INSERT INTO public.users VALUES (9, 'user_1714885807286');
INSERT INTO public.users VALUES (10, 'user_1714885807285');
INSERT INTO public.users VALUES (11, 'user_1714885835495');
INSERT INTO public.users VALUES (12, 'user_1714885835494');
INSERT INTO public.users VALUES (15, 'user_1714886100551');
INSERT INTO public.users VALUES (16, 'user_1714886100550');
INSERT INTO public.users VALUES (17, 'user_1714886397738');
INSERT INTO public.users VALUES (18, 'user_1714886397737');
INSERT INTO public.users VALUES (19, 'ABC');
INSERT INTO public.users VALUES (20, 'DEF');
INSERT INTO public.users VALUES (21, 'user_1714886708039');
INSERT INTO public.users VALUES (22, 'user_1714886708038');
INSERT INTO public.users VALUES (23, 'user_1714886787591');
INSERT INTO public.users VALUES (24, 'user_1714886787590');
INSERT INTO public.users VALUES (25, 'user_1714886952035');
INSERT INTO public.users VALUES (26, 'user_1714886952034');
INSERT INTO public.users VALUES (27, 'user_1714887014808');
INSERT INTO public.users VALUES (28, 'user_1714887014807');
INSERT INTO public.users VALUES (29, 'user_1714887072213');
INSERT INTO public.users VALUES (30, 'user_1714887072212');
INSERT INTO public.users VALUES (31, 'user_1714887074553');
INSERT INTO public.users VALUES (32, 'user_1714887074552');
INSERT INTO public.users VALUES (33, 'user_1714887337055');
INSERT INTO public.users VALUES (35, 'user_1714887337054');
INSERT INTO public.users VALUES (41, 'user_1714887411639');
INSERT INTO public.users VALUES (42, 'user_1714887411638');
INSERT INTO public.users VALUES (43, 'user_1714887561558');
INSERT INTO public.users VALUES (44, 'user_1714887561557');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 76, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_id_seq', 44, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

