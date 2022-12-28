

select * from EmployeSQL
select * from Deptt
--DML  
--insert 
insert into Deptt values(1,'HR')
insert into Deptt values(2,'Testing')
insert into Deptt values(3,'Developer')
insert into Deptt values(4,'Marketing')


insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(1,'Rahul','rahul@gmail.com',23,'HR', 21000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(2,'pranit','pranit@gmail.com',24,'HR', 30000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(3,'arun','arun@gmail.com',23,'HR', 40000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(4,'ajay','ajay@gmail.com',28,'HR', 50000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(5,'shreya','shreya@gmail.com',33,'Testing', 60000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(6,'shrunit','shrunit@gmail.com',43,'Testing', 70000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(7,'hemant','hemant@gmail.com',26,'Testing', 80000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(8,'suraj','suraj@gmail.com',29,'Testing', 90000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(9,'suyog','suyog@gmail.com',22,'Testing', 22000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(10,'nilesh','nilesh@gmail.com',35,'Developer', 33000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(11,'nitin','nitin@gmail.com',36,'Developer', 44000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(12,'dipak','dipak@gmail.com',27,'Developer', 55000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(13,'akshay','akshay@gmail.com',37,'Marketing', 66000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(14,'rohan','rohan@gmail.com',25,'Marketing', 77000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(15,'shantanu','shanatnu@gmail.com',23,'Marketing', 88000)
insert into employeSQL(empid,empName,empEmail,empAge,empDept,empSalary)values(16,'aditya','aditya@gmail.com',24,'Marketing', 52000)

alter table employeSQL add country varchar(20)

-- DML update -->to modify the existing record

update employeSQL set country= 'india' where empid=1
update employeSQL set country= 'india' where empid=2
update employeSQL set country= 'india' where empid=3
update employeSQL set country= 'india' where empid=4
update employeSQL set country= 'india' where empid=5
update employeSQL set country= 'india' where empid=6
update employeSQL set country= 'india' where empid=7

-- DML Delete --> it is used to delete the record

delete from employeSQL where empid =10
delete from employeSQL where empDept = 'Developer'



--DQL -select
select * from employeSQL

select empName , empAge,empsalary from Employee

select * from employeSQL where empid=1

select * from employeSQL where empsalary<35000

select * from employeSQL where empsalary>=35000

select * from employeSQL where empAge >30
--range
select * from employeSQL where empsalary between 25000 and 35000

drop table employee
drop table employeSQL



