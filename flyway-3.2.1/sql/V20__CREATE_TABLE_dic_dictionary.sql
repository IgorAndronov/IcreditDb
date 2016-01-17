-- Table: icredit.dic_dictionary

-- DROP TABLE icredit.dic_dictionary;

CREATE TABLE icredit.dic_dictionary
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- ���������� ������������� ������ � �������
  value character varying(30) NOT NULL, -- ������������ �����������
  active integer NOT NULL DEFAULT 1, --������ ������- ����������: 1- �� ����������: 0

  CONSTRAINT pk_dic_dictionary PRIMARY KEY (id),
  CONSTRAINT unq_dic_dictionary UNIQUE (value)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_dictionary
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_dictionary
  IS '���������� ������������, ������� ����� � ����� ��������� ����� ��������� icredit.f_dictionary_add ';
COMMENT ON COLUMN icredit.dic_dictionary.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.dic_dictionary.value IS '������������ �����������';
COMMENT ON COLUMN icredit.dic_dictionary.active IS '������ ������- ����������: 1- �� ����������: 0';


COMMENT ON CONSTRAINT pk_dic_dictionary ON icredit.dic_dictionary IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_dic_dictionary ON icredit.dic_dictionary IS '����������� ������������ �������� ������ � �������';