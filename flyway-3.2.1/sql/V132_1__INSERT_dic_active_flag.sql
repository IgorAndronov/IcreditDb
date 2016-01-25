-- Заполнение справочника dic_active_flag
INSERT INTO icredit.dic_active_flag (id, value, active)
VALUES (1,0,1);

INSERT INTO icredit.dic_active_flag (id, value, active)
VALUES (2,1,1);

insert into icredit.dic_values (id,name,comment,localisation) 
values(1,'Not active','If value = 0 (Not active), it meant that this record stay for histiry, for active records, value = 1 (Active)','ENG'); 
insert into icredit.dic_values (id,name,comment,localisation) 
values(1,'Не активная','Если значение = 0 (Не активна), это значит, что запись с таким статусом остается для исторических записей, для активнх параметров значение = 1(Активная)','РУС'); 
insert into icredit.dic_values (id,name,comment,localisation) 
values(1,'Не активна','Якщо значення = 0 (Не активна), це показує, що запис з таким значенням залишаеться для історичних записів, для активних записів значення = 1 (Активна)','УКР'); 

insert into icredit.dic_values (id,name,comment,localisation) 
values(2,'Active','If value = 0 (Not active), it meen that this record stay for histiry, for active records, value = 1 (Active)','ENG'); 
insert into icredit.dic_values (id,name,comment,localisation) 
values(2,'Активная','Если значение = 0 (Не активна), это значит, что запись с таким статусом остается для исторических записей, для активнх параметров значение = 1(Активная)','РУС'); 
insert into icredit.dic_values (id,name,comment,localisation) 
values(2,'Активна','Якщо значення = 0 (Не активна), це показує, що запис з таким значенням залишаеться для історичних записів, для активних записів значення = 1 (Активна)','УКР'); 
-----------------------------------------------------------------------
