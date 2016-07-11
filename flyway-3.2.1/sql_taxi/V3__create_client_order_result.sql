-- Table: taxi.client_order_result

-- DROP TABLE taxi.client_order_result;

CREATE TABLE taxi.client_order_result
(
  id bigint NOT NULL,
  driver_id integer,
  order_id bigint,
  car_estimation integer,
  client_comment text,
  driver_comment text,
  final_prise double precision,
  CONSTRAINT "CLIENT_ORDER_RESULT_PK" PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE taxi.client_order_result
  OWNER TO postgres;
