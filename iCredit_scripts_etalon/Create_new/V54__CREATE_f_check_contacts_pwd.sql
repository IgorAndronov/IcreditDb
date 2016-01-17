-- Function: icredit.f_check_contacts_pwd(character varying)

-- DROP FUNCTION icredit.f_check_contacts_pwd(character varying);

CREATE OR REPLACE FUNCTION icredit.f_check_contacts_pwd(IN pi_login character varying, OUT po_pwd character varying, OUT po_id_contact integer, OUT po_error_message character varying)
  RETURNS record AS
$BODY$
declare
v_pwd character varying(100);  -- ������ �� ��
v_id_row integer default null; -- �� ��������
begin

po_id_contact=null;
po_error_message=null;
--������� �������
 select pwd,id from icredit.contacts_pwd where login_name = pi_login into v_pwd,v_id_row;
 if v_id_row is null then
  po_error_message='������: ������ �� ������';
 else 
  po_pwd=v_pwd;
  po_id_contact=v_id_row;
 end if;
 exception when no_data_found then
                po_error_message='������: ������ �� ������';
                po_id_contact=null;
                po_pwd=null;
           when others then
                po_error_message='������: '|| SQLSTATE;
                po_id_contact=null;
                po_pwd=null;
    
end;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100;
ALTER FUNCTION icredit.f_check_contacts_pwd(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION icredit.f_check_contacts_pwd(character varying) IS '������� �������� ������ ';
