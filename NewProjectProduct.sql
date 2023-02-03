
 create table Product11(
 productId int primary key identity(1,1),
 productName varchar(50),
 productPrice int,
 productCompanyName varchar(50)
 );
 select * from Product11;
 sp_help  Product11;

 create table Employee11(
 employeeid int primary key identity(1,1),
 employeeName varchar(50),
 deptName varchar(50),

 )