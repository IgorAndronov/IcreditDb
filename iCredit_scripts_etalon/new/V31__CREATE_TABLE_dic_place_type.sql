-- Table: icredit.dic_place_type

-- DROP TABLE icredit.dic_place_type;

CREATE TABLE icredit.dic_place_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Значение параметра типа города
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_place_type PRIMARY KEY (id), -- Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_place_type UNIQUE (value) -- Признак уникальности значений
)
WITH (
  OIDS=FALSE
);

ALTER TABLE icredit.dic_place_type
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_place_type
  IS 'Справочник типов городов';

COMMENT ON COLUMN icredit.dic_place_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_place_type.value IS 'Значение параметра типа города';
COMMENT ON COLUMN icredit.dic_place_type.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT unq_dic_place_type ON icredit.dic_place_type IS 'Признак уникальности значений';
COMMENT ON CONSTRAINT pk_dic_place_type ON icredit.dic_place_type IS 'Уникальный идентификатор записи в таблице';

