create table Product111(
 productId int primary key identity(1,1),
 productName varchar(50),
 productPrice int,
 productCompanyName varchar(50)
 );
 select * from Product111;
 sp_help  Product111;