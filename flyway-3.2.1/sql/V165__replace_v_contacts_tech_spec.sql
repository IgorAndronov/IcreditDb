drop view icredit.v_contacts_tech_spec;
--------------- SQL ---------------
--------------- SQL ---------------

CREATE OR REPLACE VIEW icredit.v_contacts_tech_spec(
    table_schema,
    table_name,
    column_name,
    id_role,
    caption_name,
    localisation,
    data_type,
    len,
    numeric_scale,
    mandatory,
    dic_name_r,
    visible,
    read_only,
    page_number,
    group_number,
    group_sorting,
    sorting,
    field_view_type,
    repeated,
    depends_type)
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
         f_sel.group_number,
         f_sel.group_sorting,
         f_sel.sorting,
         f_sel.field_view_type,
         false AS repeated,
         CASE
           WHEN vdwr.dic_column_name IS NOT NULL AND vdwr_s.column_name IS NULL
             THEN 'primary'::text
           WHEN vdwr.dic_column_name IS NOT NULL AND vdwr_s.column_name IS NOT
             NULL OR vdwr.dic_column_name IS NULL AND vdwr_s.column_name IS NOT
             NULL THEN 'secondary'::text
           ELSE 'none'::text
         END AS depends_type
  FROM (
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
                  WHEN vft.dic_name::text ~~ 'dic%'::text THEN ('v_'::text ||
                    vft.dic_name::text)::character varying
                  ELSE vft.dic_name::character varying
                END AS dic_name_r,
                CASE
                  WHEN ds.field_name IS NOT NULL THEN 'false'::text
                  WHEN ca.visible IS NOT NULL THEN ca.visible::text
                  ELSE 'false'::text
                END AS visible,
                CASE
                  WHEN ds.field_name IS NOT NULL THEN 'true'::text
                  WHEN ca.ro IS NOT NULL THEN ca.ro::text
                  ELSE 'true'::text
                END AS read_only,
                ca.page_number,
                ca.group_number,
                rgp.sorting AS group_sorting,
                ca.sorting,
                vft.dic_schema,
                vft.dic_column_name,
                COALESCE(ca.field_view_type, 'simple'::character varying) AS
                  field_view_type
         FROM icredit.relation_group_n_to_page_n rgp,
              icredit.dic_table_for_v_contact_tech_sp dtf_ct,
              icredit.v_field_type vft
              LEFT JOIN icredit.dic_systems_fields ds ON vft.column_name::bpchar
                = ds.field_name::bpchar
              LEFT JOIN icredit.contacts_access ca ON vft.column_name::bpchar =
                ca.field_name::bpchar AND vft.table_name::bpchar = ca.table_name
                ::bpchar
         WHERE vft.table_name::text = dtf_ct.name::text AND
               ca.group_number = rgp.contact_block_number AND
               ca.page_number = rgp.contact_page_number
       ) f_sel
       LEFT JOIN icredit.contacts_caption cc ON f_sel.column_name::bpchar =
         cc.field_name::bpchar AND f_sel.table_name::bpchar = cc.table_name::
         bpchar
       LEFT JOIN icredit.dic_localisation dl ON cc.localisation::text = dl.value
         ::text
       LEFT JOIN
       (
         SELECT DISTINCT n.table_schema,
                n.table_name,
                n.column_name
         FROM icredit.v_dictionary_with_reffieldname n
       ) vdwr_s ON f_sel.dic_schema::text = vdwr_s.table_schema::text AND
         f_sel.dic_name::text = vdwr_s.table_name::text
       LEFT JOIN
       (
         SELECT DISTINCT v_dictionary_with_reffieldname.dic_schema,
                v_dictionary_with_reffieldname.dic_name,
                v_dictionary_with_reffieldname.dic_column_name
         FROM icredit.v_dictionary_with_reffieldname
       ) vdwr ON f_sel.dic_schema::text = vdwr.dic_schema::text AND
         f_sel.dic_name::text = vdwr.dic_name::text AND f_sel.dic_column_name::
         text = vdwr.dic_column_name::text
  WHERE NOT (EXISTS (
                      SELECT NULL::unknown AS unknown
                      FROM icredit.dic_systems_fields dsf
                      WHERE btrim(f_sel.column_name::text) = btrim(
                        dsf.field_name::text)
        ))
  UNION
  SELECT vft.table_schema,
         ff.table_name,
         NULL::character varying AS column_name,
         ff.id_role,
         vf.name AS caption_name,
         vf.localisation,
         NULL::character varying AS data_type,
         NULL::integer AS len,
         NULL::integer AS numeric_scale,
         CASE
           WHEN vf.mandatory IS TRUE THEN true::text
           WHEN vf.mandatory IS FALSE THEN false::text
           ELSE false::text
         END AS mandatory,
         ('v_'::text || ff.table_name::text) || '_tech_spec'::text AS dic_name_r
  ,
         CASE
           WHEN ff.visible IS TRUE THEN true::text
           WHEN ff.visible IS FALSE THEN false::text
           ELSE false::text
         END AS visible,
         CASE
           WHEN ff.ro IS TRUE THEN true::text
           WHEN ff.ro IS FALSE THEN false::text
           ELSE false::text
         END AS read_only,
         ff.page_number,
         0 AS group_number,
         0 AS group_sorting,
         ff.sorting,
         ff.field_view_type,
         vf.repeated,
         'none'::text AS depends_type
  FROM icredit.v_dic_name_contacts_block vf,
       icredit.contacts_access ff,
       (
         SELECT DISTINCT v_field_type.table_schema,
                v_field_type.table_name
         FROM icredit.v_field_type
         WHERE (v_field_type.table_name::text = 'contacts_adress'::text OR
               v_field_type.table_name::text = 'contacts_www'::text OR
               v_field_type.table_name::text = 'contacts_phones'::text OR
               v_field_type.table_name::text = 'contacts_documents'::text) AND
               v_field_type.table_schema::text = 'icredit'::text
       ) vft
  WHERE ff.table_name::text = vft.table_name::text AND
        vf.value = ff.group_number AND
        ff.field_view_type::text = 'table'::text
  ORDER BY 14,
           15,
           1,
           2,
           6,
           3;