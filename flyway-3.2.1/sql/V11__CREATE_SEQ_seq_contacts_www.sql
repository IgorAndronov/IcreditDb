-- Sequence: icredit.seq_contacts_www

-- DROP SEQUENCE icredit.seq_contacts_www;

CREATE SEQUENCE icredit.seq_contacts_www
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 1
  CACHE 1;
ALTER TABLE icredit.seq_contacts_www
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_contacts_www
  IS 'Праймери ключ для таблицы contacts_www';
