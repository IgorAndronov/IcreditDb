-- Table: icredit.contacts

-- DROP TABLE icredit.contacts;

CREATE TABLE icredit.contacts
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts'::regclass), -- ���������� ������������� ������ � �������
  created timestamp without time zone NOT NULL DEFAULT now(), -- ���� ������� ������
  created_by integer NOT NULL, -- ��� ��������� ������
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- ���� ��������� ����������� ������
  last_updated_by integer NOT NULL, -- ��� ��������� ������������� ������
  last_name character varying(30) NOT NULL, -- ������� ��������
  first_name character varying(30) NOT NULL, -- ��� ��������
  midle_name character varying(30) NOT NULL, -- �������� ��������
  residency character varying(1) NOT NULL, -- �������������
  income_monthly integer NOT NULL, -- �������� �����.
  income_family integer NOT NULL DEFAULT 0, -- �������� ����� �����.
  employment_type integer NOT NULL, -- ��� ���������.
  work_place character varying(128) NOT NULL, -- ����� ������.
  work_position character varying(128) NOT NULL, -- ���������.
  sex integer NOT NULL, -- ��� ��������
  education integer NOT NULL, -- �����������
  date_birsday date NOT NULL, -- ���� ��������
  family_count integer NOT NULL, -- ����������� ������ �����
  id_tax character varying(10) NOT NULL, -- ��������� ���
  married boolean NOT NULL DEFAULT false, -- ����� �� �����
  citizenship character varying(10) NOT NULL, -- ��������� ��� ������ ���������� ��������
  localisation character varying(5) DEFAULT '���'::character varying, -- ��������� ��������� ���� �������

  CONSTRAINT pk_contacts PRIMARY KEY (id), --���������� ������������� ������ � �������
  CONSTRAINT contacts_fk FOREIGN KEY (localisation)
      REFERENCES icredit.dic_localisation (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_dic_citizenship FOREIGN KEY (citizenship)
      REFERENCES icredit.dic_citizenship (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_dic_education_type FOREIGN KEY (education)
      REFERENCES icredit.dic_education_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_dic_married_type FOREIGN KEY (married)
      REFERENCES icredit.dic_married_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_dic_sex_type FOREIGN KEY (sex)
      REFERENCES icredit.dic_sex_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_employment_type FOREIGN KEY (employment_type)
      REFERENCES icredit.dic_employment_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_residency FOREIGN KEY (residency)
      REFERENCES icredit.dic_residency (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_contacts_id_tax UNIQUE (id_tax)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts
  IS '�������� ������� � ����������� �������';
COMMENT ON COLUMN icredit.contacts.id IS '���������� ������������� ������';
COMMENT ON COLUMN icredit.contacts.created IS '���� ������� ������';
COMMENT ON COLUMN icredit.contacts.created_by IS '��� ��������� ������';
COMMENT ON COLUMN icredit.contacts.last_updated IS '���� ��������� ����������� ������';
COMMENT ON COLUMN icredit.contacts.last_updated_by IS '��� ��������� ������������� ������';
COMMENT ON COLUMN icredit.contacts.last_name IS '������� ��������';
COMMENT ON COLUMN icredit.contacts.first_name IS '��� ��������';
COMMENT ON COLUMN icredit.contacts.midle_name IS '�������� ��������';
COMMENT ON COLUMN icredit.contacts.income_monthly IS '�������� �����.';
COMMENT ON COLUMN icredit.contacts.income_family IS '�������� ����� �����.';
COMMENT ON COLUMN icredit.contacts.employment_type IS '��� ���������.';
COMMENT ON COLUMN icredit.contacts.work_place IS '����� ������.';
COMMENT ON COLUMN icredit.contacts.work_position IS '���������.';
COMMENT ON COLUMN icredit.contacts.sex IS '��� ��������';
COMMENT ON COLUMN icredit.contacts.residency  IS '�������������';
COMMENT ON COLUMN icredit.contacts.education IS '�����������';
COMMENT ON COLUMN icredit.contacts.date_birsday IS '���� ��������';
COMMENT ON COLUMN icredit.contacts.family_count IS '����������� ������ �����';
COMMENT ON COLUMN icredit.contacts.id_tax IS '��������� ���';
COMMENT ON COLUMN icredit.contacts.married IS '����� �� �����';
COMMENT ON COLUMN icredit.contacts.citizenship IS '��������� ��� ������ ���������� ��������';
COMMENT ON COLUMN icredit.contacts.localisation IS '��������� ��������� ���� �������';

COMMENT ON CONSTRAINT pk_contacts ON icredit.contacts IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT unq_contacts_id_tax ON icredit.contacts IS '����������� ������������ �������� ������ � �������';