-- Table: icredit.contacts_phones

-- DROP TABLE icredit.contacts_phones;

CREATE TABLE icredit.contacts_phones
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_phones'::regclass), -- ���������� ������������� ������
  created timestamp without time zone NOT NULL DEFAULT now(), -- ���� ������� ������
  created_by integer NOT NULL, -- ��� ��������� ������
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- ���� ��������� ����������� ������
  last_updated_by integer NOT NULL, -- ��� ��������� ������������� ������
  id_contact integer NOT NULL, -- Id_row ������ ��������
  phone_number character varying(10) NOT NULL, -- ����� �������� ��� ���� ������...
  phone_type integer NOT NULL, -- ��� ��������
  active integer NOT NULL, -- ������ ���������...
  use_for_sms boolean NOT NULL DEFAULT false, -- ������������ ��� ��� ����������� � ��.
  CONSTRAINT pk_contacts_phones PRIMARY KEY (id),
  CONSTRAINT fk_contacts_phone_to_pfone_type FOREIGN KEY (phone_type)
      REFERENCES icredit.dic_phone_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_phones_to_active_flag FOREIGN KEY (active)
      REFERENCES icredit.dic_active_flag (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_phones_to_contacts FOREIGN KEY (id_contact)
      REFERENCES icredit.contacts (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_contacts_phones_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_phones_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_phones
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_phones
  IS '�������� ���������';
COMMENT ON COLUMN icredit.contacts_phones.id IS '���������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_phones.created IS '���� ������� ������';
COMMENT ON COLUMN icredit.contacts_phones.created_by IS '��� ��������� ������';
COMMENT ON COLUMN icredit.contacts_phones.last_updated IS '���� ��������� ����������� ������';
COMMENT ON COLUMN icredit.contacts_phones.last_updated_by IS '��� ��������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_phones.id_contact IS 'Id_row ������ ��������';
COMMENT ON COLUMN icredit.contacts_phones.phone_number IS '����� �������� ��� ���� ������
(0�� ��� �� ��)
';
COMMENT ON COLUMN icredit.contacts_phones.phone_type IS '��� �������� ';
COMMENT ON COLUMN icredit.contacts_phones.active IS '������ ���������
- ����������: 1
- �� ����������: 0
';
COMMENT ON COLUMN icredit.contacts_phones.use_for_sms IS '������������ ��� ��� ����������� � ��.';
