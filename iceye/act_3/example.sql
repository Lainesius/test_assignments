--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ashmitko;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ashmitko;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ashmitko;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ashmitko;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ashmitko;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ashmitko;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ashmitko;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ashmitko;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ashmitko;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ashmitko;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ashmitko;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ashmitko;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ashmitko;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ashmitko;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ashmitko;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ashmitko;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ashmitko;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ashmitko;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ashmitko;

--
-- Name: event_special_mentions; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.event_special_mentions (
    id integer NOT NULL,
    event_id integer NOT NULL,
    notablefigure_id integer NOT NULL
);


ALTER TABLE public.event_special_mentions OWNER TO ashmitko;

--
-- Name: event_special_mentions_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.event_special_mentions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_special_mentions_id_seq OWNER TO ashmitko;

--
-- Name: event_special_mentions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.event_special_mentions_id_seq OWNED BY public.event_special_mentions.id;


--
-- Name: web_event; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.web_event (
    id integer NOT NULL,
    title text NOT NULL,
    description text,
    level text NOT NULL,
    "timestamp" date NOT NULL,
    image character varying(200),
    special_mentions_message text
);


ALTER TABLE public.web_event OWNER TO ashmitko;

--
-- Name: web_event_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.web_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_event_id_seq OWNER TO ashmitko;

--
-- Name: web_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.web_event_id_seq OWNED BY public.web_event.id;


--
-- Name: web_notablefigure; Type: TABLE; Schema: public; Owner: ashmitko
--

CREATE TABLE public.web_notablefigure (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    image character varying(200)
);


ALTER TABLE public.web_notablefigure OWNER TO ashmitko;

--
-- Name: web_notablefigure_id_seq; Type: SEQUENCE; Schema: public; Owner: ashmitko
--

CREATE SEQUENCE public.web_notablefigure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_notablefigure_id_seq OWNER TO ashmitko;

--
-- Name: web_notablefigure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ashmitko
--

ALTER SEQUENCE public.web_notablefigure_id_seq OWNED BY public.web_notablefigure.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: event_special_mentions id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.event_special_mentions ALTER COLUMN id SET DEFAULT nextval('public.event_special_mentions_id_seq'::regclass);


--
-- Name: web_event id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.web_event ALTER COLUMN id SET DEFAULT nextval('public.web_event_id_seq'::regclass);


