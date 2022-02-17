--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-02-17 16:54:37

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
-- TOC entry 3663 (class 1262 OID 16394)
-- Name: HungerExpress; Type: DATABASE; Schema: -; Owner: postgres
--

--CREATE DATABASE "HungerExpress" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE "HungerExpress" OWNER TO postgres;

--\connect "HungerExpress"

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
-- TOC entry 259 (class 1259 OID 17233)
-- Name: addon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addon (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price integer NOT NULL,
    count integer NOT NULL
);


ALTER TABLE public.addon OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 17232)
-- Name: addon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addon_id_seq OWNER TO postgres;

--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 258
-- Name: addon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addon_id_seq OWNED BY public.addon.id;


--
-- TOC entry 218 (class 1259 OID 16967)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id integer NOT NULL,
    location character varying(20) NOT NULL,
    block character varying(20) NOT NULL,
    road character varying(20) NOT NULL,
    house character varying(20) NOT NULL,
    apartment character varying(20) NOT NULL,
    postal_code character varying(20) NOT NULL,
    start timestamp without time zone NOT NULL,
    finish timestamp without time zone NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16966)
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 217
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- TOC entry 234 (class 1259 OID 17063)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    dob timestamp without time zone NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(30) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17062)
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO postgres;

--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 233
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- TOC entry 226 (class 1259 OID 17010)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    customer_id integer NOT NULL,
    order_time timestamp without time zone NOT NULL,
    delivery_time timestamp without time zone NOT NULL,
    total_price integer NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17009)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 225
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 257 (class 1259 OID 17217)
-- Name: cart_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_item (
    id integer NOT NULL,
    item_id integer NOT NULL,
    cart_id integer NOT NULL,
    total_price integer NOT NULL,
    count integer NOT NULL
);


ALTER TABLE public.cart_item OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 17239)
-- Name: cart_item_addon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_item_addon (
    id integer NOT NULL,
    cart_item_id integer NOT NULL,
    addon_id integer NOT NULL,
    total_price integer NOT NULL,
    count integer NOT NULL
);


ALTER TABLE public.cart_item_addon OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16991)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16990)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 221
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 250 (class 1259 OID 17151)
-- Name: coin_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coin_history (
    id integer NOT NULL,
    coin_use_type_id integer NOT NULL,
    customer_id integer NOT NULL,
    voucher_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.coin_history OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 17150)
-- Name: coin_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coin_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coin_history_id_seq OWNER TO postgres;

--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 249
-- Name: coin_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coin_history_id_seq OWNED BY public.coin_history.id;


--
-- TOC entry 248 (class 1259 OID 17139)
-- Name: coin_use_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coin_use_type (
    id integer NOT NULL,
    admin_id integer NOT NULL,
    available_data character varying(50) NOT NULL,
    coin_amount integer NOT NULL,
    voucher_amount integer NOT NULL
);


ALTER TABLE public.coin_use_type OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 17138)
-- Name: coin_use_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coin_use_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coin_use_type_id_seq OWNER TO postgres;

--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 247
-- Name: coin_use_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coin_use_type_id_seq OWNED BY public.coin_use_type.id;


--
-- TOC entry 224 (class 1259 OID 17003)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    current_coin integer NOT NULL,
    current_address_id integer NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17027)
-- Name: customer_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_address (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    location character varying(20) NOT NULL,
    block character varying(20) NOT NULL,
    road character varying(20) NOT NULL,
    house character varying(20) NOT NULL,
    apartment character varying(20) NOT NULL,
    postal_code character varying(20) NOT NULL,
    start character varying(20) NOT NULL,
    finish character varying(20) NOT NULL
);


ALTER TABLE public.customer_address OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17026)
-- Name: customer_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_address_id_seq OWNER TO postgres;

--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 227
-- Name: customer_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_address_id_seq OWNED BY public.customer_address.id;


--
-- TOC entry 223 (class 1259 OID 17002)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 223
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- TOC entry 230 (class 1259 OID 17039)
-- Name: customer_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_image (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    link character varying(50) NOT NULL,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.customer_image OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17038)
-- Name: customer_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_image_id_seq OWNER TO postgres;

--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 229
-- Name: customer_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_image_id_seq OWNED BY public.customer_image.id;


--
-- TOC entry 236 (class 1259 OID 17070)
-- Name: delivery_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_address (
    id integer NOT NULL,
    location character varying(20) NOT NULL,
    block character varying(20) NOT NULL,
    road character varying(20) NOT NULL,
    house character varying(20) NOT NULL,
    apartment character varying(20) NOT NULL,
    postal_code character varying(20) NOT NULL
);


ALTER TABLE public.delivery_address OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17069)
-- Name: delivery_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.delivery_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_address_id_seq OWNER TO postgres;

--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 235
-- Name: delivery_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.delivery_address_id_seq OWNED BY public.delivery_address.id;


--
-- TOC entry 244 (class 1259 OID 17115)
-- Name: gift_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gift_info (
    id integer NOT NULL,
    order_id integer NOT NULL,
    name character varying(50) NOT NULL,
    phone character varying(13) NOT NULL
);


ALTER TABLE public.gift_info OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17114)
-- Name: gift_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gift_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gift_info_id_seq OWNER TO postgres;

--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 243
-- Name: gift_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gift_info_id_seq OWNED BY public.gift_info.id;


--
-- TOC entry 271 (class 1259 OID 17318)
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice (
    id integer NOT NULL,
    order_id integer NOT NULL,
    vat_amount real NOT NULL,
    delivery_fee real NOT NULL,
    total_price real NOT NULL
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 17317)
-- Name: invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_id_seq OWNER TO postgres;

