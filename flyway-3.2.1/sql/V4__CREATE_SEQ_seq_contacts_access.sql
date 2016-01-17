-- Sequence: icredit.seq_contacts_access

-- DROP SEQUENCE icredit.seq_contacts_access;

CREATE SEQUENCE icredit.seq_contacts_access
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 122
  CACHE 1;
ALTER TABLE icredit.seq_contacts_access
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_contacts_access
  IS 'Праймери ключ для таблицы contacts_access';
