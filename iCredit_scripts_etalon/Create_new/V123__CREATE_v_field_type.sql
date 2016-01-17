-- View: icredit.v_field_type

-- DROP VIEW icredit.v_field_type;

CREATE OR REPLACE VIEW icredit.v_field_type AS 
 SELECT d.table_schema,
    d.table_name,
    d.column_name,
    d.data_type,
        CASE
            WHEN d.data_type::text = 'numeric'::text THEN d.numeric_precision::integer
            WHEN d.data_type::text = 'character'::text THEN d.character_maximum_length::integer
            WHEN d.data_type::text = 'character varying'::text THEN d.character_maximum_length::integer
            WHEN d.data_type::text = 'integer'::text THEN d.numeric_precision::integer
            ELSE NULL::integer
        END AS len,
    d.numeric_scale,
        CASE
            WHEN d.is_nullable::text = 'NO'::text THEN 'true'::text
            WHEN d.is_nullable::text = 'YES'::text THEN 'false'::text
            ELSE 'false'::text
        END AS mandatory,
    vd.dic_schema,
    vd.dic_name,
    vd.dic_column_name,
    d.is_nullable
   FROM information_schema.columns d
     LEFT JOIN icredit.v_dictionary vd ON d.table_name::text = vd.table_name::text AND d.table_schema::text = vd.table_schema::text AND d.column_name::text = vd.column_name::text
  WHERE d.table_schema::text = 'icredit'::text
  ORDER BY d.table_schema, d.table_name;

ALTER TABLE icredit.v_field_type
  OWNER TO postgres;
