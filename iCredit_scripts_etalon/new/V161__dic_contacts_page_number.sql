update icredit.dic_contacts_page_number f
set value = 6
where id = 19;

update icredit.dic_contacts_page_number f
set value = 5
where id = 18;

update icredit.dic_contacts_page_number f
set value = 4
where id = 17;

update icredit.dic_contacts_page_number f
set value = 3
where id = 16;


INSERT INTO icredit.dic_contacts_page_number(id, value, active)
VALUES(1039,2,1);


insert into icredit.dic_values (id,name,comment,localisation)
values(1039,'Address information','Address information','ENG');
insert into icredit.dic_values (id,name,comment,localisation)
values(1039,'Адресс','Адреса проживания и регистрации заемщика','РУС');
insert into icredit.dic_values (id,name,comment,localisation)
values(1039,'Адреса','Адреса реєстрації та мешкання позичальника','УКР');