--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 270
-- Name: invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoice_id_seq OWNED BY public.invoice.id;


--
-- TOC entry 254 (class 1259 OID 17192)
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(50) NOT NULL,
    count integer NOT NULL,
    rating real NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 17191)
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_id_seq OWNER TO postgres;

--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 253
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;


--
-- TOC entry 256 (class 1259 OID 17199)
-- Name: item_review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_review (
    id integer NOT NULL,
    item_id integer NOT NULL,
    order_id integer NOT NULL,
    rating real NOT NULL,
    description text
);


ALTER TABLE public.item_review OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 17198)
-- Name: item_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_review_id_seq OWNER TO postgres;

--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 255
-- Name: item_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_review_id_seq OWNED BY public.item_review.id;


--
-- TOC entry 238 (class 1259 OID 17077)
-- Name: orderr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderr (
    id integer NOT NULL,
    cart_id integer NOT NULL,
    delivery_address_id integer NOT NULL,
    restaurant_manager_id integer NOT NULL,
    phone character varying(13) NOT NULL,
    name character varying
);


ALTER TABLE public.orderr OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17098)
-- Name: normal_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.normal_order (
    estimated_time timestamp without time zone NOT NULL
)
INHERITS (public.orderr);


ALTER TABLE public.normal_order OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17076)
-- Name: orderr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderr_id_seq OWNER TO postgres;

--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 237
-- Name: orderr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderr_id_seq OWNED BY public.orderr.id;


--
-- TOC entry 267 (class 1259 OID 17294)
-- Name: payment_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_info (
    id integer NOT NULL,
    order_id integer NOT NULL,
    account_no character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    payment_time timestamp without time zone NOT NULL,
    transaction_id character varying(50) NOT NULL
);


ALTER TABLE public.payment_info OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 17293)
-- Name: payment_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_info_id_seq OWNER TO postgres;

--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 266
-- Name: payment_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_info_id_seq OWNED BY public.payment_info.id;


--
-- TOC entry 241 (class 1259 OID 17106)
-- Name: pickup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup (
    pin character varying(6) NOT NULL,
    target_time timestamp without time zone NOT NULL
)
INHERITS (public.orderr);


ALTER TABLE public.pickup OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17110)
-- Name: pre_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pre_order (
    target_time timestamp without time zone NOT NULL
)
INHERITS (public.orderr);


ALTER TABLE public.pre_order OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 17261)
-- Name: promo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promo (
    id integer NOT NULL,
    promo_type_id integer NOT NULL,
    admin_id integer NOT NULL,
    min_amount integer NOT NULL,
    max_count integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone NOT NULL
);


ALTER TABLE public.promo OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 17255)
-- Name: promo_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promo_type (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    owner_id integer NOT NULL,
    value integer NOT NULL,
    owner_type character varying(50) NOT NULL
);


ALTER TABLE public.promo_type OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 17254)
-- Name: promo_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promo_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promo_type_id_seq OWNER TO postgres;

--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 261
-- Name: promo_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promo_type_id_seq OWNED BY public.promo_type.id;


--
-- TOC entry 265 (class 1259 OID 17277)
-- Name: promo_use; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promo_use (
    id integer NOT NULL,
    promo_id integer NOT NULL,
    order_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.promo_use OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 17276)
-- Name: promo_use_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promo_use_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promo_use_id_seq OWNER TO postgres;

--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 264
-- Name: promo_use_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promo_use_id_seq OWNED BY public.promo_use.id;


--
-- TOC entry 210 (class 1259 OID 16924)
-- Name: restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    location character varying(50) NOT NULL,
    rating real NOT NULL,
    current_service_charge_id integer NOT NULL,
    current_address_id integer NOT NULL
);


ALTER TABLE public.restaurant OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16931)
-- Name: restaurant_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_address (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    location character varying(20) NOT NULL,
    block character varying(20) NOT NULL,
    road character varying(20) NOT NULL,
    house character varying(20) NOT NULL,
    apartment character varying(20) NOT NULL,
    postal_code character varying(20) NOT NULL,
    start timestamp without time zone NOT NULL,
    finish timestamp without time zone NOT NULL
);


ALTER TABLE public.restaurant_address OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16930)
-- Name: restaurant_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_address_id_seq OWNER TO postgres;

--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 211
-- Name: restaurant_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_address_id_seq OWNED BY public.restaurant_address.id;


--
-- TOC entry 209 (class 1259 OID 16923)
-- Name: restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_id_seq OWNER TO postgres;

--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 209
-- Name: restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_id_seq OWNED BY public.restaurant.id;


--
-- TOC entry 216 (class 1259 OID 16955)
-- Name: restaurant_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_image (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    link character varying(50) NOT NULL,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.restaurant_image OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16954)
-- Name: restaurant_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_image_id_seq OWNER TO postgres;

--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 215
-- Name: restaurant_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_image_id_seq OWNED BY public.restaurant_image.id;


--
-- TOC entry 220 (class 1259 OID 16974)
-- Name: restaurant_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_manager (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    address_id integer NOT NULL,
    name character varying(50) NOT NULL,
    dob timestamp without time zone NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(30) NOT NULL
);


ALTER TABLE public.restaurant_manager OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16973)
-- Name: restaurant_manager_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_manager_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_manager_id_seq OWNER TO postgres;

--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 219
-- Name: restaurant_manager_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_manager_id_seq OWNED BY public.restaurant_manager.id;


--
-- TOC entry 252 (class 1259 OID 17173)
-- Name: restaurant_review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_review (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    order_id integer NOT NULL,
    rating real NOT NULL,
    description text
);


