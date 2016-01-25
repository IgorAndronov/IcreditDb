-- Table: icredit.role

-- DROP TABLE icredit.role;

CREATE TABLE icredit.role
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_role'::regclass), -- ���������� ������������� ������ � �������
  created timestamp without time zone NOT NULL DEFAULT now(), -- ���� ������� ������
  created_by integer NOT NULL, -- ��� ��������� ������
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- ���� ��������� ����������� ������
  last_updated_by integer NOT NULL, -- ��� ��������� ������������� ������
  role_name character varying(30) NOT NULL, -- �������� ����
  role_caption character varying(1000) NOT NULL, -- �������� ����
  active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0


  CONSTRAINT pk_role PRIMARY KEY (id), --���������� ������������� ������ � �������
  CONSTRAINT fk_role_to_active FOREIGN KEY (active)
      REFERENCES icredit.dic_role_status (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION


)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.role
  OWNER TO postgres;
COMMENT ON TABLE icredit.role
  IS '�������, ���������� �������� ����� ������������� �������';
COMMENT ON COLUMN icredit.role.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.role.created IS '���� ������� ������';
COMMENT ON COLUMN icredit.role.created_by IS '��� ��������� ������';
COMMENT ON COLUMN icredit.role.last_updated IS '���� ��������� ����������� ������';
COMMENT ON COLUMN icredit.role.last_updated_by IS '��� ��������� ������������� ������';
COMMENT ON COLUMN icredit.role.role_name IS '�������� ����';
COMMENT ON COLUMN icredit.role.role_caption IS '�������� ����';

COMMENT ON CONSTRAINT pk_role ON icredit.role IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT fk_role_to_active ON icredit.role IS '������ �� ���������� icredit.dic_role_status';