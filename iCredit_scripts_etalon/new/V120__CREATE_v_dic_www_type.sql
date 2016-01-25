-- View: icredit.v_dic_www_type

-- DROP VIEW icredit.v_dic_www_type;

CREATE OR REPLACE VIEW icredit.v_dic_www_type AS 
 SELECT daf.id,
    daf.value,
    dv.name,
    dv.comment,
    dv.localisation
   FROM icredit.dic_www_type daf,
    icredit.dic_values dv
  WHERE daf.id = dv.id;

ALTER TABLE icredit.v_dic_www_type
  OWNER TO postgres;
COMMENT ON VIEW icredit.v_dic_www_type
  IS '������������� ������������ ���������� � �������������� ��� �������� � ������ ������������';
