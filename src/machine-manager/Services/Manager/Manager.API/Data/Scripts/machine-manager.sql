--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2021-08-24 20:26:15

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

--
-- TOC entry 3009 (class 0 OID 16623)
-- Dependencies: 205
-- Data for Name: failureattachments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3004 (class 0 OID 16588)
-- Dependencies: 200
-- Data for Name: failures; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.failures (id, machineid, description, priority, status, checkintime) OVERRIDING SYSTEM VALUE VALUES (1, 4, 'Anlaser ima problema sa pokretanjem', 0, 0, '2021-08-24 19:40:44.611796');
INSERT INTO public.failures (id, machineid, description, priority, status, checkintime) OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Radilica ne pokreće motor', 0, 0, '2021-08-24 20:09:57.842932');
INSERT INTO public.failures (id, machineid, description, priority, status, checkintime) OVERRIDING SYSTEM VALUE VALUES (3, 1, 'Radilica ne radi', 0, 0, '2021-08-24 20:10:16.125015');


--
-- TOC entry 3005 (class 0 OID 16604)
-- Dependencies: 201
-- Data for Name: machines; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.machines (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Radilica');
INSERT INTO public.machines (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'Robot');
INSERT INTO public.machines (id, name) OVERRIDING SYSTEM VALUE VALUES (3, 'Anlaser');
INSERT INTO public.machines (id, name) OVERRIDING SYSTEM VALUE VALUES (4, 'Anlaser');


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 204
-- Name: failureattachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failureattachments_id_seq', 1, false);


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 203
-- Name: failures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failures_id_seq', 3, true);


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 202
-- Name: machines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.machines_id_seq', 4, true);


-- Completed on 2021-08-24 20:26:16

--
-- PostgreSQL database dump complete
--

