--
-- Definition for view v_contacts_www_tech_spec (OID = 60066) : 
--
CREATE VIEW icredit.v_contacts_www_tech_spec
AS
SELECT f_sel.table_schema,
    f_sel.table_name,
    f_sel.column_name,
    f_sel.id_role,
    cc.caption_name,
    dl.value AS localisation,
    f_sel.data_type,
    f_sel.len,
    f_sel.numeric_scale,
    f_sel.mandatory,
    f_sel.dic_name_r,
    f_sel.visible,
    f_sel.read_only,
    f_sel.page_number,
    f_sel.sorting,
    f_sel.group_number,
    f_sel.group_sorting,
    f_sel.field_view_type,
        CASE
            WHEN ((vdwr.dic_column_name IS NOT NULL) AND
                (vdwr_s.column_name IS NULL)) THEN 'primary'::text
            WHEN (((vdwr.dic_column_name IS NOT NULL) AND
                (vdwr_s.column_name IS NOT NULL)) OR ((vdwr.dic_column_name IS NULL) AND (vdwr_s.column_name IS NOT NULL))) THEN 'secondary'::text
            ELSE 'none'::text
        END AS depends_type
FROM (((((
    SELECT vft.table_schema,
            vft.table_name,
            vft.column_name,
            ca.id_role,
            vft.data_type,
            vft.len,
            vft.numeric_scale,
            vft.mandatory,
            vft.dic_name,
                CASE
                    WHEN ((vft.dic_name)::text ~~ 'dic%'::text) THEN
                        (('v_'::text || (vft.dic_name)::text))::character varying
                    ELSE (vft.dic_name)::character varying
                END AS dic_name_r,
                CASE
                    WHEN (ds.field_name IS NOT NULL) THEN 'false'::text
                    WHEN (ca.visible IS NOT NULL) THEN (ca.visible)::text
                    ELSE 'false'::text
                END AS visible,
                CASE
                    WHEN (ds.field_name IS NOT NULL) THEN 'true'::text
                    WHEN (ca.ro IS NOT NULL) THEN (ca.ro)::text
                    ELSE 'true'::text
                END AS read_only,
            ca.page_number,
            ca.sorting,
            ca.group_number,
            ca.group_sorting,
            vft.dic_schema,
            vft.dic_column_name,
            COALESCE(ca.field_view_type, 'simple'::character varying) AS
                field_view_type
    FROM ((icredit.v_field_type vft
      LEFT JOIN icredit.dic_systems_fields ds ON (((vft.column_name)::bpchar =
          (ds.field_name)::bpchar)))
   LEFT JOIN icredit.contacts_access ca ON ((((vft.column_name)::bpchar =
       (ca.field_name)::bpchar) AND ((vft.table_name)::bpchar = (ca.table_name)::bpchar))))
    WHERE ((vft.table_name)::text = 'contacts_www'::text)
    ) f_sel
   LEFT JOIN icredit.contacts_caption cc ON ((((f_sel.column_name)::bpchar =
       (cc.field_name)::bpchar) AND ((f_sel.table_name)::bpchar = (cc.table_name)::bpchar))))
   LEFT JOIN icredit.dic_localisation dl ON (((cc.localisation)::text = (dl.value)::text)))
   LEFT JOIN (
    SELECT DISTINCT n.table_schema,
    n.table_name,
    n.column_name
    FROM icredit.v_dictionary_with_reffieldname n
    ) vdwr_s ON ((((f_sel.dic_schema)::text = (vdwr_s.table_schema)::text)
        AND ((f_sel.dic_name)::text = (vdwr_s.table_name)::text))))
   LEFT JOIN (
    SELECT DISTINCT v_dictionary_with_reffieldname.dic_schema,
    v_dictionary_with_reffieldname.dic_name,
    v_dictionary_with_reffieldname.dic_column_name
    FROM icredit.v_dictionary_with_reffieldname
    ) vdwr ON (((((f_sel.dic_schema)::text = (vdwr.dic_schema)::text) AND
        ((f_sel.dic_name)::text = (vdwr.dic_name)::text)) AND ((f_sel.dic_column_name)::text = (vdwr.dic_column_name)::text))))
WHERE (NOT (EXISTS (
    SELECT NULL::unknown AS unknown
    FROM icredit.dic_systems_fields dsf
    WHERE (btrim((f_sel.column_name)::text) = btrim((dsf.field_name)::text))
    )))
ORDER BY f_sel.page_number, f_sel.sorting, f_sel.table_schema,
    f_sel.table_name, cc.localisation, f_sel.column_name;
