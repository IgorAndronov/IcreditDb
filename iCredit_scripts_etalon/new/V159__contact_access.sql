COMMENT ON COLUMN icredit.contacts_access.page_number
IS 'Номер страницы, на которой будет выведен параметр,НО если параметр входит в тип TABLE, то его номер страници расчитывается отдельно, в контексте нового обьекта TABLE.';

COMMENT ON COLUMN icredit.contacts_access.group_number
IS 'для группировки выводимых полей в блоки. Т.е на экране выводится именоыаный блок и в него включаются поля для вывода';

COMMENT ON COLUMN icredit.contacts_access.group_sorting
IS 'Порядок следования группы на странице';

COMMENT ON COLUMN icredit.contacts_access.sorting
IS 'Порядок следования записей нв группе';

ALTER TABLE icredit.contacts_access
  ALTER COLUMN group_number SET DEFAULT 1;

ALTER TABLE icredit.dic_name_contacts_block
  ALTER COLUMN repeated SET NOT NULL;


update icredit.contacts_access d
set field_view_type = 'checkbox'
where d.field_name = 'use_for_sms' and d.table_name = 'contacts_phones';

update icredit.contacts_access d
set field_view_type = 'lov'
where d.field_name = 'name_type' and d.table_name = 'contacts_www';

update icredit.contacts_access d
set field_view_type = 'checkbox', ro='FALSE'
where d.field_name = 'use_for_correspondence' and d.table_name = 'contacts_www';

update icredit.contacts_access d
set visible = 'TRUE', ro='FALSE'
where d.field_name = 'contacts_adress' and d.table_name = 'contacts_adress';

update icredit.contacts_access d
set page_number = 5
where d.field_name = 'contacts_www' and d.table_name = 'contacts_www';

update icredit.contacts_access d
set page_number = 5  , sorting = 2
where d.field_name = 'name' and d.table_name = 'contacts_www';
update icredit.contacts_access d
set page_number = 5 , sorting = 1
where d.field_name = 'name_type' and d.table_name = 'contacts_www';
update icredit.contacts_access d
set page_number = 5 , sorting = 3
where d.field_name = 'use_for_correspondence' and d.table_name = 'contacts_www';

update icredit.contacts_access d
set page_number = 6
where d.field_name = 'login_name' and d.table_name = 'contacts_pwd';
update icredit.contacts_access d
set page_number = 6 , group_number = 9
where d.field_name = 'pwd' and d.table_name = 'contacts_pwd';

update icredit.contacts_access d
set page_number = 4, sorting = 3
where d.field_name = 'use_for_sms' and d.table_name = 'contacts_phones';
update icredit.contacts_access d
set page_number = 4 , sorting = 2
where d.field_name = 'phone_number' and d.table_name = 'contacts_phones';
update icredit.contacts_access d
set page_number = 4, sorting = 1
where d.field_name = 'phone_type' and d.table_name = 'contacts_phones' ;

update icredit.contacts_access d
set page_number = 2 , sorting = 1
where d.field_name = 'address_type' and d.table_name = 'contacts_adress';
update icredit.contacts_access d
set page_number = 2 , sorting = 2
where d.field_name = 'area' and d.table_name = 'contacts_adress';
update icredit.contacts_access d
set page_number = 2, sorting = 3
where d.field_name = 'district' and d.table_name = 'contacts_adress';
update icredit.contacts_access d
set page_number = 2, sorting = 4
where d.field_name = 'city_type' and d.table_name = 'contacts_adress';
update icredit.contacts_access d
set page_number = 2, sorting = 5
where d.field_name = 'city' and d.table_name = 'contacts_adress' ;
update icredit.contacts_access d
set page_number = 2, sorting = 6
where d.field_name = 'post_index' and d.table_name = 'contacts_adress';
update icredit.contacts_access d
set page_number = 2, sorting = 7
where d.field_name = 'street_type' and d.table_name = 'contacts_adress';
update icredit.contacts_access d
set page_number = 2, sorting = 8
where d.field_name = 'street' and d.table_name = 'contacts_adress';
update icredit.contacts_access d
set page_number = 2, sorting = 9
where d.field_name = 'corp' and d.table_name = 'contacts_adress';
update icredit.contacts_access d
set page_number = 2, sorting = 10
where d.field_name = 'house' and d.table_name = 'contacts_adress';
update icredit.contacts_access d
set page_number = 2, sorting = 11
where d.field_name = 'flat' and d.table_name = 'contacts_adress';


update icredit.contacts_access d
set page_number = 3  , sorting = 4
where d.field_name = 'date_doc_given' and d.table_name = 'contacts_documents';
update icredit.contacts_access d
set page_number = 3 , sorting = 5
where d.field_name = 'doc_given' and d.table_name = 'contacts_documents';
update icredit.contacts_access d
set page_number = 3, sorting = 3
where d.field_name = 'doc_number' and d.table_name = 'contacts_documents' ;
update icredit.contacts_access d
set page_number = 3 , sorting = 2
where d.field_name = 'doc_seria' and d.table_name = 'contacts_documents';
update icredit.contacts_access d
set page_number = 3 , sorting = 1
where d.field_name = 'doc_type' and d.table_name = 'contacts_documents';

update icredit.contacts_access d
set group_sorting = 0, sorting = 0
where d.field_name =  d.table_name ;