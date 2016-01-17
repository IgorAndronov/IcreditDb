-- Sequence: icredit.seq_contacts_adress

-- DROP SEQUENCE icredit.seq_contacts_adress;

CREATE SEQUENCE icredit.seq_contacts_adress
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 1
  CACHE 1;
ALTER TABLE icredit.seq_contacts_adress
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_contacts_adress
  IS 'Праймери ключ для таблицы contacts_adress';
