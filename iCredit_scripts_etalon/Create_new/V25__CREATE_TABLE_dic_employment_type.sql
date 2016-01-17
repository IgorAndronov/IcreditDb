-- Table icredit.dic_employment_type

-- DROP TABLE icredit.dic_employment_type;

CREATE TABLE icredit.dic_employment_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Цифровое значение видов занятости заемщика
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный 1- не актуальный 0

  CONSTRAINT pk_dic_employment_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_employment_type UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_employment_type
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_employment_type
  IS 'Справочник видов занятости заемщика';
COMMENT ON COLUMN icredit.dic_employment_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_employment_type.value IS 'Цифровое значение видов занятости заемщика';
COMMENT ON COLUMN icredit.dic_employment_type.active IS 'Статус записи- актуальный 1- не актуальный 0';

COMMENT ON CONSTRAINT unq_dic_employment_type ON icredit.dic_employment_type IS 'Ограничение уникальности значения записи в таблице';
COMMENT ON CONSTRAINT pk_dic_employment_type ON icredit.dic_employment_type IS 'Уникальный идентификатор записи в таблице';