-- Sequence: icredit.seq_contacts_place

-- DROP SEQUENCE icredit.seq_contacts_place;

CREATE SEQUENCE icredit.seq_contacts_place
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 1
  CACHE 1;
ALTER TABLE icredit.seq_contacts_place
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_contacts_place
  IS 'Праймери ключ для таблицы contacts_place';
