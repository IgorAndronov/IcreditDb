-- Table: icredit.dic_contacts_page_number

-- DROP TABLE icredit.dic_contacts_page_number;

CREATE TABLE icredit.dic_contacts_page_number
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Номер страницы в личном кабинете для контактных данных
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0

  CONSTRAINT pk_dic_contacts_page_number PRIMARY KEY (id), -- Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_contacts_page_number UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_contacts_page_number
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_contacts_page_number
  IS 'Справочник страниц персональных данных в личном кабинете ';
COMMENT ON COLUMN icredit.dic_contacts_page_number.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_contacts_page_number.value IS 'Номер страницы в личном кабинете для контактных данных';
COMMENT ON COLUMN icredit.dic_contacts_page_number.active IS 'Статус записи- актуальный: 1- не актуальный: 0';

COMMENT ON CONSTRAINT pk_dic_contacts_page_number ON icredit.dic_contacts_page_number IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_contacts_page_number ON icredit.dic_contacts_page_number IS 'Ограничение уникальности значения записи в таблице';
