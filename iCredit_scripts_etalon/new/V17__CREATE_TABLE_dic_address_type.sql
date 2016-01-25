-- Table: icredit.dic_address_type

-- DROP TABLE icredit.dic_address_type;

CREATE TABLE icredit.dic_address_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Значение типа аддреса
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_address_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_address_type UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_address_type
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_address_type IS 'Справочник типов адресов';
COMMENT ON COLUMN icredit.dic_address_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_address_type.value IS 'Значение типа аддреса';
COMMENT ON COLUMN icredit.dic_address_type.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT pk_dic_address_type ON icredit.dic_address_type IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_address_type ON icredit.dic_address_type IS 'Ограничение уникальности значения записи в таблице';