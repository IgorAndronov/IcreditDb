-- View: icredit.v_dic_users_status

-- DROP VIEW icredit.v_dic_users_status;

CREATE OR REPLACE VIEW icredit.v_dic_users_status AS 
 SELECT daf.id,
    daf.value,
    dv.name,
    dv.comment,
    dv.localisation
   FROM icredit.dic_users_status daf,
    icredit.dic_values dv
  WHERE daf.id = dv.id;

ALTER TABLE icredit.v_dic_users_status
  OWNER TO postgres;
COMMENT ON VIEW icredit.v_dic_users_status
  IS 'ѕредставление обьедин€ющее справочник с наименовани€ми его значений в разных локализаци€х';
