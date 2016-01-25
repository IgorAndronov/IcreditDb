ALTER TABLE icredit.system_parameters
  ADD COLUMN dic_name VARCHAR(50);

COMMENT ON COLUMN icredit.system_parameters.dic_name
IS 'Name VIEW_dictionary , wich use this field';



ALTER TABLE icredit.system_parameters
  ALTER COLUMN type_par TYPE VARCHAR(20) COLLATE pg_catalog."default";

  ALTER TABLE icredit.system_parameters
  ADD COLUMN group_name INTEGER;

ALTER TABLE icredit.system_parameters
  ALTER COLUMN group_name SET DEFAULT 1;

COMMENT ON COLUMN icredit.system_parameters.group_name
IS 'The name of the group that includes the parametr';

ALTER TABLE icredit.system_parameters
  ADD CONSTRAINT fk_system_parameters FOREIGN KEY (group_name)
    REFERENCES icredit.dic_group_name_sys_par(value)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY IMMEDIATE;