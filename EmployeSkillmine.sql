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

alter table employeSQL add constraint fk_empDeptid foreign key (empDeptid) references Department(deptId)
sp_help Department

create table Department(
deptId int primary key,
deptName varchar(30)
)
alter table employeSQL add constraint fk_empDeptid foreign key (empDeptid) references Department(deptId)
sp_help Department



 
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
insert into employeSQL(empid,empName,empEmail,empAge,empDeptid,empSalary)values(17,'Riya','riya@gmail.com',24,5, 52000)

alter table employeSQL add country varchar(20)

-- DML update -->to modify the existing record

update employeSQL set country= 'india' where empid=1
update employeSQL set country= 'india' where empid=2
update employeSQL set country= 'india' where empid=3
update employeSQL set country= 'india' where empid=4
update employeSQL set country= 'india' where empid=5
update employeSQL set country= 'india' where empid=6
update employeSQL set country= 'india' where empid=7
update employeSQL set country= 'USA' where empid=8
update employeSQL set country= 'USA' where empid=9
update employeSQL set country= 'USA' where empid=10
update employeSQL set country= 'USA' where empid=11
update employeSQL set country= 'UAE' where empid=12
update employeSQL set country= 'UAE' where empid=13
update employeSQL set country= 'UAE' where empid=14
update employeSQL set country= 'France' where empid=15
update employeSQL set country= 'France' where empid=16
update employeSQL set country= 'France' where empid=17

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

-- if column contains null value we can not compare using operator
-- is null
-- is not null

select * from employeSQL

select * from employeSQL where country is not null

select * from employeSQL where country is null

--order by
-- Sort the records either in asending or desending order
select * from employeSQL order by empName -- by default in asending order
select * from employeSQL order by empName desc

select * from employeSQL order by empSalary desc

select * from employeSQL order by empName, empSalary, empAge

-- and , or & not operator

select * from employeSQL where empDeptid=3 and country='USA'

select * from employeSQL where empDeptid=2 or country='india'

select * from employeSQL where not country='USA' 

--offset --> you want to skip any perticular records
-- fetch --> is used to select the perticular records after the offset
select * from employeSQL 
order by empSalary desc
offset 1 rows
fetch next 3 rows only

-- Inner Join → select the records that have matching values in the both tables / multiple tables.

select e.*,d.deptName
from employeSQL e 
inner join Department d on d.deptId=e.empDeptid

-- inner join

select e.*, d.deptName from employeSQL e
inner join Department d on d.deptId =e.empDeptid

-- left join
-- display all records from the left table & match records from another table
-- when there is no match record right table returns null

select e.*, d.deptName from employeSQL e
left join Department d on d.deptid=e.empDeptid

--right join
select e.*, d.deptName from employeSQL e
right join Department d on d.deptId=e.empDeptid

select * from employeSQL
alter table employeSQL add managerid int
drop column managerid

update employeSQL set managerid = 1 where empid in (2,3,4)
update employeSQL set managerid = 5 where empid in(6,7,8)
update employeSQL set managerid = 9 where empid in (10,11,12)
update employeSQL set managerid = 13 where empid in (14,15,16)


select emp.empName as 'Employee' , man.empName as 'Manger'
from employeSQL emp, employeSQL man
where man.empid = emp.managerid


select * from employeSQL

select sum(empSalary) as 'Total Salary' from employeSQL

select avg(empSalary) as 'Avg Salary' from employeSQL

select min(empSalary) as 'Min salary' from employeSQL

select max(empSalary) as 'Max salary' from employeSQL

select count(empName) as 'Total Emp' from employeSQL

select count(country) as 'Total countries' from employeSQL

select count(distinct country) as 'Total countries' from employeSQL

-- * --> consider the duplicate & null values also
select COUNT(*) as 'All Records' from employeSQL


--Identity Column in SQL
--When you want to set the value of a particular column when new record get inserted in the table
--When we want to auto increment the value of unique or primary key column 



create table Customer(
customerid int primary key identity(1,1),
customername varchar(20)
)

select * from customer
sp_rename 'Customer', 'Customers'

create table Orders(
orderid int primary key identity(1,1),
customerid int,
constraint fk_customer_order Foreign Key (customerid) references customer(customerid)
)


select * from employeSQL

select* from Department
select country, count(empDeptid) as 'Total emp' from employeSQL
group by country
select deptName, count(deptId) as 'Total Department Emp' from Department
group by deptName

