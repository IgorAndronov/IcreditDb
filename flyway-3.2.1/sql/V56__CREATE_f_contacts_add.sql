-- Function: icredit.f_contacts_add(icredit.contacts, icredit.contacts_pwd)

-- DROP FUNCTION icredit.f_contacts_add(icredit.contacts, icredit.contacts_pwd);

CREATE OR REPLACE FUNCTION icredit.f_contacts_add(pi_contacts icredit.contacts, pi_contacts_pwd icredit.contacts_pwd)
  RETURNS integer AS
$BODY$
declare
 v_contact_id icredit.contacts.id%type;
BEGIN
 insert into icredit.contacts (created_by,last_updated_by,last_name,first_name,midle_name,residency,income_monthly,
			       income_family,employment_type,work_place,work_position,sex, education, date_birsday, 
			       married, family_count, id_tax,citizenship)
			values(pi_contacts.created_by,pi_contacts.last_updated_by,pi_contacts.last_name,pi_contacts.first_name,pi_contacts.midle_name,
				pi_contacts.residency ,pi_contacts.income_monthly ,pi_contacts.income_family  ,pi_contacts.employment_type ,
				pi_contacts.work_place  ,pi_contacts.work_position  ,pi_contacts.sex,pi_contacts.education,pi_contacts.date_birsday,
				pi_contacts.married, pi_contacts.family_count,pi_contacts.id_tax,pi_contacts.citizenship) RETURNING id into v_contact_id;
 insert into icredit.contacts_pwd (created_by ,last_updated_by,id_contact,login_name, pwd )
                            values(pi_contacts_pwd.created_by,pi_contacts_pwd.created_by,v_contact_id,pi_contacts_pwd.login,pi_contacts_pwd.pwd);
 RETURN v_contact_id;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION icredit.f_contacts_add(icredit.contacts, icredit.contacts_pwd)
  OWNER TO postgres;

-- Function: icredit.f_contacts_adress_add(icredit.contacts_adress)

-- DROP FUNCTION icredit.f_contacts_adress_add(icredit.contacts_adress);