ALTER TABLE public.restaurant_review OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 17172)
-- Name: restaurant_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_review_id_seq OWNER TO postgres;

--
-- TOC entry 3687 (class 0 OID 0)
-- Dependencies: 251
-- Name: restaurant_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_review_id_seq OWNED BY public.restaurant_review.id;


--
-- TOC entry 240 (class 1259 OID 17102)
-- Name: rush_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rush_order (
    maximum_time timestamp without time zone NOT NULL,
    estimated_time timestamp without time zone NOT NULL
)
INHERITS (public.orderr);


ALTER TABLE public.rush_order OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17051)
-- Name: search_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search_history (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    description character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.search_history OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17050)
-- Name: search_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.search_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.search_history_id_seq OWNER TO postgres;

--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 231
-- Name: search_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.search_history_id_seq OWNED BY public.search_history.id;


--
-- TOC entry 214 (class 1259 OID 16943)
-- Name: service_charge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_charge (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    value integer NOT NULL,
    start timestamp without time zone NOT NULL,
    finish timestamp without time zone NOT NULL
);


ALTER TABLE public.service_charge OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16942)
-- Name: service_charge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_charge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_charge_id_seq OWNER TO postgres;

--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 213
-- Name: service_charge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_charge_id_seq OWNED BY public.service_charge.id;


--
-- TOC entry 269 (class 1259 OID 17306)
-- Name: state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.state (
    id integer NOT NULL,
    order_id integer NOT NULL,
    description character varying(50) NOT NULL,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.state OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 17305)
-- Name: state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_id_seq OWNER TO postgres;

--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 268
-- Name: state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.state_id_seq OWNED BY public.state.id;


--
-- TOC entry 246 (class 1259 OID 17127)
-- Name: voucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voucher (
    id integer NOT NULL,
    order_id integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.voucher OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17126)
-- Name: voucher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voucher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voucher_id_seq OWNER TO postgres;

--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 245
-- Name: voucher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voucher_id_seq OWNED BY public.voucher.id;


--
-- TOC entry 3353 (class 2604 OID 17236)
-- Name: addon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addon ALTER COLUMN id SET DEFAULT nextval('public.addon_id_seq'::regclass);


--
-- TOC entry 3331 (class 2604 OID 16970)
-- Name: address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- TOC entry 3339 (class 2604 OID 17066)
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- TOC entry 3335 (class 2604 OID 17013)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 3333 (class 2604 OID 16994)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3349 (class 2604 OID 17154)
-- Name: coin_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_history ALTER COLUMN id SET DEFAULT nextval('public.coin_history_id_seq'::regclass);


--
-- TOC entry 3348 (class 2604 OID 17142)
-- Name: coin_use_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_use_type ALTER COLUMN id SET DEFAULT nextval('public.coin_use_type_id_seq'::regclass);


--
-- TOC entry 3334 (class 2604 OID 17006)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 3336 (class 2604 OID 17030)
-- Name: customer_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address ALTER COLUMN id SET DEFAULT nextval('public.customer_address_id_seq'::regclass);


--
-- TOC entry 3337 (class 2604 OID 17042)
-- Name: customer_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_image ALTER COLUMN id SET DEFAULT nextval('public.customer_image_id_seq'::regclass);


--
-- TOC entry 3340 (class 2604 OID 17073)
-- Name: delivery_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_address ALTER COLUMN id SET DEFAULT nextval('public.delivery_address_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 17118)
-- Name: gift_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_info ALTER COLUMN id SET DEFAULT nextval('public.gift_info_id_seq'::regclass);


--
-- TOC entry 3358 (class 2604 OID 17321)
-- Name: invoice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice ALTER COLUMN id SET DEFAULT nextval('public.invoice_id_seq'::regclass);


--
-- TOC entry 3351 (class 2604 OID 17195)
-- Name: item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);


