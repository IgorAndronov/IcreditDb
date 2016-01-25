-- View: icredit.v_dic_dictionary

-- DROP VIEW icredit.v_dic_dictionary;

CREATE OR REPLACE VIEW icredit.v_dic_dictionary AS 
 SELECT daf.id,
    daf.value,
    dv.name,
    dv.comment,
    dv.localisation
   FROM icredit.dic_dictionary daf,
    icredit.dic_values dv
  WHERE daf.id = dv.id;

ALTER TABLE icredit.v_dic_dictionary
  OWNER TO postgres;
COMMENT ON VIEW icredit.v_dic_dictionary
  IS 'ѕредставление обьедин€ющее справочник с наименовани€ми его значений в разных локализаци€х';