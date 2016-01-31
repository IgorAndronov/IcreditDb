-- Заполнение справочника dic_field_view_type 

INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (6, 'table', 1);
insert into icredit.dic_values (id,name,comment,localisation) 
values(6,'Таблица','Указывает на тип обьекта, который будет отображен на экране. Тип является таблицей','RUS');
insert into icredit.dic_values (id,name,comment,localisation) 
values(6,'Таблиця','Вказує на тип об`єкту, який буде відображено на экрані. Тип є таблицею','UKR');
insert into icredit.dic_values (id,name,comment,localisation) 
values(6,'Таблица','Indicates that type of object that will be displayed on the screen is tables type','ENG'); 

INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (7,'simple',1);
insert into icredit.dic_values (id,name,comment,localisation) 
values(7,'Простое','Указывает на тип обьекта, который будет отображен на экране. Тип является простым полем (текст или число)','RUS');
insert into icredit.dic_values (id,name,comment,localisation) 
values(7,'Просте','Вказує на тип об`єкту, який буде відображено на экрані. Тип є простим полем (текст або число)','UKR');
insert into icredit.dic_values (id,name,comment,localisation) 
values(7,'Simple','Indicates that type of object that will be displayed on the screen is simple type (string or number)','ENG'); 

INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (8,'calendar',1);
insert into icredit.dic_values (id,name,comment,localisation) 
values(8,'Простое','Указывает на тип обьекта, который будет отображен на экране. Тип является датой','RUS');
insert into icredit.dic_values (id,name,comment,localisation) 
values(8,'Просте','Вказує на тип об`єкту, який буде відображено на экрані. Тип є датою','UKR');
insert into icredit.dic_values (id,name,comment,localisation) 
values(8,'Simple','Indicates that type of object that will be displayed on the screen is date type','ENG'); 

INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (9,'radio',1);
insert into icredit.dic_values (id,name,comment,localisation) 
values(9,'Переключатель','Указывает на тип обьекта, который будет отображен на экране. Тип является списком с единичным выбором','RUS');
insert into icredit.dic_values (id,name,comment,localisation) 
values(9,'Перемикач','Вказує на тип об`єкту, який буде відображено на экрані. Тип є списком з одиничним вибором','UKR');
insert into icredit.dic_values (id,name,comment,localisation) 
values(9,'RadioButton','Indicates that type of object that will be displayed on the screen is RadioButton type','ENG'); 

INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (10,'lov',1);
insert into icredit.dic_values (id,name,comment,localisation) 
values(10,'Выбор','Указывает на тип обьекта, который будет отображен на экране. Тип является - поле со списком','RUS');
insert into icredit.dic_values (id,name,comment,localisation) 
values(10,'Вибір','Вказує на тип об`єкту, який буде відображено на экрані. Тип є випадаючим списком','UKR');
insert into icredit.dic_values (id,name,comment,localisation) 
values(10,'ComboBox','Indicates that type of object that will be displayed on the screen is ComboBox type','ENG'); 

INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (11,'checkbox',1);
insert into icredit.dic_values (id,name,comment,localisation) 
values(11,'Выбор','Указывает на тип обьекта, который будет отображен на экране. Тип является - поле флажок','RUS');
insert into icredit.dic_values (id,name,comment,localisation) 
values(11,'Вибір','Вказує на тип об`єкту, який буде відображено на экрані. Тип є поле Флаг','UKR');
insert into icredit.dic_values (id,name,comment,localisation) 
values(11,'Checkbox','Indicates that type of object that will be displayed on the screen is Сheckbox type','ENG'); 

INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (12,'lov_multy',1);
insert into icredit.dic_values (id,name,comment,localisation) 
values(12,'Выбор','Указывает на тип обьекта, который будет отображен на экране. Тип является - поле с множественным выбором в котором можно отметить один и более значений','RUS');
insert into icredit.dic_values (id,name,comment,localisation) 
values(12,'Вибір','Вказує на тип об`єкту, який буде відображено на экрані. Тип є поле з множинним вибором у якому можно вибраби більше одного значення','UKR');
insert into icredit.dic_values (id,name,comment,localisation) 
values(12,'MultiValueGroup','Indicates that type of object that will be displayed on the screen is Multi Value Group type for choice one or two values','ENG'); 

INSERT INTO icredit.dic_field_view_type (id, value, active)
VALUES (1036,'integer',1);
insert into icredit.dic_values (id,name,comment,localisation)
values(1036,'Число','Указывает на тип обьекта, который будет отображен на экране. Тип является - числолвым полем без дробной части','RUS');
insert into icredit.dic_values (id,name,comment,localisation)
values(1036,'Число','Вказує на тип об`єкту, який буде відображено на экрані. Тип є поле число без дробної частини','UKR');
insert into icredit.dic_values (id,name,comment,localisation)
values(1036,'MultiValueGroup','Indicates that type of object that will be displayed on the screen is integer with out float','ENG');

-----------------------------------------------------------------------
