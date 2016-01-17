CREATE TABLE icredit.dic_group_name_sys_par (
  id INTEGER DEFAULT nextval('icredit.seq_dictionaries'::regclass) NOT NULL,
  value INTEGER NOT NULL,
  active INTEGER DEFAULT 1 NOT NULL,

  CONSTRAINT pk_dic_group_name_sys_par PRIMARY KEY(id),
  CONSTRAINT unq_dic_group_name_sys_par UNIQUE(value)
)
WITH (oids = false);

COMMENT ON TABLE icredit.dic_group_name_sys_par
IS 'Reference name of the group, for the table system_parameters';

COMMENT ON COLUMN icredit.dic_group_name_sys_par.id
IS 'The unique ID table entries';

COMMENT ON COLUMN icredit.dic_group_name_sys_par.value
IS 'Group number in table system_parameters';

COMMENT ON COLUMN icredit.dic_group_name_sys_par.active
IS 'Status Record- Active: 1- NOT Active: 0';

COMMENT ON CONSTRAINT pk_dic_group_name_sys_par ON icredit.dic_group_name_sys_par
IS 'The unique ID table entries';

COMMENT ON CONSTRAINT unq_dic_group_name_sys_par ON icredit.dic_group_name_sys_par
IS 'A unique constraint record values in the table';