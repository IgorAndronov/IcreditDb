
-- Table: icredit.contacts_caption

-- DROP TABLE icredit.contacts_caption;

CREATE TABLE icredit.contacts_caption
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_caption'::regclass), -- Уникальный идентификатор записи в таблице
  created timestamp without time zone NOT NULL DEFAULT now(), -- Дата вставки записи
  created_by integer NOT NULL DEFAULT 1, -- Кем вставлена запись
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- Дата последней модификации записи
  last_updated_by integer NOT NULL DEFAULT 1, -- кто последним модифицировал запись
  table_name character varying(100) NOT NULL, --название таблицы на английском
  field_name character varying(100) NOT NULL, -- название поля на английском
  caption_name character varying(30) NOT NULL, -- Краткое описание поля
  localisation character varying(5) NOT NULL, -- локаль

  CONSTRAINT pk_contacts_caption PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT fk_contacts_caption_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_caption_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_caption_to_localisation FOREIGN KEY (localisation)
      REFERENCES icredit.dic_localisation (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_contacts_caption UNIQUE (table_name,field_name, localisation)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_caption
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_caption
  IS 'наименование полей, по контакту, для вывода на экран';
COMMENT ON COLUMN icredit.contacts_caption.id IS 'Уникальный идентификатор строки';
COMMENT ON COLUMN icredit.contacts_caption.created IS 'Дата вставки записи';
COMMENT ON COLUMN icredit.contacts_caption.created_by IS 'Кем вставлена запись';
COMMENT ON COLUMN icredit.contacts_caption.last_updated IS 'Дата последней модификации записи';
COMMENT ON COLUMN icredit.contacts_caption.last_updated_by IS 'кто последним модифицировал запись';
COMMENT ON COLUMN icredit.contacts_caption.field_name IS 'название поля на английском';
COMMENT ON COLUMN icredit.contacts_caption.caption_name IS 'Краткое описание поля';
COMMENT ON COLUMN icredit.contacts_caption.localisation IS 'локаль';
COMMENT ON COLUMN icredit.contacts_caption.table_name IS 'Название таблицы на английском';

COMMENT ON CONSTRAINT pk_contacts_caption ON icredit.contacts_caption IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_contacts_caption ON icredit.contacts_caption IS 'Ограничение уникальности значения записи в таблице';