--
-- TOC entry 3352 (class 2604 OID 17202)
-- Name: item_review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_review ALTER COLUMN id SET DEFAULT nextval('public.item_review_id_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 17101)
-- Name: normal_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.normal_order ALTER COLUMN id SET DEFAULT nextval('public.orderr_id_seq'::regclass);


--
-- TOC entry 3341 (class 2604 OID 17080)
-- Name: orderr id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderr ALTER COLUMN id SET DEFAULT nextval('public.orderr_id_seq'::regclass);


--
-- TOC entry 3356 (class 2604 OID 17297)
-- Name: payment_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_info ALTER COLUMN id SET DEFAULT nextval('public.payment_info_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 17109)
-- Name: pickup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup ALTER COLUMN id SET DEFAULT nextval('public.orderr_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 17113)
-- Name: pre_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_order ALTER COLUMN id SET DEFAULT nextval('public.orderr_id_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 17258)
-- Name: promo_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_type ALTER COLUMN id SET DEFAULT nextval('public.promo_type_id_seq'::regclass);


--
-- TOC entry 3355 (class 2604 OID 17280)
-- Name: promo_use id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_use ALTER COLUMN id SET DEFAULT nextval('public.promo_use_id_seq'::regclass);


--
-- TOC entry 3327 (class 2604 OID 16927)
-- Name: restaurant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant ALTER COLUMN id SET DEFAULT nextval('public.restaurant_id_seq'::regclass);


--
-- TOC entry 3328 (class 2604 OID 16934)
-- Name: restaurant_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_address ALTER COLUMN id SET DEFAULT nextval('public.restaurant_address_id_seq'::regclass);


--
-- TOC entry 3330 (class 2604 OID 16958)
-- Name: restaurant_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_image ALTER COLUMN id SET DEFAULT nextval('public.restaurant_image_id_seq'::regclass);


--
-- TOC entry 3332 (class 2604 OID 16977)
-- Name: restaurant_manager id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_manager ALTER COLUMN id SET DEFAULT nextval('public.restaurant_manager_id_seq'::regclass);


--
-- TOC entry 3350 (class 2604 OID 17176)
-- Name: restaurant_review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_review ALTER COLUMN id SET DEFAULT nextval('public.restaurant_review_id_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 17105)
-- Name: rush_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rush_order ALTER COLUMN id SET DEFAULT nextval('public.orderr_id_seq'::regclass);


--
-- TOC entry 3338 (class 2604 OID 17054)
-- Name: search_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history ALTER COLUMN id SET DEFAULT nextval('public.search_history_id_seq'::regclass);


--
-- TOC entry 3329 (class 2604 OID 16946)
-- Name: service_charge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_charge ALTER COLUMN id SET DEFAULT nextval('public.service_charge_id_seq'::regclass);


--
-- TOC entry 3357 (class 2604 OID 17309)
-- Name: state id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state ALTER COLUMN id SET DEFAULT nextval('public.state_id_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 17130)
-- Name: voucher id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voucher ALTER COLUMN id SET DEFAULT nextval('public.voucher_id_seq'::regclass);


--
-- TOC entry 3645 (class 0 OID 17233)
-- Dependencies: 259
-- Data for Name: addon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.addon (id, name, price, count) VALUES (100, 'Chicken Burger', 180, 1);
INSERT INTO public.addon (id, name, price, count) VALUES (101, 'Beef biriyani', 250, 1);
INSERT INTO public.addon (id, name, price, count) VALUES (102, 'Mutton Kacchi', 300, 1);


--
-- TOC entry 3604 (class 0 OID 16967)
-- Dependencies: 218
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address (id, location, block, road, house, apartment, postal_code, start, finish) VALUES (100, 'Buet', 'Buet', 'Polashi', 'Buet', 'Sorkari', '200', '2019-03-03 10:10:10', '2019-03-03 10:10:10');
INSERT INTO public.address (id, location, block, road, house, apartment, postal_code, start, finish) VALUES (110, 'Bakshibazar', 'Bakshibazar', 'DMC', 'Our house', 'B-08', '200', '2019-03-03 10:10:10', '2019-03-03 10:10:10');


--
-- TOC entry 3620 (class 0 OID 17063)
-- Dependencies: 234
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin (id, name, dob, phone, email) VALUES (10, 'Mehedi Imon', '1998-04-08 00:00:00', '01821018181', 'worstemon8@gmail.com');
INSERT INTO public.admin (id, name, dob, phone, email) VALUES (15, 'Asif Piyal', '1998-05-11 00:00:00', '01821462352', 'boroloxpiyal@gmail.com');


--
-- TOC entry 3612 (class 0 OID 17010)
-- Dependencies: 226
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cart (id, restaurant_id, customer_id, order_time, delivery_time, total_price) VALUES (1000, 200, 100, '2020-03-15 15:30:10', '2020-03-15 16:00:10', 450);
INSERT INTO public.cart (id, restaurant_id, customer_id, order_time, delivery_time, total_price) VALUES (1010, 210, 101, '2020-03-15 17:30:10', '2020-03-15 17:00:10', 675);
INSERT INTO public.cart (id, restaurant_id, customer_id, order_time, delivery_time, total_price) VALUES (1015, 215, 103, '2020-04-12 10:30:10', '2020-04-12 11:00:10', 1000);


--
-- TOC entry 3643 (class 0 OID 17217)
-- Dependencies: 257
-- Data for Name: cart_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cart_item (id, item_id, cart_id, total_price, count) VALUES (100, 10, 1000, 200, 1);
INSERT INTO public.cart_item (id, item_id, cart_id, total_price, count) VALUES (101, 11, 1010, 250, 1);
INSERT INTO public.cart_item (id, item_id, cart_id, total_price, count) VALUES (102, 12, 1015, 300, 1);


--
-- TOC entry 3646 (class 0 OID 17239)
-- Dependencies: 260
-- Data for Name: cart_item_addon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cart_item_addon (id, cart_item_id, addon_id, total_price, count) VALUES (100, 100, 100, 150, 1);
INSERT INTO public.cart_item_addon (id, cart_item_id, addon_id, total_price, count) VALUES (101, 101, 101, 250, 1);
INSERT INTO public.cart_item_addon (id, cart_item_id, addon_id, total_price, count) VALUES (102, 102, 102, 300, 1);


--
-- TOC entry 3608 (class 0 OID 16991)
-- Dependencies: 222
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, restaurant_id, name) VALUES (100, 200, 'Biriyani');
INSERT INTO public.category (id, restaurant_id, name) VALUES (101, 210, 'Burger');
INSERT INTO public.category (id, restaurant_id, name) VALUES (102, 210, 'Steak');
INSERT INTO public.category (id, restaurant_id, name) VALUES (103, 215, 'Chicken');
INSERT INTO public.category (id, restaurant_id, name) VALUES (104, 215, 'Beef');
INSERT INTO public.category (id, restaurant_id, name) VALUES (105, 215, 'Mutton');


--
-- TOC entry 3636 (class 0 OID 17151)
-- Dependencies: 250
-- Data for Name: coin_history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3634 (class 0 OID 17139)
-- Dependencies: 248
-- Data for Name: coin_use_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3610 (class 0 OID 17003)
-- Dependencies: 224
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer (id, name, current_coin, current_address_id) VALUES (100, 'Souvik das', 5000, 110);
INSERT INTO public.customer (id, name, current_coin, current_address_id) VALUES (101, 'Mehedi Hasan Riga', 2000, 115);
INSERT INTO public.customer (id, name, current_coin, current_address_id) VALUES (102, 'Asif Mustafa Hasan', 3000, 120);
INSERT INTO public.customer (id, name, current_coin, current_address_id) VALUES (103, 'Taufiqun Nur Farid', 5000, 125);
INSERT INTO public.customer (id, name, current_coin, current_address_id) VALUES (104, 'Monirul Haq Imon', 100, 130);
INSERT INTO public.customer (id, name, current_coin, current_address_id) VALUES (105, 'Shahriar Tanmay', 2000, 135);


--
-- TOC entry 3614 (class 0 OID 17027)
-- Dependencies: 228
-- Data for Name: customer_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer_address (id, customer_id, location, block, road, house, apartment, postal_code, start, finish) VALUES (115, 101, 'Buet', 'Shere bangla', 'Polashi', 'Sorkari', 'none', '200', '1/1/2020', '10/1/2020');
INSERT INTO public.customer_address (id, customer_id, location, block, road, house, apartment, postal_code, start, finish) VALUES (120, 102, 'Buet', 'Titumir', 'Polashi', 'Sorkari', 'none', '200', '1/1/2020', '10/1/2020');
INSERT INTO public.customer_address (id, customer_id, location, block, road, house, apartment, postal_code, start, finish) VALUES (125, 103, 'Buet', 'Suhrawardi', 'Polashi', 'Sorkari', 'none', '200', '1/1/2020', '10/1/2020');
INSERT INTO public.customer_address (id, customer_id, location, block, road, house, apartment, postal_code, start, finish) VALUES (130, 104, 'Buet', 'Nazrul', 'Polashi', 'Sorkari', 'none', '200', '1/1/2020', '10/1/2020');
INSERT INTO public.customer_address (id, customer_id, location, block, road, house, apartment, postal_code, start, finish) VALUES (135, 105, 'Buet', 'Chattri', 'Polashi', 'Sorkari', 'none', '200', '1/1/2020', '10/1/2020');
INSERT INTO public.customer_address (id, customer_id, location, block, road, house, apartment, postal_code, start, finish) VALUES (110, 100, 'Buet', 'Ahsanullah', 'Polashi', 'Sorkari', 'none', '200', '1/1/2020', '10/1/2020');


--
-- TOC entry 3616 (class 0 OID 17039)
-- Dependencies: 230
-- Data for Name: customer_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer_image (id, customer_id, link, "time") VALUES (100, 100, 'www.kichuekta.com', '2021-03-04 10:10:10');
INSERT INTO public.customer_image (id, customer_id, link, "time") VALUES (101, 101, 'www.JANINAA.com', '2021-03-04 10:10:10');
INSERT INTO public.customer_image (id, customer_id, link, "time") VALUES (102, 102, 'www.something.com', '2021-03-04 10:10:10');


--
-- TOC entry 3622 (class 0 OID 17070)
-- Dependencies: 236
-- Data for Name: delivery_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.delivery_address (id, location, block, road, house, apartment, postal_code) VALUES (100, 'Buet', 'Bakshibazar', 'Palashi', 'Ahsanullah hall', 'Room 233', '200');
INSERT INTO public.delivery_address (id, location, block, road, house, apartment, postal_code) VALUES (101, 'Buet', 'Bakshibazar', 'Palashi', 'Rashid hall', 'Room 5001', '200');
INSERT INTO public.delivery_address (id, location, block, road, house, apartment, postal_code) VALUES (102, 'Dhanmondi', 'Jigatola', 'Dhanmondi 5', 'Chitra', 'C-5', '300');


--
-- TOC entry 3630 (class 0 OID 17115)
-- Dependencies: 244
-- Data for Name: gift_info; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3657 (class 0 OID 17318)
-- Dependencies: 271
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3640 (class 0 OID 17192)
-- Dependencies: 254
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item (id, name, description, count, rating) VALUES (10, 'Beef biriyani', 'Beef,potato and special masala', 1, 4.6);
INSERT INTO public.item (id, name, description, count, rating) VALUES (11, 'Mutton Kacchi', 'Basmati rice, 2 piece mutton, 2 piece potato', 1, 4.9);
INSERT INTO public.item (id, name, description, count, rating) VALUES (12, 'Chicken Burger', '350 gm patty and fresh bun', 1, 4.2);
INSERT INTO public.item (id, name, description, count, rating) VALUES (13, 'French fry', 'Fresh fries with sauce', 1, 4.1);


--
-- TOC entry 3642 (class 0 OID 17199)
-- Dependencies: 256
-- Data for Name: item_review; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3625 (class 0 OID 17098)
-- Dependencies: 239
-- Data for Name: normal_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.normal_order (id, cart_id, delivery_address_id, restaurant_manager_id, phone, estimated_time, name) VALUES (100, 1000, 100, 100, '01521431424', '2021-05-04 10:10:10', 'normal');


--
-- TOC entry 3624 (class 0 OID 17077)
-- Dependencies: 238
-- Data for Name: orderr; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orderr (id, cart_id, delivery_address_id, restaurant_manager_id, phone, name) VALUES (100, 1000, 100, 100, '01531414143', 'normal');
INSERT INTO public.orderr (id, cart_id, delivery_address_id, restaurant_manager_id, phone, name) VALUES (101, 1010, 101, 100, '01531414143', 'pre_order');
INSERT INTO public.orderr (id, cart_id, delivery_address_id, restaurant_manager_id, phone, name) VALUES (102, 1015, 102, 101, '01531414146', 'rush_order');


--
-- TOC entry 3653 (class 0 OID 17294)
-- Dependencies: 267
-- Data for Name: payment_info; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3627 (class 0 OID 17106)
-- Dependencies: 241
-- Data for Name: pickup; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3628 (class 0 OID 17110)
-- Dependencies: 242
-- Data for Name: pre_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pre_order (id, cart_id, delivery_address_id, restaurant_manager_id, phone, target_time, name) VALUES (100, 101, 101, 101, '01712141411', '2021-05-06 10:10:10', 'pre_order');


--
-- TOC entry 3649 (class 0 OID 17261)
-- Dependencies: 263
-- Data for Name: promo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3648 (class 0 OID 17255)
-- Dependencies: 262
-- Data for Name: promo_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3651 (class 0 OID 17277)
-- Dependencies: 265
-- Data for Name: promo_use; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3596 (class 0 OID 16924)
-- Dependencies: 210
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.restaurant (id, name, location, rating, current_service_charge_id, current_address_id) VALUES (210, 'Meat Theory', 'Banani', 4.4, 105, 110);
INSERT INTO public.restaurant (id, name, location, rating, current_service_charge_id, current_address_id) VALUES (215, 'Kabab fort', 'Lalbagh', 4.2, 110, 115);
INSERT INTO public.restaurant (id, name, location, rating, current_service_charge_id, current_address_id) VALUES (200, 'Sultans Dine', 'Dhanmondi', 4.8, 100, 100);
INSERT INTO public.restaurant (id, name, location, rating, current_service_charge_id, current_address_id) VALUES (220, 'Woodhouse', 'Banani', 4.5, 115, 120);


--
-- TOC entry 3598 (class 0 OID 16931)
-- Dependencies: 212
-- Data for Name: restaurant_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.restaurant_address (id, restaurant_id, location, block, road, house, apartment, postal_code, start, finish) VALUES (100, 200, 'Dhanmondi', 'Jigatola', 'Bus stand', 'SF tower', 'Third floor', '200', '2020-01-01 09:00:00', '2020-01-01 21:00:00');
INSERT INTO public.restaurant_address (id, restaurant_id, location, block, road, house, apartment, postal_code, start, finish) VALUES (101, 210, 'Banani', '2', 'Banani-11', 'Grand tower', 'Fourth floor', '200', '2020-01-01 09:00:00', '2020-01-01 21:00:00');
INSERT INTO public.restaurant_address (id, restaurant_id, location, block, road, house, apartment, postal_code, start, finish) VALUES (102, 215, 'Lalbagh', '3', 'Lalbagh more', 'Lalbagh fort', 'Fifth floor', '200', '2020-01-01 09:00:00', '2020-01-01 21:00:00');
INSERT INTO public.restaurant_address (id, restaurant_id, location, block, road, house, apartment, postal_code, start, finish) VALUES (103, 220, 'Banani', '4', 'Banani-6', 'Meat king', 'Fifth floor', '200', '2020-01-01 09:00:00', '2020-01-01 21:00:00');


--
-- TOC entry 3602 (class 0 OID 16955)
-- Dependencies: 216
-- Data for Name: restaurant_image; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3606 (class 0 OID 16974)
-- Dependencies: 220
-- Data for Name: restaurant_manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.restaurant_manager (id, restaurant_id, address_id, name, dob, phone, email) VALUES (100, 200, 100, 'Shahriar Tanmay', '1998-05-06 00:00:00', '01521341441', 'tanmay111@gmail.com');
INSERT INTO public.restaurant_manager (id, restaurant_id, address_id, name, dob, phone, email) VALUES (101, 210, 110, 'Vergil', '1998-06-08 00:00:00', '01521451253', 'vergil@gmail.com');
INSERT INTO public.restaurant_manager (id, restaurant_id, address_id, name, dob, phone, email) VALUES (102, 215, 110, 'Gary Frost', '1995-06-08 00:00:00', '01710310811', 'sanderson@gmail.com');
INSERT INTO public.restaurant_manager (id, restaurant_id, address_id, name, dob, phone, email) VALUES (103, 220, 110, 'Grinch Sanderson', '1995-03-08 00:00:00', '01710310141', 'grinch@gmail.com');


--
-- TOC entry 3638 (class 0 OID 17173)
-- Dependencies: 252
-- Data for Name: restaurant_review; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3626 (class 0 OID 17102)
-- Dependencies: 240
-- Data for Name: rush_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rush_order (id, cart_id, delivery_address_id, restaurant_manager_id, phone, maximum_time, estimated_time, name) VALUES (100, 102, 102, 100, '01634141411', '2021-03-04 12:10:20', '2021-03-04 12:00:20', 'rush_order');


--
-- TOC entry 3618 (class 0 OID 17051)
-- Dependencies: 232
-- Data for Name: search_history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3600 (class 0 OID 16943)
-- Dependencies: 214
-- Data for Name: service_charge; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3655 (class 0 OID 17306)
-- Dependencies: 269
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3632 (class 0 OID 17127)
-- Dependencies: 246
-- Data for Name: voucher; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 258
-- Name: addon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addon_id_seq', 1, false);


--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 217
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 1, false);


--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 233
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_id_seq', 1, false);


--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 225
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 221
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 249
-- Name: coin_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coin_history_id_seq', 1, false);


--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 247
-- Name: coin_use_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coin_use_type_id_seq', 1, false);


--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 227
-- Name: customer_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_address_id_seq', 1, false);


--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 223
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, false);


--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 229
-- Name: customer_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_image_id_seq', 1, false);


--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 235
-- Name: delivery_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.delivery_address_id_seq', 1, false);


--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 243
-- Name: gift_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gift_info_id_seq', 1, false);


--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 270
-- Name: invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoice_id_seq', 1, false);


--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 253
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_id_seq', 1, false);


--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 255
-- Name: item_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_review_id_seq', 1, false);


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 237
-- Name: orderr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderr_id_seq', 1, false);


--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 266
-- Name: payment_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_info_id_seq', 1, false);


--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 261
-- Name: promo_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promo_type_id_seq', 1, false);


--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 264
-- Name: promo_use_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promo_use_id_seq', 1, false);


--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 211
-- Name: restaurant_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_address_id_seq', 1, false);


--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 209
-- Name: restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_id_seq', 1, false);


--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 215
-- Name: restaurant_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_image_id_seq', 1, false);


--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 219
-- Name: restaurant_manager_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_manager_id_seq', 1, false);


--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 251
-- Name: restaurant_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_review_id_seq', 1, false);


--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 231
-- Name: search_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.search_history_id_seq', 1, false);


--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 213
-- Name: service_charge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_charge_id_seq', 1, false);


--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 268
-- Name: state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.state_id_seq', 1, false);


--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 245
-- Name: voucher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voucher_id_seq', 1, false);


--
-- TOC entry 3406 (class 2606 OID 17238)
-- Name: addon addon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addon
    ADD CONSTRAINT addon_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 16972)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- TOC entry 3384 (class 2606 OID 17068)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- TOC entry 3408 (class 2606 OID 17243)
-- Name: cart_item_addon cart_item_addon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item_addon
    ADD CONSTRAINT cart_item_addon_pkey PRIMARY KEY (id);


--
-- TOC entry 3404 (class 2606 OID 17221)
-- Name: cart_item cart_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (id);


--
-- TOC entry 3376 (class 2606 OID 17015)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 16996)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 17156)
-- Name: coin_history coin_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_history
    ADD CONSTRAINT coin_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3394 (class 2606 OID 17144)
