-- Table: taxi.clients

-- DROP TABLE taxi.clients;

CREATE TABLE taxi.clients
(
  id bigint NOT NULL,
  region_id integer, -- used for reporting purpose
  name text,
  phone_reg text, -- for registered users that allow personal data keeping
  pkey text,
  pkey2 text,
  CONSTRAINT pk_clients PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE taxi.clients
  OWNER TO postgres;
COMMENT ON COLUMN taxi.clients.region_id IS 'used for reporting purpose';
COMMENT ON COLUMN taxi.clients.phone_reg IS 'for registered users that allow personal data keeping';

