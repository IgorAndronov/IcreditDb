-- Table: icredit.dic_residency

-- DROP TABLE icredit.dic_residency;

CREATE TABLE icredit.dic_residency
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value character varying(1) NOT NULL, -- Значение для резидентности (Y-резидент, N-не резидент)
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_residency PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_residency UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_residency
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_residency
  IS 'Справочник резидентности';
COMMENT ON COLUMN icredit.dic_residency.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_residency.value IS 'Значение для резидентности (Y-резидент, N-не резидент)';
COMMENT ON COLUMN icredit.dic_residency.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT pk_dic_residency ON icredit.dic_residency IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_residency ON icredit.dic_residency IS 'Ограничение уникальности значения записи в таблице';
