-- Table: icredit.contacts_adress

-- DROP TABLE icredit.contacts_adress;

CREATE TABLE icredit.contacts_adress
(
  id integer NOT NULL DEFAULT nextval('icredit.seq_contacts_adress'::regclass), -- Уникальный идентификатор записи
  created timestamp without time zone NOT NULL DEFAULT now(), -- Дата вставки записи
  created_by integer NOT NULL, -- Кем вставлена запись
  last_updated timestamp without time zone NOT NULL DEFAULT now(), -- Дата последней модификации записи
  last_updated_by integer NOT NULL, -- кто последним модифицировал запись
  id_contact integer NOT NULL, -- Id_row записи заемщика из t_contacts
  area integer NOT NULL, -- Область прописки
  district integer NOT NULL, -- Район прописки
  city character varying(30) NOT NULL, -- Населенный пункт прописки
  post_index numeric(6,0) NOT NULL, -- Индекс прописки
  street_type integer NOT NULL, -- Тип улицы
  street character varying(30) NOT NULL, -- Название улицы
  house character varying(10) NOT NULL, -- Номер дома
  corp character varying(5), -- Номер корпуса
  flat character varying(4), -- Номер квартиры
  address_type integer NOT NULL, -- Тип адреса
  active integer NOT NULL, -- Статус документа...
  city_type integer NOT NULL, -- тип населенного пункта

  CONSTRAINT pk_contacts_adress PRIMARY KEY (id),
  CONSTRAINT fk_contacts_adress_to_active_flag FOREIGN KEY (active)
      REFERENCES icredit.dic_active_flag (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_address_type FOREIGN KEY (address_type)
      REFERENCES icredit.dic_address_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_area FOREIGN KEY (area)
      REFERENCES icredit.dic_area_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_contacts FOREIGN KEY (id_contact)
      REFERENCES icredit.contacts (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_contacts_adress_to_created_by FOREIGN KEY (created_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_cyty_type FOREIGN KEY (city_type)
      REFERENCES icredit.dic_place_type (value) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION, -- Внешний ключ на типы населенных пунктов
  CONSTRAINT fk_contacts_adress_to_district FOREIGN KEY (district)
      REFERENCES icredit.dic_district_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_lb_by FOREIGN KEY (last_updated_by)
      REFERENCES icredit.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_contacts_adress_to_street_type FOREIGN KEY (street_type)
      REFERENCES icredit.dic_street_type (value) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE icredit.contacts_adress
  OWNER TO postgres;
COMMENT ON TABLE icredit.contacts_adress
  IS 'Адреса заемщиков';
COMMENT ON COLUMN icredit.contacts_adress.id IS 'Уникальный идентификатор записи';
COMMENT ON COLUMN icredit.contacts_adress.created IS 'Дата вставки записи';
COMMENT ON COLUMN icredit.contacts_adress.created_by IS 'Кем вставлена запись';
COMMENT ON COLUMN icredit.contacts_adress.last_updated IS 'Дата последней модификации записи';
COMMENT ON COLUMN icredit.contacts_adress.last_updated_by IS 'кто последним модифицировал запись';
COMMENT ON COLUMN icredit.contacts_adress.id_contact IS 'Id_row записи заемщика из t_contacts ';
COMMENT ON COLUMN icredit.contacts_adress.area IS 'Область прописки';
COMMENT ON COLUMN icredit.contacts_adress.district IS 'Район прописки';
COMMENT ON COLUMN icredit.contacts_adress.city IS 'Населенный пункт прописки';
COMMENT ON COLUMN icredit.contacts_adress.post_index IS 'Индекс прописки';
COMMENT ON COLUMN icredit.contacts_adress.street_type IS 'Тип улицы';
COMMENT ON COLUMN icredit.contacts_adress.street IS 'Название улицы';
COMMENT ON COLUMN icredit.contacts_adress.house IS 'Номер дома';
COMMENT ON COLUMN icredit.contacts_adress.corp IS 'Номер корпуса';
COMMENT ON COLUMN icredit.contacts_adress.flat IS 'Номер квартиры';
COMMENT ON COLUMN icredit.contacts_adress.address_type IS 'Тип адреса';
COMMENT ON COLUMN icredit.contacts_adress.active IS 'Статус документа
- актуальный: 1
- не актуальный: 0
';
COMMENT ON COLUMN icredit.contacts_adress.city_type IS 'тип населенного пункта';

COMMENT ON CONSTRAINT pk_contacts_adress ON icredit.contacts_adress IS 'Уникальный идентификатор записи в таблице';
COMMENT ON CONSTRAINT fk_contacts_adress_to_cyty_type ON icredit.contacts_adress IS 'Внешний ключ на типы населенных пунктов icredit.dic_place_type';
COMMENT ON CONSTRAINT fk_contacts_adress_to_active_flag ON icredit.contacts_adress IS 'Внешний ключ на icredit.dic_active_flag ';
COMMENT ON CONSTRAINT fk_contacts_adress_to_address_type ON icredit.contacts_adress IS 'Внешний ключ на типы адресов icredit.dic_address_type ';
COMMENT ON CONSTRAINT fk_contacts_adress_to_area ON icredit.contacts_adress IS 'Внешний ключ на типы областей icredit.dic_area_type icredit.dic_area_type';
COMMENT ON CONSTRAINT fk_contacts_adress_to_contacts ON icredit.contacts_adress IS 'Внешний ключ основную таблицу с ИД клиента icredit.contacts';
COMMENT ON CONSTRAINT fk_contacts_adress_to_created_by ON icredit.contacts_adress IS 'Внешний ключ основную таблицу с пользователями icredit.users';
COMMENT ON CONSTRAINT fk_contacts_adress_to_lb_by ON icredit.contacts_adress IS 'Внешний ключ основную таблицу с пользователями icredit.users';
COMMENT ON CONSTRAINT fk_contacts_adress_to_street_type ON icredit.contacts_adress IS 'Внешний ключ на таблицу типов улиц icredit.dic_street_type ';
COMMENT ON CONSTRAINT fk_contacts_adress_to_district  ON icredit.contacts_adress IS 'Внешний ключ на таблицу районов в областях icredit.dic_district_type ';