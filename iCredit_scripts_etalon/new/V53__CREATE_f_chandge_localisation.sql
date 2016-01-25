-- Function: icredit.f_chandge_localisation(character varying, integer, integer, integer)

-- DROP FUNCTION icredit.f_chandge_localisation(character varying, integer, integer, integer);

CREATE OR REPLACE FUNCTION icredit.f_chandge_localisation(IN pi_localisation character varying, IN pi_id_contact integer, IN pi_id_session integer, IN pi_created_by integer, OUT po_result integer, OUT po_error_message character varying)
  RETURNS record AS
$BODY$
declare
 v_localisation_old icredit.contacts.localisation%TYPE;        -- ������ ������
 v_id_row icredit.contacts.localisation%TYPE; -- ���������� ������������� ��������
begin
-- ������������� ���������� ��������
po_result=1;
po_error_message=null;
--�������� ������ �������� ��� ���������� � �������� ����
 select localisation,id from icredit.contacts where id_contact = pi_id_contact into v_localisation_old, v_id_row;
-- ��������� ���� �� ����� ������
 if v_id_row is null then
  po_error_message='�� ������ ������ � ����� v_id_row:' || v_id_row;
  raise '�� ������ ������ � ����� v_id_row:%' , v_id_row;
 end if;
 
  -- ��������� � �������� ������� ������ �������� 
  insert into icredit.arc_contacts (created_by,id_contact,id_par,value_par,id_session) 
       values (pi_created_by,pi_id_contact,pi_par_type,v_localisation_old,pi_session);
   -- ��������� ����� ������         
  update  icredit.contacts set localisation=pi_localisation 
   where id = v_id_row;

 exception when others then
  po_result=0;
  po_error_message='������: '||SQLSTATE||'->'||SQLERRM;
            
end;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100;
ALTER FUNCTION icredit.f_chandge_localisation(character varying, integer, integer, integer)
  OWNER TO postgres;

COMMENT ON FUNCTION icredit.f_chandge_localisation(character varying, integer, integer, integer) IS '������ ������ ������������� ��� ��������/�������. ������ ������ ��������� � �������� �������';