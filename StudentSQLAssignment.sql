create  table student(
rollno int not null primary key,
sname varchar(50),
degree varchar(50),
bithdate date,
courseid  int,
batchid int,
feespaid int,
remark varchar(50),
isplaced  varchar(50)
)
alter table student add constraint fk_courseid1 foreign key(courseid) references Course (courseid)
alter table Course add constraint fk_trainerid foreign key(trainerid) references Trainer (trainerid)

create table Course(
courseid int not null primary key,
coursename varchar(50),
duration int,
trainerid  int,
totalfees  int
)

--alter table Course alter column duration date
--MONTH(ProducedDate) AS ProducedMonth
--SELECT 
	--MONTH('2020-12-01') [month];

create table Trainer (
trainerid int not null primary key,
trainername varchar(50),
joindate date,
email varchar(50),
experienceyears  varchar(50)
)
alter table  student alter column feespaid int
alter table  Trainer alter column experienceyears int

select * from student
select * from  Course
select * from Trainer

insert into student values(1,'arun','Electrical','1994-02-06',100,200,10000,'A','Yes')
insert into student values(2,'Atul','Computer','1994-02-06',101,201,10000,'B','No')
insert into student values(3,'Rina','BCA','1994-02-06',102,202,12000,'A+','Yes')
insert into student values(4,'Ritika','ENTC','1994-02-06',103,203,30000,'A++','Yes')
insert into student values(5,'Pandit','Civil','1994-02-06',104,204,20000,'B','No')
insert into student values(6,'Kumar','MBA','1994-02-06',105,205,50000,'A+','Yes')
insert into student values(7,'Kumar','MCA','1994-02-06',106,206,10000,'B+','Yes')
insert into student values(8,'Rina','Computer','1995-04-06',102,207,12000,'A+','Yes')
insert into student values(9,'vishal','Electrical','1995-02-06',100,200,10000,'A','Yes')
insert into student values(10,'sanjay','Electrical','1998-02-06',100,200,5000,'B','No')
insert into student values(11,'kavita','Electrical','1996-02-06',100,200,12000,'A+','Yes')
insert into student values(12,'swara','ENTC','1998-02-06',103,203,30000,'A++','Yes')
insert into student values(13,'prana','ENTC','1992-02-06',103,203,20000,'B','No')
insert into student values(14,'prathamesh','ENTC','1995-02-06',103,203,50000,'A+','Yes')
insert into student values(15,'ram','ENTC','1999-02-06',103,203,10000,'B+','Yes')
insert into student values(16,'lakhan','ENTC','1920-04-06',103,203,12000,'A+','Yes')




insert into Course values(100,'PlC',6,300,20000)
insert into Course values(101,'Mechanical',5,301,10000)
insert into Course values(102,'Computer',4,302,15000)
insert into Course values(103,'BCA',5,303,30000)
insert into Course values(104,'Civil',1,304,40000)
insert into Course values(105,'MBA',2,305,50000)
insert into Course values(106,'MCA',3,306,10000)



--drop table  Course
--alter table  course  drop fk_trainerid 
--truncate table Course
--alter table  Course alter column coursename

update Course set  coursename ='Java' where Courseid=101 
update Course set  coursename ='DotNet' where Courseid=102 
update Course set  coursename ='PHP' where Courseid=103 
update Course set  coursename ='AutoCad' where Courseid=104 
update Course set  coursename ='Marketing' where Courseid=105 
update Course set  coursename ='Testing' where Courseid=106 

update student set  courseid =103 where rollno=8


insert into Trainer values(300,'Pranit','2021-04-02','Pranit@gmail.com',5)
insert into Trainer values(301,'Hari','2020-04-02','Hari@gmail.com',4)
insert into Trainer values(302,'Jay','2019-04-19','Jay@gmail.com',3)
insert into Trainer values(303,'Ramkumar','2018-05-02','Ramkumar@gmail.com',3)
insert into Trainer values(304,'Pranali','2017-05-20','Pranali@gmail.com',2)
insert into Trainer values(305,'Pavan','2021-04-22','Pavan@gmail.com',1)
insert into Trainer values(306,'Deepa','2019-09-07','Deepa@gmail.com',6)
select * from  Trainer
select * from  Course
select * from student

