-- Table: icredit.dic_education_type

-- DROP TABLE icredit.dic_education_type;

CREATE TABLE icredit.dic_education_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- ���������� ������������� ������ � �������
  value integer NOT NULL, -- �������� ��� ��������� ������� �����������
  active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0

  CONSTRAINT pk_dic_education_type PRIMARY KEY (id), --���������� ������������� ������ � �������
  CONSTRAINT unq_dic_education_type UNIQUE (value) -- ����������� ������������ �������� ������ � �������
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_education_type
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_education_type
  IS '���������� �����(�������) ����������� ����������';
COMMENT ON COLUMN icredit.dic_education_type.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.dic_education_type.value IS '�������� ��� ��������� ������� �����������';
COMMENT ON COLUMN icredit.dic_education_type.active IS '������ ������- ����������: 1- �� ����������: 0';

COMMENT ON CONSTRAINT pk_dic_education_type ON icredit.dic_education_type IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_dic_education_type ON icredit.dic_education_type IS '����������� ������������ �������� ������ � �������';