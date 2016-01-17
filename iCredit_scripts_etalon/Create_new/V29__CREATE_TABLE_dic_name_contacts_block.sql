-- Table: icredit.dic_name_contacts_block

-- DROP TABLE icredit.dic_name_contacts_block;

CREATE TABLE icredit.dic_name_contacts_block
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- ���������� ������������� ������ � �������
  value integer NOT NULL, -- ����� ����� � ������ �������� ��� ���������� ������
  active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0
  mandatory boolean NOT NULL DEFAULT true, -- �������� ���������-�������������� �������
  repeated boolean DEFAULT true, -- �������� ����� - �������������
  CONSTRAINT pk_dic_name_contacts_block PRIMARY KEY (id), -- ���������� ������������� ������ � �������
  CONSTRAINT unq_dic_name_contacts_block UNIQUE (value) -- ����������� ������������ �������� ������ � �������
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_name_contacts_block
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_name_contacts_block
  IS '���������� ������������ ������, �� ������� ������� �������� � ����������� �������';
COMMENT ON COLUMN icredit.dic_name_contacts_block.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.dic_name_contacts_block.value IS '����� ����� � ������ �������� ��� ���������� ������';
COMMENT ON COLUMN icredit.dic_name_contacts_block.active IS '������ ������- ����������: 1- �� ����������: 0';
COMMENT ON COLUMN icredit.dic_name_contacts_block.mandatory IS '�������� ���������-�������������� �������, ��� ������, ��� ������ ����������� ������ ���� ���� ���������, ������ ���� ���.';
COMMENT ON COLUMN icredit.dic_name_contacts_block.repeated IS '�������� ����� - �������������, ��� ������, ��� ������ ������ ����� ���� ������ ������';

COMMENT ON CONSTRAINT pk_dic_name_contacts_block ON icredit.dic_name_contacts_block IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_dic_name_contacts_block ON icredit.dic_name_contacts_block IS '����������� ������������ �������� ������ � �������';