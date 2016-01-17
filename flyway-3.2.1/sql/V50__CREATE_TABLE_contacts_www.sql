-- Table: icredit.contacts_www

-- DROP TABLE icredit.contacts_www;

CREATE TABLE icredit.contacts_www
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_www'::regclass), -- ���������� ������������� ������
  created timestamp without time zone NOT NULL DEFAULT now(), -- ���� ������� ������
  created_by integer NOT NULL, -- ��� ��������� ������
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- ���� ��������� ����������� ������
  last_updated_by integer NOT NULL, -- ��� ��������� ������������� ������
  id_contact integer NOT NULL, -- Id_row ������ ��������
  name character varying(100) NOT NULL, -- �����
  name_type integer NOT NULL, -- ��� ������
  active integer NOT NULL DEFAULT 1, -- ������ ���������...
  use_for_correspondence boolean NOT NULL DEFAULT false, -- ������������ ��� ���������������
  CONSTRAINT pk_contacts_www PRIMARY KEY (id),
  CONSTRAINT fk_contacts_www_to_contacts FOREIGN KEY (id_contact)
      REFERENCES icredit.contacts (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_contacts_www_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_www_to_dic_active_flag FOREIGN KEY (active)
      REFERENCES icredit.dic_active_flag (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_www_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_www_to_www_type FOREIGN KEY (name_type)
      REFERENCES icredit.dic_www_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_www
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_www
  IS '�������� ������ � ������ � ��������';
COMMENT ON COLUMN icredit.contacts_www.id IS '���������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_www.created IS '���� ������� ������';
COMMENT ON COLUMN icredit.contacts_www.created_by IS '��� ��������� ������';
COMMENT ON COLUMN icredit.contacts_www.last_updated IS '���� ��������� ����������� ������';
COMMENT ON COLUMN icredit.contacts_www.last_updated_by IS '��� ��������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_www.id_contact IS 'Id_row ������ ��������';
COMMENT ON COLUMN icredit.contacts_www.name IS '�����';
COMMENT ON COLUMN icredit.contacts_www.name_type IS '��� ������ ';
COMMENT ON COLUMN icredit.contacts_www.active IS '������ ���������
- ����������: 1
- �� ����������: 0';
COMMENT ON COLUMN icredit.contacts_www.use_for_correspondence IS '������������ ��� ���������������';
