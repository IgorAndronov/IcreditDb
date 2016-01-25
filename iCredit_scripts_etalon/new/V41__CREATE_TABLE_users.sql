-- Table: icredit.users

-- DROP TABLE icredit.users;

CREATE TABLE icredit.users
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_users'::regclass), -- Уникальный идентификатор записи в таблице
  created timestamp without time zone NOT NULL DEFAULT now(), -- Дата вставки записи
  created_by integer NOT NULL, -- Кем вставлена запись
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- Дата последней модификации записи
  last_updated_by numeric(2,0) NOT NULL, -- кто последним модифицировал запись
  last_name character varying(30) NOT NULL, -- Фамилия пользователя
  first_name character varying(30) NOT NULL, -- Имя пользователя
  midle_name character varying(30) NOT NULL, -- Отчество пользователя
  login character varying(30) NOT NULL, -- Логин пользователя в системе
  pwd character varying(100) NOT NULL, -- Пароль пользователя
  status integer NOT NULL DEFAULT 0, -- статус, по умолчанию 0 - не активен

  CONSTRAINT pk_users PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_users UNIQUE  (login), --Ограничение уникальности значения записи в таблице
  CONSTRAINT fk_users_to_status FOREIGN KEY (status)
      REFERENCES icredit.dic_users_status (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.users
  OWNER TO postgres;
COMMENT ON TABLE icredit.users
  IS 'Таблица пользователей системы';
COMMENT ON COLUMN icredit.users.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.users.created IS 'Дата вставки записи';
COMMENT ON COLUMN icredit.users.created_by IS 'Кем вставлена запись';
COMMENT ON COLUMN icredit.users.last_updated IS 'Дата последней модификации записи';
COMMENT ON COLUMN icredit.users.last_updated_by IS 'кто последним модифицировал запись';
COMMENT ON COLUMN icredit.users.last_name IS 'Фамилия пользователя';
COMMENT ON COLUMN icredit.users.first_name IS 'Имя пользователя';
COMMENT ON COLUMN icredit.users.midle_name IS 'Отчество пользователя';
COMMENT ON COLUMN icredit.users.login IS 'Логин пользователя в системе';
COMMENT ON COLUMN icredit.users.pwd IS 'Пароль пользователя';
COMMENT ON COLUMN icredit.users.status IS 'статус, по умолчанию 0 - не активен';

COMMENT ON CONSTRAINT pk_users ON icredit.users IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_users ON icredit.users IS 'Ограничение уникальности значения записи в таблице';
COMMENT ON CONSTRAINT fk_users_to_status ON icredit.users IS 'Ограничение уникальности значения dic_users_status';