select d.deptName, COUNT(e.empDeptid) as 'emp count' from employeSQL e
inner join Department d on d.deptId= e.empDeptid
where d.deptName= 'Testing'
group by d.deptName

select country , COUNT(empDeptid) as 'Total emp' from employeSQL
where country in('india', 'USA')
group by country
order by count (empDeptid)


--Views in SQL 

--View is a virtual table based on result set of an sql statement
--View also contains rows & columns just like real table
--Virtual presentation of the table or multiple tables

--CREATE / alter / Drop

--views in SQL
--Create a view
create view deptwise_empcount 
as
select d.deptName , count(e.empDeptid) as 'emp count' from employeSQL e
inner join Department d on d.deptId=e.empDeptid
group by d.deptName

--modify the existing view
alter view deptwise_empcount 
as
select d.deptName , count(e.empDeptid) as 'emp count' from employeSQL e
inner join Department d on d.deptId=e.empDeptid
group by d.deptName

--call the view
select * from deptwise_empcount

-- delete the view
drop view deptwise_empcount


create view salary_greaterthan30k
as
select * from employeSQL where empSalary > 30000

select * from salary_greaterthan30k


-- Built in functions
--1. substring
select * from employeSQL
select SUBSTRING(empName,2,5) as tempname from employeSQL

--2. concat
select CONCAT(empName,'-> ',empEmail) as details from employeSQL

--3. len
select len(empName) as emplength from employeSQL
-- 4. upper, lower
select UPPER(empName) as empname, lower(empEmail)as email from employeSQL

--5. TRIM -> remove white space from L & R side , 
-- LTRIM->remove white space from Left side, 
-- RTRIM ->remove white space from Right side
select TRIM(empName) from employeSQL

--6. Reverse
select REVERSE(empName) as tempname from employeSQL

-- 7 round
select round(empSalary,2) from employeSQL

 select cast(empSalary as varchar(20)) as 'str salary' from employeSQL-- .ToString()

 -- isnull --> if any null value found then replace with new word or value
 select empName,country from employeSQL
 select empName,ISNULL(country,'Not assigned') as 'Country' from employeSQL
 --product price  qty  total
 select isnull(price,1000), ISNULL(qty,'NA'), price *(isnull(qty,1))



-- User defined function
--Single / scalar function → that returns a single value
--Multi value / table function → that returns a record set 



-- user defined function
-- single value

create function Addition(@a int,@b int)
returns int
as begin
declare @sum int
set @sum=@a+@b
return @sum
end


select dbo.Addition(77,123) as 'Sum' 


create function GetEmpNameById(@id int)
returns varchar(20)
as begin
return (select empName from employeSQL where empid=@id)
end

select dbo.GetEmpNameById(2) as 'empname'

create function GetEmpDetails(@id int)
returns table
as 
return (select * from employeSQL where empid=@id)


select * from dbo.GetEmpDetails(2)


create function GetEmpByDept(@id int)
returns table
as 
return (select * from employeSQL where empDeptid=@id)

select * from dbo.GetEmpByDept(4)

--Create user defined function to calculate salary hike by 15 % & display emp salary & new salary 
--(scalar function)
--Display empname, salary as old salary & salary as new salary from emp table


create function SalaryHike(@salary int)
returns int
as begin
declare @Hikesalary int
set @Hikesalary = @salary + (@salary* 0.15)
return @Hikesalary
end

select empName, empSalary, dbo.SalaryHike(empSalary) as 'Hike Salary' from employeSQL

sp_help employeSQL


create procedure SP_GetAllEmpByDept(@did int)
as begin
select * from Employee where deptid=@did
return
end

exec SP_GetAllEmpByDept
@did =2


create proc SP_InsetEmployee(
@empid int,
@empname varchar(20),
@email varchar(30),
@age int,
@country varchar(20),
@deptid int,
@sal int,
@managerid int
)
as begin
insert into Employee values(@empid,@empname,@email,@age,@country,@deptid,@sal,@managerid)
return
end

exec SP_UpdateEmployee
@empid=13,
@empname ='Test1',
@email='test@gmail.com',
@age=22,
@country ='UK',
@deptid =5,
@sal =23000,
@managerid=1

create proc SP_UpdateEmployee(
@empid int,
@empname varchar(20),
@email varchar(30),
@age int,
@country varchar(20),
@deptid int,
@sal int,
@managerid int
)
as begin
update Employee set empname=@empname,email=@email,age=@age,country=@country,deptid=@deptid,salary=@sal,managerid=@managerid where empid=@empid
return
End




