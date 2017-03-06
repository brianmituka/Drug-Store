--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: vagabond
--

CREATE TABLE customers (
    id integer NOT NULL,
    name character varying,
    email character varying
);


ALTER TABLE customers OWNER TO vagabond;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: vagabond
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_id_seq OWNER TO vagabond;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagabond
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: vagabond
--

CREATE TABLE products (
    id integer NOT NULL,
    description character varying,
    price integer,
    quantity integer
);


ALTER TABLE products OWNER TO vagabond;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: vagabond
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO vagabond;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagabond
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: vagabond
--

CREATE TABLE transactions (
    id integer NOT NULL,
    date timestamp without time zone,
    saleprice integer,
    productid integer,
    customerid integer,
    productname character varying
);


ALTER TABLE transactions OWNER TO vagabond;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: vagabond
--

CREATE SEQUENCE transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transactions_id_seq OWNER TO vagabond;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagabond
--

ALTER SEQUENCE transactions_id_seq OWNED BY transactions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagabond
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagabond
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagabond
--

ALTER TABLE ONLY transactions ALTER COLUMN id SET DEFAULT nextval('transactions_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: vagabond
--

COPY customers (id, name, email) FROM stdin;
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagabond
--

SELECT pg_catalog.setval('customers_id_seq', 1, false);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: vagabond
--

COPY products (id, description, price, quantity) FROM stdin;
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagabond
--

SELECT pg_catalog.setval('products_id_seq', 1, false);


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: vagabond
--

COPY transactions (id, date, saleprice, productid, customerid, productname) FROM stdin;
\.


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagabond
--

SELECT pg_catalog.setval('transactions_id_seq', 1, false);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: vagabond
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: vagabond
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: vagabond
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

