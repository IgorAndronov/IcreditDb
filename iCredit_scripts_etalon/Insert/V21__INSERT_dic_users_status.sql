--dic_users_status


INSERT INTO icredit.dic_users_status(id, value, active)  VALUES(1030,0,1);
INSERT INTO icredit.dic_users_status(id, value, active)  VALUES(1031,1,1);
INSERT INTO icredit.dic_users_status(id, value, active)  VALUES(1032,2,1);
INSERT INTO icredit.dic_users_status(id, value, active)  VALUES(1033,3,1);
INSERT INTO icredit.dic_users_status(id, value, active)  VALUES(1034,4,1);
INSERT INTO icredit.dic_users_status(id, value, active)  VALUES(1035,5,1);

insert into icredit.dic_values (id,name,comment,localisation) values(1030,'Retire','Retire','ENG');
insert into icredit.dic_values (id,name,comment,localisation) values(1030,'Уволен','Уволен','РУС');
insert into icredit.dic_values (id,name,comment,localisation) values(1030,'Звільнений','Звільнений','УКР');
insert into icredit.dic_values (id,name,comment,localisation) values(1031,'locked','Locked befor','ENG');
insert into icredit.dic_values (id,name,comment,localisation) values(1031,'Блокирована','Заблокирована до даты','РУС');
insert into icredit.dic_values (id,name,comment,localisation) values(1031,'Блокована','Заблокована до дати','УКР');

insert into icredit.dic_values (id,name,comment,localisation) values(1032,'vacation','vacation','ENG');
insert into icredit.dic_values (id,name,comment,localisation) values(1032,'Отпуск','Отпуск','РУС');
insert into icredit.dic_values (id,name,comment,localisation) values(1032,'Відпустка','Відпустка','УКР');
insert into icredit.dic_values (id,name,comment,localisation) values(1033,'locked on PWD','Locked - incorrect password','ENG');
insert into icredit.dic_values (id,name,comment,localisation) values(1033,'Блокирована','Заблокирован - неверный пароль','РУС');
insert into icredit.dic_values (id,name,comment,localisation) values(1033,'Блокована','Заблоковано - невырно введено пароль','УКР');

insert into icredit.dic_values (id,name,comment,localisation) values(1034,'Ill','Ill','ENG');
insert into icredit.dic_values (id,name,comment,localisation) values(1034,'Болен','Болен','РУС');
insert into icredit.dic_values (id,name,comment,localisation) values(1034,'Хворий','Хворий','УКР');
insert into icredit.dic_values (id,name,comment,localisation) values(1035,'Work','Work','ENG');
insert into icredit.dic_values (id,name,comment,localisation) values(1035,'Работает','Работает','РУС');
insert into icredit.dic_values (id,name,comment,localisation) values(1035,'Працює','Працює','УКР');
--------------------------------------------