--Database queries

--Book table	– Book id , book name , author id , price , published date
--Author table 	– author id , author name , ph no , email , address, city 
--Awards table 	– award id , award type id, author id , book id , year 
--Awards master table – award type id , award name , award price




create table book11(
Bookid int not null primary key,
Bookname varchar(30),
authorid int,
price decimal,
publisheddate date
)

create table Author11(
Authorid int not null Primary key,
Authorname varchar(30),
phno varchar(10),
email varchar(30),
Authoraddress varchar(50),
city varchar(30)
)
create table AwardMaster11(
Awardtypeid int not null primary key,
AwardName varchar(30),
AwardPrize decimal
)

create table Awards11(
Awardid int not null primary key,
Awardtypeid int ,
Authorid int,
Bookid int,
AwardYears varchar(20) 
)

alter table Awards11 add constraint fk_Awardtypeid1 foreign key(Awardtypeid) references AwardMaster11 (Awardtypeid)
alter table Awards11 add constraint fk_bookid1 foreign key(bookid) references book11 (bookid)
alter table Awards11 add constraint fk_Authorid1 foreign key(Authorid) references Author11 (Authorid)

insert into book11 values (1,'Dairyofannfrank',100,500,'2010-5-12')
insert into book11 values (2,'Mrutynjay',101,50,'2014-4-21')
insert into book11 values (3,'MahaBharat',102,70,'1875-2-20')
insert into book11 values (4,'Ramayan',103,900,'2017-7-5')
insert into book11 values (5,'Agnipankh',104,700,'2020-9-13')

INSERT INTO Author11 VALUES(100, 'Chetan  Bhagat', '9850332330', 'pranit@gmail.com', 'near modern highschool' , 'Ichalkaranji')
INSERT INTO Author11 VALUES(101, 'Arun', '123332330', 'arun@gmail.com', 'near st stand' , 'Nashik')
INSERT INTO Author11 VALUES(102, 'Kavita', '9850334556', 'kavita@gmail.com', 'near dmart' , 'Bhusawal')
INSERT INTO Author11 VALUES(103, 'Mahesh', '123456789', 'mahesh@gmail.com', 'near sfc mall' , 'Kolhapur')
INSERT INTO Author11 VALUES(104, 'Ajay', '789456123', 'ajay@gmail.com', 'near shiroli fata' , 'Shiroli')

insert into AwardMaster11 values(420,'PadmBhushan',50000)
insert into AwardMaster11 values(421,'PadmShree',55000)
insert into AwardMaster11 values(422,'Dadasaheb Falke',600000)
insert into AwardMaster11 values(423,'Arjun',1000000)
insert into AwardMaster11 values(424,'Veer',4500000)

Insert into Awards11 values (300, 420, 100,1, '2019')
Insert into Awards11 values (301, 421, 101,2, '2002')
Insert into Awards11 values (302, 422, 102,3, '1996')
Insert into Awards11 values (303, 423, 103,4, '2000')
Insert into Awards11 values (304, 424, 104,5, '2016')

select * from book11
select * from Author11
select * from AwardMaster11
select * from Awards11
--1.	Write a query to show book name , author name and award name for all books which has received any award. 
select  b.Bookname,au.Authorname,am.AwardName 
from book11 b inner join Author11 au on au.authorid=b.authorid
inner join Awards11 aw on aw.Authorid=au.Authorid
inner join AwardMaster11 am on am.Awardtypeid=aw.Awardtypeid
 
--book,= auther id
--author
--awards=authot id both join awrdmasrr
--awardsmaster=joint both awrdtypeide 
--2.	Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .
update  Author11 set Authorname ='Honourable' where authorid in
(
select  authorid
from  book11 where  price>100
)

--3.Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.
select Authorname,count(Bookid) from 
Author11 a1 inner  join  book11 b1 on  a1.Authorid=b1.authorid
group by Authorname
ORDER BY COUNT(Bookid)desc 
--4.	Write a query to select book name with 5 th highest price.
select  bookname from  book11 where price =
(
SELECT  MAX(Price) AS LargestPrice
FROM book11
)
--5.Select list of books which have same price as book ‘Diary of Ann Frank’
select  * from  book11 where  Bookname='Dairyofannfrank'
--6.Increase price of all books written by Mr. Chetan Bhagat by 5%.
INSERT INTO Author11 VALUES(105, 'Chetan  Bhagat', '9850332830', 'pranit@gmail.com', 'near modern highschool' , 'Ichalkaranji')
--insert into book11 values (6,'story book',105,600,'2012-5-12')
--insert into book11 values (7,'kids book',105,550,'2013-5-12')
update book11  set price=price+(price*0.05) where authorid=
(
select  
authorid from Author11 where  Authorname='Chetan  Bhagat'
)

--7.Show award names and number of books which got these awards.
select a1.AwardName,count(b.Bookid) from 
AwardMaster11 a1 inner  join  Awards11 a11 on  a1.Awardtypeid=a11.Awardtypeid
inner join book11 b on b.authorid=a11.Authorid
group by awardname
--ORDER BY COUNT(b.Bookid)desc 
--8.	Delete all books written by ‘Chetan Bhagat’
delete  from book11 where authorid=
(
select Authorid from  Author11 where Authorname='Chetan  Bhagat'
)
--9.Create view to show name of book and year when it has received award

select  b.Bookname,aw.AwardYears,am.AwardName 
from AwardMaster11 am inner join Awards11 aw on  am.Awardtypeid=aw.Awardtypeid
inner join book11 b on b.Bookid=aw.Bookid

--10.	Create trigger to ensure min price of any book must be Rs. 100. 

--11.	Increase price of book by 10% if that book has received any award.
update book11  set price=price+(price*0.10) where Bookid in
(
select  
Bookid from Awards11 where Awardtypeid in(
select Awardtypeid from AwardMaster11
) 
)
--12.Show names of author and number of books written by that Author

select a1.Authorname,COUNT(b.Bookid) as  'Total Book Return'
from Author11 a1 inner  join book11 b on  a1.Authorid=b.authorid
group by Authorname
order by count (b.Bookid)desc

--13.Show names of authors whose books are published before year 2020

select  a1.Authorname
from  Author11 a1 inner  join book11 b on  a1.Authorid=b.authorid
inner join book11 b1 on b1.authorid=a1.Authorid
where   b1.publisheddate <= '2020-01-02'

--14.Show name of books which has published within 1 year after 15 August 2020.

select *  from  book11  where  publisheddate between'2010-05-12'and'2015-04-21'

select *  from  book11  where  publisheddate in ('2017-07-05','2020-09-13')

--15.Delete all authors whose no book is published in year 2020.



--delete  Author11 where Authorid=106
select * from  Author11
select * from  book11
select * from AwardMaster11
select * from  Author11
select * from  book11