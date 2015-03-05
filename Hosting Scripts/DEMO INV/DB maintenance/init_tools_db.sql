--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.1
-- Dumped by pg_dump version 9.3.1
-- Started on 2014-10-10 17:36:24

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 169 (class 1259 OID 961890)
-- Name: organisation; Type: TABLE; Schema: public; Owner: inventory; Tablespace: 
--

CREATE TABLE organisation (
    id bigint NOT NULL,
    code character varying(255),
    consistencyversion bigint NOT NULL,
    deleted boolean NOT NULL,
    email character varying(255),
    info character varying(255),
    name character varying(255),
    phonenumber character varying(255),
    tunnus character varying(255),
    city character varying(255),
    countrycode character varying(255),
    description character varying(255),
    index character varying(255),
    pobox character varying(255),
    street character varying(255)
);


ALTER TABLE public.organisation OWNER TO inventory;

--
-- TOC entry 163 (class 1259 OID 961848)
-- Name: orguser; Type: TABLE; Schema: public; Owner: inventory; Tablespace: 
--

CREATE TABLE orguser (
    id bigint NOT NULL,
    consistencyversion bigint NOT NULL,
    deleted boolean NOT NULL,
    email character varying(255),
    firstname character varying(255),
    identities bytea,
    lastname character varying(255),
    phonenumber character varying(255),
    city character varying(255),
    countrycode character varying(255),
    description character varying(255),
    index character varying(255),
    pobox character varying(255),
    street character varying(255),
    organisation_id bigint
);

--
-- TOC entry 165 (class 1259 OID 961864)
-- Name: account; Type: TABLE; Schema: public; Owner: inventory; Tablespace: 
--

CREATE TABLE account (
    id bigint NOT NULL,
    consistencyversion bigint NOT NULL,
    dateendedfordb timestamp without time zone,
    datestartedfordb timestamp without time zone,
    datetouchedfordb timestamp without time zone,
    deleted boolean NOT NULL,
    pwd character varying(255),
    state integer,
    uniquesessionid character varying(255),
    usrname character varying(255),
    user_id bigint
);


ALTER TABLE public.account OWNER TO inventory;

--
-- TOC entry 168 (class 1259 OID 961882)
-- Name: category; Type: TABLE; Schema: public; Owner: inventory; Tablespace: 
--

CREATE TABLE category (
    id bigint NOT NULL,
    code character varying(255),
    consistencyversion bigint NOT NULL,
    deleted boolean NOT NULL,
    name character varying(255),
    parent_id bigint
);


ALTER TABLE public.category OWNER TO inventory;

--
-- TOC entry 166 (class 1259 OID 961872)
-- Name: message; Type: TABLE; Schema: public; Owner: inventory; Tablespace: 
--

CREATE TABLE message (
    id bigint NOT NULL,
    consistencyversion bigint NOT NULL,
    datefordb date,
    deleted boolean NOT NULL,
    status integer,
    text character varying(255),
    type integer,
    from_id bigint,
    item_id bigint,
    to_id bigint
);


ALTER TABLE public.message OWNER TO inventory;

--
-- TOC entry 164 (class 1259 OID 961856)
-- Name: producer; Type: TABLE; Schema: public; Owner: inventory; Tablespace: 
--

CREATE TABLE producer (
    id bigint NOT NULL,
    consistencyversion bigint NOT NULL,
    deleted boolean NOT NULL,
    description character varying(255),
    name character varying(255)
);


ALTER TABLE public.producer OWNER TO inventory;

--
-- TOC entry 161 (class 1259 OID 961762)
-- Name: sequence; Type: TABLE; Schema: public; Owner: inventory; Tablespace: 
--

CREATE TABLE sequence (
    seq_name character varying(50) NOT NULL,
    seq_count numeric(38,0)
);


ALTER TABLE public.sequence OWNER TO inventory;

--
-- TOC entry 162 (class 1259 OID 961840)
-- Name: tool; Type: TABLE; Schema: public; Owner: inventory; Tablespace: 
--

CREATE TABLE tool (
    id bigint NOT NULL,
    code character varying(255),
    consistencyversion bigint NOT NULL,
    deleted boolean NOT NULL,
    description character varying(255),
    name character varying(255),
    category_id bigint,
    producer_id bigint
);


ALTER TABLE public.tool OWNER TO inventory;

