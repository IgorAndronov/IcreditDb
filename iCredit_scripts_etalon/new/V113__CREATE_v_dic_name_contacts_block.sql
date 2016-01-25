-- View: icredit.v_dic_name_contacts_block

-- DROP VIEW icredit.v_dic_name_contacts_block;

CREATE OR REPLACE VIEW icredit.v_dic_name_contacts_block AS 
 SELECT daf.id,
    daf.value,
    dv.name,
    dv.comment,
    dv.localisation,
    daf.mandatory,
    daf.repeated
   FROM icredit.dic_name_contacts_block daf,
    icredit.dic_values dv
  WHERE daf.id = dv.id;

ALTER TABLE icredit.v_dic_name_contacts_block
  OWNER TO postgres;
COMMENT ON VIEW icredit.v_dic_name_contacts_block
  IS 'ѕредставление обьедин€ющее справочник с наименовани€ми его значений в разных локализаци€х';
