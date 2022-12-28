create table customer(
custid int not null ,
custname varchar(12) not null,
custaddress varchar(56),
custcountry varchar(23) ,
custemail varchar(14) ,
custage int ,
)
sp_help customer

alter table customer add constraint pk_custid primary key (custid)

alter table customer add constraint un_email unique (custemail)

alter table customer add constraint ch_custage check (custage>18)

alter table customer add constraint df_country default 'India' for custcountry

 alter table customer drop  constraint df_country