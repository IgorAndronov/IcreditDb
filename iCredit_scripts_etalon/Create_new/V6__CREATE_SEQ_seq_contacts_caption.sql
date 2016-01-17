-- Sequence: icredit.seq_contacts_caption

-- DROP SEQUENCE icredit.seq_contacts_caption;

CREATE SEQUENCE icredit.seq_contacts_caption
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 503
  CACHE 1;
ALTER TABLE icredit.seq_contacts_caption
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_contacts_caption
  IS 'Праймери ключ для таблицы seq_contacts_caption';
