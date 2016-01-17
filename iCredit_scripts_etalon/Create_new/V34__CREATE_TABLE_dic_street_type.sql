-- Table: icredit.dic_street_type

-- DROP TABLE icredit.dic_street_type;

CREATE TABLE icredit.dic_street_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Код типа улицы
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_street_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_street_type UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_street_type
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_street_type
  IS 'Справочник типов улиц';
COMMENT ON COLUMN icredit.dic_street_type.id IS 'Уникальный идентификатор записи';
COMMENT ON COLUMN icredit.dic_street_type.value IS 'Код типа улицы';
COMMENT ON COLUMN icredit.dic_street_type.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT pk_dic_street_type ON icredit.dic_street_type IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_street_type ON icredit.dic_street_type IS 'Ограничение уникальности значения записи в таблице';