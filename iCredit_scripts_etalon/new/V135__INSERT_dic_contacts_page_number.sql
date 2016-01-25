-- Заполнение справочника dic_area_type

INSERT INTO icredit.dic_contacts_page_number(id, value, active)
VALUES(15,1,1);
INSERT INTO icredit.dic_contacts_page_number(id, value, active)
VALUES(16,2,1);
INSERT INTO icredit.dic_contacts_page_number(id, value, active)
VALUES(17,3,1);
INSERT INTO icredit.dic_contacts_page_number(id, value, active)
VALUES(18,4,1);
INSERT INTO icredit.dic_contacts_page_number(id, value, active)
VALUES(19,5,1);


insert into icredit.dic_values (id,name,comment,localisation) 
values(15,'Personal Information','Last name? First name, born date ....','ENG');
insert into icredit.dic_values (id,name,comment,localisation) 
values(15,'Персональные данные','Персональные данные ФИО, год рождения и пр.','РУС');
insert into icredit.dic_values (id,name,comment,localisation) 
values(15,'Персональні дані','ПІБ, рік народження, та інша інф.','УКР');
insert into icredit.dic_values (id,name,comment,localisation) 
values(16,'Documents','Documents confirming the identity of the borrower','ENG');
insert into icredit.dic_values (id,name,comment,localisation) 
values(16,'Документы','Документы удостоверяющие личность заемщика','РУС');
insert into icredit.dic_values (id,name,comment,localisation) 
values(16,'Документи','Документи які посвідчують особу позичальника','УКР');
insert into icredit.dic_values (id,name,comment,localisation) 
values(17,'Phones number','Phones of the borrower','ENG');
insert into icredit.dic_values (id,name,comment,localisation) 
values(17,'Телефоны','	Телефоны заемщика','РУС');
insert into icredit.dic_values (id,name,comment,localisation) 
values(17,'Телефон','Телефони позичальника','УКР');
insert into icredit.dic_values (id,name,comment,localisation) 
values(18,'electronic channels','Тшсл name in social networks, e-mail and others','ENG');
insert into icredit.dic_values (id,name,comment,localisation) 
values(18,'Электонные каналы','логины в соцсетях, почтовые ящики и прочее','РУС');
insert into icredit.dic_values (id,name,comment,localisation) 
values(18,'Єлектронні канали','Логіни до соціальних мереж, поштові скриньки та інше','УКР');
insert into icredit.dic_values (id,name,comment,localisation) 
values(19,'Additional Information','Additional Information','ENG');
insert into icredit.dic_values (id,name,comment,localisation) 
values(19,'Дополнительная информация','Дополнительная информация','РУС');
insert into icredit.dic_values (id,name,comment,localisation) 
values(19,'Додаткова інформація','Додаткова інформація','УКР');

-----------------------------------------------------------------------