--
-- Name: web_notablefigure id; Type: DEFAULT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.web_notablefigure ALTER COLUMN id SET DEFAULT nextval('public.web_notablefigure_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add notable figure	7	add_notablefigure
26	Can change notable figure	7	change_notablefigure
27	Can delete notable figure	7	delete_notablefigure
28	Can view notable figure	7	view_notablefigure
29	Can add event	8	add_event
30	Can change event	8	change_event
31	Can delete event	8	delete_event
32	Can view event	8	view_event
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$7HizqeY2Ffhn5Yi4rtjzyz$CefBdBTsu32gV4mQR7k/V9f15oajiRfKwR2svGIY1vs=	2021-11-15 09:24:43.100607+03	t	test			test@test.test	t	t	2021-11-15 01:58:03.651733+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	web	notablefigure
8	web	event
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-11-15 01:54:07.884498+03
2	auth	0001_initial	2021-11-15 01:54:07.969717+03
3	admin	0001_initial	2021-11-15 01:54:07.995064+03
4	admin	0002_logentry_remove_auto_add	2021-11-15 01:54:08.006882+03
5	admin	0003_logentry_add_action_flag_choices	2021-11-15 01:54:08.015254+03
6	contenttypes	0002_remove_content_type_name	2021-11-15 01:54:08.025499+03
7	auth	0002_alter_permission_name_max_length	2021-11-15 01:54:08.030469+03
8	auth	0003_alter_user_email_max_length	2021-11-15 01:54:08.035651+03
9	auth	0004_alter_user_username_opts	2021-11-15 01:54:08.041018+03
10	auth	0005_alter_user_last_login_null	2021-11-15 01:54:08.046002+03
11	auth	0006_require_contenttypes_0002	2021-11-15 01:54:08.048153+03
12	auth	0007_alter_validators_add_error_messages	2021-11-15 01:54:08.053337+03
13	auth	0008_alter_user_username_max_length	2021-11-15 01:54:08.062168+03
14	auth	0009_alter_user_last_name_max_length	2021-11-15 01:54:08.068414+03
15	auth	0010_alter_group_name_max_length	2021-11-15 01:54:08.073762+03
16	auth	0011_update_proxy_permissions	2021-11-15 01:54:08.077864+03
17	auth	0012_alter_user_first_name_max_length	2021-11-15 01:54:08.082926+03
18	sessions	0001_initial	2021-11-15 01:54:08.095479+03
20	web	0001_initial	2021-11-15 10:09:19.449651+03
21	web	0002_auto_20211115_1020	2021-11-15 13:20:10.991611+03
22	web	0001_squashed_0002_auto_20211115_1020	2021-11-15 23:31:24.809485+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: event_special_mentions; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.event_special_mentions (id, event_id, notablefigure_id) FROM stdin;
1	1	3
2	1	6
3	2	2
4	3	1
5	3	5
7	3	4
\.


--
-- Data for Name: web_event; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.web_event (id, title, description, level, "timestamp", image, special_mentions_message) FROM stdin;
1	Prevented Megacorporation Coup	With a few well timed media leaks stopped the megacorporations from taking over the world government... For the time being	world	2020-12-10	https://i.imgur.com/6cE8pMz.png	The  world would have gone into a new dark era without support of our inside agents
2	Stopped mafia feud	Several rival families were bringing devastation to the City N in their struggle for control. Put them in line by reminding them that there's always room for the family	town	2021-05-19	https://i.imgur.com/3mzhG18.png	Negotiations went much more smoothly thanks to the unlimited charisma of
3	Prevented universe from imploding	Who could have expected that this site being created in anything but Comic Sans would lead to inevitable destruction of the entire universe? Butterfly effect is a most curious thing indeed	universe	2021-11-14	https://i.imgur.com/4CYs0f2.png	This could have gone terribly wrong without the assistance of
\.


--
-- Data for Name: web_notablefigure; Type: TABLE DATA; Schema: public; Owner: ashmitko
--

COPY public.web_notablefigure (id, name, description, image) FROM stdin;
1	Albert Einstein		https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Albert_Einstein_Head.jpg/1536px-Albert_Einstein_Head.jpg
2	Vin Diesel		https://upload.wikimedia.org/wikipedia/commons/7/71/Vin_Diesel_XXX_Return_of_Xander_Cage_premiere.png
3	Ryan Gosling		https://upload.wikimedia.org/wikipedia/commons/f/f6/Ryan_Gosling_in_2018.jpg
4	Emmet Brown		https://www.looper.com/img/gallery/expedition-back-to-the-future-star-christopher-lloyd-on-his-lifelong-friendship-with-michael-j-fox-exclusive/intro-1615837847.jpg
5	Vincent Connare		https://upload.wikimedia.org/wikipedia/commons/1/14/Vincent_Connare_2012.jpg
6	Marcin Iwiński		https://en.cdprojektred.com/wp-content/uploads-cdpr-en/2014/05/th-2208-522.jpg
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 14, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: event_special_mentions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.event_special_mentions_id_seq', 7, true);


--
-- Name: web_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.web_event_id_seq', 3, true);


--
-- Name: web_notablefigure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ashmitko
--

SELECT pg_catalog.setval('public.web_notablefigure_id_seq', 6, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: event_special_mentions event_special_mentions_event_id_notablefigure_id_b6d5789a_uniq; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.event_special_mentions
    ADD CONSTRAINT event_special_mentions_event_id_notablefigure_id_b6d5789a_uniq UNIQUE (event_id, notablefigure_id);


--
-- Name: event_special_mentions event_special_mentions_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.event_special_mentions
    ADD CONSTRAINT event_special_mentions_pkey PRIMARY KEY (id);


--
-- Name: web_event web_event_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.web_event
    ADD CONSTRAINT web_event_pkey PRIMARY KEY (id);


--
-- Name: web_notablefigure web_notablefigure_pkey; Type: CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.web_notablefigure
    ADD CONSTRAINT web_notablefigure_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: event_special_mentions_event_id_4c284cda; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX event_special_mentions_event_id_4c284cda ON public.event_special_mentions USING btree (event_id);


--
-- Name: event_special_mentions_notablefigure_id_6b4a299e; Type: INDEX; Schema: public; Owner: ashmitko
--

CREATE INDEX event_special_mentions_notablefigure_id_6b4a299e ON public.event_special_mentions USING btree (notablefigure_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_special_mentions event_special_mentions_event_id_4c284cda_fk_web_event_id; Type: FK CONSTRAINT; Schema: public; Owner: ashmitko
--

ALTER TABLE ONLY public.event_special_mentions
    ADD CONSTRAINT event_special_mentions_event_id_4c284cda_fk_web_event_id FOREIGN KEY (event_id) REFERENCES public.web_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

