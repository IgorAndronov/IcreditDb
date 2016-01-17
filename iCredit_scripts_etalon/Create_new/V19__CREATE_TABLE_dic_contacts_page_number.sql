-- Table: icredit.dic_contacts_page_number

-- DROP TABLE icredit.dic_contacts_page_number;

CREATE TABLE icredit.dic_contacts_page_number
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- ���������� ������������� ������ � �������
  value integer NOT NULL, -- ����� �������� � ������ �������� ��� ���������� ������
  active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0

  CONSTRAINT pk_dic_contacts_page_number PRIMARY KEY (id), -- ���������� ������������� ������ � �������
  CONSTRAINT unq_dic_contacts_page_number UNIQUE (value) -- ����������� ������������ �������� ������ � �������
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_contacts_page_number
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_contacts_page_number
  IS '���������� ������� ������������ ������ � ������ �������� ';
COMMENT ON COLUMN icredit.dic_contacts_page_number.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.dic_contacts_page_number.value IS '����� �������� � ������ �������� ��� ���������� ������';
COMMENT ON COLUMN icredit.dic_contacts_page_number.active IS '������ ������- ����������: 1- �� ����������: 0';

COMMENT ON CONSTRAINT pk_dic_contacts_page_number ON icredit.dic_contacts_page_number IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_dic_contacts_page_number ON icredit.dic_contacts_page_number IS '����������� ������������ �������� ������ � �������';
