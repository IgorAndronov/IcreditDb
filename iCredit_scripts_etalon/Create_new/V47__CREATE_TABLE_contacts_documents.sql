-- Table: icredit.contacts_documents

-- DROP TABLE icredit.contacts_documents;

CREATE TABLE icredit.contacts_documents
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_documents'::regclass), -- Уникальный идентификатор записи в таблице
  created timestamp without time zone NOT NULL DEFAULT now(), -- Дата вставки записи
  created_by integer NOT NULL, -- Кем вставлена запись
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- Дата последней модификации записи
  last_updated_by integer NOT NULL, -- кто последним модифицировал запись
  id_contact integer NOT NULL, -- Id_row записи заемщика
  doc_seria character varying(5), -- Серия документа
  doc_number numeric(8,0) NOT NULL, -- Номер документа
  date_doc_given date NOT NULL, -- Дата выдачи
  doc_given character varying(100), -- Кем выдан
  doc_type integer NOT NULL, -- Тип документа
  active integer NOT NULL, -- Статус документа...

  CONSTRAINT pk_contacts_documents PRIMARY KEY (id),
  CONSTRAINT fk_contacts_documents_to_active FOREIGN KEY (active)
      REFERENCES icredit.dic_active_flag (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_documents_to_contacts FOREIGN KEY (id_contact)
      REFERENCES icredit.contacts (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_contacts_documents_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_documents_to_doc_type FOREIGN KEY (doc_type)
      REFERENCES icredit.dic_document_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_documents_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_documents
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_documents
  IS 'Документы заемщиков';
COMMENT ON COLUMN icredit.contacts_documents.id IS 'Уникальный идентификатор записи';
COMMENT ON COLUMN icredit.contacts_documents.created IS 'Дата вставки записи';
COMMENT ON COLUMN icredit.contacts_documents.created_by IS 'Кем вставлена запись';
COMMENT ON COLUMN icredit.contacts_documents.last_updated IS 'Дата последней модификации записи';
COMMENT ON COLUMN icredit.contacts_documents.last_updated_by IS 'кто последним модифицировал запись';
COMMENT ON COLUMN icredit.contacts_documents.id_contact IS 'Id_row записи заемщика';
COMMENT ON COLUMN icredit.contacts_documents.doc_seria IS 'Серия документа';
COMMENT ON COLUMN icredit.contacts_documents.doc_number IS 'Номер документа';
COMMENT ON COLUMN icredit.contacts_documents.date_doc_given IS 'Дата выдачи';
COMMENT ON COLUMN icredit.contacts_documents.doc_given IS 'Кем выдан';
COMMENT ON COLUMN icredit.contacts_documents.doc_type IS 'Тип документа ';
COMMENT ON COLUMN icredit.contacts_documents.active IS 'Статус документа
- актуальный: 1
- не актуальный: 0
';

COMMENT ON CONSTRAINT pk_contacts_documents ON icredit.contacts_documents IS 'Уникальный идентификатор записи в таблице';
