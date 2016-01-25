-- Sequence: icredit.seq_dictionaries

-- DROP SEQUENCE icredit.seq_dictionaries;

CREATE SEQUENCE icredit.seq_dictionaries
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 1026
  CACHE 1;
ALTER TABLE icredit.seq_dictionaries
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_dictionaries
  IS 'Праймери ключ для таблицы seq_dictionaries';
