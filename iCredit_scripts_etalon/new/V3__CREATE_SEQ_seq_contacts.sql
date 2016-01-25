-- Sequence: icredit.seq_contacts

-- DROP SEQUENCE icredit.seq_contacts;

CREATE SEQUENCE icredit.seq_contacts
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 1
  CACHE 1;
ALTER TABLE icredit.seq_contacts
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_contacts
  IS 'Праймери ключ для таблицы contacts';
