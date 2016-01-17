-- View: icredit.v_dic_active_flag

-- DROP VIEW icredit.v_dic_active_flag;

CREATE OR REPLACE VIEW icredit.v_dic_active_flag AS 
 SELECT daf.id,
    daf.value,
    dv.name,
    dv.comment,
    dv.localisation
   FROM icredit.dic_active_flag daf,
    icredit.dic_values dv
  WHERE daf.id = dv.id;

ALTER TABLE icredit.v_dic_active_flag
  OWNER TO postgres;
COMMENT ON VIEW icredit.v_dic_active_flag
  IS 'ѕредставление обьедин€ющее справочник с наименовани€ми его значений в разных локализаци€х';
