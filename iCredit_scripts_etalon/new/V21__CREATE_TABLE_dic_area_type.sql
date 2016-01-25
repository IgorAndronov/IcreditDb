-- Table: icredit.dic_area_type 

-- DROP TABLE icredit.dic_area_type;

CREATE TABLE icredit.dic_area_type 
(
    id integer DEFAULT nextval('icredit.seq_dictionaries'::regclass) NOT NULL,-- ���������� ������������� ������ � �������
    value integer NOT NULL, -- �������� ��� �������
    active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0
   
    CONSTRAINT pk_dic_area_type PRIMARY KEY (id), --���������� ������������� ������ � �������
    CONSTRAINT unq_dic_area_type UNIQUE (value) -- ����������� ������������ �������� ������ � �������
)
WITH (
  oids = false
);

ALTER TABLE icredit.dic_area_type
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_area_type IS '���������� ��������';
COMMENT ON COLUMN icredit.dic_area_type.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.dic_area_type.value IS '�������� ��� �������';
COMMENT ON COLUMN icredit.dic_area_type.active IS '������ ������- ����������: 1- �� ����������: 0';

COMMENT ON CONSTRAINT pk_dic_area_type ON icredit.dic_area_type IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_dic_area_type ON icredit.dic_area_type IS '����������� ������������ �������� ������ � �������';