-- Function: icredit.f_contacts_documents_add(icredit.contacts_documents)

-- DROP FUNCTION icredit.f_contacts_documents_add(icredit.contacts_documents);

CREATE OR REPLACE FUNCTION icredit.f_contacts_documents_add(pi_contacts_documents icredit.contacts_documents)
  RETURNS integer AS
$BODY$
declare
 v_id icredit.contacts.id%type;
BEGIN
 insert into icredit.contacts_documents (created_by, last_updated_by, id_contact , doc_seria ,doc_number,
					date_doc_given, doc_given ,doc_type ,active )
			values(pi_contacts_documents.created_by ,pi_contacts_documents.last_updated_by,pi_contacts_documents.id_contact,
			pi_contacts_documents.doc_seria ,pi_contacts_documents.doc_number ,pi_contacts_documents.date_doc_given,pi_contacts_documents.doc_given,
			pi_contacts_documents.street_type,	pi_contacts_documents.street,pi_contacts_documents.house,pi_contacts_documents.corp,
			pi_contacts_documents.doc_type,pi_contacts_documents.active) RETURNING id into v_id;
 RETURN v_id;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION icredit.f_contacts_documents_add(icredit.contacts_documents)
  OWNER TO postgres;
