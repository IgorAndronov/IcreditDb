-- Table: icredit.dic_values

-- DROP TABLE icredit.dic_values;

CREATE TABLE icredit.dic_values
(
  id integer NOT NULL, -- Уникальный идентификатор записи, который равен соответствующей записи в одном из справочников ИЛИ Ссылка на родительскую запись справочника icredit.dic_*, к кторой привязано данное наименование
  name character varying(60) NOT NULL, -- Наименование параметра в соответствующей локали, которое нужно вывести на экран
  comment character varying(1000) NOT NULL, -- Для вывода в хинт
  localisation character varying(5) NOT NULL, -- локаль, согласно справочника icredit.dic_localisation

  CONSTRAINT unq_dic_education_local UNIQUE (id, localisation),
  CONSTRAINT fk_dic_education_local_to_localisation FOREIGN KEY (localisation)
      REFERENCES icredit.dic_localisation (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_values
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_values
  IS 'Таблица для текстовых описаний всех справочников, в которой находится название в нужной ЛОКАЛИЗАЦИИ';

COMMENT ON COLUMN icredit.dic_values.id IS 'Уникальный идентификатор записи, который равен соответствующей записи в одном из справочников ИЛИ Ссылка на родительскую запись справочника icredit.dic_*, к кторой привязано данное наименование';
COMMENT ON COLUMN icredit.dic_values.name IS 'Наименование параметра в соответствующей локали, которое нужно вывести на экран';
COMMENT ON COLUMN icredit.dic_values.comment IS 'Для вывода в хинт';
COMMENT ON COLUMN icredit.dic_values.localisation IS 'локаль, согласно справочника icredit.dic_localisation';

COMMENT ON CONSTRAINT fk_dic_education_local_to_localisation ON icredit.dic_values IS 'Ограничение на колонку в зависимости от значений связанного справочника';
COMMENT ON CONSTRAINT unq_dic_education_local ON icredit.dic_values IS 'Ограничение уникальности значения записи в таблице';