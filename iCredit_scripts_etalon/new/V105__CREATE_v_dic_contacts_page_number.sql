
-- View: icredit.v_dic_contacts_page_number

-- DROP VIEW icredit.v_dic_contacts_page_number;

CREATE OR REPLACE VIEW icredit.v_dic_contacts_page_number AS 
 SELECT daf.id,
    daf.value,
    dv.name,
    dv.comment,
    dv.localisation
   FROM icredit.dic_contacts_page_number daf,
    icredit.dic_values dv
  WHERE daf.id = dv.id;

ALTER TABLE icredit.v_dic_contacts_page_number
  OWNER TO postgres;
COMMENT ON VIEW icredit.v_dic_contacts_page_number
  IS '������������� ������������ ���������� � �������������� ��� �������� � ������ ������������';
