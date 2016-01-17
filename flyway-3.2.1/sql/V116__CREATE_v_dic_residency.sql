-- View: icredit.v_dic_residency

-- DROP VIEW icredit.v_dic_residency;

CREATE OR REPLACE VIEW icredit.v_dic_residency AS 
 SELECT daf.id,
    daf.value,
    dv.name,
    dv.comment,
    dv.localisation
   FROM icredit.dic_residency daf,
    icredit.dic_values dv
  WHERE daf.id = dv.id;

ALTER TABLE icredit.v_dic_residency
  OWNER TO postgres;
COMMENT ON VIEW icredit.v_dic_residency
  IS 'ѕредставление обьедин€ющее справочник с наименовани€ми его значений в разных локализаци€х';
