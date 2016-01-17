-- Table: icredit.users

-- DROP TABLE icredit.users;

CREATE TABLE icredit.users
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_users'::regclass), -- ���������� ������������� ������ � �������
  created timestamp without time zone NOT NULL DEFAULT now(), -- ���� ������� ������
  created_by integer NOT NULL, -- ��� ��������� ������
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- ���� ��������� ����������� ������
  last_updated_by numeric(2,0) NOT NULL, -- ��� ��������� ������������� ������
  last_name character varying(30) NOT NULL, -- ������� ������������
  first_name character varying(30) NOT NULL, -- ��� ������������
  midle_name character varying(30) NOT NULL, -- �������� ������������
  login character varying(30) NOT NULL, -- ����� ������������ � �������
  pwd character varying(100) NOT NULL, -- ������ ������������
  status integer NOT NULL DEFAULT 0, -- ������, �� ��������� 0 - �� �������

  CONSTRAINT pk_users PRIMARY KEY (id), --���������� ������������� ������ � �������
  CONSTRAINT unq_users UNIQUE  (login), --����������� ������������ �������� ������ � �������
  CONSTRAINT fk_users_to_status FOREIGN KEY (status)
      REFERENCES icredit.dic_users_status (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.users
  OWNER TO postgres;
COMMENT ON TABLE icredit.users
  IS '������� ������������� �������';
COMMENT ON COLUMN icredit.users.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.users.created IS '���� ������� ������';
COMMENT ON COLUMN icredit.users.created_by IS '��� ��������� ������';
COMMENT ON COLUMN icredit.users.last_updated IS '���� ��������� ����������� ������';
COMMENT ON COLUMN icredit.users.last_updated_by IS '��� ��������� ������������� ������';
COMMENT ON COLUMN icredit.users.last_name IS '������� ������������';
COMMENT ON COLUMN icredit.users.first_name IS '��� ������������';
COMMENT ON COLUMN icredit.users.midle_name IS '�������� ������������';
COMMENT ON COLUMN icredit.users.login IS '����� ������������ � �������';
COMMENT ON COLUMN icredit.users.pwd IS '������ ������������';
COMMENT ON COLUMN icredit.users.status IS '������, �� ��������� 0 - �� �������';

COMMENT ON CONSTRAINT pk_users ON icredit.users IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_users ON icredit.users IS '����������� ������������ �������� ������ � �������';
COMMENT ON CONSTRAINT fk_users_to_status ON icredit.users IS '����������� ������������ �������� dic_users_status';