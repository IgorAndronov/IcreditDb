-- Table: icredit.dic_localisation

-- DROP TABLE icredit.dic_localisation;

CREATE TABLE icredit.dic_localisation
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  name character varying(50) NOT NULL, -- Наименование локали
  value character varying(5) NOT NULL, -- Значение локали
  comments character varying(1000) NOT NULL, -- комментарий, который может быть выведен в ХИНТЕ
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_localisation PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_localisation UNIQUE (value) -- Признак уникальности значений
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_localisation
  OWNER TO postgres;

COMMENT ON COLUMN icredit.dic_localisation.id IS 'Уникальный идентификатор записи';
COMMENT ON COLUMN icredit.dic_localisation.name IS 'Наименование локали';
COMMENT ON COLUMN icredit.dic_localisation.value IS 'Значение локали';
COMMENT ON COLUMN icredit.dic_localisation.comments IS 'комментарий, который может быть выведен в ХИНТЕ';
COMMENT ON COLUMN icredit.dic_localisation.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT pk_dic_localisation ON icredit.dic_localisation IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_localisation ON icredit.dic_localisation IS 'Ограничение уникальности значения записи в таблице';