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
select* from employeSQL
--DML  
--insert 
insert into Department values(1,'HR')
insert into Department values(2,'Testing')
insert into Department values(3,'Developer')
insert into Department values(4,'Marketing')


insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(1,'Rahul','rahul@gmail.com',23,1, 21000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(2,'pranit','pranit@gmail.com',24,1, 30000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(3,'arun','arun@gmail.com',23,1, 40000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(4,'ajay','ajay@gmail.com',28,1, 50000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(5,'shreya','shreya@gmail.com',33,2, 60000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(6,'shrunit','shrunit@gmail.com',43,2, 70000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(7,'hemant','hemant@gmail.com',26,2, 80000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(8,'suraj','suraj@gmail.com',29,3, 90000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(9,'suyog','suyog@gmail.com',22,3, 22000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(10,'nilesh','nilesh@gmail.com',35,4, 33000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(11,'nitin','nitin@gmail.com',36,3, 44000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(12,'dipak','dipak@gmail.com',27,3, 55000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(13,'akshay','akshay@gmail.com',37,4, 66000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(14,'rohan','rohan@gmail.com',25,4, 77000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(15,'shantanu','shanatnu@gmail.com',23,4, 88000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(16,'aditya','aditya@gmail.com',24,1, 52000)
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(17,'aditya','aditya@gmail.com',24,5, 52000)

alter table employeSQL add country varchar(20)

-- DML update -->to modify the existing record

update employeSQL set country= 'india' where empid=1
update employeSQL set country= 'india' where empid=2
update employeSQL set country= 'india' where empid=3
update employeSQL set country= 'india' where empid=4
update employeSQL set country= 'india' where empid=5
update employeSQL set country= 'india' where empid=6
update employeSQL set country= 'india' where empid=7

--DQL -select
select * from employeSQL

select empName , empAge,empsalary from Employee

select * from employeSQL where empid=1

select * from employeSQL where empsalary<35000

select * from employeSQL where empsalary>=50000

select * from employeSQL where empAge >30
--range
select * from employeSQL where empsalary between 25000 and 35000

-- in operator is used to select the multiple match values

select * from employeSQL where empDeptid in(1,2,4)

-- not in --> records those are not matched
select * from employeSQL where empDeptid not in(1,2,4)

select * from employeSQL where empAge in(23,24,25,26)
select * from employeSQL where empDeptid not in (1,4,6,8,9)

--like used to match the string with specific pattern

select * from employeSQL where empName like 'a%' -- name start with s & contains any no of chars
select * from employeSQL where empName like '%l' -- name end with j
select * from employeSQL where empName like '%s%' -- name may contains a anywhere in the string

select * from employeSQL where empName like '%[asr]'
select * from employeSQL where empName like '[asr]%'

select * from employeSQL where empName like '[a-h]%' -- range
select * from employeSQL where empName like '%[d-r]'

select * from employeSQL where empName like 'a______'
select * from employeSQL where empName like '___l'
select * from employeSQL where empName like '____o_'

-- not like
select * from employeSQL where empName not like 'a%'
select * from employeSQL where empName not like '[asr]%'

