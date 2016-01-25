-- Function: icredit.f_contacts_adress_add(icredit.contacts_adress)

-- DROP FUNCTION icredit.f_contacts_adress_add(icredit.contacts_adress);

CREATE OR REPLACE FUNCTION icredit.f_contacts_adress_add(pi_contacts_adress icredit.contacts_adress)
  RETURNS integer AS
$BODY$
declare
 v_id icredit.contacts.id%type;
BEGIN
 insert into icredit.contacts_adress (created_by ,last_updated_by,id_contact,area ,district ,city,post_index,street_type,
				street,house,corp,flat,address_type, active )
			values(pi_contacts_adress.created_by ,pi_contacts_adress.last_updated_by,pi_contacts_adress.id_contact,
			pi_contacts_adress.area ,pi_contacts_adress.district ,pi_contacts_adress.city,pi_contacts_adress.post_index,
			pi_contacts_adress.street_type,	pi_contacts_adress.street,pi_contacts_adress.house,pi_contacts_adress.corp,
			pi_contacts_adress.flat,pi_contacts_adress.address_type, pi_contacts_adress.active) RETURNING id into v_id;
 RETURN v_id;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION icredit.f_contacts_adress_add(icredit.contacts_adress)
  OWNER TO postgres;
