-- Table: icredit.role

-- DROP TABLE icredit.role;

CREATE TABLE icredit.role
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_role'::regclass), -- Уникальный идентификатор записи в таблице
  created timestamp without time zone NOT NULL DEFAULT now(), -- Дата вставки записи
  created_by integer NOT NULL, -- Кем вставлена запись
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- Дата последней модификации записи
  last_updated_by integer NOT NULL, -- кто последним модифицировал запись
  role_name character varying(30) NOT NULL, -- Название роли
  role_caption character varying(1000) NOT NULL, -- Описание роли
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0


  CONSTRAINT pk_role PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT fk_role_to_active FOREIGN KEY (active)
      REFERENCES icredit.dic_role_status (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION


)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.role
  OWNER TO postgres;
COMMENT ON TABLE icredit.role
  IS 'Таблица, содержащая перечень ролей пользователей системы';
COMMENT ON COLUMN icredit.role.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.role.created IS 'Дата вставки записи';
COMMENT ON COLUMN icredit.role.created_by IS 'Кем вставлена запись';
COMMENT ON COLUMN icredit.role.last_updated IS 'Дата последней модификации записи';
COMMENT ON COLUMN icredit.role.last_updated_by IS 'кто последним модифицировал запись';
COMMENT ON COLUMN icredit.role.role_name IS 'Название роли';
COMMENT ON COLUMN icredit.role.role_caption IS 'Описание роли';

COMMENT ON CONSTRAINT pk_role ON icredit.role IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT fk_role_to_active ON icredit.role IS 'Ссылка на справочник icredit.dic_role_status';