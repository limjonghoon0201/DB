create table address(
 address1 varchar(255),
 address2 varchar(255),
 address3 varchar(255),
 postal_code varchar(255),
 client_id varchar(255));
 
insert into address values('안양시','동안구','학의로','12345','이름');     //테이블 삽입

drop table address;     //테이블 삭제