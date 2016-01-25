-- View: icredit.v_dictionary

-- DROP VIEW icredit.v_dictionary;

CREATE OR REPLACE VIEW icredit.v_dictionary AS 
 SELECT b.table_name,
    b.column_name,
    b.table_schema,
    c.constraint_type,
    b.constraint_schema,
    b.constraint_name,
    p.unique_constraint_name,
    b.constraint_schema AS dic_schema,
    c1.table_name AS dic_name,
    b1.column_name AS dic_column_name
   FROM information_schema.referential_constraints p,
    information_schema.table_constraints c,
    information_schema.table_constraints c1,
    information_schema.key_column_usage b,
    information_schema.key_column_usage b1
  WHERE c.constraint_name::text = b.constraint_name::text AND b.table_schema::text = 'icredit'::text AND b.table_schema::text = c.table_schema::text AND b.constraint_schema::text = p.constraint_schema::text AND b.constraint_name::text = p.constraint_name::text AND p.constraint_schema::text = c1.constraint_schema::text AND p.unique_constraint_name::text = c1.constraint_name::text AND b1.constraint_name::text = p.unique_constraint_name::text AND b1.constraint_schema::text = p.constraint_schema::text AND b1.table_name::text = c1.table_name::text;

ALTER TABLE icredit.v_dictionary
  OWNER TO postgres;
COMMENT ON VIEW icredit.v_dictionary
  IS 'представление, которе дает зависимость колонки таблицы от справочника';
