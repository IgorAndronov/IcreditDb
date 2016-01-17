-- Sequence: icredit.seq_contacts_documents

-- DROP SEQUENCE icredit.seq_contacts_documents;

CREATE SEQUENCE icredit.seq_contacts_documents
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 1
  CACHE 1;
ALTER TABLE icredit.seq_contacts_documents
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_contacts_documents
  IS 'Праймери ключ для таблицы contacts_documents';
