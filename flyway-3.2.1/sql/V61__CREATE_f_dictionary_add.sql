-- Function: icredit.f_dictionary_add(character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION icredit.f_dictionary_add(character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION icredit.f_dictionary_add(pi_dic_name character varying, pi_value character varying, pi_name character varying, pi_comment character varying, pi_localisation character varying)
  RETURNS integer AS
$BODY$
declare
 c_tables CURSOR FOR SELECT value FROM icredit.dic_localisation WHERE value <> pi_localisation;
 v_id integer;
 v_local icredit.dic_localisation.value%TYPE;
 v_is_dic_name integer;
BEGIN

--sprintf(command, "INSERT INTO test (name, amount, letter) VALUES ('db: ''r1''', 1, 'f')");
--EXEC SQL EXECUTE IMMEDIATE :command;
--EXECUTE 'SELECT c FROM ' || quote_ident(_tablename)::regclass || ' WHERE x=$1' 
--                                USING _parameter || INTO _r;
 select count(*) from icredit.dic_dictionary where value = pi_dic_name into v_is_dic_name;
 if v_is_dic_name = 0 and pi_dic_name <> 'dic_dictionary' then
   raise exception 'Таблицы-% нет в справочнике icredit.dic_dictionary',pi_dic_name;
 end if;
 v_id = nextval('icredit.seq_dictionaries');
 EXECUTE 'insert into icredit.'|| pi_dic_name || ' (value,id) values('''|| pi_value ||''','|| v_id ||')' ;

 EXECUTE 'insert into icredit.dic_values (id,name,comment,localisation) values('''|| v_id ||''','''|| pi_name ||''','''||pi_comment||''','''|| pi_localisation ||''')' ; 
   FOR table_record IN c_tables LOOP
    if table_record.value <> pi_localisation then
     EXECUTE 'insert into icredit.dic_values (id,name,comment,localisation) values('''|| v_id ||''','''|| 'Не определено' ||''','''||'Не определено'||''','''|| table_record.value ||''')' ; 
    end if;
   END LOOP;
 RETURN 1;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION icredit.f_dictionary_add(character varying, character varying, character varying, character varying, character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION icredit.f_dictionary_add(character varying, character varying, character varying, character varying, character varying) IS 'ДЛЯ ПРОСТЫХ СПРАВОЧНИКОВ. функция через которую заполняем значения справочников. Мы перезаем значения, указываем имя справочника и функция пишет инфу в две таблиы, в ту имя которой мы передаем и в стандартную таблицу значений dic_values';
