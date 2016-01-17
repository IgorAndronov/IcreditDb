-- Sequence: icredit.seq_arc_contacts_pwd

-- DROP SEQUENCE icredit.seq_arc_contacts_pwd;

CREATE SEQUENCE icredit.seq_arc_contacts_pwd
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 1
  CACHE 1;
ALTER TABLE icredit.seq_arc_contacts_pwd
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_arc_contacts_pwd
  IS 'Праймери ключ для таблицы arc_contacts_pwd';