--
-- TOC entry 167 (class 1259 OID 961877)
-- Name: toolitem; Type: TABLE; Schema: public; Owner: inventory; Tablespace: 
--

CREATE TABLE toolitem (
    id bigint NOT NULL,
    consistencyversion bigint NOT NULL,
    deleted boolean NOT NULL,
    quantity integer,
    status integer,
    accuracy double precision,
    latitude double precision,
    longitude double precision,
    currentuser_id bigint,
    org_id bigint,
    responsible_id bigint,
    tool_id bigint,
    reservedby_id bigint,
    barcode character varying(255)
);


ALTER TABLE public.toolitem OWNER TO inventory;


--
-- TOC entry 1919 (class 0 OID 961890)
-- Dependencies: 169
-- Data for Name: organisation; Type: TABLE DATA; Schema: public; Owner: inventory
--

INSERT INTO organisation VALUES (1, '0001', 1, false, 'info@construction.fi', '', 'Construction Oy', '040 1111111', '12345-6', 'Espoo', 'FI', '01122', NULL, 'Espoonlahdentie 5 4 A 15', NULL);


--
-- TOC entry 1913 (class 0 OID 961848)
-- Dependencies: 163
-- Data for Name: orguser; Type: TABLE DATA; Schema: public; Owner: inventory
-- id, consistencyversion, deleted,email, firstname,identities,lastname,phonenumber,city,countrycode,description,index,pobox,street,organisation_id
--

