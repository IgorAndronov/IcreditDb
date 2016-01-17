-- Function: icredit.f_chandge_contacts_pwd(character varying, character varying, integer, integer)

-- DROP FUNCTION icredit.f_chandge_contacts_pwd(character varying, character varying, integer, integer);

CREATE OR REPLACE FUNCTION icredit.f_chandge_contacts_pwd(IN pi_value character varying, IN pi_par_type character varying, IN pi_id_contact integer, IN pi_created_by integer, OUT po_result integer, OUT po_error_message character varying)
  RETURNS record AS
$BODY$
declare
 v_pwd character varying(100);        -- старый пароль
 v_login_name character varying(100); -- старый логин
 v_id_row integer;	      -- id_row записи из таблицы contact
 v_is_fc integer;	      -- проверка правильности передачи имени параметра , который нужно иен€ть 
begin
-- pi_par_type  может принимать следующие значени€:
--	1. login_name
--	2. pwd
-- любые другие значени€ будут приводить к формированию текста ошибки

-- устанавливаем дефолтовые значени€
po_result=1;
po_error_message=null;
-- поскольку icredit.contacts_pwd плоска€ твблица, а архивна€ таблица icredit.arc_contacts_pwd создана в виде параметризированой
-- и на нее нужно навесить зависимость или проверку, что бы нельз€ было вставить никакое значение, которого нет в таблице icredit.contacts_pwd
-- будем использовать системную таблицу , в которой наход€тс€ имена полей дл€ icredit.contacts_pwd, за исключением системных полей
-- из справочника dic_systems_fields
 select count(*) 
   from information_schema.columns d
  where d.table_schema = 'icredit' and d.table_name = 'contacts_pwd' and d.column_name = pi_par_type
  and not exists (select 1 from icredit.dic_systems_fields ds where ds.field_name = d.column_name) into v_is_fc;
-- провер€ем есть ли такое переданное значение
 if v_is_fc = 0 then
  po_error_message='Ќе верный параметр.ѕередано неверное значение в параметре pi_par_type:'|| pi_par_type;
  raise exception 'Ќе верный параметр.ѕередано неверное значение в параметре pi_par_type:';
 end if;
--выбираем старое значени€ дл€ сохранени€ в архивной базе
 select login_name,pwd,id from icredit.contacts_pwd where id_contact = pi_id_contact into v_login_name, v_pwd,v_id_row;
-- провер€ем есть ли такой клиент
 if v_id_row is null then
  po_error_message='Ќе найден клиент с кодом v_id_row:' || v_id_row;
  raise exception 'Ќет такого заемщика';
 end if;
 
 if pi_par_type = 'login_name' then -- если мен€ем логин
  -- вставл€ем в архивную таблицу старое значение
  insert into icredit.arc_contacts_pwd (created_by,id_contact,id_par,value_par)
         values (pi_created_by,pi_id_contact,pi_par_type,v_login_name);
  -- обновл€ем новый логин
  update  icredit.contacts_pwd set login_name=pi_value, last_updated_by=pi_created_by, last_updated = now() 
   where id = v_id_row;
 elsif pi_par_type = 'pwd' then -- если мен€ем пароль
  -- вставл€ем в архивную таблицу старое значение 
  insert into icredit.arc_contacts_pwd (created_by,id_contact,id_pr,value_par) 
       values (pi_created_by,pi_id_contact,pi_par_type,v_pwd);
   -- обновл€ем новый пароль         
  update  icredit.contacts_pwd set pwd=pi_value , last_updated_by=pi_created_by , last_updated = now() 
   where id = v_id_row;
 else
  -- ≈сли передано неверное название параметра
  po_error_message='ѕередано неверное значение в параметре pi_par_type' || pi_par_type;
  po_result=0;
 end if;

 exception when others then
 --RAISE NOTICE 'SQLSTATE: %', SQLSTATE;
 --   RAISE;
  po_result=0;
  po_error_message='ќЎ»Ѕ ј: '||SQLSTATE||'->'||SQLERRM;
            
end;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100;
ALTER FUNCTION icredit.f_chandge_contacts_pwd(character varying, character varying, integer, integer)
  OWNER TO postgres;
COMMENT ON FUNCTION icredit.f_chandge_contacts_pwd(character varying, character varying, integer, integer) IS 'функци€ смены парол€ или логина в таблице contacts_pwd. ¬ момент смены старые данные перенос€тс€ в архивную таблицу arc_contacts_pwd. ¬озвращает 1, если ќ  и 0 если все плохо и в одном из out параметров текст ошибки';
