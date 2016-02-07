CREATE TABLE icredit.contacts_block_access (
  id INTEGER DEFAULT nextval('icredit.seq_contacts_block_access'::regclass) NOT NULL,
  created TIMESTAMP WITHOUT TIME ZONE DEFAULT now() NOT NULL,
  created_by INTEGER DEFAULT 1 NOT NULL,
  last_updated TIMESTAMP WITHOUT TIME ZONE DEFAULT now() NOT NULL,
  last_updated_by INTEGER DEFAULT 1 NOT NULL,
  id_role INTEGER NOT NULL,
  page_number INTEGER DEFAULT 1 NOT NULL,
  group_number INTEGER DEFAULT 1 NOT NULL,
  group_sorting INTEGER DEFAULT 1 NOT NULL,
  field_view_type VARCHAR(10) DEFAULT 0 NOT NULL,
  visible BOOLEAN DEFAULT false NOT NULL,
  ro BOOLEAN DEFAULT true NOT NULL,
  CONSTRAINT pk_contacts_block_access PRIMARY KEY(id),
  CONSTRAINT unq_contacts_block_access UNIQUE(id_role, group_number),
  CONSTRAINT fk_contacts_block_access_to_created_by FOREIGN KEY (created_by)
    REFERENCES icredit.users(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE,
  CONSTRAINT fk_contacts_block_access_to_group_number FOREIGN KEY (group_number)
    REFERENCES icredit.dic_name_contacts_block(value)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE,
  CONSTRAINT fk_contacts_block_access_to_lb_by FOREIGN KEY (last_updated_by)
    REFERENCES icredit.users(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE,
  CONSTRAINT fk_contacts_block_access_to_list_type FOREIGN KEY (field_view_type)
    REFERENCES icredit.dic_field_view_type(value)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE
)
WITH (oids = false);

COMMENT ON TABLE icredit.contacts_block_access
IS 'Таблица глобальных параметров и разрешений системы для соступа к данным клиентов';

COMMENT ON COLUMN icredit.contacts_block_access.id
IS 'Уникальный идентификатор записи в таблице';

COMMENT ON COLUMN icredit.contacts_block_access.created
IS 'Дата вставки записи';

COMMENT ON COLUMN icredit.contacts_block_access.created_by
IS 'Кем вставлена запись';

COMMENT ON COLUMN icredit.contacts_block_access.last_updated
IS 'Дата последней модификации записи';

COMMENT ON COLUMN icredit.contacts_block_access.last_updated_by
IS 'кто последним модифицировал запись';

COMMENT ON COLUMN icredit.contacts_block_access.id_role
IS 'роль, для которой действуют данные разрешения';

COMMENT ON COLUMN icredit.contacts_block_access.page_number
IS 'Номер страницы, на которой будет выведен параметр,НО если параметр входит в тип TABLE, то его номер страници расчитывается отдельно, в контексте нового обьекта TABLE.';

COMMENT ON COLUMN icredit.contacts_block_access.group_number
IS 'для группировки выводимых полей в блоки. Т.е на экране выводится именоыаный блок и в него включаются поля для вывода';

COMMENT ON COLUMN icredit.contacts_block_access.group_sorting
IS 'Порядок следования группы на странице';

COMMENT ON COLUMN icredit.contacts_access.field_view_type
IS 'Параметр, который показывает тип обьекта для полей с выбором значений. Например РАДИОБАТОН, ВЫПАДАЮЩИЙ СПИСОК, СПИСОК МНОЖЕСТВЕННОГО выбора';

COMMENT ON COLUMN icredit.contacts_block_access.visible
IS 'Видимость поля на экране';

COMMENT ON COLUMN icredit.contacts_block_access.ro
IS 'Доступность к записи на экране';