-- Name: coin_use_type coin_use_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_use_type
    ADD CONSTRAINT coin_use_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 17032)
-- Name: customer_address customer_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT customer_address_pkey PRIMARY KEY (id);


--
-- TOC entry 3380 (class 2606 OID 17044)
-- Name: customer_image customer_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_image
    ADD CONSTRAINT customer_image_pkey PRIMARY KEY (id);


--
-- TOC entry 3374 (class 2606 OID 17008)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 3386 (class 2606 OID 17075)
-- Name: delivery_address delivery_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_address
    ADD CONSTRAINT delivery_address_pkey PRIMARY KEY (id);


--
-- TOC entry 3390 (class 2606 OID 17120)
-- Name: gift_info gift_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_info
    ADD CONSTRAINT gift_info_pkey PRIMARY KEY (id);


--
-- TOC entry 3420 (class 2606 OID 17323)
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- TOC entry 3400 (class 2606 OID 17197)
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- TOC entry 3402 (class 2606 OID 17206)
-- Name: item_review item_review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_review
    ADD CONSTRAINT item_review_pkey PRIMARY KEY (id);


--
-- TOC entry 3388 (class 2606 OID 17082)
-- Name: orderr orderr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderr
    ADD CONSTRAINT orderr_pkey PRIMARY KEY (id);


