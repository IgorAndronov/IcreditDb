-- Table: icredit.dic_district_type

-- DROP TABLE icredit.dic_district_type;

CREATE TABLE icredit.dic_district_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- ���������� ������������� ������ � �������
  value integer NOT NULL, -- �������� ��� ������
  active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0
  value_parent integer NOT NULL, -- ������������� ������ �������

  CONSTRAINT pk_dic_district_type PRIMARY KEY (id), --���������� ������������� ������ � �������
  CONSTRAINT fk_dic_district_type_to_id_parent FOREIGN KEY (value_parent) --����������� �� ������������� ������ �������'
      REFERENCES icredit.dic_area_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_dic_district_type UNIQUE (value) -- ����������� ������������ �������� ������ � �������
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_district_type
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_district_type
  IS '���������� ������� � ��������� �������';
COMMENT ON COLUMN icredit.dic_district_type.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.dic_district_type.value IS '�������� ��� ������';
COMMENT ON COLUMN icredit.dic_district_type.active IS '������ ������- ����������: 1- �� ����������: 0';
COMMENT ON COLUMN icredit.dic_district_type.value_parent IS '������������� ������ �������';

COMMENT ON CONSTRAINT pk_dic_district_type ON icredit.dic_district_type IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_dic_district_type ON icredit.dic_district_type IS '����������� ������������ �������� ������ � �������';
COMMENT ON CONSTRAINT fk_dic_district_type_to_id_parent ON icredit.dic_district_type IS '����������� �� ������������� ������ �������';