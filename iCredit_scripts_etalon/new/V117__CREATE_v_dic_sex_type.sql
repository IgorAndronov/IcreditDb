-- View: icredit.v_dic_sex_type

-- DROP VIEW icredit.v_dic_sex_type;

CREATE OR REPLACE VIEW icredit.v_dic_sex_type AS 
 SELECT daf.id,
    daf.value,
    dv.name,
    dv.comment,
    dv.localisation
   FROM icredit.dic_sex_type daf,
    icredit.dic_values dv
  WHERE daf.id = dv.id;

ALTER TABLE icredit.v_dic_sex_type
  OWNER TO postgres;
COMMENT ON VIEW icredit.v_dic_sex_type
  IS '������������� ������������ ���������� � �������������� ��� �������� � ������ ������������';
