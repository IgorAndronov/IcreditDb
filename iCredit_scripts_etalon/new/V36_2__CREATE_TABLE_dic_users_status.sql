-- Table: icredit.dic_users_status

-- DROP TABLE icredit.dic_users_status;

CREATE TABLE icredit.dic_users_status
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- код статуса пользователя
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0
  
  CONSTRAINT pk_dic_users_status PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_users_status UNIQUE (value) -- Признак уникальности значений
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_users_status
  OWNER TO postgres;

COMMENT ON TABLE icredit.dic_users_status IS 'Справочник кодов статусов пользователей';
COMMENT ON COLUMN icredit.dic_users_status.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_users_status.value IS 'код статуса пользователя';
COMMENT ON COLUMN icredit.dic_users_status.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT unq_dic_users_status ON icredit.dic_users_status IS 'Признак уникальности значений';
COMMENT ON CONSTRAINT pk_dic_users_status ON icredit.dic_users_status IS 'Уникальный идентификатор записи в таблице';
