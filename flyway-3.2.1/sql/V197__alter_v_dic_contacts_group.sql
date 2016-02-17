--ALTER VIEW icredit.v_dic_name_contacts_block
--  RENAME TO v_dic_contacts_group;

  DROP VIEW icredit.v_dic_contacts_group;

CREATE or REPLACE VIEW icredit.v_dic_contacts_group (
    id,
    value,
    name,
    comment,
    localisation,
    mandatory)
AS
SELECT daf.id,
    daf.value,
    dv.name,
    dv.comment,
    dv.localisation,
    daf.mandatory
FROM icredit.dic_contacts_group daf,
    icredit.dic_values dv
WHERE daf.id = dv.id;

COMMENT ON VIEW icredit.v_dic_contacts_group
IS 'Представление обьединяющее справочник с наименованиями его значений в разных локализациях';



