-- Table: icredit.system_parameters

-- DROP TABLE icredit.system_parameters;

CREATE TABLE icredit.system_parameters
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_system_parameters'::regclass), -- Уникальный идентификатор записи в таблице
  par_name character varying(50) NOT NULL, -- Наименование системной переменной
  value character varying(100) NOT NULL, -- Значение локали
  comment character varying(1000) NOT NULL, -- Описание
  type_par character varying(5) NOT NULL, -- тип параметра
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_system_parameters PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT fk_system_parameters_to_type_par FOREIGN KEY (type_par)
      REFERENCES icredit.dic_field_view_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_system_parameters UNIQUE (par_name) -- Признак уникальности значений
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.system_parameters
  OWNER TO postgres;

COMMENT ON COLUMN icredit.system_parameters.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.system_parameters.par_name IS 'Наименование системной переменной';
COMMENT ON COLUMN icredit.system_parameters.value IS 'Значение локали';
COMMENT ON COLUMN icredit.system_parameters.comment IS 'Описание';
COMMENT ON COLUMN icredit.system_parameters.type_par IS 'тип параметра';
COMMENT ON COLUMN icredit.system_parameters.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT unq_system_parameters ON icredit.system_parameters IS 'Признак уникальности значений';

