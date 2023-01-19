--Cross Join
--The cross join is used to generate paired combination of each row of the first table with each row of second table
--This type of join is also called as cartesian product

 create table product(
 productname varchar(20)
 )

 create table Prosize(
 size varchar(5)
 )
 create table proColour(
 colour varchar(20)
 )
 select*from product
 insert into product values('Tshirts')
 insert into product values('shirts')
 insert into product values('Jackets')
 select *from Prosize 
 insert into Prosize values('M')
  insert into Prosize values('L')
   insert into Prosize values('XL')
    insert into Prosize values('XXL')
select *from proColour
insert into proColour values('Black')
insert into proColour values('White')
insert into proColour values('Gray')

	select*from product cross join proColour cross join Prosize