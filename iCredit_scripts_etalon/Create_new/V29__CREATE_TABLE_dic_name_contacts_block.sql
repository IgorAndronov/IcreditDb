-- Table: icredit.dic_name_contacts_block

-- DROP TABLE icredit.dic_name_contacts_block;

CREATE TABLE icredit.dic_name_contacts_block
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_dictionaries'::regclass), -- Уникальный идентификатор записи в таблице
  value integer NOT NULL, -- Номер блока в личном кабинете для контактных данных
  active integer NOT NULL DEFAULT 1, -- Статус записи- актуальный: 1- не актуальный: 0
  mandatory boolean NOT NULL DEFAULT true, -- свойство параметра-обязательность наличия
  repeated boolean DEFAULT true, -- Свойство блока - повторяемость
  CONSTRAINT pk_dic_name_contacts_block PRIMARY KEY (id), -- Уникальный идентификатор записи в таблице
  CONSTRAINT unq_dic_name_contacts_block UNIQUE (value) -- Ограничение уникальности значения записи в таблице
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.dic_name_contacts_block
  OWNER TO postgres;
COMMENT ON TABLE icredit.dic_name_contacts_block
  IS 'Справочник наименований блоков, на которые делится страница с клиентскими данными';
COMMENT ON COLUMN icredit.dic_name_contacts_block.id IS 'Уникальный идентификатор записи в таблице';
COMMENT ON COLUMN icredit.dic_name_contacts_block.value IS 'Номер блока в личном кабинете для контактных данных';
COMMENT ON COLUMN icredit.dic_name_contacts_block.active IS 'Статус записи- актуальный: 1- не актуальный: 0';
COMMENT ON COLUMN icredit.dic_name_contacts_block.mandatory IS 'свойство параметра-обязательность наличия, это значит, что клиент обязательно должен этот блок заполнить, хотябы один раз.';
COMMENT ON COLUMN icredit.dic_name_contacts_block.repeated IS 'Свойство блока - повторяемость, это значит, что данных блоков может быть больше одного';

COMMENT ON CONSTRAINT pk_dic_name_contacts_block ON icredit.dic_name_contacts_block IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT unq_dic_name_contacts_block ON icredit.dic_name_contacts_block IS 'Ограничение уникальности значения записи в таблице';