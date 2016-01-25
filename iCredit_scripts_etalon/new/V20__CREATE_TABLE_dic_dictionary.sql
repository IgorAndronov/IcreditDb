-- Table: icredit.dic_dictionary

-- DROP TABLE icredit.dic_dictionary;

CREATE TABLE icredit.dic_dictionary
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value character varying(30) NOT NULL, -- Наименование справочника
  active integer NOT NULL DEFAULT 1, --Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_dictionary PRIMARY KEY (id),
  CONSTRAINT unq_dic_dictionary UNIQUE (value)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_dictionary
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_dictionary
  IS 'Справочник справочников, которые можно и нужно заполнять через процедуру icredit.f_dictionary_add ';
COMMENT ON COLUMN icredit.dic_dictionary.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_dictionary.value IS 'Наименование справочника';
COMMENT ON COLUMN icredit.dic_dictionary.active IS 'Статус записи- актуальный: 1- не актуальный: 0';


COMMENT ON CONSTRAINT pk_dic_dictionary ON icredit.dic_dictionary IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_dictionary ON icredit.dic_dictionary IS 'Ограничение уникальности значения записи в таблице';