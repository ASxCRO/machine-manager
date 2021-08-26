--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2021-08-26 19:47:07

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

--
-- TOC entry 3015 (class 1262 OID 16571)
-- Name: machine-manager-db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "machine-manager-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Croatian_Croatia.1252';


ALTER DATABASE "machine-manager-db" OWNER TO postgres;

\connect -reuse-previous=on "dbname='machine-manager-db'"

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
-- TOC entry 205 (class 1259 OID 16623)
-- Name: failureattachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failureattachments (
    id integer NOT NULL,
    failureid integer NOT NULL,
    attachment bytea NOT NULL
);


ALTER TABLE public.failureattachments OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16621)
-- Name: failureattachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.failureattachments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.failureattachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 200 (class 1259 OID 16588)
-- Name: failures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failures (
    id integer NOT NULL,
    machineid integer,
    description text,
    priority integer,
    status integer,
    checkintime timestamp without time zone DEFAULT now(),
    name text
);


ALTER TABLE public.failures OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16619)
-- Name: failures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.failures ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.failures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 201 (class 1259 OID 16604)
-- Name: machines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.machines (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.machines OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16617)
-- Name: machines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.machines ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.machines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3009 (class 0 OID 16623)
-- Dependencies: 205
-- Data for Name: failureattachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (71, 14, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (72, 15, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (55, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (56, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (57, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (58, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (59, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (60, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (61, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (62, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (63, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (64, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (65, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (66, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (67, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (68, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (69, 13, '\x53797374656d2e427974655b5d');
INSERT INTO public.failureattachments (id, failureid, attachment) OVERRIDING SYSTEM VALUE VALUES (70, 13, '\x53797374656d2e427974655b5d');


--
-- TOC entry 3004 (class 0 OID 16588)
-- Dependencies: 200
-- Data for Name: failures; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.failures (id, machineid, description, priority, status, checkintime, name) OVERRIDING SYSTEM VALUE VALUES (13, 3, '1231231231234', 0, 2, '2021-08-26 16:20:20.408347', '1231231234');
INSERT INTO public.failures (id, machineid, description, priority, status, checkintime, name) OVERRIDING SYSTEM VALUE VALUES (14, 10, 'test opis kvara', 0, 1, '2021-08-26 19:30:24.410705', 'kvar na glavnoj komponenti');
INSERT INTO public.failures (id, machineid, description, priority, status, checkintime, name) OVERRIDING SYSTEM VALUE VALUES (15, 14, 'ostala bez struje', 2, 2, '2021-08-26 19:31:33.947163', 'priključna komponenta ima kvar');


--
-- TOC entry 3005 (class 0 OID 16604)
-- Dependencies: 201
-- Data for Name: machines; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.machines (id, name) OVERRIDING SYSTEM VALUE VALUES (10, 'Anlaser');
INSERT INTO public.machines (id, name) OVERRIDING SYSTEM VALUE VALUES (3, 'Radilica');
INSERT INTO public.machines (id, name) OVERRIDING SYSTEM VALUE VALUES (14, 'Kondezacijski robot');


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 204
-- Name: failureattachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failureattachments_id_seq', 72, true);


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 203
-- Name: failures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failures_id_seq', 15, true);


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 202
-- Name: machines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.machines_id_seq', 14, true);


--
-- TOC entry 2871 (class 2606 OID 16630)
-- Name: failureattachments failureattachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failureattachments
    ADD CONSTRAINT failureattachments_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 16595)
-- Name: failures failures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failures
    ADD CONSTRAINT failures_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 16611)
-- Name: machines machines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.machines
    ADD CONSTRAINT machines_pkey PRIMARY KEY (id);


--
-- TOC entry 2872 (class 2606 OID 16612)
-- Name: failures failures_machineid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failures
    ADD CONSTRAINT failures_machineid_fkey FOREIGN KEY (machineid) REFERENCES public.machines(id);


--
-- TOC entry 2873 (class 2606 OID 16631)
-- Name: failureattachments fk_failure; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failureattachments
    ADD CONSTRAINT fk_failure FOREIGN KEY (failureid) REFERENCES public.failures(id);


-- Completed on 2021-08-26 19:47:07

--
-- PostgreSQL database dump complete
--

