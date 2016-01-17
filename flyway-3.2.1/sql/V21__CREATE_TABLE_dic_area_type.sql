-- Table: icredit.dic_area_type 

-- DROP TABLE icredit.dic_area_type;

CREATE TABLE icredit.dic_area_type 
(
    id integer DEFAULT nextval('icredit.seq_dictionaries'::regclass) NOT NULL,-- Уникальный идентификатор записи в таблице
    value integer NOT NULL, -- Цифровой код области
    active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0
   
    CONSTRAINT pk_dic_area_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
    CONSTRAINT unq_dic_area_type UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  oids = false
);

ALTER TABLE icredit.dic_area_type
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_area_type IS 'Справочник областей';
COMMENT ON COLUMN icredit.dic_area_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_area_type.value IS 'Цифровой код области';
COMMENT ON COLUMN icredit.dic_area_type.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT pk_dic_area_type ON icredit.dic_area_type IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_area_type ON icredit.dic_area_type IS 'Ограничение уникальности значения записи в таблице';