-- Table: icredit.dic_district_type

-- DROP TABLE icredit.dic_district_type;

CREATE TABLE icredit.dic_district_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Цифровой код района
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0
  value_parent integer NOT NULL, -- подчиненность района области

  CONSTRAINT pk_dic_district_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT fk_dic_district_type_to_id_parent FOREIGN KEY (value_parent) --Ограничение на подчиненность района области'
      REFERENCES icredit.dic_area_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_dic_district_type UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_district_type
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_district_type
  IS 'Справочник районов в областных центрах';
COMMENT ON COLUMN icredit.dic_district_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_district_type.value IS 'Цифровой код района';
COMMENT ON COLUMN icredit.dic_district_type.active IS 'Статус записи- актуальный: 1- не актуальный: 0';
COMMENT ON COLUMN icredit.dic_district_type.value_parent IS 'подчиненность района области';

COMMENT ON CONSTRAINT pk_dic_district_type ON icredit.dic_district_type IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_district_type ON icredit.dic_district_type IS 'Ограничение уникальности значения записи в таблице';
COMMENT ON CONSTRAINT fk_dic_district_type_to_id_parent ON icredit.dic_district_type IS 'Ограничение на подчиненность района области';