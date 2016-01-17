-- Table: icredit.contacts_access

-- DROP TABLE icredit.contacts_access;

CREATE TABLE icredit.contacts_access
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_access'::regclass), -- Уникальный идентификатор записи в таблице
  created timestamp without time zone NOT NULL DEFAULT now(), -- Дата вставки записи
  created_by integer NOT NULL DEFAULT 1, -- Кем вставлена запись
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- Дата последней модификации записи
  last_updated_by integer NOT NULL DEFAULT 1, -- кто последним модифицировал запись
  id_role integer NOT NULL, -- роль, для которой действуют данные разрешения
  table_name character varying(100) NOT NULL, -- Наименование таблицы, в которой расположено поле
  field_name character varying(100) NOT NULL, -- ИД поля в таблице contacts_caption и вообще в таблице
  page_number integer NOT NULL DEFAULT 1, -- Номер страницы, на которой будет выведен параметр
  group_number integer NOT NULL, -- для группировки
  group_sorting integer NOT NULL DEFAULT 1, -- Порядок следования группы
  sorting integer NOT NULL DEFAULT 1, -- Порядок следования на странице
  field_view_type character varying(10) NOT NULL DEFAULT 0, -- Параметр, который показывает тип обьекта для полей с выбором значений. Например РАДИОБАТОН, ВЫПАДАЮЩИЙ СПИСОК, СПИСОК МНОЖЕСТВЕННОГО выбора
  visible boolean NOT NULL DEFAULT false, -- Видимость поля на экране
  ro boolean NOT NULL DEFAULT true, -- Доступность к записи на экране

  CONSTRAINT pk_contacts_access PRIMARY KEY (id), -- Уникальный идентификатор записи в таблице
  CONSTRAINT fk_contacts_access_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_access_to_group_number FOREIGN KEY (group_number)
      REFERENCES icredit.dic_name_contacts_block (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_access_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_access_to_list_type FOREIGN KEY (field_view_type)
      REFERENCES icredit.dic_field_view_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_contacts_access UNIQUE (id_role, field_name)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_access
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_access
  IS 'Таблица глобальных параметров и разрешений системы для соступа к данным клиентов';
COMMENT ON COLUMN icredit.contacts_access.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.contacts_access.created IS 'Дата вставки записи';
COMMENT ON COLUMN icredit.contacts_access.created_by IS 'Кем вставлена запись';
COMMENT ON COLUMN icredit.contacts_access.last_updated IS 'Дата последней модификации записи';
COMMENT ON COLUMN icredit.contacts_access.last_updated_by IS 'кто последним модифицировал запись';
COMMENT ON COLUMN icredit.contacts_access.id_role IS 'роль, для которой действуют данные разрешения';
COMMENT ON COLUMN icredit.contacts_access.table_name IS 'Наименование таблицы, в которой расположено поле';
COMMENT ON COLUMN icredit.contacts_access.field_name IS 'ИД поля в таблице contacts_caption и вообще в таблице';
COMMENT ON COLUMN icredit.contacts_access.page_number IS 'Номер страницы, на которой будет выведен параметр';
COMMENT ON COLUMN icredit.contacts_access.group_number IS 'для группировки';
COMMENT ON COLUMN icredit.contacts_access.group_sorting IS 'Порядок следования группы';
COMMENT ON COLUMN icredit.contacts_access.sorting IS 'Порядок следования на странице';
COMMENT ON COLUMN icredit.contacts_access.field_view_type IS 'Параметр, который показывает тип обьекта для полей с выбором значений. Например РАДИОБАТОН, ВЫПАДАЮЩИЙ СПИСОК, СПИСОК МНОЖЕСТВЕННОГО выбора';
COMMENT ON COLUMN icredit.contacts_access.visible IS 'Видимость поля на экране';
COMMENT ON COLUMN icredit.contacts_access.ro IS 'Доступность к записи на экране';
