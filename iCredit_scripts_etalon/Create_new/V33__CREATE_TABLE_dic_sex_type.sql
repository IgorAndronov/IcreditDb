CREATE TABLE icredit.dic_sex_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Код гендорной принадлежности
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_sex_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_sex_type UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);

ALTER TABLE icredit.dic_sex_type
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_sex_type
  IS 'Справочник гендерной принадлежности человека';
COMMENT ON COLUMN icredit.dic_sex_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_sex_type.value IS 'Код гендорной принадлежности';
COMMENT ON COLUMN icredit.dic_sex_type.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT unq_dic_sex_type ON icredit.dic_sex_type IS 'Ограничение уникальности значения записи в таблице';
COMMENT ON CONSTRAINT pk_dic_sex_type ON icredit.dic_sex_type IS 'Уникальный идентификатор записи в таблице';