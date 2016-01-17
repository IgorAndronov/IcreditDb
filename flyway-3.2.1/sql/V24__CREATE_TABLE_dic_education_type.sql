-- Table: icredit.dic_education_type

-- DROP TABLE icredit.dic_education_type;

CREATE TABLE icredit.dic_education_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Цифровой код параметра уровень образования
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_education_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_education_type UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_education_type
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_education_type
  IS 'Справочник видов(уровней) образований документов';
COMMENT ON COLUMN icredit.dic_education_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_education_type.value IS 'Цифровой код параметра уровень образования';
COMMENT ON COLUMN icredit.dic_education_type.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT pk_dic_education_type ON icredit.dic_education_type IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_education_type ON icredit.dic_education_type IS 'Ограничение уникальности значения записи в таблице';