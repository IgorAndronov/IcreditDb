-- Table: icredit.dic_married_type

-- DROP TABLE icredit.dic_married_type;

CREATE TABLE icredit.dic_married_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value boolean NOT NULL, -- Значение параметра семейное положение
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_married_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_married_type UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);

ALTER TABLE icredit.dic_married_type
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_married_type
  IS 'Справочник кодов семейного положения';
COMMENT ON COLUMN icredit.dic_married_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_married_type.value IS 'Значение параметра семейное положение';
COMMENT ON COLUMN icredit.dic_married_type.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT unq_dic_married_type ON icredit.dic_married_type IS 'Ограничение уникальности значения записи в таблице';
COMMENT ON CONSTRAINT pk_dic_married_type ON icredit.dic_married_type IS 'Уникальный идентификатор записи в таблице';
