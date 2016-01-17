-- Table: icredit.dic_values

-- DROP TABLE icredit.dic_values;

CREATE TABLE icredit.dic_values
(
  id integer NOT NULL, -- ���������� ������������� ������, ������� ����� ��������������� ������ � ����� �� ������������ ��� ������ �� ������������ ������ ����������� icredit.dic_*, � ������ ��������� ������ ������������
  name character varying(60) NOT NULL, -- ������������ ��������� � ��������������� ������, ������� ����� ������� �� �����
  comment character varying(1000) NOT NULL, -- ��� ������ � ����
  localisation character varying(5) NOT NULL, -- ������, �������� ����������� icredit.dic_localisation

  CONSTRAINT unq_dic_education_local UNIQUE (id, localisation),
  CONSTRAINT fk_dic_education_local_to_localisation FOREIGN KEY (localisation)
      REFERENCES icredit.dic_localisation (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_values
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_values
  IS '������� ��� ��������� �������� ���� ������������, � ������� ��������� �������� � ������ �����������';

COMMENT ON COLUMN icredit.dic_values.id IS '���������� ������������� ������, ������� ����� ��������������� ������ � ����� �� ������������ ��� ������ �� ������������ ������ ����������� icredit.dic_*, � ������ ��������� ������ ������������';
COMMENT ON COLUMN icredit.dic_values.name IS '������������ ��������� � ��������������� ������, ������� ����� ������� �� �����';
COMMENT ON COLUMN icredit.dic_values.comment IS '��� ������ � ����';
COMMENT ON COLUMN icredit.dic_values.localisation IS '������, �������� ����������� icredit.dic_localisation';

COMMENT ON CONSTRAINT fk_dic_education_local_to_localisation ON icredit.dic_values IS '����������� �� ������� � ����������� �� �������� ���������� �����������';
COMMENT ON CONSTRAINT unq_dic_education_local ON icredit.dic_values IS '����������� ������������ �������� ������ � �������';