-- Function: icredit.f_chandge_contacts_pwd(character varying, character varying, integer, integer)

-- DROP FUNCTION icredit.f_chandge_contacts_pwd(character varying, character varying, integer, integer);

CREATE OR REPLACE FUNCTION icredit.f_chandge_contacts_pwd(IN pi_value character varying, IN pi_par_type character varying, IN pi_id_contact integer, IN pi_created_by integer, OUT po_result integer, OUT po_error_message character varying)
  RETURNS record AS
$BODY$
declare
 v_pwd character varying(100);        -- ������ ������
 v_login_name character varying(100); -- ������ �����
 v_id_row integer;	      -- id_row ������ �� ������� contact
 v_is_fc integer;	      -- �������� ������������ �������� ����� ��������� , ������� ����� ������ 
begin
-- pi_par_type  ����� ��������� ��������� ��������:
--	1. login_name
--	2. pwd
-- ����� ������ �������� ����� ��������� � ������������ ������ ������

-- ������������� ���������� ��������
po_result=1;
po_error_message=null;
-- ��������� icredit.contacts_pwd ������� �������, � �������� ������� icredit.arc_contacts_pwd ������� � ���� ������������������
-- � �� ��� ����� �������� ����������� ��� ��������, ��� �� ������ ���� �������� ������� ��������, �������� ��� � ������� icredit.contacts_pwd
-- ����� ������������ ��������� ������� , � ������� ��������� ����� ����� ��� icredit.contacts_pwd, �� ����������� ��������� �����
-- �� ����������� dic_systems_fields
 select count(*) 
   from information_schema.columns d
  where d.table_schema = 'icredit' and d.table_name = 'contacts_pwd' and d.column_name = pi_par_type
  and not exists (select 1 from icredit.dic_systems_fields ds where ds.field_name = d.column_name) into v_is_fc;
-- ��������� ���� �� ����� ���������� ��������
 if v_is_fc = 0 then
  po_error_message='�� ������ ��������.�������� �������� �������� � ��������� pi_par_type:'|| pi_par_type;
  raise exception '�� ������ ��������.�������� �������� �������� � ��������� pi_par_type:';
 end if;
--�������� ������ �������� ��� ���������� � �������� ����
 select login_name,pwd,id from icredit.contacts_pwd where id_contact = pi_id_contact into v_login_name, v_pwd,v_id_row;
-- ��������� ���� �� ����� ������
 if v_id_row is null then
  po_error_message='�� ������ ������ � ����� v_id_row:' || v_id_row;
  raise exception '��� ������ ��������';
 end if;
 
 if pi_par_type = 'login_name' then -- ���� ������ �����
  -- ��������� � �������� ������� ������ ��������
  insert into icredit.arc_contacts_pwd (created_by,id_contact,id_par,value_par)
         values (pi_created_by,pi_id_contact,pi_par_type,v_login_name);
  -- ��������� ����� �����
  update  icredit.contacts_pwd set login_name=pi_value, last_updated_by=pi_created_by, last_updated = now() 
   where id = v_id_row;
 elsif pi_par_type = 'pwd' then -- ���� ������ ������
  -- ��������� � �������� ������� ������ �������� 
  insert into icredit.arc_contacts_pwd (created_by,id_contact,id_pr,value_par) 
       values (pi_created_by,pi_id_contact,pi_par_type,v_pwd);
   -- ��������� ����� ������         
  update  icredit.contacts_pwd set pwd=pi_value , last_updated_by=pi_created_by , last_updated = now() 
   where id = v_id_row;
 else
  -- ���� �������� �������� �������� ���������
  po_error_message='�������� �������� �������� � ��������� pi_par_type' || pi_par_type;
  po_result=0;
 end if;

 exception when others then
 --RAISE NOTICE 'SQLSTATE: %', SQLSTATE;
 --   RAISE;
  po_result=0;
  po_error_message='������: '||SQLSTATE||'->'||SQLERRM;
            
end;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100;
ALTER FUNCTION icredit.f_chandge_contacts_pwd(character varying, character varying, integer, integer)
  OWNER TO postgres;
COMMENT ON FUNCTION icredit.f_chandge_contacts_pwd(character varying, character varying, integer, integer) IS '������� ����� ������ ��� ������ � ������� contacts_pwd. � ������ ����� ������ ������ ����������� � �������� ������� arc_contacts_pwd. ���������� 1, ���� �� � 0 ���� ��� ����� � � ����� �� out ���������� ����� ������';
