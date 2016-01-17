-- Function: icredit.f_contact_ins(integer, character varying, character varying, character varying, boolean, integer, integer, integer, character varying, character varying, numeric, integer, date, boolean, integer, character varying, character varying, character varying, character varying)

-- DROP FUNCTION icredit.f_contact_ins(integer, character varying, character varying, character varying, boolean, integer, integer, integer, character varying, character varying, numeric, integer, date, boolean, integer, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION icredit.f_contact_ins(pi_created_by integer, pi_last_name character varying, pi_first_name character varying, pi_midle_name character varying, pi_residency boolean, pi_income_monthly integer, pi_income_family integer, pi_employment_type integer, pi_work_place character varying, pi_work_position character varying, pi_sex numeric, pi_education integer, pi_date_birsday date, pi_married boolean, pi_family_count integer, pi_id_tax character varying, pi_citizenship character varying, pi_login character varying, pi_pwd character varying)
  RETURNS numeric AS
$BODY$  
declare
v_contact_id_row numeric;
begin
insert into icredit.contacts (created_by , last_updated_by , last_name, first_name, midle_name, residency ,income_monthly ,income_family  ,employment_type ,work_place  ,work_position  ,
				sex, education, date_birsday, married, family_count, id_tax,citizenship)
               values(pi_created_by,pi_created_by,pi_last_name,pi_first_name,pi_midle_name,
			pi_residency ,pi_income_monthly ,pi_income_family  ,pi_employment_type ,pi_work_place  ,pi_work_position  ,
			pi_sex,pi_education,pi_date_birsday,pi_married,pi_family_count,pi_id_tax,pi_citizenship) RETURNING id_row into v_contact_id_row;

insert into icredit.contacts_pwd (created_by ,last_updated_by,id_contact,login_name, pwd )
               values(pi_created_by,pi_created_by,v_contact_id_row,pi_login,pi_pwd);
RETURN v_contact_id_row;
               
end;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION icredit.f_contact_ins(integer, character varying, character varying, character varying, boolean, integer, integer, integer, character varying, character varying, numeric, integer, date, boolean, integer, character varying, character varying, character varying, character varying)
  OWNER TO postgres;