--
-- TOC entry 3416 (class 2606 OID 17299)
-- Name: payment_info payment_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_info
    ADD CONSTRAINT payment_info_pkey PRIMARY KEY (id);


--
-- TOC entry 3412 (class 2606 OID 17265)
-- Name: promo promo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo
    ADD CONSTRAINT promo_pkey PRIMARY KEY (id);


--
-- TOC entry 3410 (class 2606 OID 17260)
-- Name: promo_type promo_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_type
    ADD CONSTRAINT promo_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3414 (class 2606 OID 17282)
-- Name: promo_use promo_use_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_use
    ADD CONSTRAINT promo_use_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 16936)
-- Name: restaurant_address restaurant_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_address
    ADD CONSTRAINT restaurant_address_pkey PRIMARY KEY (id);


--
-- TOC entry 3366 (class 2606 OID 16960)
-- Name: restaurant_image restaurant_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_image
    ADD CONSTRAINT restaurant_image_pkey PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 16979)
-- Name: restaurant_manager restaurant_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_manager
    ADD CONSTRAINT restaurant_manager_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 16929)
-- Name: restaurant restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (id);


--
-- TOC entry 3398 (class 2606 OID 17180)
-- Name: restaurant_review restaurant_review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_review
    ADD CONSTRAINT restaurant_review_pkey PRIMARY KEY (id);


