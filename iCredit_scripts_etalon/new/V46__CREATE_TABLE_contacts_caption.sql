
-- Table: icredit.contacts_caption

-- DROP TABLE icredit.contacts_caption;

CREATE TABLE icredit.contacts_caption
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_caption'::regclass), -- ���������� ������������� ������ � �������
  created timestamp without time zone NOT NULL DEFAULT now(), -- ���� ������� ������
  created_by integer NOT NULL DEFAULT 1, -- ��� ��������� ������
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- ���� ��������� ����������� ������
  last_updated_by integer NOT NULL DEFAULT 1, -- ��� ��������� ������������� ������
  table_name character varying(100) NOT NULL, --�������� ������� �� ����������
  field_name character varying(100) NOT NULL, -- �������� ���� �� ����������
  caption_name character varying(30) NOT NULL, -- ������� �������� ����
  localisation character varying(5) NOT NULL, -- ������

  CONSTRAINT pk_contacts_caption PRIMARY KEY (id), --���������� ������������� ������ � �������
  CONSTRAINT fk_contacts_caption_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_caption_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_caption_to_localisation FOREIGN KEY (localisation)
      REFERENCES icredit.dic_localisation (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_contacts_caption UNIQUE (table_name,field_name, localisation)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_caption
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_caption
  IS '������������ �����, �� ��������, ��� ������ �� �����';
COMMENT ON COLUMN icredit.contacts_caption.id IS '���������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_caption.created IS '���� ������� ������';
COMMENT ON COLUMN icredit.contacts_caption.created_by IS '��� ��������� ������';
COMMENT ON COLUMN icredit.contacts_caption.last_updated IS '���� ��������� ����������� ������';
COMMENT ON COLUMN icredit.contacts_caption.last_updated_by IS '��� ��������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_caption.field_name IS '�������� ���� �� ����������';
COMMENT ON COLUMN icredit.contacts_caption.caption_name IS '������� �������� ����';
COMMENT ON COLUMN icredit.contacts_caption.localisation IS '������';
COMMENT ON COLUMN icredit.contacts_caption.table_name IS '�������� ������� �� ����������';

COMMENT ON CONSTRAINT pk_contacts_caption ON icredit.contacts_caption IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_contacts_caption ON icredit.contacts_caption IS '����������� ������������ �������� ������ � �������';