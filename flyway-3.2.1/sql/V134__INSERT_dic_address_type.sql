-- Заполнение справочника dic_address_type
INSERT INTO icredit.dic_address_type(id, value, active)
VALUES (13,'0',1);
INSERT INTO icredit.dic_address_type(id, value, active)
VALUES (14,'1',1);

insert into icredit.dic_values (id,name,comment,localisation) 
values(13, 'Residence address','Residence address','ENG');
insert into icredit.dic_values (id,name,comment,localisation) 
values(13, 'Адрес фактического проживания','Адрес фактического места проживания заемщика на момент оформления заявки на займ','RUS');
insert into icredit.dic_values (id,name,comment,localisation) 
values(13, 'Адреса фактичного проживання','Адреса фактичного місця мешкання позичальника на момент оформлення заявки на позику','UKR');
insert into icredit.dic_values (id,name,comment,localisation) 
values(14, 'Registered address','Registered address','ENG');
insert into icredit.dic_values (id,name,comment,localisation) 
values(14, 'Адрес регистрации','Адрес регистрации места проживания заемщика на момент оформления заявки на займ','RUS');
insert into icredit.dic_values (id,name,comment,localisation) 
values(14, 'Адреса регістрації','Адреса регістрації місця мешкання позичальника на момент оформлення заявки на позику','UKR');
-----------------------------------------------------------------------