--
-- TOC entry 3382 (class 2606 OID 17056)
-- Name: search_history search_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 16948)
-- Name: service_charge service_charge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_charge
    ADD CONSTRAINT service_charge_pkey PRIMARY KEY (id);


--
-- TOC entry 3418 (class 2606 OID 17311)
-- Name: state state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (id);


--
-- TOC entry 3392 (class 2606 OID 17132)
-- Name: voucher voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voucher
    ADD CONSTRAINT voucher_pkey PRIMARY KEY (id);


--
-- TOC entry 3428 (class 2606 OID 17021)
-- Name: cart cart_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 3448 (class 2606 OID 17249)
-- Name: cart_item_addon cart_item_addon_addon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item_addon
    ADD CONSTRAINT cart_item_addon_addon_id_fkey FOREIGN KEY (addon_id) REFERENCES public.addon(id);


--
-- TOC entry 3447 (class 2606 OID 17244)
-- Name: cart_item_addon cart_item_addon_cart_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item_addon
    ADD CONSTRAINT cart_item_addon_cart_item_id_fkey FOREIGN KEY (cart_item_id) REFERENCES public.cart_item(id);


--
-- TOC entry 3446 (class 2606 OID 17227)
-- Name: cart_item cart_item_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- TOC entry 3445 (class 2606 OID 17222)
-- Name: cart_item cart_item_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(id);


