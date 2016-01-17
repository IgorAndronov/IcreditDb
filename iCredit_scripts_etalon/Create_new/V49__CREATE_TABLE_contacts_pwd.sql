-- Table: icredit.contacts_pwd

-- DROP TABLE icredit.contacts_pwd;

CREATE TABLE icredit.contacts_pwd
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_pwd'::regclass), -- ���������� ������������� ������
  created timestamp without time zone NOT NULL DEFAULT now(), -- ���� ������� ������
  created_by integer NOT NULL, -- ��� ��������� ������
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- ���� ��������� ����������� ������
  last_updated_by integer NOT NULL, -- ��� ��������� ������������� ������
  id_contact integer NOT NULL, -- ������������� �������
  login_name character varying(50) NOT NULL, -- �����
  pwd character varying(100) NOT NULL, -- ������

  CONSTRAINT pk_contacts_pwd PRIMARY KEY (id),
  CONSTRAINT fk_contacts_pwd_to_contacts FOREIGN KEY (id_contact)
      REFERENCES icredit.contacts (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_contacts_pwd_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_pwd_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_pwd
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_pwd
  IS '�������, ������ �������� ���������� ����� � ����� ��������';
COMMENT ON COLUMN icredit.contacts_pwd.id IS '���������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_pwd.created IS '���� ������� ������';
COMMENT ON COLUMN icredit.contacts_pwd.created_by IS '��� ��������� ������';
COMMENT ON COLUMN icredit.contacts_pwd.last_updated IS '���� ��������� ����������� ������';
COMMENT ON COLUMN icredit.contacts_pwd.last_updated_by IS '��� ��������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_pwd.id_contact IS '������������� �������';
COMMENT ON COLUMN icredit.contacts_pwd.login_name IS '�����';
COMMENT ON COLUMN icredit.contacts_pwd.pwd IS '������';
