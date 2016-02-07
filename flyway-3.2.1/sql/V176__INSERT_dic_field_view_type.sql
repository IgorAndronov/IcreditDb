INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (nextval('icredit.seq_dictionaries'::regclass), 'block', 1);
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Группа ','Указывает на тип обьекта, который будет отображен на экране. Тип является группой','RUS');
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Група','Вказує на тип об`єкту, який буде відображено на экрані. Тип є групою','UKR');
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Groupe','Indicates that type of object that will be displayed on the screen is groupe type','ENG');

INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (nextval('icredit.seq_dictionaries'::regclass), 'page', 1);
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Страница ','Указывает на тип обьекта, который будет отображен на экране. Тип является страницей','RUS');
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Сторінка','Вказує на тип об`єкту, який буде відображено на экрані. Тип є сторінкою','UKR');
insert into icredit.dic_values (id,name,comment,localisation)
values(currval('icredit.seq_dictionaries'::regclass),'Page','Indicates that type of object that will be displayed on the screen is page type','ENG');
