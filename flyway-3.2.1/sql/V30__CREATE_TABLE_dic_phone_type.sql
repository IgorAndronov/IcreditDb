
-- Table: icredit.dic_phone_type

-- DROP TABLE icredit.dic_phone_type;

CREATE TABLE icredit.dic_phone_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Код типа телефона
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0
  CONSTRAINT pk_dic_phone_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_phone_type UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_phone_type
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_phone_type
  IS 'Справочник типов телефонов';
COMMENT ON COLUMN icredit.dic_phone_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_phone_type.value IS 'Код типа телефона';
COMMENT ON COLUMN icredit.dic_phone_type.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT unq_dic_phone_type ON icredit.dic_phone_type IS 'Ограничение уникальности значения записи в таблице';
