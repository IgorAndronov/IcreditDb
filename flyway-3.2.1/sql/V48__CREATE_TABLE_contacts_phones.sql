-- Table: icredit.contacts_phones

-- DROP TABLE icredit.contacts_phones;

CREATE TABLE icredit.contacts_phones
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_phones'::regclass), -- Уникальный идентификатор записи
  created timestamp without time zone NOT NULL DEFAULT now(), -- Дата вставки записи
  created_by integer NOT NULL, -- Кем вставлена запись
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- Дата последней модификации записи
  last_updated_by integer NOT NULL, -- кто последним модифицировал запись
  id_contact integer NOT NULL, -- Id_row записи заемщика
  phone_number character varying(10) NOT NULL, -- Номер телефона без кода страны...
  phone_type integer NOT NULL, -- Тип телефона
  active integer NOT NULL, -- Статус документа...
  use_for_sms boolean NOT NULL DEFAULT false, -- использовать для СМС верификации и пр.
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
  IS 'Телефоны заемщиков';
COMMENT ON COLUMN icredit.contacts_phones.id IS 'Уникальный идентификатор записи';
COMMENT ON COLUMN icredit.contacts_phones.created IS 'Дата вставки записи';
COMMENT ON COLUMN icredit.contacts_phones.created_by IS 'Кем вставлена запись';
COMMENT ON COLUMN icredit.contacts_phones.last_updated IS 'Дата последней модификации записи';
COMMENT ON COLUMN icredit.contacts_phones.last_updated_by IS 'кто последним модифицировал запись';
COMMENT ON COLUMN icredit.contacts_phones.id_contact IS 'Id_row записи заемщика';
COMMENT ON COLUMN icredit.contacts_phones.phone_number IS 'Номер телефона без кода страны
(0ХХ ХХХ ХХ ХХ)
';
COMMENT ON COLUMN icredit.contacts_phones.phone_type IS 'Тип телефона ';
COMMENT ON COLUMN icredit.contacts_phones.active IS 'Статус документа
- актуальный: 1
- не актуальный: 0
';
COMMENT ON COLUMN icredit.contacts_phones.use_for_sms IS 'использовать для СМС верификации и пр.';
