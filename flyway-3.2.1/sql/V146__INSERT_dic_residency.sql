--dic_residency


INSERT INTO icredit.dic_residency(id, value, active)  VALUES(1010,'R',1);
INSERT INTO icredit.dic_residency(id, value, active)  VALUES(1011,'N',1);

insert into icredit.dic_values (id,name,comment,localisation) values(1010,'Resident','Не определено','ENG');
insert into icredit.dic_values (id,name,comment,localisation) values(1010,'Резидент','Лицо являющееся гражданином UKRаины','RUS');
insert into icredit.dic_values (id,name,comment,localisation) values(1010,'Резидент','Особа яка є громадянином UKRаїни','UKR');
insert into icredit.dic_values (id,name,comment,localisation) values(1011,'Non resident','Не определено','ENG');
insert into icredit.dic_values (id,name,comment,localisation) values(1011,'Не резидент','Лицо, которое является гражданином  иностранного государства','RUS');
insert into icredit.dic_values (id,name,comment,localisation) values(1011,'Не резидент','Особа, яка є громадянином закордонної держави','UKR');

-----------------------------------------------------------