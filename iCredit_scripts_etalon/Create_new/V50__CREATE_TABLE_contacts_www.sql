-- Table: icredit.contacts_www

-- DROP TABLE icredit.contacts_www;

CREATE TABLE icredit.contacts_www
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_www'::regclass), -- Уникальный идентификатор записи
  created timestamp without time zone NOT NULL DEFAULT now(), -- Дата вставки записи
  created_by integer NOT NULL, -- Кем вставлена запись
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- Дата последней модификации записи
  last_updated_by integer NOT NULL, -- кто последним модифицировал запись
  id_contact integer NOT NULL, -- Id_row записи заемщика
  name character varying(100) NOT NULL, -- логин
  name_type integer NOT NULL, -- Тип логина
  active integer NOT NULL DEFAULT 1, -- Статус документа...
  use_for_correspondence boolean NOT NULL DEFAULT false, -- Использовать для корреспонденции
  CONSTRAINT pk_contacts_www PRIMARY KEY (id),
  CONSTRAINT fk_contacts_www_to_contacts FOREIGN KEY (id_contact)
      REFERENCES icredit.contacts (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_contacts_www_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_www_to_dic_active_flag FOREIGN KEY (active)
      REFERENCES icredit.dic_active_flag (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_www_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_www_to_www_type FOREIGN KEY (name_type)
      REFERENCES icredit.dic_www_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_www
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_www
  IS 'почтовые логины и логины в соцсетях';
COMMENT ON COLUMN icredit.contacts_www.id IS 'Уникальный идентификатор записи';
COMMENT ON COLUMN icredit.contacts_www.created IS 'Дата вставки записи';
COMMENT ON COLUMN icredit.contacts_www.created_by IS 'Кем вставлена запись';
COMMENT ON COLUMN icredit.contacts_www.last_updated IS 'Дата последней модификации записи';
COMMENT ON COLUMN icredit.contacts_www.last_updated_by IS 'кто последним модифицировал запись';
COMMENT ON COLUMN icredit.contacts_www.id_contact IS 'Id_row записи заемщика';
COMMENT ON COLUMN icredit.contacts_www.name IS 'логин';
COMMENT ON COLUMN icredit.contacts_www.name_type IS 'Тип логина ';
COMMENT ON COLUMN icredit.contacts_www.active IS 'Статус документа
- актуальный: 1
- не актуальный: 0';
COMMENT ON COLUMN icredit.contacts_www.use_for_correspondence IS 'Использовать для корреспонденции';
