//���̺� ����
create table tCity 
(
    name char(10) primary key,
    area int null ,
    popu int null ,
    metro char (1) not null,
    region char(6) not null
);

//������ ����    
insert into tCity values ('����',605,974,'y','���');
insert into tCity values ('�λ�',765,342,'y','���');
insert into tCity values ('����',42,21,'n','���');
insert into tCity values ('û��',940,83,'n','��û');
insert into tCity values ('����',205,65,'n','����');
insert into tCity values ('��õ',910,27,'n','����');
insert into tCity values ('��õ',1116,27,'n','����');
insert into tCity values ('ȫõ',1819,7,'n','����');

//������ ǥ��
select * from tCity;


commit;