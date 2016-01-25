-- Table: icredit.dic_systems_fields

-- DROP TABLE icredit.dic_systems_fields;

CREATE TABLE icredit.dic_systems_fields
(
  field_name character varying(30) NOT NULL, -- имя поля

  CONSTRAINT pk_dic_systems_fields PRIMARY KEY (field_name) -- имя поля
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_systems_fields
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_systems_fields
  IS 'Справочник системных полей, которые нельзя редактировать';

COMMENT ON COLUMN icredit.dic_systems_fields.field_name IS 'имя поля';
COMMENT ON CONSTRAINT pk_dic_systems_fields ON icredit.dic_systems_fields IS 'Признак уникальности значений';