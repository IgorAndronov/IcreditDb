-- Sequence: icredit.seq_users

-- DROP SEQUENCE icredit.seq_users;

CREATE SEQUENCE icredit.seq_users
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2140000000
  START 1
  CACHE 1;
ALTER TABLE icredit.seq_users
  OWNER TO postgres;
COMMENT ON SEQUENCE icredit.seq_users
  IS 'Праймери ключ для таблицы seq_users';
