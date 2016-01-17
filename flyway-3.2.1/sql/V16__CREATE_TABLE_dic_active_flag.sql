-- Table: icredit.dic_active_flag

-- DROP TABLE icredit.dic_active_flag;

CREATE TABLE icredit.dic_active_flag
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- ���������� ������������� ������
  value integer NOT NULL,             -- �������� ��������� active_flag. ������ ��������� ���� ������ ��� ��������- ����������: 1- �� ����������: 0';
  active integer NOT NULL DEFAULT 1,  -- ������� ���������� ������ � ����������� (������ ���� ���������, ��������� ��� ���������� �������� �������������)

  CONSTRAINT pk_dic_active_flag PRIMARY KEY (id), --���������� ������������� ������ � �������
  CONSTRAINT unq_dic_active_flag UNIQUE (value)   -- ����������� ������������ �������� ������ � �������
)
WITH (
  OIDS=FALSE
);

ALTER TABLE icredit.dic_active_flag
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_active_flag  IS '���������� �������� ���������� ������';
COMMENT ON COLUMN icredit.dic_active_flag.id IS '���������� ������������� ������';
COMMENT ON COLUMN icredit.dic_active_flag.value IS '�������� ��������� active_flag. ������ ��������� ���� ������ ��� �������� ����������: 1- �� ����������: 0';
COMMENT ON COLUMN icredit.dic_active_flag.active IS '������� ���������� ������ � ����������� (������ ���� ���������, ��������� ��� ���������� �������� �������������)';

COMMENT ON CONSTRAINT pk_dic_active_flag ON icredit.dic_active_flag IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_dic_active_flag ON icredit.dic_active_flag IS '����������� ������������ �������� ������ � �������';
