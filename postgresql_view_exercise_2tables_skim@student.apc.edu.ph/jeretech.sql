--
-- postgresQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2019-11-12 16:06:00

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
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 2837
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 2 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for postgresQL';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 25228)
-- Name: _course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._course (
    id integer NOT NULL,
    course_name character varying(7) DEFAULT NULL::character varying,
    course_type character varying(13) DEFAULT NULL::character varying,
    course_time character varying(19) DEFAULT NULL::character varying,
    _professional_id smallint,
    _student_id smallint
);


ALTER TABLE public._course OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 25226)
-- Name: _course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._course_id_seq OWNER TO postgres;

--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 197
-- Name: _course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._course_id_seq OWNED BY public._course.id;


--
-- TOC entry 200 (class 1259 OID 25237)
-- Name: _professional1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._professional1 (
    id integer NOT NULL,
    prof_fname character varying(7) DEFAULT NULL::character varying,
    prof_lname character varying(8) DEFAULT NULL::character varying,
    prof_address character varying(13) DEFAULT NULL::character varying,
    prof_email character varying(22) DEFAULT NULL::character varying,
    prof_date_of_hire character varying(10) DEFAULT NULL::character varying,
    prof_phone_number bigint,
    prof_type character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public._professional1 OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 25235)
-- Name: _professional1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._professional1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._professional1_id_seq OWNER TO postgres;

--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 199
-- Name: _professional1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._professional1_id_seq OWNED BY public._professional1.id;


--
-- TOC entry 202 (class 1259 OID 25249)
-- Name: _student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._student (
    id integer NOT NULL,
    student_fname character varying(6) DEFAULT NULL::character varying,
    student_lname character varying(7) DEFAULT NULL::character varying,
    student_date_of_birth character varying(10) DEFAULT NULL::character varying,
    student_address character varying(14) DEFAULT NULL::character varying,
    student_email character varying(20) DEFAULT NULL::character varying,
    student_phone_number bigint
);


ALTER TABLE public._student OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 25247)
-- Name: _student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._student_id_seq OWNER TO postgres;

--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 201
-- Name: _student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._student_id_seq OWNED BY public._student.id;


--
-- TOC entry 203 (class 1259 OID 25260)
-- Name: outline; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.outline AS
 SELECT _professional1.prof_fname,
    _professional1.prof_lname,
    _course.course_name,
    _course.course_time,
    _course.course_type
   FROM (public._course
     JOIN public._professional1 ON ((_course._professional_id = _professional1.id)));


ALTER TABLE public.outline OWNER TO postgres;

--
-- TOC entry 2687 (class 2604 OID 25231)
-- Name: _course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._course ALTER COLUMN id SET DEFAULT nextval('public._course_id_seq'::regclass);


--
-- TOC entry 2691 (class 2604 OID 25240)
-- Name: _professional1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._professional1 ALTER COLUMN id SET DEFAULT nextval('public._professional1_id_seq'::regclass);


--
-- TOC entry 2698 (class 2604 OID 25252)
-- Name: _student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._student ALTER COLUMN id SET DEFAULT nextval('public._student_id_seq'::regclass);


--
-- TOC entry 2827 (class 0 OID 25228)
-- Dependencies: 198
-- Data for Name: _course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._course (id, course_name, course_type, course_time, _professional_id, _student_id) VALUES (1, 'MATH', 'GENERAL', '2018-10-30 18:00:00', 1, 1);
INSERT INTO public._course (id, course_name, course_type, course_time, _professional_id, _student_id) VALUES (2, 'SCIENCE', 'STEM', '2018-10-18 12:00:00', 2, 2);
INSERT INTO public._course (id, course_name, course_type, course_time, _professional_id, _student_id) VALUES (3, 'ARTS', 'CREATIVE ARTS', '2018-02-17 14:30:00', 3, 3);



--
-- TOC entry 2829 (class 0 OID 25237)
-- Dependencies: 200
-- Data for Name: _professional1; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._professional1 (id, prof_fname, prof_lname, prof_address, prof_email, prof_date_of_hire, prof_phone_number, prof_type) VALUES (1, 'Jackson', 'Huge', '123 ABC', 'jhuge@gmail.com', '2018-10-28', 9174865237, 'DEAN');
INSERT INTO public._professional1 (id, prof_fname, prof_lname, prof_address, prof_email, prof_date_of_hire, prof_phone_number, prof_type) VALUES (2, 'Hugo', 'Jackman', '123 CDE', 'hugojack@gmail.com', '2016-05-18', 97686317, 'ASST.PROF');
INSERT INTO public._professional1 (id, prof_fname, prof_lname, prof_address, prof_email, prof_date_of_hire, prof_phone_number, prof_type) VALUES (3, 'Jackson', 'Michigan', 'Rosevelt 123', 'michijackson@gmail.com', '2014-03-03', 9176863187, 'PARTTIMER');



--
-- TOC entry 2831 (class 0 OID 25249)
-- Dependencies: 202
-- Data for Name: _student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._student (id, student_fname, student_lname, student_date_of_birth, student_address, student_email, student_phone_number) VALUES (1, 'Adam', 'Rogers', '1965', 'DEF 13 Street', 'adamrogers@gmail.com', 9178657948);
INSERT INTO public._student (id, student_fname, student_lname, student_date_of_birth, student_address, student_email, student_phone_number) VALUES (2, 'Scout', 'Antonio', '1971', 'ABD 12 Avenue', 'roro@gmail.com', 9279557785);
INSERT INTO public._student (id, student_fname, student_lname, student_date_of_birth, student_address, student_email, student_phone_number) VALUES (3, 'Jeremy', 'Tan', '1975', 'Abra Street', 'jeretan@gmail.com', 9479557201);



--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 197
-- Name: _course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._course_id_seq', 6, true);


--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 199
-- Name: _professional1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._professional1_id_seq', 6, true);


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 201
-- Name: _student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._student_id_seq', 9, true);


-- Completed on 2019-11-12 16:06:00

--
-- postgresQL database dump complete
--

