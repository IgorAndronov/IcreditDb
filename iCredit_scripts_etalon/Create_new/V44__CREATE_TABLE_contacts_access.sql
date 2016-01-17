-- Table: icredit.contacts_access

-- DROP TABLE icredit.contacts_access;

CREATE TABLE icredit.contacts_access
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_access'::regclass), -- ���������� ������������� ������ � �������
  created timestamp without time zone NOT NULL DEFAULT now(), -- ���� ������� ������
  created_by integer NOT NULL DEFAULT 1, -- ��� ��������� ������
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- ���� ��������� ����������� ������
  last_updated_by integer NOT NULL DEFAULT 1, -- ��� ��������� ������������� ������
  id_role integer NOT NULL, -- ����, ��� ������� ��������� ������ ����������
  table_name character varying(100) NOT NULL, -- ������������ �������, � ������� ����������� ����
  field_name character varying(100) NOT NULL, -- �� ���� � ������� contacts_caption � ������ � �������
  page_number integer NOT NULL DEFAULT 1, -- ����� ��������, �� ������� ����� ������� ��������
  group_number integer NOT NULL, -- ��� �����������
  group_sorting integer NOT NULL DEFAULT 1, -- ������� ���������� ������
  sorting integer NOT NULL DEFAULT 1, -- ������� ���������� �� ��������
  field_view_type character varying(10) NOT NULL DEFAULT 0, -- ��������, ������� ���������� ��� ������� ��� ����� � ������� ��������. �������� ����������, ���������� ������, ������ �������������� ������
  visible boolean NOT NULL DEFAULT false, -- ��������� ���� �� ������
  ro boolean NOT NULL DEFAULT true, -- ����������� � ������ �� ������

  CONSTRAINT pk_contacts_access PRIMARY KEY (id), -- ���������� ������������� ������ � �������
  CONSTRAINT fk_contacts_access_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_access_to_group_number FOREIGN KEY (group_number)
      REFERENCES icredit.dic_name_contacts_block (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_access_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_access_to_list_type FOREIGN KEY (field_view_type)
      REFERENCES icredit.dic_field_view_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_contacts_access UNIQUE (id_role, field_name)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_access
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_access
  IS '������� ���������� ���������� � ���������� ������� ��� ������� � ������ ��������';
COMMENT ON COLUMN icredit.contacts_access.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.contacts_access.created IS '���� ������� ������';
COMMENT ON COLUMN icredit.contacts_access.created_by IS '��� ��������� ������';
COMMENT ON COLUMN icredit.contacts_access.last_updated IS '���� ��������� ����������� ������';
COMMENT ON COLUMN icredit.contacts_access.last_updated_by IS '��� ��������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_access.id_role IS '����, ��� ������� ��������� ������ ����������';
COMMENT ON COLUMN icredit.contacts_access.table_name IS '������������ �������, � ������� ����������� ����';
COMMENT ON COLUMN icredit.contacts_access.field_name IS '�� ���� � ������� contacts_caption � ������ � �������';
COMMENT ON COLUMN icredit.contacts_access.page_number IS '����� ��������, �� ������� ����� ������� ��������';
COMMENT ON COLUMN icredit.contacts_access.group_number IS '��� �����������';
COMMENT ON COLUMN icredit.contacts_access.group_sorting IS '������� ���������� ������';
COMMENT ON COLUMN icredit.contacts_access.sorting IS '������� ���������� �� ��������';
COMMENT ON COLUMN icredit.contacts_access.field_view_type IS '��������, ������� ���������� ��� ������� ��� ����� � ������� ��������. �������� ����������, ���������� ������, ������ �������������� ������';
COMMENT ON COLUMN icredit.contacts_access.visible IS '��������� ���� �� ������';
COMMENT ON COLUMN icredit.contacts_access.ro IS '����������� � ������ �� ������';