--
-- TOC entry 3427 (class 2606 OID 17016)
-- Name: cart cart_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


--
-- TOC entry 3426 (class 2606 OID 16997)
-- Name: category category_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


--
-- TOC entry 3438 (class 2606 OID 17157)
-- Name: coin_history coin_history_coin_use_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_history
    ADD CONSTRAINT coin_history_coin_use_type_id_fkey FOREIGN KEY (coin_use_type_id) REFERENCES public.coin_use_type(id);


--
-- TOC entry 3440 (class 2606 OID 17167)
-- Name: coin_history coin_history_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_history
    ADD CONSTRAINT coin_history_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 3439 (class 2606 OID 17162)
-- Name: coin_history coin_history_voucher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_history
    ADD CONSTRAINT coin_history_voucher_id_fkey FOREIGN KEY (voucher_id) REFERENCES public.voucher(id);


--
-- TOC entry 3437 (class 2606 OID 17145)
-- Name: coin_use_type coin_use_type_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_use_type
    ADD CONSTRAINT coin_use_type_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admin(id);


--
-- TOC entry 3429 (class 2606 OID 17033)
-- Name: customer_address customer_address_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT customer_address_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 3430 (class 2606 OID 17045)
-- Name: customer_image customer_image_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_image
    ADD CONSTRAINT customer_image_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 3435 (class 2606 OID 17121)
-- Name: gift_info gift_info_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_info
    ADD CONSTRAINT gift_info_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orderr(id);


--
-- TOC entry 3455 (class 2606 OID 17324)
-- Name: invoice invoice_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orderr(id);


--
-- TOC entry 3444 (class 2606 OID 17212)
-- Name: item_review item_review_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_review
    ADD CONSTRAINT item_review_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(id);


--
-- TOC entry 3443 (class 2606 OID 17207)
-- Name: item_review item_review_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_review
    ADD CONSTRAINT item_review_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orderr(id);


--
-- TOC entry 3432 (class 2606 OID 17083)
-- Name: orderr orderr_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderr
    ADD CONSTRAINT orderr_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- TOC entry 3433 (class 2606 OID 17088)
-- Name: orderr orderr_delivery_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderr
    ADD CONSTRAINT orderr_delivery_address_id_fkey FOREIGN KEY (delivery_address_id) REFERENCES public.delivery_address(id);


--
-- TOC entry 3434 (class 2606 OID 17093)
-- Name: orderr orderr_restaurant_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderr
    ADD CONSTRAINT orderr_restaurant_manager_id_fkey FOREIGN KEY (restaurant_manager_id) REFERENCES public.restaurant_manager(id);


--
-- TOC entry 3453 (class 2606 OID 17300)
-- Name: payment_info payment_info_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_info
    ADD CONSTRAINT payment_info_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orderr(id);


--
-- TOC entry 3450 (class 2606 OID 17271)
-- Name: promo promo_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo
    ADD CONSTRAINT promo_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admin(id);


--
-- TOC entry 3449 (class 2606 OID 17266)
-- Name: promo promo_promo_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo
    ADD CONSTRAINT promo_promo_type_id_fkey FOREIGN KEY (promo_type_id) REFERENCES public.promo_type(id);


--
-- TOC entry 3451 (class 2606 OID 17283)
-- Name: promo_use promo_use_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_use
    ADD CONSTRAINT promo_use_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orderr(id);


--
-- TOC entry 3452 (class 2606 OID 17288)
-- Name: promo_use promo_use_promo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_use
    ADD CONSTRAINT promo_use_promo_id_fkey FOREIGN KEY (promo_id) REFERENCES public.promo(id);


--
-- TOC entry 3421 (class 2606 OID 16937)
-- Name: restaurant_address restaurant_address_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_address
    ADD CONSTRAINT restaurant_address_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


--
-- TOC entry 3423 (class 2606 OID 16961)
-- Name: restaurant_image restaurant_image_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_image
    ADD CONSTRAINT restaurant_image_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


--
-- TOC entry 3425 (class 2606 OID 16985)
-- Name: restaurant_manager restaurant_manager_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_manager
    ADD CONSTRAINT restaurant_manager_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- TOC entry 3424 (class 2606 OID 16980)
-- Name: restaurant_manager restaurant_manager_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_manager
    ADD CONSTRAINT restaurant_manager_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


--
-- TOC entry 3441 (class 2606 OID 17181)
-- Name: restaurant_review restaurant_review_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_review
    ADD CONSTRAINT restaurant_review_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orderr(id);


--
-- TOC entry 3442 (class 2606 OID 17186)
-- Name: restaurant_review restaurant_review_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_review
    ADD CONSTRAINT restaurant_review_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


--
-- TOC entry 3431 (class 2606 OID 17057)
-- Name: search_history search_history_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 3422 (class 2606 OID 16949)
-- Name: service_charge service_charge_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_charge
    ADD CONSTRAINT service_charge_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


--
-- TOC entry 3454 (class 2606 OID 17312)
-- Name: state state_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orderr(id);


--
-- TOC entry 3436 (class 2606 OID 17133)
-- Name: voucher voucher_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voucher
    ADD CONSTRAINT voucher_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orderr(id);


-- Completed on 2022-02-17 16:54:37

--
-- PostgreSQL database dump complete
--

