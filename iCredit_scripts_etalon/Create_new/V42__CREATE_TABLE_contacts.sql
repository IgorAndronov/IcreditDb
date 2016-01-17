-- Table: icredit.contacts

-- DROP TABLE icredit.contacts;

CREATE TABLE icredit.contacts
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts'::regclass), -- Уникальный идентификатор записи в таблице
  created timestamp without time zone NOT NULL DEFAULT now(), -- Дата вставки записи
  created_by integer NOT NULL, -- Кем вставлена запись
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- Дата последней модификации записи
  last_updated_by integer NOT NULL, -- кто последним модифицировал запись
  last_name character varying(30) NOT NULL, -- Фамилия заемщика
  first_name character varying(30) NOT NULL, -- Имя заемщика
  midle_name character varying(30) NOT NULL, -- Отчество заемщика
  residency character varying(1) NOT NULL, -- Резидентность
  income_monthly integer NOT NULL, -- Месячный доход.
  income_family integer NOT NULL DEFAULT 0, -- Месячный доход семьи.
  employment_type integer NOT NULL, -- Тип занятости.
  work_place character varying(128) NOT NULL, -- Место работы.
  work_position character varying(128) NOT NULL, -- Должность.
  sex integer NOT NULL, -- Пол заемщика
  education integer NOT NULL, -- Образование
  date_birsday date NOT NULL, -- Дата рождения
  family_count integer NOT NULL, -- Колличество членов семьи
  id_tax character varying(10) NOT NULL, -- налоговый код
  married boolean NOT NULL DEFAULT false, -- Женат не женат
  citizenship character varying(10) NOT NULL, -- Буквенный код страны проживания заемщика
  localisation character varying(5) DEFAULT 'РУС'::character varying, -- выбранный заемщиком язык общения

  CONSTRAINT pk_contacts PRIMARY KEY (id), --Уникальный идентификатор записи в таблице
  CONSTRAINT contacts_fk FOREIGN KEY (localisation)
      REFERENCES icredit.dic_localisation (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_dic_citizenship FOREIGN KEY (citizenship)
      REFERENCES icredit.dic_citizenship (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_dic_education_type FOREIGN KEY (education)
      REFERENCES icredit.dic_education_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_dic_married_type FOREIGN KEY (married)
      REFERENCES icredit.dic_married_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_dic_sex_type FOREIGN KEY (sex)
      REFERENCES icredit.dic_sex_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_employment_type FOREIGN KEY (employment_type)
      REFERENCES icredit.dic_employment_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_to_residency FOREIGN KEY (residency)
      REFERENCES icredit.dic_residency (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_contacts_id_tax UNIQUE (id_tax)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts
  IS 'Основная таблица с клиентскими данными';
COMMENT ON COLUMN icredit.contacts.id IS 'Уникальный идентификатор строки';
COMMENT ON COLUMN icredit.contacts.created IS 'Дата вставки записи';
COMMENT ON COLUMN icredit.contacts.created_by IS 'Кем вставлена запись';
COMMENT ON COLUMN icredit.contacts.last_updated IS 'Дата последней модификации записи';
COMMENT ON COLUMN icredit.contacts.last_updated_by IS 'кто последним модифицировал запись';
COMMENT ON COLUMN icredit.contacts.last_name IS 'Фамилия заемщика';
COMMENT ON COLUMN icredit.contacts.first_name IS 'Имя заемщика';
COMMENT ON COLUMN icredit.contacts.midle_name IS 'Отчество заемщика';
COMMENT ON COLUMN icredit.contacts.income_monthly IS 'Месячный доход.';
COMMENT ON COLUMN icredit.contacts.income_family IS 'Месячный доход семьи.';
COMMENT ON COLUMN icredit.contacts.employment_type IS 'Тип занятости.';
COMMENT ON COLUMN icredit.contacts.work_place IS 'Место работы.';
COMMENT ON COLUMN icredit.contacts.work_position IS 'Должность.';
COMMENT ON COLUMN icredit.contacts.sex IS 'Пол заемщика';
COMMENT ON COLUMN icredit.contacts.residency  IS 'Резидентность';
COMMENT ON COLUMN icredit.contacts.education IS 'Образование';
COMMENT ON COLUMN icredit.contacts.date_birsday IS 'Дата рождения';
COMMENT ON COLUMN icredit.contacts.family_count IS 'Колличество членов семьи';
COMMENT ON COLUMN icredit.contacts.id_tax IS 'налоговый код';
COMMENT ON COLUMN icredit.contacts.married IS 'Женат не женат';
COMMENT ON COLUMN icredit.contacts.citizenship IS 'Буквенный код страны проживания заемщика';
COMMENT ON COLUMN icredit.contacts.localisation IS 'выбранный заемщиком язык общения';

COMMENT ON CONSTRAINT pk_contacts ON icredit.contacts IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_contacts_id_tax ON icredit.contacts IS 'Ограничение уникальности значения записи в таблице';