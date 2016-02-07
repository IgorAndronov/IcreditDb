CREATE TABLE icredit.contacts_page_number_access (
  id INTEGER DEFAULT nextval('icredit.seq_contacts_page_number_access'::regclass) NOT NULL,
  created TIMESTAMP WITHOUT TIME ZONE DEFAULT now() NOT NULL,
  created_by INTEGER DEFAULT 1 NOT NULL,
  last_updated TIMESTAMP WITHOUT TIME ZONE DEFAULT now() NOT NULL,
  last_updated_by INTEGER DEFAULT 1 NOT NULL,
  id_role INTEGER NOT NULL,
  page_number INTEGER  NOT NULL,

   page_sorting INTEGER NOT NULL,
   field_view_type VARCHAR(10) DEFAULT 0 NOT NULL,
  visible BOOLEAN DEFAULT false NOT NULL,
  ro BOOLEAN DEFAULT true NOT NULL,
  CONSTRAINT pk_contacts_page_number_access PRIMARY KEY(id),
  CONSTRAINT unq_contacts_page_number_access UNIQUE(id_role, page_number),
  CONSTRAINT fk_contacts_page_number_access_to_created_by FOREIGN KEY (created_by)
    REFERENCES icredit.users(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE,
  CONSTRAINT fk_contacts_page_number_access_to_group_number FOREIGN KEY (page_number)
    REFERENCES icredit.dic_contacts_page_number(value)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE,
  CONSTRAINT fk_contacts_page_number_access_to_lb_by FOREIGN KEY (last_updated_by)
    REFERENCES icredit.users(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE,
  CONSTRAINT fk_contacts_page_number_access_to_list_type FOREIGN KEY (field_view_type)
    REFERENCES icredit.dic_field_view_type(value)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE
)
WITH (oids = false);


COMMENT ON COLUMN icredit.contacts_page_number_access.page_sorting
IS 'Сортировка';

COMMENT ON TABLE icredit.contacts_page_number_access
IS 'Таблица глобальных параметров и разрешений системы для соступа к данным клиентов';

COMMENT ON COLUMN icredit.contacts_page_number_access.id
IS 'Уникальный идентификатор записи в таблице';

COMMENT ON COLUMN icredit.contacts_page_number_access.created
IS 'Дата вставки записи';

COMMENT ON COLUMN icredit.contacts_page_number_access.created_by
IS 'Кем вставлена запись';

COMMENT ON COLUMN icredit.contacts_page_number_access.last_updated
IS 'Дата последней модификации записи';

COMMENT ON COLUMN icredit.contacts_page_number_access.last_updated_by
IS 'кто последним модифицировал запись';

COMMENT ON COLUMN icredit.contacts_page_number_access.id_role
IS 'роль, для которой действуют данные разрешения';

COMMENT ON COLUMN icredit.contacts_page_number_access.page_number
IS 'Номер страницы, на которой будет выведен параметр,НО если параметр входит в тип TABLE, то его номер страници расчитывается отдельно, в контексте нового обьекта TABLE.';


COMMENT ON COLUMN icredit.contacts_page_number_access.field_view_type
IS 'Параметр, который показывает тип обьекта для полей с выбором значений. Например РАДИОБАТОН, ВЫПАДАЮЩИЙ СПИСОК, СПИСОК МНОЖЕСТВЕННОГО выбора';

COMMENT ON COLUMN icredit.contacts_page_number_access.visible
IS 'Видимость поля на экране';

COMMENT ON COLUMN icredit.contacts_block_access.ro
IS 'Доступность к записи на экране';