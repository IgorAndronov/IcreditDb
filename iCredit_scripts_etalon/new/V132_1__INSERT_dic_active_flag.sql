-- ���������� ����������� dic_active_flag
INSERT INTO icredit.dic_active_flag (id, value, active)
VALUES (1,0,1);

INSERT INTO icredit.dic_active_flag (id, value, active)
VALUES (2,1,1);

insert into icredit.dic_values (id,name,comment,localisation) 
values(1,'Not active','If value = 0 (Not active), it meant that this record stay for histiry, for active records, value = 1 (Active)','ENG'); 
insert into icredit.dic_values (id,name,comment,localisation) 
values(1,'�� ��������','���� �������� = 0 (�� �������), ��� ������, ��� ������ � ����� �������� �������� ��� ������������ �������, ��� ������� ���������� �������� = 1(��������)','���'); 
insert into icredit.dic_values (id,name,comment,localisation) 
values(1,'�� �������','���� �������� = 0 (�� �������), �� ������, �� ����� � ����� ��������� ����������� ��� ���������� ������, ��� �������� ������ �������� = 1 (�������)','���'); 

insert into icredit.dic_values (id,name,comment,localisation) 
values(2,'Active','If value = 0 (Not active), it meen that this record stay for histiry, for active records, value = 1 (Active)','ENG'); 
insert into icredit.dic_values (id,name,comment,localisation) 
values(2,'��������','���� �������� = 0 (�� �������), ��� ������, ��� ������ � ����� �������� �������� ��� ������������ �������, ��� ������� ���������� �������� = 1(��������)','���'); 
insert into icredit.dic_values (id,name,comment,localisation) 
values(2,'�������','���� �������� = 0 (�� �������), �� ������, �� ����� � ����� ��������� ����������� ��� ���������� ������, ��� �������� ������ �������� = 1 (�������)','���'); 
-----------------------------------------------------------------------
