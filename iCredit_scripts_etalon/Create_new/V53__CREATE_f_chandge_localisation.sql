-- Function: icredit.f_chandge_localisation(character varying, integer, integer, integer)

-- DROP FUNCTION icredit.f_chandge_localisation(character varying, integer, integer, integer);

CREATE OR REPLACE FUNCTION icredit.f_chandge_localisation(IN pi_localisation character varying, IN pi_id_contact integer, IN pi_id_session integer, IN pi_created_by integer, OUT po_result integer, OUT po_error_message character varying)
  RETURNS record AS
$BODY$
declare
 v_localisation_old icredit.contacts.localisation%TYPE;        -- старая локаль
 v_id_row icredit.contacts.localisation%TYPE; -- уникальный идентификатор заемщика
begin
-- устанавливаем дефолтовые значения
po_result=1;
po_error_message=null;
--выбираем старое значения для сохранения в архивной базе
 select localisation,id from icredit.contacts where id_contact = pi_id_contact into v_localisation_old, v_id_row;
-- проверяем есть ли такой клиент
 if v_id_row is null then
  po_error_message='Не найден клиент с кодом v_id_row:' || v_id_row;
  raise 'Не найден клиент с кодом v_id_row:%' , v_id_row;
 end if;
 
  -- вставляем в архивную таблицу старое значение 
  insert into icredit.arc_contacts (created_by,id_contact,id_par,value_par,id_session) 
       values (pi_created_by,pi_id_contact,pi_par_type,v_localisation_old,pi_session);
   -- обновляем новую локаль         
  update  icredit.contacts set localisation=pi_localisation 
   where id = v_id_row;

 exception when others then
  po_result=0;
  po_error_message='ОШИБКА: '||SQLSTATE||'->'||SQLERRM;
            
end;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100;
ALTER FUNCTION icredit.f_chandge_localisation(character varying, integer, integer, integer)
  OWNER TO postgres;

COMMENT ON FUNCTION icredit.f_chandge_localisation(character varying, integer, integer, integer) IS 'Меняет локаль представления для заемщика/клиента. Статую локаль записівает в архивную таблицу';