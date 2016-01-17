-- Table: icredit.dic_localisation

-- DROP TABLE icredit.dic_localisation;

CREATE TABLE icredit.dic_localisation
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- ���������� ������������� ������ � �������
  name character varying(50) NOT NULL, -- ������������ ������
  value character varying(5) NOT NULL, -- �������� ������
  comments character varying(1000) NOT NULL, -- �����������, ������� ����� ���� ������� � �����
  active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0

  CONSTRAINT pk_dic_localisation PRIMARY KEY (id), --���������� ������������� ������ � �������
  CONSTRAINT unq_dic_localisation UNIQUE (value) -- ������� ������������ ��������
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_localisation
  OWNER TO postgres;

COMMENT ON COLUMN icredit.dic_localisation.id IS '���������� ������������� ������';
COMMENT ON COLUMN icredit.dic_localisation.name IS '������������ ������';
COMMENT ON COLUMN icredit.dic_localisation.value IS '�������� ������';
COMMENT ON COLUMN icredit.dic_localisation.comments IS '�����������, ������� ����� ���� ������� � �����';
COMMENT ON COLUMN icredit.dic_localisation.active IS '������ ������- ����������: 1- �� ����������: 0';

COMMENT ON CONSTRAINT pk_dic_localisation ON icredit.dic_localisation IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_dic_localisation ON icredit.dic_localisation IS '����������� ������������ �������� ������ � �������';