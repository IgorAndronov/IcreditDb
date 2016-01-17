-- View: icredit.v_dic_field_view_type

-- DROP VIEW icredit.v_dic_field_view_type;

CREATE OR REPLACE VIEW icredit.v_dic_field_view_type AS 
 SELECT daf.id,
    daf.value,
    dv.name,
    dv.comment,
    dv.localisation
   FROM icredit.dic_field_view_type daf,
    icredit.dic_values dv
  WHERE daf.id = dv.id;

ALTER TABLE icredit.v_dic_field_view_type
  OWNER TO postgres;
COMMENT ON VIEW icredit.v_dic_field_view_type
  IS 'ѕредставление обьедин€ющее справочник с наименовани€ми его значений в разных локализаци€х';
