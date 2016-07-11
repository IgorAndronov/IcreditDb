-- Sequence: taxi.seq_client_orders

-- DROP SEQUENCE taxi.seq_client_orders;

CREATE SEQUENCE taxi.seq_client_orders
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE taxi.seq_client_orders
  OWNER TO postgres;
