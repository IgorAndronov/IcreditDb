-- Table: icredit.dic_citizenship

-- DROP TABLE icredit.dic_citizenship;

CREATE TABLE icredit.dic_citizenship
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value character varying(10) NOT NULL, -- Буквенный код страны
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0'
  
  CONSTRAINT pk_dic_citizenship PRIMARY KEY (id), -- Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_citizenship UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_citizenship
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_citizenship
  IS 'Справочник стран';
COMMENT ON COLUMN icredit.dic_citizenship.id IS 'Уникальный идентификатор записи';
COMMENT ON COLUMN icredit.dic_citizenship.value IS 'Буквенный код страны';
COMMENT ON COLUMN icredit.dic_citizenship.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT unq_dic_citizenship ON icredit.dic_citizenship IS 'Ограничение уникальности значения записи в таблице';
COMMENT ON CONSTRAINT pk_dic_citizenship ON icredit.dic_citizenship IS 'Уникальный идентификатор записи в таблице';
