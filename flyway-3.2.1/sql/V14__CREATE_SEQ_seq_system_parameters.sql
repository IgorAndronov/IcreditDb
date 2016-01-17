-- Sequence: icredit.seq_system_parameters

-- DROP SEQUENCE icredit.seq_system_parameters;

CREATE SEQUENCE icredit.seq_system_parameters
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 1
  CACHE 1;
ALTER TABLE icredit.seq_system_parameters
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_system_parameters
  IS 'Праймери ключ для таблицы system_parameters';
