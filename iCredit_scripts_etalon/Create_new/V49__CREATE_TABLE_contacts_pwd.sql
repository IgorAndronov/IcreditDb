-- Table: icredit.contacts_pwd

-- DROP TABLE icredit.contacts_pwd;

CREATE TABLE icredit.contacts_pwd
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_pwd'::regclass), -- Уникальный идентификатор строки
  created timestamp without time zone NOT NULL DEFAULT now(), -- Дата вставки записи
  created_by integer NOT NULL, -- Кем вставлена запись
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- Дата последней модификации записи
  last_updated_by integer NOT NULL, -- кто последним модифицировал запись
  id_contact integer NOT NULL, -- идентификатор клиента
  login_name character varying(50) NOT NULL, -- логин
  pwd character varying(100) NOT NULL, -- пароль

  CONSTRAINT pk_contacts_pwd PRIMARY KEY (id),
  CONSTRAINT fk_contacts_pwd_to_contacts FOREIGN KEY (id_contact)
      REFERENCES icredit.contacts (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_contacts_pwd_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_pwd_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_pwd
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_pwd
  IS 'Таблица, котрая содержит актуальный пароь и логин заемщика';
COMMENT ON COLUMN icredit.contacts_pwd.id IS 'Уникальный идентификатор строки';
COMMENT ON COLUMN icredit.contacts_pwd.created IS 'Дата вставки записи';
COMMENT ON COLUMN icredit.contacts_pwd.created_by IS 'Кем вставлена запись';
COMMENT ON COLUMN icredit.contacts_pwd.last_updated IS 'Дата последней модификации записи';
COMMENT ON COLUMN icredit.contacts_pwd.last_updated_by IS 'кто последним модифицировал запись';
COMMENT ON COLUMN icredit.contacts_pwd.id_contact IS 'идентификатор клиента';
COMMENT ON COLUMN icredit.contacts_pwd.login_name IS 'логин';
COMMENT ON COLUMN icredit.contacts_pwd.pwd IS 'пароль';
