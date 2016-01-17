-- Function: icredit.f_contacts_phones_add(icredit.contacts_phones)

-- DROP FUNCTION icredit.f_contacts_phones_add(icredit.contacts_phones);

CREATE OR REPLACE FUNCTION icredit.f_contacts_phones_add(pi_contacts_phones icredit.contacts_phones)
  RETURNS integer AS
$BODY$
declare
 v_id icredit.contacts.id%type;
BEGIN
 insert into icredit.contacts_phones (created_by, last_updated_by, id_contact , phone_number ,phone_type, active )
			values(pi_contacts_phones.created_by ,pi_contacts_phones.last_updated_by,pi_contacts_phones.id_contact,
			pi_contacts_phones.phone_number,pi_contacts_phones.phone_type ,pi_contacts_phones.active) RETURNING id into v_id;
 RETURN v_id;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION icredit.f_contacts_phones_add(icredit.contacts_phones)
  OWNER TO postgres;
