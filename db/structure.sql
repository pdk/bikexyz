--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_keys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_keys (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: auth_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_keys_id_seq OWNED BY auth_keys.id;


--
-- Name: bike_regs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bike_regs (
    id integer NOT NULL,
    xyz_code character varying(255) NOT NULL,
    serial_number character varying(255),
    color character varying(255),
    brand character varying(255),
    model character varying(255),
    kind character varying(255),
    size character varying(255),
    number_of_gears integer,
    notes text,
    name character varying(255),
    alternate_name character varying(255),
    city character varying(255),
    state character varying(255),
    country character varying(255),
    primary_email character varying(255),
    second_email character varying(255),
    third_email character varying(255),
    cell_phone_one character varying(255),
    cell_phone_two character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_1 character varying(255),
    photo_2 character varying(255),
    photo_3 character varying(255),
    photo_4 character varying(255),
    photo_5 character varying(255),
    photo_6 character varying(255),
    year integer,
    searchable_text text
);


--
-- Name: bike_regs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bike_regs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bike_regs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bike_regs_id_seq OWNED BY bike_regs.id;


--
-- Name: inbound_emails; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE inbound_emails (
    id integer NOT NULL,
    message_data json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: inbound_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE inbound_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inbound_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE inbound_emails_id_seq OWNED BY inbound_emails.id;


--
-- Name: lookup_codes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE lookup_codes (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    xyz_code character varying(255) DEFAULT '***'::character varying NOT NULL
);


--
-- Name: lookup_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lookup_codes_id_seq
    START WITH 10000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lookup_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lookup_codes_id_seq OWNED BY lookup_codes.id;


--
-- Name: order_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE order_types (
    id integer NOT NULL,
    name character varying(255),
    description text,
    price numeric(8,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: order_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE order_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE order_types_id_seq OWNED BY order_types.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    order_type_id integer,
    bike_reg_id integer,
    email character varying(255),
    name character varying(255),
    address character varying(255),
    city character varying(255),
    state character varying(255),
    zip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stripe_card_token character varying(255)
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    password_salt character varying(255),
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying(255),
    failed_attempts integer DEFAULT 0,
    unlock_token character varying(255),
    locked_at timestamp without time zone,
    authentication_token character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role character varying(255) DEFAULT 'user'::character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE versions (
    id integer NOT NULL,
    item_type character varying(255) NOT NULL,
    item_id integer NOT NULL,
    event character varying(255) NOT NULL,
    whodunnit character varying(255),
    object text,
    created_at timestamp without time zone
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_keys ALTER COLUMN id SET DEFAULT nextval('auth_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bike_regs ALTER COLUMN id SET DEFAULT nextval('bike_regs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY inbound_emails ALTER COLUMN id SET DEFAULT nextval('inbound_emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lookup_codes ALTER COLUMN id SET DEFAULT nextval('lookup_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_types ALTER COLUMN id SET DEFAULT nextval('order_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: auth_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_keys
    ADD CONSTRAINT auth_keys_pkey PRIMARY KEY (id);


--
-- Name: bike_regs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bike_regs
    ADD CONSTRAINT bike_regs_pkey PRIMARY KEY (id);


--
-- Name: inbound_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY inbound_emails
    ADD CONSTRAINT inbound_emails_pkey PRIMARY KEY (id);


--
-- Name: lookup_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lookup_codes
    ADD CONSTRAINT lookup_codes_pkey PRIMARY KEY (id);


--
-- Name: order_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY order_types
    ADD CONSTRAINT order_types_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: bike_regs_searchable_text; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX bike_regs_searchable_text ON bike_regs USING gin (to_tsvector('english'::regconfig, searchable_text));


--
-- Name: index_bike_regs_on_xyz_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_bike_regs_on_xyz_code ON bike_regs USING btree (xyz_code);


--
-- Name: index_lookup_codes_on_xyz_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_lookup_codes_on_xyz_code ON lookup_codes USING btree (xyz_code);


--
-- Name: index_users_on_authentication_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_authentication_token ON users USING btree (authentication_token);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON users USING btree (unlock_token);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20131128172221');

INSERT INTO schema_migrations (version) VALUES ('20131128180431');

INSERT INTO schema_migrations (version) VALUES ('20131128180900');

INSERT INTO schema_migrations (version) VALUES ('20131128184531');

INSERT INTO schema_migrations (version) VALUES ('20131128222924');

INSERT INTO schema_migrations (version) VALUES ('20131128232002');

INSERT INTO schema_migrations (version) VALUES ('20131201202442');

INSERT INTO schema_migrations (version) VALUES ('20131201210615');

INSERT INTO schema_migrations (version) VALUES ('20131214063153');

INSERT INTO schema_migrations (version) VALUES ('20131216005714');

INSERT INTO schema_migrations (version) VALUES ('20131216131346');

INSERT INTO schema_migrations (version) VALUES ('20131221060844');

INSERT INTO schema_migrations (version) VALUES ('20131224083705');

INSERT INTO schema_migrations (version) VALUES ('20131226090608');

INSERT INTO schema_migrations (version) VALUES ('20131231030604');

INSERT INTO schema_migrations (version) VALUES ('20140104173151');

INSERT INTO schema_migrations (version) VALUES ('20140104174115');

INSERT INTO schema_migrations (version) VALUES ('20140104174436');

INSERT INTO schema_migrations (version) VALUES ('20140106013435');

INSERT INTO schema_migrations (version) VALUES ('20140106014346');

INSERT INTO schema_migrations (version) VALUES ('20140106091218');