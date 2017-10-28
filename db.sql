CREATE TABLE categoria (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE public.categoria OWNER TO vxqlcwkmweksor;

--
-- TOC entry 171 (class 1259 OID 49648)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_seq OWNER TO vxqlcwkmweksor;

--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 171
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- TOC entry 174 (class 1259 OID 49658)
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cidade (
    id integer NOT NULL,
    nome character varying(255),
    estado_id integer
);


ALTER TABLE public.cidade OWNER TO vxqlcwkmweksor;

--
-- TOC entry 173 (class 1259 OID 49656)
-- Name: cidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cidade_id_seq OWNER TO vxqlcwkmweksor;

--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 173
-- Name: cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cidade_id_seq OWNED BY cidade.id;


--
-- TOC entry 176 (class 1259 OID 49666)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cliente (
    id integer NOT NULL,
    cpf_ou_cnpj character varying(255),
    email character varying(255),
    nome character varying(255),
    tipo integer
);


ALTER TABLE public.cliente OWNER TO vxqlcwkmweksor;

--
-- TOC entry 175 (class 1259 OID 49664)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO vxqlcwkmweksor;

--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 175
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- TOC entry 178 (class 1259 OID 49677)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE endereco (
    id integer NOT NULL,
    bairro character varying(255),
    cep character varying(255),
    complemento character varying(255),
    logradouro character varying(255),
    numero character varying(255),
    cidade_id integer,
    cliente_id integer
);


ALTER TABLE public.endereco OWNER TO vxqlcwkmweksor;

--
-- TOC entry 177 (class 1259 OID 49675)
-- Name: endereco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endereco_id_seq OWNER TO vxqlcwkmweksor;

--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 177
-- Name: endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE endereco_id_seq OWNED BY endereco.id;


--
-- TOC entry 180 (class 1259 OID 49688)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE public.estado OWNER TO vxqlcwkmweksor;

--
-- TOC entry 179 (class 1259 OID 49686)
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_id_seq OWNER TO vxqlcwkmweksor;

--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 179
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_id_seq OWNED BY estado.id;


--
-- TOC entry 181 (class 1259 OID 49694)
-- Name: item_pedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE item_pedido (
    desconto double precision,
    preco double precision,
    quantidade integer,
    pedido_id integer NOT NULL,
    produto_id integer NOT NULL
);


ALTER TABLE public.item_pedido OWNER TO vxqlcwkmweksor;

--
-- TOC entry 182 (class 1259 OID 49699)
-- Name: pagamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pagamento (
    pedido_id integer NOT NULL,
    estado integer
);


ALTER TABLE public.pagamento OWNER TO vxqlcwkmweksor;

--
-- TOC entry 183 (class 1259 OID 49704)
-- Name: pagamento_com_boleto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pagamento_com_boleto (
    data_pagamento timestamp without time zone,
    data_vencimento timestamp without time zone,
    pedido_id integer NOT NULL
);


ALTER TABLE public.pagamento_com_boleto OWNER TO vxqlcwkmweksor;

--
-- TOC entry 184 (class 1259 OID 49709)
-- Name: pagamento_com_cartao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pagamento_com_cartao (
    numero_de_parcelas integer,
    pedido_id integer NOT NULL
);


ALTER TABLE public.pagamento_com_cartao OWNER TO vxqlcwkmweksor;

--
-- TOC entry 186 (class 1259 OID 49716)
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pedido (
    id integer NOT NULL,
    instante timestamp without time zone,
    client_id integer,
    endereco_de_entrega_id integer
);


ALTER TABLE public.pedido OWNER TO vxqlcwkmweksor;

--
-- TOC entry 185 (class 1259 OID 49714)
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedido_id_seq OWNER TO vxqlcwkmweksor;

--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 185
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pedido_id_seq OWNED BY pedido.id;


--
-- TOC entry 188 (class 1259 OID 49724)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE produto (
    id integer NOT NULL,
    nome character varying(255),
    preco double precision
);


ALTER TABLE public.produto OWNER TO vxqlcwkmweksor;

--
-- TOC entry 189 (class 1259 OID 49730)
-- Name: produto_categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE produto_categoria (
    produto_id integer NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE public.produto_categoria OWNER TO vxqlcwkmweksor;

--
-- TOC entry 187 (class 1259 OID 49722)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_id_seq OWNER TO vxqlcwkmweksor;

--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 187
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_id_seq OWNED BY produto.id;


--
-- TOC entry 190 (class 1259 OID 49733)
-- Name: telefone; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE telefone (
    cliente_id integer NOT NULL,
    telefones character varying(255)
);


ALTER TABLE public.telefone OWNER TO vxqlcwkmweksor;

--
-- TOC entry 1923 (class 2604 OID 49653)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- TOC entry 1924 (class 2604 OID 49661)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade ALTER COLUMN id SET DEFAULT nextval('cidade_id_seq'::regclass);


--
-- TOC entry 1925 (class 2604 OID 49669)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- TOC entry 1926 (class 2604 OID 49680)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco ALTER COLUMN id SET DEFAULT nextval('endereco_id_seq'::regclass);


--
-- TOC entry 1927 (class 2604 OID 49691)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_id_seq'::regclass);


--
-- TOC entry 1928 (class 2604 OID 49719)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido ALTER COLUMN id SET DEFAULT nextval('pedido_id_seq'::regclass);


--
-- TOC entry 1929 (class 2604 OID 49727)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN id SET DEFAULT nextval('produto_id_seq'::regclass);


--
-- TOC entry 2075 (class 0 OID 49650)
-- Dependencies: 172
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categoria VALUES (1, 'Informática');
INSERT INTO categoria VALUES (2, 'Escritório');
INSERT INTO categoria VALUES (3, 'Cama, mesa e banho');
INSERT INTO categoria VALUES (4, 'Eletrônicos');
INSERT INTO categoria VALUES (5, 'Jardinagem');
INSERT INTO categoria VALUES (6, 'Decoração');
INSERT INTO categoria VALUES (7, 'Perfumaria');


--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 171
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_id_seq', 7, true);


--
-- TOC entry 2077 (class 0 OID 49658)
-- Dependencies: 174
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cidade VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade VALUES (2, 'São Paulo', 2);
INSERT INTO cidade VALUES (3, 'Campinas', 2);


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 173
-- Name: cidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cidade_id_seq', 3, true);


--
-- TOC entry 2079 (class 0 OID 49666)
-- Dependencies: 176
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cliente VALUES (1, '99999999999', 'maria@gmail.com', 'Maria Silva', 1);


--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 175
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_id_seq', 1, true);


--
-- TOC entry 2081 (class 0 OID 49677)
-- Dependencies: 178
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO endereco VALUES (1, 'Jardim', '38220834', 'Apto 203', 'Rua Flores', '300', 1, 1);
INSERT INTO endereco VALUES (2, 'Centro', '38777012', 'Sala 800', 'Avenida Matos', '105', 2, 1);


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 177
-- Name: endereco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('endereco_id_seq', 2, true);


--
-- TOC entry 2083 (class 0 OID 49688)
-- Dependencies: 180
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estado VALUES (1, 'Minas Gerais');
INSERT INTO estado VALUES (2, 'São Paulo');


--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 179
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_id_seq', 2, true);


--
-- TOC entry 2084 (class 0 OID 49694)
-- Dependencies: 181
-- Data for Name: item_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO item_pedido VALUES (0, 2000, 1, 1, 1);
INSERT INTO item_pedido VALUES (0, 80, 2, 1, 3);
INSERT INTO item_pedido VALUES (100, 800, 1, 2, 2);


--
-- TOC entry 2085 (class 0 OID 49699)
-- Dependencies: 182
-- Data for Name: pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pagamento VALUES (1, 2);
INSERT INTO pagamento VALUES (2, 1);


--
-- TOC entry 2086 (class 0 OID 49704)
-- Dependencies: 183
-- Data for Name: pagamento_com_boleto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pagamento_com_boleto VALUES (NULL, '2017-10-20 00:00:00', 2);


--
-- TOC entry 2087 (class 0 OID 49709)
-- Dependencies: 184
-- Data for Name: pagamento_com_cartao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pagamento_com_cartao VALUES (6, 1);


--
-- TOC entry 2089 (class 0 OID 49716)
-- Dependencies: 186
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pedido VALUES (1, '2017-09-30 10:32:00', 1, 1);
INSERT INTO pedido VALUES (2, '2017-10-10 19:35:00', 1, 2);


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 185
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pedido_id_seq', 2, true);


--
-- TOC entry 2091 (class 0 OID 49724)
-- Dependencies: 188
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO produto VALUES (1, 'Computador', 2000);
INSERT INTO produto VALUES (2, 'Impressora', 800);
INSERT INTO produto VALUES (3, 'Mouse', 80);
INSERT INTO produto VALUES (4, 'Mesa de escritório', 300);
INSERT INTO produto VALUES (5, 'Toalha', 50);
INSERT INTO produto VALUES (6, 'Colcha', 200);
INSERT INTO produto VALUES (7, 'TV true color', 1200);
INSERT INTO produto VALUES (8, 'Roçadeira', 800);
INSERT INTO produto VALUES (9, 'Abajour', 100);
INSERT INTO produto VALUES (10, 'Pendente', 180);
INSERT INTO produto VALUES (11, 'Shampoo', 90);


--
-- TOC entry 2092 (class 0 OID 49730)
-- Dependencies: 189
-- Data for Name: produto_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO produto_categoria VALUES (1, 1);
INSERT INTO produto_categoria VALUES (1, 4);
INSERT INTO produto_categoria VALUES (2, 1);
INSERT INTO produto_categoria VALUES (2, 2);
INSERT INTO produto_categoria VALUES (2, 4);
INSERT INTO produto_categoria VALUES (3, 1);
INSERT INTO produto_categoria VALUES (3, 4);
INSERT INTO produto_categoria VALUES (4, 2);
INSERT INTO produto_categoria VALUES (5, 3);
INSERT INTO produto_categoria VALUES (6, 3);
INSERT INTO produto_categoria VALUES (7, 4);
INSERT INTO produto_categoria VALUES (8, 5);
INSERT INTO produto_categoria VALUES (9, 6);
INSERT INTO produto_categoria VALUES (10, 6);
INSERT INTO produto_categoria VALUES (11, 7);


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 187
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produto_id_seq', 11, true);


--
-- TOC entry 2093 (class 0 OID 49733)
-- Dependencies: 190
-- Data for Name: telefone; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO telefone VALUES (1, '98383399');
INSERT INTO telefone VALUES (1, '273633323');


--
-- TOC entry 1931 (class 2606 OID 49655)
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 1933 (class 2606 OID 49663)
-- Name: cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 1935 (class 2606 OID 49674)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 1939 (class 2606 OID 49685)
-- Name: endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 1941 (class 2606 OID 49693)
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 1943 (class 2606 OID 49698)
-- Name: item_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT item_pedido_pkey PRIMARY KEY (pedido_id, produto_id);


--
-- TOC entry 1947 (class 2606 OID 49708)
-- Name: pagamento_com_boleto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pagamento_com_boleto
    ADD CONSTRAINT pagamento_com_boleto_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 1949 (class 2606 OID 49713)
-- Name: pagamento_com_cartao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pagamento_com_cartao
    ADD CONSTRAINT pagamento_com_cartao_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 1945 (class 2606 OID 49703)
-- Name: pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 1951 (class 2606 OID 49721)
-- Name: pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 1953 (class 2606 OID 49729)
-- Name: produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 1937 (class 2606 OID 49737)
-- Name: uk_cmxo70m08n43599l3h0h07cc6; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT uk_cmxo70m08n43599l3h0h07cc6 UNIQUE (email);


--
-- TOC entry 1965 (class 2606 OID 49793)
-- Name: fk1c0y58d3n6x3m6euv2j3h64vt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT fk1c0y58d3n6x3m6euv2j3h64vt FOREIGN KEY (produto_id) REFERENCES produto(id);


--
-- TOC entry 1963 (class 2606 OID 49783)
-- Name: fk1fihyy2fnocpuwc74674qmfkv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk1fihyy2fnocpuwc74674qmfkv FOREIGN KEY (endereco_de_entrega_id) REFERENCES endereco(id);


--
-- TOC entry 1962 (class 2606 OID 49778)
-- Name: fk5g6bg7ydxkd6hx8i6m2b0we56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk5g6bg7ydxkd6hx8i6m2b0we56 FOREIGN KEY (client_id) REFERENCES cliente(id);


--
-- TOC entry 1957 (class 2606 OID 49753)
-- Name: fk60ym08cfoysa17wrn1swyiuda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT fk60ym08cfoysa17wrn1swyiuda FOREIGN KEY (pedido_id) REFERENCES pedido(id);


--
-- TOC entry 1966 (class 2606 OID 49798)
-- Name: fk8aafha0njkoyoe3kvrwsy3g8u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefone
    ADD CONSTRAINT fk8aafha0njkoyoe3kvrwsy3g8u FOREIGN KEY (cliente_id) REFERENCES cliente(id);


--
-- TOC entry 1955 (class 2606 OID 49743)
-- Name: fk8b1kcb3wucapb8dejshyn5fsx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT fk8b1kcb3wucapb8dejshyn5fsx FOREIGN KEY (cidade_id) REFERENCES cidade(id);


--
-- TOC entry 1956 (class 2606 OID 49748)
-- Name: fk8s7ivtl4foyhrfam9xqom73n9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT fk8s7ivtl4foyhrfam9xqom73n9 FOREIGN KEY (cliente_id) REFERENCES cliente(id);


--
-- TOC entry 1960 (class 2606 OID 49768)
-- Name: fkcr74vrxf8nfph0knq2bho8doo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento_com_boleto
    ADD CONSTRAINT fkcr74vrxf8nfph0knq2bho8doo FOREIGN KEY (pedido_id) REFERENCES pagamento(pedido_id);


--
-- TOC entry 1954 (class 2606 OID 49738)
-- Name: fkkworrwk40xj58kevvh3evi500; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT fkkworrwk40xj58kevvh3evi500 FOREIGN KEY (estado_id) REFERENCES estado(id);


--
-- TOC entry 1964 (class 2606 OID 49788)
-- Name: fkq3g33tp7xk2juh53fbw6y4y57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT fkq3g33tp7xk2juh53fbw6y4y57 FOREIGN KEY (categoria_id) REFERENCES categoria(id);


--
-- TOC entry 1961 (class 2606 OID 49773)
-- Name: fkta3cdnuuxclwfh52t4qi432ow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento_com_cartao
    ADD CONSTRAINT fkta3cdnuuxclwfh52t4qi432ow FOREIGN KEY (pedido_id) REFERENCES pagamento(pedido_id);


--
-- TOC entry 1959 (class 2606 OID 49763)
-- Name: fkthad9tkw4188hb3qo1lm5ueb0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagamento
    ADD CONSTRAINT fkthad9tkw4188hb3qo1lm5ueb0 FOREIGN KEY (pedido_id) REFERENCES pedido(id);


--
-- TOC entry 1958 (class 2606 OID 49758)
-- Name: fktk55mn6d6bvl5h0no5uagi3sf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT fktk55mn6d6bvl5h0no5uagi3sf FOREIGN KEY (produto_id) REFERENCES produto(id);


--
-- TOC entry 2100 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-10-28 15:12:52 BRST

--
-- PostgreSQL database dump complete
--

