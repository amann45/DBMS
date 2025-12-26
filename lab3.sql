/*UPDATE QUERY, MULTI-TABLE QUERY AND SUB-QUERY*/


-- q1 create table student and teacher in same database use in last lab(amann).
-- q2 insert the data in both table.

use amann;
create table student(
id int primary key NOT NULL,
name varchar(29),
rollno int,
batch varchar(20)
);
insert into student values
(1,'patel',10,'2080'),
(2,'madhav',11,'2081'),
(3,'manoj',20,'2082'),
(4,'aruu',8,'2079');

create table teacher(
tid int primary key NOT NULL,
tname varchar(29),
faculty varchar(20)
);

insert into teacher values
(1,'aman','bct'),
(2,'arjun','bce'),
(3,'aarogya','bei'),
(4,'manu','bca');

select * from student;
select * from teacher;

-- INITIALLY GOT ERROR SINCE WE NEED TO MATCH THE AUTHOR'S NAME WITH TEACHER'S NAME SO RAN THIS QUERY.
update bookid
set author='aman' where bid=289;


update bookid
set author='arjun' where bid=2876;


update bookid
set author='aarogya' where bid=3676;


update bookid
set author='manu' where bid=456;

-- q3=select bname,publication, author from booklist,bookid where publication like '%a'.
select b.bname,bl.publication, b.author from booklist as bl,bookid as b where publication like 'a%' and b.bid=bl.isbn;

-- q4=display teacher name and faculty whose dateofemployee is 01-01-2010.
select t.tname,t.faculty from employee as e, teacher as t where e.dateofemployee='01-01-2010' and t.tname=e.ename;

-- q5=find employee name whose salary>10000 and faculty is bct.
select e.ename from employee as e, teacher as t where e.salary>10000 and t.faculty='bct' and t.tname=e.ename;

-- q6=find teachers name and bookname issued by teacher whose name starts with 'm'.
select t.tname, b.bname from teacher as t, bookid as b where t.tname like 'm%' and t.tname=b.author;

-- q7=update all salary by 10%
update employee
set salary=1.1*salary;

select * from employee;

-- q8=find top3 teachers with highest salary.
SELECT TOP(3) salary, name FROM  (SELECT e.salary as salary, t.tname as name FROM employee AS e
INNER JOIN teacher as t
ON e.ename = t.tname) as a ORDER BY salary DESC;

-- q9 display books that are written by teacher
select t.tname,b.bname from teacher as t, bookid as b where t.tname=b.author;



