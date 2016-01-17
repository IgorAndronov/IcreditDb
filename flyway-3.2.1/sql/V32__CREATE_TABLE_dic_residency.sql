-- Table: icredit.dic_residency

-- DROP TABLE icredit.dic_residency;

CREATE TABLE icredit.dic_residency
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- ���������� ������������� ������ � �������
  value character varying(1) NOT NULL, -- �������� ��� ������������� (Y-��������, N-�� ��������)
  active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0

  CONSTRAINT pk_dic_residency PRIMARY KEY (id), --���������� ������������� ������ � �������
  CONSTRAINT unq_dic_residency UNIQUE (value) -- ����������� ������������ �������� ������ � �������
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_residency
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_residency
  IS '���������� �������������';
COMMENT ON COLUMN icredit.dic_residency.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.dic_residency.value IS '�������� ��� ������������� (Y-��������, N-�� ��������)';
COMMENT ON COLUMN icredit.dic_residency.active IS '������ ������- ����������: 1- �� ����������: 0';

COMMENT ON CONSTRAINT pk_dic_residency ON icredit.dic_residency IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_dic_residency ON icredit.dic_residency IS '����������� ������������ �������� ������ � �������';
