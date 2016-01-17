-- Function: icredit.f_contacts_www_add(icredit.contacts_www)

-- DROP FUNCTION icredit.f_contacts_www_add(icredit.contacts_www);

CREATE OR REPLACE FUNCTION icredit.f_contacts_www_add(pi_contacts_www icredit.contacts_www)
  RETURNS integer AS
$BODY$
declare
 v_id icredit.contacts.id%type;
BEGIN
 insert into icredit.contacts_www (created_by, last_updated_by, id_contact , name ,name_type,active )
			values(pi_contacts_www.created_by ,pi_contacts_www.last_updated_by,pi_contacts_www.id_contact,
			pi_contacts_www.name,pi_contacts_www.name_type ,pi_contacts_www.active) RETURNING id into v_id;
 RETURN v_id;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION icredit.f_contacts_www_add(icredit.contacts_www)
  OWNER TO postgres;


-- Function: icredit.f_dictionary_add(character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION icredit.f_dictionary_add(character varying, character varying, character varying, character varying, character varying);
