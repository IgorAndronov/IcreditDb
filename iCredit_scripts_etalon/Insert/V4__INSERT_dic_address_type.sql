-- ���������� ����������� dic_address_type
INSERT INTO icredit.dic_address_type(id, value, active)
VALUES (13,'0',1);
INSERT INTO icredit.dic_address_type(id, value, active)
VALUES (14,'1',1);

insert into icredit.dic_values (id,name,comment,localisation) 
values(13, 'Residence address','Residence address','ENG');
insert into icredit.dic_values (id,name,comment,localisation) 
values(13, '����� ������������ ����������','����� ������������ ����� ���������� �������� �� ������ ���������� ������ �� ����','���');
insert into icredit.dic_values (id,name,comment,localisation) 
values(13, '������ ���������� ����������','������ ���������� ���� �������� ������������ �� ������ ���������� ������ �� ������','���');
insert into icredit.dic_values (id,name,comment,localisation) 
values(14, 'Registered address','Registered address','ENG');
insert into icredit.dic_values (id,name,comment,localisation) 
values(14, '����� �����������','����� ����������� ����� ���������� �������� �� ������ ���������� ������ �� ����','���');
insert into icredit.dic_values (id,name,comment,localisation) 
values(14, '������ ����������','������ ���������� ���� �������� ������������ �� ������ ���������� ������ �� ������','���');
-----------------------------------------------------------------------