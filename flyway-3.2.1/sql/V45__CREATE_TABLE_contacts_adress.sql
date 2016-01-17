-- Table: icredit.contacts_adress

-- DROP TABLE icredit.contacts_adress;

CREATE TABLE icredit.contacts_adress
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_adress'::regclass), -- ���������� ������������� ������
  created timestamp without time zone NOT NULL DEFAULT now(), -- ���� ������� ������
  created_by integer NOT NULL, -- ��� ��������� ������
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- ���� ��������� ����������� ������
  last_updated_by integer NOT NULL, -- ��� ��������� ������������� ������
  id_contact integer NOT NULL, -- Id_row ������ �������� �� t_contacts
  area integer NOT NULL, -- ������� ��������
  district integer NOT NULL, -- ����� ��������
  city character varying(30) NOT NULL, -- ���������� ����� ��������
  post_index numeric(6,0) NOT NULL, -- ������ ��������
  street_type integer NOT NULL, -- ��� �����
  street character varying(30) NOT NULL, -- �������� �����
  house character varying(10) NOT NULL, -- ����� ����
  corp character varying(5), -- ����� �������
  flat character varying(4), -- ����� ��������
  address_type integer NOT NULL, -- ��� ������
  active integer NOT NULL, -- ������ ���������...
  city_type integer NOT NULL, -- ��� ����������� ������

  CONSTRAINT pk_contacts_adress PRIMARY KEY (id),
  CONSTRAINT fk_contacts_adress_to_active_flag FOREIGN KEY (active)
      REFERENCES icredit.dic_active_flag (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_address_type FOREIGN KEY (address_type)
      REFERENCES icredit.dic_address_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_area FOREIGN KEY (area)
      REFERENCES icredit.dic_area_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_contacts FOREIGN KEY (id_contact)
      REFERENCES icredit.contacts (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_contacts_adress_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_cyty_type FOREIGN KEY (city_type)
      REFERENCES icredit.dic_place_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION, -- ������� ���� �� ���� ���������� �������
  CONSTRAINT fk_contacts_adress_to_district FOREIGN KEY (district)
      REFERENCES icredit.dic_district_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_street_type FOREIGN KEY (street_type)
      REFERENCES icredit.dic_street_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_adress
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_adress
  IS '������ ���������';
COMMENT ON COLUMN icredit.contacts_adress.id IS '���������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_adress.created IS '���� ������� ������';
COMMENT ON COLUMN icredit.contacts_adress.created_by IS '��� ��������� ������';
COMMENT ON COLUMN icredit.contacts_adress.last_updated IS '���� ��������� ����������� ������';
COMMENT ON COLUMN icredit.contacts_adress.last_updated_by IS '��� ��������� ������������� ������';
COMMENT ON COLUMN icredit.contacts_adress.id_contact IS 'Id_row ������ �������� �� t_contacts ';
COMMENT ON COLUMN icredit.contacts_adress.area IS '������� ��������';
COMMENT ON COLUMN icredit.contacts_adress.district IS '����� ��������';
COMMENT ON COLUMN icredit.contacts_adress.city IS '���������� ����� ��������';
COMMENT ON COLUMN icredit.contacts_adress.post_index IS '������ ��������';
COMMENT ON COLUMN icredit.contacts_adress.street_type IS '��� �����';
COMMENT ON COLUMN icredit.contacts_adress.street IS '�������� �����';
COMMENT ON COLUMN icredit.contacts_adress.house IS '����� ����';
COMMENT ON COLUMN icredit.contacts_adress.corp IS '����� �������';
COMMENT ON COLUMN icredit.contacts_adress.flat IS '����� ��������';
COMMENT ON COLUMN icredit.contacts_adress.address_type IS '��� ������';
COMMENT ON COLUMN icredit.contacts_adress.active IS '������ ���������
- ����������: 1
- �� ����������: 0
';
COMMENT ON COLUMN icredit.contacts_adress.city_type IS '��� ����������� ������';

COMMENT ON CONSTRAINT pk_contacts_adress ON icredit.contacts_adress IS '���������� ������������� ������ � �������';
COMMENT ON CONSTRAINT fk_contacts_adress_to_cyty_type ON icredit.contacts_adress IS '������� ���� �� ���� ���������� ������� icredit.dic_place_type';
COMMENT ON CONSTRAINT fk_contacts_adress_to_active_flag ON icredit.contacts_adress IS '������� ���� �� icredit.dic_active_flag ';
COMMENT ON CONSTRAINT fk_contacts_adress_to_address_type ON icredit.contacts_adress IS '������� ���� �� ���� ������� icredit.dic_address_type ';
COMMENT ON CONSTRAINT fk_contacts_adress_to_area ON icredit.contacts_adress IS '������� ���� �� ���� �������� icredit.dic_area_type icredit.dic_area_type';
COMMENT ON CONSTRAINT fk_contacts_adress_to_contacts ON icredit.contacts_adress IS '������� ���� �������� ������� � �� ������� icredit.contacts';
COMMENT ON CONSTRAINT fk_contacts_adress_to_created_by ON icredit.contacts_adress IS '������� ���� �������� ������� � �������������� icredit.users';
COMMENT ON CONSTRAINT fk_contacts_adress_to_lb_by ON icredit.contacts_adress IS '������� ���� �������� ������� � �������������� icredit.users';
COMMENT ON CONSTRAINT fk_contacts_adress_to_street_type ON icredit.contacts_adress IS '������� ���� �� ������� ����� ���� icredit.dic_street_type ';
COMMENT ON CONSTRAINT fk_contacts_adress_to_district  ON icredit.contacts_adress IS '������� ���� �� ������� ������� � �������� icredit.dic_district_type ';