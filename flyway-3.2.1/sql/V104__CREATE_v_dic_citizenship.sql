-- View: icredit.v_dic_citizenship

-- DROP VIEW icredit.v_dic_citizenship;

CREATE OR REPLACE VIEW icredit.v_dic_citizenship AS 
 SELECT daf.id,
    daf.value,
    dv.name,
    dv.comment,
    dv.localisation
   FROM icredit.dic_citizenship daf,
    icredit.dic_values dv
  WHERE daf.id = dv.id;

ALTER TABLE icredit.v_dic_citizenship
  OWNER TO postgres;
COMMENT ON VIEW icredit.v_dic_citizenship
  IS 'ѕредставление обьедин€ющее справочник с наименовани€ми его значений в разных локализаци€х';
