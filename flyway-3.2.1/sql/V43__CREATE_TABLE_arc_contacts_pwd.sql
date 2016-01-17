-- Table: icredit.arc_contacts_pwd

-- DROP TABLE icredit.arc_contacts_pwd;

CREATE TABLE icredit.arc_contacts_pwd
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_arc_contacts_pwd'::regclass), -- ���������� ������������� ������ � �������
  created timestamp without time zone NOT NULL DEFAULT now(), -- ���� ������� ������
  created_by integer NOT NULL, -- ��� ��������� ������
  id_contact integer NOT NULL, -- ID �������� �� ������� contacts
  id_par character varying(100) NOT NULL, -- �������� , ������� ���������� ��� �������� (����� �� ���������� ������� contacts_pwd ��� �������)
  value_par character varying(100) NOT NULL, -- ������ �������� ���������


  CONSTRAINT pk_arc_contacts_pwd PRIMARY KEY (id),--���������� ������������� ������ � �������
  CONSTRAINT fk_arc_contacts_pwd_to_contacts FOREIGN KEY (id_contact)
      REFERENCES icredit.contacts (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_arc_contacts_pwd_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);


ALTER TABLE icredit.arc_contacts_pwd
  OWNER TO postgres;


COMMENT ON TABLE icredit.arc_contacts_pwd
  IS '�������� �������, ������ �������� ���������� ������ �/��� ����� ��������, ���� ����� � ��� �����. �.�. ��� ������� ��������� ���� ����������';
COMMENT ON COLUMN icredit.arc_contacts_pwd.id IS '���������� ������������� ������';
COMMENT ON COLUMN icredit.arc_contacts_pwd.created IS '���� ������� ������';
COMMENT ON COLUMN icredit.arc_contacts_pwd.created_by IS '��� ��������� ������';
COMMENT ON COLUMN icredit.arc_contacts_pwd.id_contact  IS 'ID �������� �� ������� contacts, ��� �� ����� ���� ����������� ��� ������������ ������';
COMMENT ON COLUMN icredit.arc_contacts_pwd.id_par IS '�������� , ������� ���������� ��� �������� (����� �� ���������� ������� contacts_pwd ��� �������)';
COMMENT ON COLUMN icredit.arc_contacts_pwd.value_par IS '������ ��������';

COMMENT ON CONSTRAINT pk_arc_contacts_pwd ON icredit.arc_contacts_pwd IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT fk_arc_contacts_pwd_to_contacts ON icredit.arc_contacts_pwd IS '����������� ������������ �������� ������ � ������� icredit.contacts ';
COMMENT ON CONSTRAINT fk_arc_contacts_pwd_to_created_by ON icredit.arc_contacts_pwd IS '����������� ������������ �������� ������ � ������� icredit.users';