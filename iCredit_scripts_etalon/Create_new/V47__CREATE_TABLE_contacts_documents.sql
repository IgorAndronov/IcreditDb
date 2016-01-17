-- Table: icredit.contacts_documents

-- DROP TABLE icredit.contacts_documents;

CREATE TABLE icredit.contacts_documents
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_documents'::regclass), -- ���������� ������������� ������ � �������
  created timestamp without time zone NOT NULL DEFAULT now(), -- ���� ������� ������
  created_by integer NOT NULL, -- ��� ��������� ������
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- ���� ��������� ����������� ������
  last_updated_by integer NOT NULL, -- ��� ��������� ������������� ������
  id_contact integer NOT NULL, -- Id_row ������ ��������
  doc_seria character varying(5), -- ����� ���������
  doc_number numeric(8,0) NOT NULL, -- ����� ���������
  date_doc_given date NOT NULL, -- ���� ������
  doc_given character varying(100), -- ��� �����
  doc_type integer NOT NULL, -- ��� ���������
  active integer NOT NULL, -- ������ ���������...

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
  IS '��������� ���������';
COMMENT ON COLUMN icredit.contacts_documents.id IS '���������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_documents.created IS '���� ������� ������';
COMMENT ON COLUMN icredit.contacts_documents.created_by IS '��� ��������� ������';
COMMENT ON COLUMN icredit.contacts_documents.last_updated IS '���� ��������� ����������� ������';
COMMENT ON COLUMN icredit.contacts_documents.last_updated_by IS '��� ��������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_documents.id_contact IS 'Id_row ������ ��������';
COMMENT ON COLUMN icredit.contacts_documents.doc_seria IS '����� ���������';
COMMENT ON COLUMN icredit.contacts_documents.doc_number IS '����� ���������';
COMMENT ON COLUMN icredit.contacts_documents.date_doc_given IS '���� ������';
COMMENT ON COLUMN icredit.contacts_documents.doc_given IS '��� �����';
COMMENT ON COLUMN icredit.contacts_documents.doc_type IS '��� ��������� ';
COMMENT ON COLUMN icredit.contacts_documents.active IS '������ ���������
- ����������: 1
- �� ����������: 0
';

COMMENT ON CONSTRAINT pk_contacts_documents ON icredit.contacts_documents IS '���������� ������������� ������ � �������';
