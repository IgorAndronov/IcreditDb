-- Table: icredit.dic_users_status

-- DROP TABLE icredit.dic_users_status;

CREATE TABLE icredit.dic_users_status
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- ���������� ������������� ������ � �������
  value integer NOT NULL, -- ��� ������� ������������
  active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0
  
  CONSTRAINT pk_dic_users_status PRIMARY KEY (id), --���������� ������������� ������ � �������
  CONSTRAINT unq_dic_users_status UNIQUE (value) -- ������� ������������ ��������
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_users_status
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_users_status IS '���������� ����� �������� �������������';
COMMENT ON COLUMN icredit.dic_users_status.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.dic_users_status.value IS '��� ������� ������������';
COMMENT ON COLUMN icredit.dic_users_status.active IS '������ ������- ����������: 1- �� ����������: 0';

COMMENT ON CONSTRAINT unq_dic_users_status ON icredit.dic_users_status IS '������� ������������ ��������';
COMMENT ON CONSTRAINT pk_dic_users_status ON icredit.dic_users_status IS '���������� ������������� ������ � �������';
