-- Table: icredit.system_parameters

-- DROP TABLE icredit.system_parameters;

CREATE TABLE icredit.system_parameters
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_system_parameters'::regclass), -- ���������� ������������� ������ � �������
  par_name character varying(50) NOT NULL, -- ������������ ��������� ����������
  value character varying(100) NOT NULL, -- �������� ������
  comment character varying(1000) NOT NULL, -- ��������
  type_par character varying(5) NOT NULL, -- ��� ���������
  active integer NOT NULL DEFAULT 1, -- ������ ������- ����������: 1- �� ����������: 0

  CONSTRAINT pk_system_parameters PRIMARY KEY (id), --���������� ������������� ������ � �������
  CONSTRAINT fk_system_parameters_to_type_par FOREIGN KEY (type_par)
      REFERENCES icredit.dic_field_view_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_system_parameters UNIQUE (par_name) -- ������� ������������ ��������
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.system_parameters
  OWNER TO postgres;

COMMENT ON COLUMN icredit.system_parameters.id IS '���������� ������������� ������ � �������';
COMMENT ON COLUMN icredit.system_parameters.par_name IS '������������ ��������� ����������';
COMMENT ON COLUMN icredit.system_parameters.value IS '�������� ������';
COMMENT ON COLUMN icredit.system_parameters.comment IS '��������';
COMMENT ON COLUMN icredit.system_parameters.type_par IS '��� ���������';
COMMENT ON COLUMN icredit.system_parameters.active IS '������ ������- ����������: 1- �� ����������: 0';

COMMENT ON CONSTRAINT unq_system_parameters ON icredit.system_parameters IS '������� ������������ ��������';

