-- Table: icredit.dic_active_flag

-- DROP TABLE icredit.dic_active_flag;

CREATE TABLE icredit.dic_active_flag
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи
  value integer NOT NULL,             -- Значение параметра active_flag. Вообще принимает есть только два значения- актуальный: 1- не актуальный: 0';
  active integer NOT NULL DEFAULT 1,  -- Признак активности строки в справочнике (данное поле избыточно, добавлено для унификации структур саправочников)

  CONSTRAINT pk_dic_active_flag PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_active_flag UNIQUE (value)   -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);

ALTER TABLE icredit.dic_active_flag
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_active_flag  IS 'Справочник значений активности записи';
COMMENT ON COLUMN icredit.dic_active_flag.id IS 'Уникальный идентификатор записи';
COMMENT ON COLUMN icredit.dic_active_flag.value IS 'Значение параметра active_flag. Вообще принимает есть только два значения актуальный: 1- не актуальный: 0';
COMMENT ON COLUMN icredit.dic_active_flag.active IS 'Признак активности строки в справочнике (данное поле избыточно, добавлено для унификации структур саправочников)';

COMMENT ON CONSTRAINT pk_dic_active_flag ON icredit.dic_active_flag IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_active_flag ON icredit.dic_active_flag IS 'Ограничение уникальности значения записи в таблице';
