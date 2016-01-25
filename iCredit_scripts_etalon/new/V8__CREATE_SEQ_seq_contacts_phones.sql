-- Sequence: icredit.seq_contacts_phones

-- DROP SEQUENCE icredit.seq_contacts_phones;

CREATE SEQUENCE icredit.seq_contacts_phones
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 1
  CACHE 1;
ALTER TABLE icredit.seq_contacts_phones
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_contacts_phones
  IS 'Праймери ключ для таблицы contacts_pfones';
