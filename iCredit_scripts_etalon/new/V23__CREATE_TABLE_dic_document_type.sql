-- Table: icredit.dic_document_type

-- DROP TABLE icredit.dic_document_type;

CREATE TABLE icredit.dic_document_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Цифровой код параметра тип документа
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_document_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_document_type UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_document_type
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_document_type
  IS 'Справочник типов документов';
COMMENT ON COLUMN icredit.dic_document_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_document_type.value IS 'Цифровой код параметра тип документа';
COMMENT ON COLUMN icredit.dic_document_type.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT unq_dic_document_type ON icredit.dic_document_type IS 'Ограничение уникальности значения записи в таблице';
COMMENT ON CONSTRAINT pk_dic_document_type ON icredit.dic_document_type IS 'Уникальный идентификатор записи в таблице';
