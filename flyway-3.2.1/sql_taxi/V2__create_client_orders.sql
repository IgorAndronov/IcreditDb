-- Table: taxi.client_orders

-- DROP TABLE taxi.client_orders;

CREATE TABLE taxi.client_orders
(
  id bigint NOT NULL,
  region text,
  address_city_from text,
  address_district_from text,
  address_street_from text,
  address_home_from text,
  address_note_from text,
  address_city_to1 text,
  address_district_to1 text,
  address_street_to1 text,
  address_home_to1 text,
  address_note_to1 text,
  address_city_to2 text,
  address_district_to2 text,
  address_street_to2 text,
  address_home_to2 text,
  address_note_to2 text,
  address_city_to3 text,
  address_district_to3 text,
  address_street_to3 text,
  address_home_to3 text,
  address_note_to3 text,
  order_time timestamp without time zone,
  arrival_time timestamp without time zone,
  order_initial_prise double precision,
  distance double precision,
  status character varying(20), -- ACTIVE...
  client_id bigint,
  CONSTRAINT id_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE taxi.client_orders
  OWNER TO postgres;
COMMENT ON COLUMN taxi.client_orders.status IS 'ACTIVE
INPROGRESS
CANCELED
DONE
EXPIRED';

