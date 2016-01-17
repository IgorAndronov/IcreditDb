-- Table: icredit.dic_www_type

-- DROP TABLE icredit.dic_www_type;

CREATE TABLE icredit.dic_www_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Тип логина
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_www_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_www_type UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_www_type
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_www_type
  IS 'Справочник типов логинов в соцсетях и почтовых логинов';
COMMENT ON COLUMN icredit.dic_www_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_www_type.value IS 'Тип логина';
COMMENT ON COLUMN icredit.dic_www_type.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT unq_dic_www_type ON icredit.dic_www_type IS 'Ограничение уникальности значения записи в таблице';
COMMENT ON CONSTRAINT pk_dic_www_type ON icredit.dic_www_type IS 'Уникальный идентификатор записи в таблице';
