-- Table: icredit.dic_field_view_type

-- DROP TABLE icredit.dic_field_view_type;

CREATE TABLE icredit.dic_field_view_type
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value character varying(10) NOT NULL, -- Тип поля
  active integer NOT NULL DEFAULT 1, -- Статус записи - актуальный: 1 - не актуальный: 0

  CONSTRAINT pk_dic_field_view_type PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_field_view_type UNIQUE (value) --Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_field_view_type
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_field_view_type
  IS 'Справочник типов полей ТИПА СПИОК';
COMMENT ON COLUMN icredit.dic_field_view_type.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_field_view_type.value IS 'Тип поля';
COMMENT ON COLUMN icredit.dic_field_view_type.active IS 'Статус записи - актуальный: 1 - не актуальный: 0';


COMMENT ON CONSTRAINT pk_dic_field_view_type ON icredit.dic_field_view_type IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_field_view_type ON icredit.dic_field_view_type IS 'Ограничение уникальности значения записи в таблице';