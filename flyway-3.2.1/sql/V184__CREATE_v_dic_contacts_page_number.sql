CREATE OR REPLACE VIEW icredit.v_dic_contacts_page_number(
    id,
    value,
    name,
    comment,
    localisation,
    parent_id
    )
AS
  SELECT daf.id,  daf.value,  dv.name,  dv.comment,  dv.localisation,
     daf.parent_id  FROM icredit.dic_contacts_page_number daf,  icredit.dic_values
    dv  WHERE daf.id = dv.id;