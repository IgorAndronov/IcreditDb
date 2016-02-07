INSERT INTO icredit.dic_contacts_page_number(id, value, active,parent_id)
VALUES(nextval('icredit.seq_dictionaries'::regclass),7,1,6);


insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Exampl for type TABLE','Exampl for type TABL','ENG');
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Пример для типа TABLE','Пример для типа TABLE','RUS');
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Приклад для типу TABLE','Приклад для типу TABLE','UKR');



