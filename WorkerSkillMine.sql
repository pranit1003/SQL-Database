create table worker(
Worker_id int not null primary key,
Firstname varchar(20),
Last_name varchar(20),
Salary int,
Joining_date datetime,
Department varchar(20)
)

INSERT INTO Worker 
	(Worker_id ,Firstname ,Last_name ,Salary ,Joining_date ,Department ) VALUES
		(11, 'Pranit', 'Chougule', 100000, 14-02-20 , 'HR'),
		(12, 'Arun', 'Tarle', 80000, 14-06-20 , 'Admin'),
		(13, 'Ajay', 'Patil', 300000, 14-02-21 , 'HR'),
		(14, 'Ritika', 'Lad', 500000, 14-02-22 , 'Admin'),
		(15, 'Kavita', 'Bari', 500000, 14-06-21 , 'Admin'),
		(16, 'Hemant', 'Desai', 200000, 14-08-21, 'Account'),
		(17, 'Ashwini', 'Jagtap', 75000, 14-05-20 , 'Account'),
		(18, 'Mahesh', 'Mane', 90000, 14-06-22 , 'Admin');
insert into Worker (Worker_id ,Firstname ,Last_name ,Salary ,Joining_date ,Department ) VALUES(19, 'Om ', 'Gavde' , 85000, 12-03-19, 'Account');
insert into worker(Worker_id, Firstname, Last_name , Salary , Joining_date , Department) values(20, 'Rahul', 'Kale', 78000, 04-05-20 , 'Admin');

 select *from worker

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(11, 5000, 16-02-20),
		(12, 3000, 16-06-11),
		(13, 4000, 16-02-20),
		(14, 4500, 16-02-20),
		(15, 3500, 16-06-11);
insert into Bonus(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) values (16, 2500, 25-12-20);

	 select *from Bonus

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE varchar(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (11, 'Manager', 2016-02-20 ),
 (12, 'Executive', 2016-06-11 ),
 (18, 'Executive', 2016-06-11),
 (15, 'Manager', 2016-06-11 ),
 (14, 'Asst. Manager', 2016-06-11 ),
 (17, 'Executive', 2016-06-11 ),
 (16, 'Lead', 2016-06-11 ),
 (13, 'Lead', 2016-06-11 );

 select *from worker
 select *from Bonus 
 select *from Title

 --Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>

 select Firstname as WORKER_NAME from 
 worker 
 --Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

 select upper(firstname) as WORKER_NAME from worker

 --Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

 select distinct Department from worker

 --Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table

 select substring(firstname,1,3) from worker

 --Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.


 --Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

 select rtrim(firstname)from worker

 --Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

 select ltrim(department) as 'dept' from worker

 --Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

 select distinct department as'Dept Name',len(department)as 'Length ' from worker 

 --Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
 Select REPLACE(firstname,'a','A') from Worker;

 --Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

 select CONCAT (firstname,' ',last_name) as 'Name' from worker 

 --Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

 select *from worker order by firstname asc

 --Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

 select*from worker order by firstname , department desc 

 --Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

 select*from worker where firstname in('pranit','arun')

 --Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
 select*from worker where firstname not in('pranit','arun')

 --Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

 select*from worker where Department ='Admin'

 --Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

 select *from worker where firstname like '%a%'

 --Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

  select *from worker where firstname like '%a'

  --Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

  select *from worker where firstname like '_____h'

  --Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

  select *from worker where Salary between 100000 and 500000

  --Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

  select *from worker where YEAR(joining_date)=14 and MONTH(joining_date)=02;

  --Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

  select count(worker_id) as'count ' from worker where Department ='Admin'

  --Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
  select CONCAT (firstname,' ',Last_name )as'Name',Salary  from worker where Worker_id in
  (select worker_id from worker where Salary between 50000 and 100000)

  --Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

  select distinct department, COUNT (worker_id) as'Count' from worker 
group by Department 
order by 'Count' desc

--Q-24. Write an SQL query to print details of the Workers who are also Managers.

select w.firstname ,t.WORKER_TITLE 
from worker w
inner join Title t
on w.worker_id=t.WORKER_REF_ID 
and t.WORKER_TITLE ='Manager'

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

--Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker WHERE MOD (Worker_id, 2) <> 0;

--Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM Worker WHERE MOD (Worker_id, 2) = 0;

--Q-28. Write an SQL query to clone a new table from another table.
SELECT * INTO WorkerClone FROM Worker;

--Q-29. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);

--Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT * FROM Worker
MINUS
SELECT * FROM Title;

--Q-31. Write an SQL query to show the current date and time.
SELECT * FROM Worker
MINUS
SELECT * FROM Title;