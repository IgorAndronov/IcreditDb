-- Table: icredit.dic_citizenship

-- DROP TABLE icredit.dic_citizenship;

CREATE TABLE icredit.dic_citizenship
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- ���������� ������������� ������ � �������
  value character varying(10) NOT NULL, -- ��������� ��� ������
  active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0'
  
  CONSTRAINT pk_dic_citizenship PRIMARY KEY (id), -- ���������� ������������� ������ � �������
  CONSTRAINT unq_dic_citizenship UNIQUE (value) -- ����������� ������������ �������� ������ � �������
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_citizenship
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_citizenship
  IS '���������� �����';
COMMENT ON COLUMN icredit.dic_citizenship.id IS '���������� ������������� ������';
COMMENT ON COLUMN icredit.dic_citizenship.value IS '��������� ��� ������';
COMMENT ON COLUMN icredit.dic_citizenship.active IS '������ ������- ����������: 1- �� ����������: 0';

COMMENT ON CONSTRAINT unq_dic_citizenship ON icredit.dic_citizenship IS '����������� ������������ �������� ������ � �������';
COMMENT ON CONSTRAINT pk_dic_citizenship ON icredit.dic_citizenship IS '���������� ������������� ������ � �������';
