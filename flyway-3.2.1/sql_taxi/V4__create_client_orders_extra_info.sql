-- Table: taxi.client_orders_extra_info

-- DROP TABLE taxi.client_orders_extra_info;

CREATE TABLE taxi.client_orders_extra_info
(
  id bigint NOT NULL,
  order_id bigint,
  animal boolean,
  baggage boolean,
  no_smoking boolean,
  note text,
  CONSTRAINT "CLIENT_ORDER_EXTRA_PK" PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE taxi.client_orders_extra_info
  OWNER TO postgres;
