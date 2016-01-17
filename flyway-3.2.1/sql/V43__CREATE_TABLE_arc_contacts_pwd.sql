-- Table: icredit.arc_contacts_pwd

-- DROP TABLE icredit.arc_contacts_pwd;

CREATE TABLE icredit.arc_contacts_pwd
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_arc_contacts_pwd'::regclass), -- ”никальный идентификатор записи в таблице
  created timestamp without time zone NOT NULL DEFAULT now(), -- ƒата вставки записи
  created_by integer NOT NULL, --  ем вставлена запись
  id_contact integer NOT NULL, -- ID контакта из таблицы contacts
  id_par character varying(100) NOT NULL, -- параметр , который показывает что мен€лось (какой из параметров таблицы contacts_pwd был изменен)
  value_par character varying(100) NOT NULL, -- старое значение параметра


  CONSTRAINT pk_arc_contacts_pwd PRIMARY KEY (id),--”никальный идентификатор записи в таблице
  CONSTRAINT fk_arc_contacts_pwd_to_contacts FOREIGN KEY (id_contact)
      REFERENCES icredit.contacts (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_arc_contacts_pwd_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);


ALTER TABLE icredit.arc_contacts_pwd
  OWNER TO postgres;


COMMENT ON TABLE icredit.arc_contacts_pwd
  IS 'јрхивна€ таблица, котра€ содержит предыдущий пароль и/или логин заемщика, дату смены и кто мен€л. “.е. всю историю изменени€ этих параметров';
COMMENT ON COLUMN icredit.arc_contacts_pwd.id IS '”никальный идентификатор записи';
COMMENT ON COLUMN icredit.arc_contacts_pwd.created IS 'ƒата вставки записи';
COMMENT ON COLUMN icredit.arc_contacts_pwd.created_by IS ' ем вставлена запись';
COMMENT ON COLUMN icredit.arc_contacts_pwd.id_contact  IS 'ID контакта из таблицы contacts, что бы знать кому принадлежат эти исторические данные';
COMMENT ON COLUMN icredit.arc_contacts_pwd.id_par IS 'параметр , который показывает что мен€лось (какой из параметров таблицы contacts_pwd был изменен)';
COMMENT ON COLUMN icredit.arc_contacts_pwd.value_par IS 'старое значение';

COMMENT ON CONSTRAINT pk_arc_contacts_pwd ON icredit.arc_contacts_pwd IS '”никальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT fk_arc_contacts_pwd_to_contacts ON icredit.arc_contacts_pwd IS 'ќграничение уникальности значени€ записи в таблице icredit.contacts ';
COMMENT ON CONSTRAINT fk_arc_contacts_pwd_to_created_by ON icredit.arc_contacts_pwd IS 'ќграничение уникальности значени€ записи в таблице icredit.users';