INSERT INTO orguser VALUES (2, 1, false, NULL, 'Serge', NULL, 'Sev',       '040 1234567', 'Espoo', 'FI', NULL, '04321', NULL, 'Finnontie 15', 1);
INSERT INTO orguser VALUES (3, 1, false, NULL, 'Antti', NULL, 'Pekonen',   '040 3333333', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO orguser VALUES (4, 1, false, NULL, 'Elis', NULL, 'Laukkanen',  '040 4444444', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO orguser VALUES (5, 1, false, NULL, 'Samuli', NULL, 'Tikkanen', '040 5555555', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO orguser VALUES (6, 1, false, NULL, 'Istvan', NULL, 'Ivanesku', '040 6666666', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO orguser VALUES (7, 1, false, NULL, 'Pekka', NULL, 'Laakkonen', '040 1234567', 'Espoo', 'FI', NULL, '00123', NULL, 'Malmintie 4 A 15', 1);


--
-- TOC entry 1915 (class 0 OID 961864)
-- Dependencies: 165
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: inventory
-- id,consistencyversion,dateendedfordb,datestartedfordb,datetouchedfordb,deleted,pwd,state,uniquesessionid,usrname,user_id
--

INSERT INTO account VALUES ( 8, 170, NULL, '2014-10-10 11:03:05.182', '2014-10-10 11:03:05.182', false, 'iv', NULL, '21d5b747-5e7d-4b7d-919d-37e84afed0a3', 'iv', 6);
INSERT INTO account VALUES ( 9, 461, NULL, '2014-10-10 11:06:03.606', '2014-10-10 11:06:03.606', false, 'sev', 0, 'e95bd7e1-e971-40f7-9c71-6b22b61ba66c', 'sev', 2);
INSERT INTO account VALUES (10, 1, NULL, NULL, NULL, false, 'testpwd', 0, null, 'filaakkonen', 7);


--
-- TOC entry 1918 (class 0 OID 961882)
-- Dependencies: 168
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: inventory
--
-- id,code,consistencyversion,deleted,name,parent_id
--

INSERT INTO category VALUES (11, '0011', 1, false, 'Saha', NULL);
INSERT INTO category VALUES (12, '0012', 1, false, 'Käsaha', 11);
INSERT INTO category VALUES (13, '0013', 1, false, 'Pösirkkeli', 11 ); ;
INSERT INTO category VALUES (14, '0014', 1, false, 'Moottorisaha, sAhkO', 13 );
INSERT INTO category VALUES (15, '0015', 1, false, 'Moottorisaha, polttom.', 13);

INSERT INTO category VALUES (16, '0016', 1, false, 'Betonikalusto', NULL);
INSERT INTO category VALUES (17, '0017', 1, false, 'Betoninsekoitin', 16 );
INSERT INTO category VALUES (18, '0018', 1, false, 'Betonikalusto, muu', 16 );

INSERT INTO category VALUES (19, '0018', 1, false, 'Mittausväneet', NULL);
INSERT INTO category VALUES (20, '0020', 1, false, 'Etäyysmittari', 19 );
INSERT INTO category VALUES (21, '0021', 1, false, 'Mittari, muu', 19 );

INSERT INTO category VALUES (22, '0022', 1, false, 'Naulain', NULL);
INSERT INTO category VALUES (23, '0023', 1, false, 'Paineilmanaulain', 22 );
INSERT INTO category VALUES (24, '0024', 1, false, 'Panosnaulain', 22 );
INSERT INTO category VALUES (25, '0025', 1, false, 'Impulssinaulain', 22 );

INSERT INTO category VALUES (26, '0026', 1, false, 'Hiomakoneet ja -jyrsimet', NULL);
INSERT INTO category VALUES (27, '0027', 1, false, 'Kulmahiomakone', 26 );
INSERT INTO category VALUES (28, '0028', 1, false, 'Kähiomakoneet', 26 );
INSERT INTO category VALUES (29, '0029', 1, false, 'Lattianhoito-/hiomakoneet', 26 );

--
-- TOC entry 1916 (class 0 OID 961872)
-- Dependencies: 166
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: inventory
--
--   NOTHING initially
--


--
-- TOC entry 1914 (class 0 OID 961856)
-- Dependencies: 164
-- Data for Name: producer; Type: TABLE DATA; Schema: public; Owner: inventory
--
-- id,consistencyversion,deleted,description,name
--

INSERT INTO producer VALUES (30, 1, false, NULL, 'Hitachi');
INSERT INTO producer VALUES (31, 1, false, NULL, 'Esko');
INSERT INTO producer VALUES (32, 1, false, NULL, 'Vispiläne');
INSERT INTO producer VALUES (33, 1, false, NULL, 'Makita');
INSERT INTO producer VALUES (34, 1, false, NULL, 'Geo-FENNEL');
INSERT INTO producer VALUES (35, 1, false, NULL, 'Hilti');
INSERT INTO producer VALUES (36, 1, false, NULL, 'Senco');
INSERT INTO producer VALUES (37, 1, false, NULL, 'Fein');
INSERT INTO producer VALUES (38, 1, false, NULL, 'Flex');
INSERT INTO producer VALUES (39, 1, false, NULL, 'FlexTM');
INSERT INTO producer VALUES (40, 1, false, NULL, 'Schwamborn');
INSERT INTO producer VALUES (41, 1, false, NULL, 'Von Arx ');


--
-- TOC entry 1911 (class 0 OID 961762)
-- Dependencies: 161
-- Data for Name: sequence; Type: TABLE DATA; Schema: public; Owner: inventory
--

INSERT INTO sequence VALUES ('SEQ_GEN', 80);


--
-- TOC entry 1912 (class 0 OID 961840)
-- Dependencies: 162
-- Data for Name: tool; Type: TABLE DATA; Schema: public; Owner: inventory
--
-- id,code,consistencyversion,deleted,description,name,category_id,producer_id
--

INSERT INTO tool VALUES ( 42, NULL, 1, false, '1500 W, 3000rpm', '', 14, 30 );
INSERT INTO tool VALUES ( 43, NULL, 1, false, '3000 W, 5000 rpm, 5 kg', '', 14, 30 );
INSERT INTO tool VALUES ( 44, NULL, 1, false, '100-130 l, 230 V', 'säöttori', 17, 31 );
INSERT INTO tool VALUES ( 45, NULL, 1, false, '100-130 l', 'Polttomoottori', 17, 31 );
INSERT INTO tool VALUES ( 46, NULL, 1, false, '230 V', '', 18, 32 );
INSERT INTO tool VALUES ( 47, NULL, 1, false, '', 'Makita LD060P', 20, 33 );
INSERT INTO tool VALUES ( 48, NULL, 1, false, '', 'Teodoliitti FET120', 21, 34 );
INSERT INTO tool VALUES ( 49, NULL, 1, false, '', 'Vaaituskone Hilti PM24', 21, 35 );
INSERT INTO tool VALUES ( 50, NULL, 1, false, '', 'Ankkurointinaulain', 23, NULL );
INSERT INTO tool VALUES ( 51, NULL, 1, false, '', 'Hakasnaulain', 23, 36 );
INSERT INTO tool VALUES ( 52, NULL, 1, false, '50-100 mm', 'Runkonaulain', 23, NULL );
INSERT INTO tool VALUES ( 53, NULL, 1, false, '130 mm', 'Runkonaulain', 23, NULL );
INSERT INTO tool VALUES ( 54, NULL, 1, false, '160 mm', 'Runkonaulain', 23, NULL );
INSERT INTO tool VALUES ( 55, NULL, 1, false, '', 'Hilti GX-100 Impulssinaulain', 23, 35 );
INSERT INTO tool VALUES ( 56, NULL, 1, false, '18 V', 'BUC122 Akkuketjusaha', 14, 33 );
INSERT INTO tool VALUES ( 57, NULL, 1, false, '18 V', 'BJV180 Akkukuviosaha', 14, 33 );
INSERT INTO tool VALUES ( 58, NULL, 1, false, '18 V', 'BJR181 Akkupuukkosaha', 14, 33 );
INSERT INTO tool VALUES ( 59, NULL, 1, false, '18 V', 'Akkukulmahiomakone Hilti', 27, 35 );
INSERT INTO tool VALUES ( 60, NULL, 1, false, '230 V', '', 27, 30 );
INSERT INTO tool VALUES ( 61, NULL, 1, false, '230 V', 'Pöerotuslaitteella', 27, 30 );
INSERT INTO tool VALUES ( 62, NULL, 1, false, '230 V', 'Epäskohiomakone,', 27, 30 );
INSERT INTO tool VALUES ( 63, NULL, 1, false, '230 V', 'Epäskohiomakone', 28, 30 );
INSERT INTO tool VALUES ( 64, NULL, 1, false, '230 V', 'Multimaster Epäskohiomakone', 28, 37 );
INSERT INTO tool VALUES ( 65, NULL, 1, false, '230 V', 'Kähö', 28, 30 );
INSERT INTO tool VALUES ( 66, NULL, 1, false, '', 'Katonhiontavaunu', 28, 39 );
INSERT INTO tool VALUES ( 67, NULL, 1, false, '230 V', 'Nauhahiomakone', 28, 30 );
INSERT INTO tool VALUES ( 68, NULL, 1, false, '230 V', '9404 Nauhahiomakone', 28, 33 );
INSERT INTO tool VALUES ( 69, NULL, 1, false, '230 V', 'Seinäomakone kirahvi 225 mm', 28, 38 );
INSERT INTO tool VALUES ( 70, NULL, 1, false, '300 V', 'Betonilattianhiomakone', 29, 40 );
INSERT INTO tool VALUES ( 71, NULL, 1, false, '230 V', 'Betonilattianjyrsin 100 mm', 29, 41 );

--
-- TOC entry 1917 (class 0 OID 961877)
-- Dependencies: 167
-- Data for Name: toolitem; Type: TABLE DATA; Schema: public; Owner: inventory
--
-- id,consistencyversion,deleted,quantity,,status,accuracy,latitude,longitude,currentuser_id,org_id,responsible_id,tool_id,reservedby_id,barcode
--

INSERT INTO toolitem VALUES (42,1,false,1,2,NULL,NULL,NULL,   7,1,2,42, NULL,'1000000000009' );
INSERT INTO toolitem VALUES (43,1,false,1,2,NULL,NULL,NULL,   7,1,2,43, NULL,'2000000000008' );
INSERT INTO toolitem VALUES (44,1,false,1,1,NULL,NULL,NULL,NULL,1,2,44, NULL,'3000000000007' );
INSERT INTO toolitem VALUES (45,1,false,1,1,NULL,NULL,NULL,NULL,1,2,45, NULL,'4000000000006' );
INSERT INTO toolitem VALUES (46,1,false,1,1,NULL,NULL,NULL,NULL,1,2,46, NULL,'5000000000005' );
INSERT INTO toolitem VALUES (47,1,false,1,1,NULL,NULL,NULL,NULL,1,2,47, NULL,'6000000000004' );
INSERT INTO toolitem VALUES (48,1,false,1,1,NULL,NULL,NULL,NULL,1,2,48, NULL,'7000000000003' );
INSERT INTO toolitem VALUES (49,1,false,1,1,NULL,NULL,NULL,NULL,1,2,49, NULL,'8000000000002' );
INSERT INTO toolitem VALUES (50,1,false,1,1,NULL,NULL,NULL,NULL,1,2,50, NULL,'9000000000001' );
INSERT INTO toolitem VALUES (51,1,false,1,1,NULL,NULL,NULL,NULL,1,2,51, NULL,'0000000000109' );
INSERT INTO toolitem VALUES (52,1,false,1,1,NULL,NULL,NULL,NULL,1,2,52, NULL,'0000000000116' );
INSERT INTO toolitem VALUES (53,1,false,1,1,NULL,NULL,NULL,NULL,1,2,53, NULL,'0000000000123' );
INSERT INTO toolitem VALUES (54,1,false,1,1,NULL,NULL,NULL,NULL,1,2,54, NULL,'0000000000130' );
INSERT INTO toolitem VALUES (55,1,false,1,1,NULL,NULL,NULL,NULL,1,2,55, NULL,'0000000000147' );
INSERT INTO toolitem VALUES (56,1,false,1,1,NULL,NULL,NULL,NULL,1,2,56, NULL,'0000000000154' );
INSERT INTO toolitem VALUES (57,1,false,1,1,NULL,NULL,NULL,NULL,1,2,57, NULL,'0000000000161' );
INSERT INTO toolitem VALUES (58,1,false,1,1,NULL,NULL,NULL,NULL,1,2,58, NULL,'0000000000178' );
INSERT INTO toolitem VALUES (59,1,false,1,1,NULL,NULL,NULL,NULL,1,2,59, NULL,'0000000000185' );
INSERT INTO toolitem VALUES (60,1,false,1,1,NULL,NULL,NULL,NULL,1,2,60, NULL,'0000000000192' );
INSERT INTO toolitem VALUES (61,1,false,1,1,NULL,NULL,NULL,NULL,1,2,61, NULL,'0000000000208' );
INSERT INTO toolitem VALUES (62,1,false,1,1,NULL,NULL,NULL,NULL,1,2,62, NULL,'0000000000215' );
INSERT INTO toolitem VALUES (63,1,false,1,1,NULL,NULL,NULL,NULL,1,2,63, NULL,'0000000000222' );
INSERT INTO toolitem VALUES (64,1,false,1,1,NULL,NULL,NULL,NULL,1,2,64, NULL,'0000000000239' );
INSERT INTO toolitem VALUES (65,1,false,1,1,NULL,NULL,NULL,NULL,1,2,65, NULL,'0000000000246' );
INSERT INTO toolitem VALUES (66,1,false,1,1,NULL,NULL,NULL,NULL,1,2,66, NULL,'0000000000253' );
INSERT INTO toolitem VALUES (67,1,false,1,1,NULL,NULL,NULL,NULL,1,2,67, NULL,'0000000000260' );
INSERT INTO toolitem VALUES (68,1,false,1,1,NULL,NULL,NULL,NULL,1,2,68, NULL,'0000000000277' );
INSERT INTO toolitem VALUES (69,1,false,1,1,NULL,NULL,NULL,NULL,1,2,69, NULL,'0000000000284' );
INSERT INTO toolitem VALUES (70,1,false,1,1,NULL,NULL,NULL,NULL,1,2,70, NULL,'0000000000291' );
INSERT INTO toolitem VALUES (71,1,false,1,1,NULL,NULL,NULL,NULL,1,2,71, NULL,'0000000000307' );


--
-- TOC entry 1790 (class 2606 OID 961968)
-- Name: account_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- TOC entry 1798 (class 2606 OID 961970)
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 1793 (class 2606 OID 962026)
-- Name: message_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory; Tablespace: 
--

ALTER TABLE ONLY message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- TOC entry 1800 (class 2606 OID 961974)
-- Name: organisation_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory; Tablespace: 
--

ALTER TABLE ONLY organisation
    ADD CONSTRAINT organisation_pkey PRIMARY KEY (id);


--
-- TOC entry 1786 (class 2606 OID 961972)
-- Name: orguser_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory; Tablespace: 
--

ALTER TABLE ONLY orguser
    ADD CONSTRAINT orguser_pkey PRIMARY KEY (id);


--
-- TOC entry 1788 (class 2606 OID 961976)
-- Name: producer_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory; Tablespace: 
--

ALTER TABLE ONLY producer
    ADD CONSTRAINT producer_pkey PRIMARY KEY (id);


--
-- TOC entry 1796 (class 2606 OID 961978)
-- Name: repositoryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory; Tablespace: 
--

ALTER TABLE ONLY toolitem
    ADD CONSTRAINT repositoryitem_pkey PRIMARY KEY (id);


--
-- TOC entry 1782 (class 2606 OID 962034)
-- Name: sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory; Tablespace: 
--

ALTER TABLE ONLY sequence
    ADD CONSTRAINT sequence_pkey PRIMARY KEY (seq_name);


--
-- TOC entry 1784 (class 2606 OID 961984)
-- Name: tool_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory; Tablespace: 
--

ALTER TABLE ONLY tool
    ADD CONSTRAINT tool_pkey PRIMARY KEY (id);


--
-- TOC entry 1791 (class 1259 OID 962032)
-- Name: fki_account_user_id; Type: INDEX; Schema: public; Owner: inventory; Tablespace: 
--

CREATE INDEX fki_account_user_id ON account USING btree (user_id);


--
-- TOC entry 1794 (class 1259 OID 962040)
-- Name: fki_repositoryitem_reservedby_id; Type: INDEX; Schema: public; Owner: inventory; Tablespace: 
--

CREATE INDEX fki_repositoryitem_reservedby_id ON toolitem USING btree (reservedby_id);


--
-- TOC entry 1804 (class 2606 OID 962027)
-- Name: fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inventory
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_account_user_id FOREIGN KEY (user_id) REFERENCES orguser(id);


--
-- TOC entry 1803 (class 2606 OID 961990)
-- Name: fk_orguser_organisation_id; Type: FK CONSTRAINT; Schema: public; Owner: inventory
--

ALTER TABLE ONLY orguser
    ADD CONSTRAINT fk_orguser_organisation_id FOREIGN KEY (organisation_id) REFERENCES organisation(id);


--
-- TOC entry 1805 (class 2606 OID 961995)
-- Name: fk_repositoryitem_currentuser_id; Type: FK CONSTRAINT; Schema: public; Owner: inventory
--

ALTER TABLE ONLY toolitem
    ADD CONSTRAINT fk_repositoryitem_currentuser_id FOREIGN KEY (currentuser_id) REFERENCES orguser(id);


--
-- TOC entry 1806 (class 2606 OID 962000)
-- Name: fk_repositoryitem_org_id; Type: FK CONSTRAINT; Schema: public; Owner: inventory
--

ALTER TABLE ONLY toolitem
    ADD CONSTRAINT fk_repositoryitem_org_id FOREIGN KEY (org_id) REFERENCES organisation(id);


--
-- TOC entry 1809 (class 2606 OID 962035)
-- Name: fk_repositoryitem_reservedby_id; Type: FK CONSTRAINT; Schema: public; Owner: inventory
--

ALTER TABLE ONLY toolitem
    ADD CONSTRAINT fk_repositoryitem_reservedby_id FOREIGN KEY (reservedby_id) REFERENCES orguser(id);


--
-- TOC entry 1807 (class 2606 OID 962005)
-- Name: fk_repositoryitem_responsible_id; Type: FK CONSTRAINT; Schema: public; Owner: inventory
--

ALTER TABLE ONLY toolitem
    ADD CONSTRAINT fk_repositoryitem_responsible_id FOREIGN KEY (responsible_id) REFERENCES orguser(id);


--
-- TOC entry 1808 (class 2606 OID 962010)
-- Name: fk_repositoryitem_tool_id; Type: FK CONSTRAINT; Schema: public; Owner: inventory
--

ALTER TABLE ONLY toolitem
    ADD CONSTRAINT fk_repositoryitem_tool_id FOREIGN KEY (tool_id) REFERENCES tool(id);


--
-- TOC entry 1801 (class 2606 OID 962015)
-- Name: fk_tool_category_id; Type: FK CONSTRAINT; Schema: public; Owner: inventory
--

ALTER TABLE ONLY tool
    ADD CONSTRAINT fk_tool_category_id FOREIGN KEY (category_id) REFERENCES category(id);


--
-- TOC entry 1802 (class 2606 OID 962020)
-- Name: fk_tool_producer_id; Type: FK CONSTRAINT; Schema: public; Owner: inventory
--

ALTER TABLE ONLY tool
    ADD CONSTRAINT fk_tool_producer_id FOREIGN KEY (producer_id) REFERENCES producer(id);


--
-- TOC entry 1926 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;





