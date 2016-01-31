CREATE TABLE icredit.dic_table_for_v_contact_tech_sp (
  name VARCHAR(20),
  CONSTRAINT unq_dic_table_for_v_contact_tech_sp UNIQUE(name)
)
WITH (oids = false);

COMMENT ON TABLE icredit.dic_table_for_v_contact_tech_sp
IS 'This table nids for speed workin view v_contacts_www_tech_spec';

COMMENT ON COLUMN icredit.dic_table_for_v_contact_tech_sp.name
IS 'Table name';

INSERT INTO icredit.dic_table_for_v_contact_tech_sp ("name")
VALUES ('contacts');
INSERT INTO icredit.dic_table_for_v_contact_tech_sp ("name")
VALUES ('contacts_pwd');