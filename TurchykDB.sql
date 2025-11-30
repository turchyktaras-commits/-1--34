--
-- PostgreSQL database dump
--

\restrict 94s0UOntTrerEVLa6F5hlB2PvgoTiIHHKLcKaKDzMUjhAFyBvXUZPzwFdq2XtTQ

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-11-30 17:04:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 33595)
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    genre character varying(50),
    country character varying(50)
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33594)
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artists_id_seq OWNER TO postgres;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 219
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- TOC entry 222 (class 1259 OID 33602)
-- Name: festivals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.festivals (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    city character varying(50) NOT NULL,
    event_date date NOT NULL,
    organizer_id integer NOT NULL
);


ALTER TABLE public.festivals OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33601)
-- Name: festivals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.festivals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.festivals_id_seq OWNER TO postgres;

--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 221
-- Name: festivals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.festivals_id_seq OWNED BY public.festivals.id;


--
-- TOC entry 224 (class 1259 OID 33614)
-- Name: lineups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lineups (
    id integer NOT NULL,
    festival_id integer NOT NULL,
    artist_id integer NOT NULL,
    stage_name character varying(50),
    fee_amount numeric(10,2)
);


ALTER TABLE public.lineups OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33613)
-- Name: lineups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lineups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lineups_id_seq OWNER TO postgres;

--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 223
-- Name: lineups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lineups_id_seq OWNED BY public.lineups.id;


--
-- TOC entry 218 (class 1259 OID 33586)
-- Name: organizers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizers (
    id integer NOT NULL,
    company_name character varying(100) NOT NULL,
    contact_email character varying(100) NOT NULL
);


ALTER TABLE public.organizers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33585)
-- Name: organizers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organizers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.organizers_id_seq OWNER TO postgres;

--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 217
-- Name: organizers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organizers_id_seq OWNED BY public.organizers.id;


--
-- TOC entry 4758 (class 2604 OID 33598)
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 33605)
-- Name: festivals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festivals ALTER COLUMN id SET DEFAULT nextval('public.festivals_id_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 33617)
-- Name: lineups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineups ALTER COLUMN id SET DEFAULT nextval('public.lineups_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 33589)
-- Name: organizers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizers ALTER COLUMN id SET DEFAULT nextval('public.organizers_id_seq'::regclass);


--
-- TOC entry 4924 (class 0 OID 33595)
-- Dependencies: 220
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (id, name, genre, country) FROM stdin;
1	The Hardkiss	Rock	Ukraine
2	Imagine Dragons	Pop Rock	USA
3	Okean Elzy	Rock	Ukraine
\.


--
-- TOC entry 4926 (class 0 OID 33602)
-- Dependencies: 222
-- Data for Name: festivals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.festivals (id, title, city, event_date, organizer_id) FROM stdin;
1	Atlas Weekend	Kyiv	2026-07-10	1
2	Faine Misto	Ternopil	2026-08-02	2
\.


--
-- TOC entry 4928 (class 0 OID 33614)
-- Dependencies: 224
-- Data for Name: lineups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lineups (id, festival_id, artist_id, stage_name, fee_amount) FROM stdin;
1	1	1	Main Stage	15000.00
2	1	2	Main Stage	500000.00
3	2	1	Dark Stage	14000.00
4	2	3	Main Stage	20000.00
\.


--
-- TOC entry 4922 (class 0 OID 33586)
-- Dependencies: 218
-- Data for Name: organizers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organizers (id, company_name, contact_email) FROM stdin;
1	Music World	info@musicworld.com
2	Rock Events	contact@rockevents.ua
\.


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 219
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_id_seq', 3, true);


--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 221
-- Name: festivals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.festivals_id_seq', 2, true);


--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 223
-- Name: lineups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lineups_id_seq', 4, true);


--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 217
-- Name: organizers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organizers_id_seq', 2, true);


--
-- TOC entry 4766 (class 2606 OID 33600)
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- TOC entry 4768 (class 2606 OID 33607)
-- Name: festivals festivals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festivals
    ADD CONSTRAINT festivals_pkey PRIMARY KEY (id);


--
-- TOC entry 4770 (class 2606 OID 33619)
-- Name: lineups lineups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineups
    ADD CONSTRAINT lineups_pkey PRIMARY KEY (id);


--
-- TOC entry 4762 (class 2606 OID 33593)
-- Name: organizers organizers_contact_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizers
    ADD CONSTRAINT organizers_contact_email_key UNIQUE (contact_email);


--
-- TOC entry 4764 (class 2606 OID 33591)
-- Name: organizers organizers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizers
    ADD CONSTRAINT organizers_pkey PRIMARY KEY (id);


--
-- TOC entry 4772 (class 2606 OID 33621)
-- Name: lineups unique_performance; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineups
    ADD CONSTRAINT unique_performance UNIQUE (festival_id, artist_id);


--
-- TOC entry 4774 (class 2606 OID 33627)
-- Name: lineups fk_artist; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineups
    ADD CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- TOC entry 4775 (class 2606 OID 33622)
-- Name: lineups fk_festival; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineups
    ADD CONSTRAINT fk_festival FOREIGN KEY (festival_id) REFERENCES public.festivals(id);


--
-- TOC entry 4773 (class 2606 OID 33608)
-- Name: festivals fk_organizer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festivals
    ADD CONSTRAINT fk_organizer FOREIGN KEY (organizer_id) REFERENCES public.organizers(id);


-- Completed on 2025-11-30 17:04:51

--
-- PostgreSQL database dump complete
--

\unrestrict 94s0UOntTrerEVLa6F5hlB2PvgoTiIHHKLcKaKDzMUjhAFyBvXUZPzwFdq2XtTQ