--1.Show list of students. List contains roll no , student name , course name , trainer name in 
--order of course name and student name
select s.rollno, S.sname,c.coursename,t.trainername
from student  s inner join Course c on s.courseid=c.courseid
inner join Trainer t on t.trainerid= c.trainerid
order by s.sname,c.coursename desc
--2.Show list of students who have pending fees more than 1000rs . List should have student 
--name , course name , balance fees . Show this list in descending order of balance fees
select s.sname,c.coursename ,(c.totalfees-s.feespaid )as balancefees
from student s inner join Course c on  s.courseid=c.courseid
where (c.totalfees-s.feespaid )>=15000 
--3.Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’.
update student set batchid=concat('_spl',' ',batchid) where trainerid =
(
select  trainerid
from Trainer where trainername='Deepa'
)


--5-Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid 
--by student is more than 60%.
update   student set remark='Eligible for exam' where rollno in
(
select s.rollno
from student s inner join  Course c on  s.courseid=c.courseid
--where  (c.totalfees-s.feespaid)>=(0.6*c.totalfees)
where (c.totalfees*0.6)<=s.feespaid
)
--6. Create a index to make retrieval faster based on course name.
select  c.coursename,COUNT(s.rollno)
from student s inner join Course c on  c.courseid=s.courseid
group by c.coursename
order by count (s.rollno) desc
--7.List name of course for which more than 20 students are enrolled.
select c.coursename , count(s.rollno) as ' Total Enrolled Student'
from student s inner join  Course c on s.courseid=c.courseid
where  s.isplaced='Yes'
group by  c.coursename 
having count(s.rollno)>=3

--8.List name of course for which maximum revenue was generated. ( max fee collection)
select  TOP  1 c.coursename,  sum(s.feespaid) as 'Total revenue'
from student s inner join  Course c on s.courseid=c.courseid
group by  coursename 
order by [Total revenue] desc

--9.Select name of student who are in same batch as ‘Atul’
select sname from student where batchid in
(
select  batchid 
from  student where  sname='Arun'
)
--9.Delete all students who are in course which is less than 2 months duration.
select  sname from  student where courseid in
(
select  courseid
from Course where  duration<=2
)
--10.Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.
delete  from  student where sname in
 (select s.sname
from  student s inner  join  course c on  s.courseid=c.courseid
where  s.isplaced='Yes' and c.totalfees =s.feespaid)

--11. Create a trigger to add student data in ex-student table if student is deleted from student 
--tabl
--12. Create a view which shows name of trainer and number of students he is training.
create view viewstudent as
select t.trainername,COUNT(s.rollno) as 'Total student'
from student s inner join  Course c on s.courseid=c.courseid
inner join  Trainer t on t.trainerid=c.trainerid
group by t.trainername

select * from viewstudent
--13.Show names of students who are more than 20 years old

select sname from student where    
  (year (cast(CURRENT_TIMESTAMP as date ))- year  (cast( bithdate as date)))>=40
  -- year(getdate()) – year(birthdate)
  ------------------------------------
 -- select sname from student where  
  --(datediff(Year,(cast( bithdate as date)),getdate()))>30
--14. Show names of students who have paid all the fees.
select s.sname
from  student s inner  join  course c on  s.courseid=c.courseid
where   c.totalfees =s.feespaid

--15.Write a procedure which accepts student id and returns his balance fee
create procedure BalnaceFeeChart as
(
select s.rollno,s.sname,(c.totalfees-s.feespaid )as [remaing fee]
from student s inner join Course c on  s.courseid=c.courseid
where (c.totalfees-s.feespaid )>0
)
EXEC  BalnaceFeeChart
--select s.sname
--from  student s inner  join  course c on  s.courseid=c.courseid
--where  s.isplaced='Yes' and c.totalfees =s.feespaid

--update  student set remark='no'

select * from student
select * from Course
select * from Trainer
