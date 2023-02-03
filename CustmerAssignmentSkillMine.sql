create table Customer1(
customerid int,
customername varchar(20),
customerCity varchar(40),
coustomerCountry varchar(50),
customerPostalCode int
)
sp_Rename 'Customer1.coustomerCountry','customerCountry','COLUMN'
select*from Customer1

insert into Customer1(customerid,customername,customerCity,customerCountry)values(101,'Ashwini','pune','India')
insert into Customer1 values(102,'Ritika','Berlin','England',null)
insert into Customer1 values(103,'Arun','London','England',null)
insert into Customer1 values(104,'Pranit','Kolhapur','India',null)
insert into Customer1 values(105,'Payal','kolhapur','India',null)
insert into Customer1 values(106,'Kavita','Pune','India',null)
insert into Customer1 values(107,'Manthan','Berlin','England',null)
insert into Customer1 values(108,'Krushna','London','England',null)
insert into Customer1 values(109,'Brijesh','Berlin','England',null)
insert into Customer1 values(110,'Rahul','NewYork','USA',null)

select*from Customer1 order by customerid asc

--1.Write a statement that will select the City column from the Customers table

select customerCity from Customer1

--2.Select all the different values from the Country column in the Customers table.
 
 select distinct customerCountry from Customer1

 --3.	Select all records where the City column has the value "London

 select *from Customer1 where customerCity='London'

 --4.	Use the NOT keyword to select all records where City is NOT "Berlin".

 select*from Customer1 where customerCity not in ('Berlin')

 --5.	Select all records where the CustomerID column has the value 23.

 --select*from Customer1 where customerid=23 
 select*from Customer1 where customerid=107

-- 6.	Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.

update Customer1 set customerPostalCode=121110 where customerCity='Berlin'

 select *from Customer1 where customerCity='Berlin' and customerPostalCode=121110

 --7.	Select all records where the City column has the value 'Berlin' or 'London'.

 select*from Customer1 where customerCity='Berlin' or customerCity='London'

 --8.	Select all records from the Customers table, sort the result alphabetically by the column City.

 select*from Customer1 order by customerCity --by default ascending

 --9.	Select all records from the Customers table, sort the result reversed alphabetically by the column City.

 select*from Customer1 order by customerCity desc

 --10.	Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City

 select*from Customer1 order by customerCountry , customerCity 

 --11.	Select all records from the Customers where the PostalCode column is empty

 select*from Customer1 where customerPostalCode is null

 --12.	Select all records from the Customers where the PostalCode column is NOT empty.

 select*from Customer1 where customerPostalCode is not null
 
 --13.	Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".

 insert into Customer1(customerid,customername,customerCity,customerCountry)values(111,'Om','Canada','Norway')

 --14.	Delete all the records from the Customers table where the Country value is 'Norway'.

 delete from Customer1 where customerCountry='Norway'

 

 alter table Customer1 add Price int 
 select*from Customer1 order by customerid --by default ascending
update Customer1 set Price=20 where customerid in (101,105,109)
update Customer1 set Price=10 where customerid in (110,104,106)
update Customer1 set Price=50 where customerid in (107)
update Customer1 set Price=70 where customerid in (102)
update Customer1 set Price=80 where customerid in (103,108)

--15.	Use the MIN function to select the record with the smallest value of the Price column.

select min (Price) from Customer1

--16.	Use an SQL function to select the record with the highest value of the Price column.

select max (Price) from Customer1

--17.	Use the correct function to return the number of records that have the Price value set to 20

select *from Customer1 where Price=20

--18.	Use an SQL function to calculate the average price of all products.

select avg (Price) from Customer1

--19.	Use an SQL function to calculate the sum of all the Price column values in the Products table
 
 select sum (price) from Customer1

 --20.	Select all records where the value of the City column starts with the letter "a".

 select*from Customer1 where customerCity like 'a%'

 --21.	Select all records where the value of the City column ends with the letter "a".

 select*from Customer1 where customerCity like '%a'

 --22.	Select all records where the value of the City column contains the letter "a".

 select*from Customer1 where customerCity like '%a%'

 --23.	Select all records where the value of the City column starts with letter "a" and ends with the letter "b".

 select*from Customer1 where customerCity like 'a%' and customerCity like '%b'

 --24.	Select all records where the value of the City column does NOT start with the letter "a".

select*from Customer1 where customerCity not like 'a%'

--25.	Select all records where the second letter of the City is an "a".

select*from Customer1 where customerCity like '_a%'

--26.	Select all records where the first letter of the City is an "a" or a "c" or an "s".

select*from Customer1 where customerCity like 'a%' or customerCity like 'c%' or customerCity like 's%'

--27.	Select all records where the first letter of the City starts with anything from an "a" to an "f".

select*from Customer1 where customerCity like '[a-f]%'

--28.	Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".

select*from Customer1 where customerCity not like 'a%' or customerCity not like 'c%' or customerCity not like 'f%'

--29.	Use the IN operator to select all the records where the Country is either "Norway" or "France".

select*from Customer1 where customerCountry in ('Norway')or  customerCountry in ('France')

--30.	Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".

select*from Customer1 where customerCountry not in ('Norway') and customerCountry not in  ('France')

--31.	Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20

select*from Customer1 where Price between 10 and 20

--32.	Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.

select*from Customer1 where Price  not between 10 and 20

--33.	Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
alter table Customer1 add ProdName varchar(20)
update Customer1 set ProdName='Iphone' where customerid in (101,105,109)
update Customer1 set ProdName='Samsung' where customerid in (110,104,106)
update Customer1 set ProdName='Mi A3' where customerid in (107)
update Customer1 set ProdName='OnePlus'where customerid in (102)
update Customer1 set ProdName='OOpO'where customerid in (103,108)

select*from Customer1 where ProdName between 'Geitost' and 'Pavlova'

--34.	When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.

select customerPostalCode as 'pno'from Customer1

--35.	When displaying the Customers table, refer to the table as Consumers instead of Customers.

select*from Customer1 as Consumers

--36.	List the number of customers in each country.

select customername ,customerCountry from Customer1

--37.	List the number of customers in each country, ordered by the country with the most customers first.

select customerCountry,customername,customerid from Customer1 order by customerid desc

--38.	Write the correct SQL statement to create a new database called testDB.

create database testDB

--39.	Write the correct SQL statement to delete a database named testDB
 drop database testDB

--40.	Add a column of type DATE called Birthday in Persons table
create table Person(
Birthday Date)
select*from Person
 alter table Person add PersonId int 

--41.	Delete the column Birthday from the Persons table
alter table Person drop column Birthday
 




