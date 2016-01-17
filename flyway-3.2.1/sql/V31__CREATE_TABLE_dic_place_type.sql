-- Table: icredit.dic_place_type

-- DROP TABLE icredit.dic_place_type;

CREATE TABLE icredit.dic_place_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- ���������� ������������� ������ � �������
  value integer NOT NULL, -- �������� ��������� ���� ������
  active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0

  CONSTRAINT pk_dic_place_type PRIMARY KEY (id), -- ���������� ������������� ������ � �������
  CONSTRAINT unq_dic_place_type UNIQUE (value) -- ������� ������������ ��������
)
WITH (
  OIDS=FALSE
);

ALTER TABLE icredit.dic_place_type
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_place_type
  IS '���������� ����� �������';

COMMENT ON COLUMN icredit.dic_place_type.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.dic_place_type.value IS '�������� ��������� ���� ������';
COMMENT ON COLUMN icredit.dic_place_type.active IS '������ ������- ����������: 1- �� ����������: 0';

COMMENT ON CONSTRAINT unq_dic_place_type ON icredit.dic_place_type IS '������� ������������ ��������';
COMMENT ON CONSTRAINT pk_dic_place_type ON icredit.dic_place_type IS '���������� ������������� ������ � �������';

