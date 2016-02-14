INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (nextval('icredit.seq_dictionaries'::regclass), 'tab_sheet', 1);
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Страница','Указывает на тип обьекта, который будет отображен на экране. Тип является страницей','RUS');
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Сторінка','Вказує на тип об`єкту, який буде відображено на экрані. Тип є сторінкою','UKR');
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Sheet','Indicates that type of object that will be displayed on the screen is sheet type','ENG');

INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (nextval('icredit.seq_dictionaries'::regclass), 'group', 1);
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Группа','Указывает на тип обьекта, который будет отображен на экране. Тип является группой неделимых простых полей','RUS');
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Група','Вказує на тип об`єкту, який буде відображено на экрані. Тип є групою простих невід`емних полів','UKR');
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Group','Indicates that type of object that will be displayed on the screen is group simple fields type','ENG');
