create table employeSQL(
empid int,
empName varchar(20),
empEmail varchar(40),
empAge int,
empDeptid int,
empSalary decimal
)
alter table employeSQL alter column empid int not null
alter table employeSQL add constraint pk_employeId primary key (empid)

 
sp_help employeSQL
