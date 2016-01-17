-- Sequence: icredit.seq_role

-- DROP SEQUENCE icredit.seq_role;

CREATE SEQUENCE icredit.seq_role
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 1
  CACHE 1;
ALTER TABLE icredit.seq_role
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_role
  IS 'Праймери ключ для таблицы role';
