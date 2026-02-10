------------lab7 Supplementary lab 2 2026-feb-10 --------------

use amann;

select * from student;
select * from teacher;
select * from employee;
select * from booklist;
select * from bookid;
select * from issues;

ALTER TABLE bookid ADD idb int;

update bookid
set idb = 1 where bid=289;

update bookid
set idb = 2 where bid=456;

update bookid
set idb = 3 where bid=2876;

update bookid
set idb = 4 where bid=3676;

ALTER TABLE booklist ADD blid int;

update booklist
set blid = 1 where isbn=289;

update booklist
set blid = 2 where isbn=456;

update booklist
set blid = 3 where isbn=2876;

update booklist
set blid = 4 where isbn=3676;


-- Q1 List book name, author, and issue date for all issued books.

select b.bname, b.author, i.dateofissues 
from bookid b
join issues i on i.iid= b.idb
order by b.bname ;

-- Q2 Retrieve the teacher name and salary along with the books they have issued.

select t.tname, t.salary ,b.bname from teacher t
join bookid b on t.tid= b.idb
join issues i on i.iid=b.idb;

-- Q3 Find students and teachers who issued books, showing their name, role (Student/Teacher), and issue date.

select * from student;
select * from teacher;

select s.name , t.tname ,i.dateofissues from  student s
join teacher t on t.tid=s.id
join issues i on t.tid=i.iid;

-- Q4 Display student name and number of books issued (use JOIN with aggregation).

select  s.name,count(i.iid) from issues i
join student s on s.id= i.iid group by s.name;

-- Q5 Display book names that have been issued by students from a specific batch.

select * from bookid;
select * from student;
select * from issues;

select b.bname from bookid b
join student s on  b.author=s.name
join issues i on i.iid= s.id
group by b.bname;

-- Q6 List students who have issued the same book as another student.

SELECT DISTINCT s.name as stud_name, i.name as issue_stud_name from student s
JOIN issues i ON i.iid = s.id
ORDER BY s.name;

-- Q7 Find students who issued books published by a specific publication.

select s.name from student s
join issues i on s.id=i.iid
join booklist bl on bl.blid=i.iid
group by s.name;
 
-- Q8 Find employees who issued books and were issued by teachers also.

select e.ename from employee e
join issues i on e.eid=i.iid
join teacher t on t.tid= i.iid
group by e.ename;

-- Q9 Create a stored procedure that accepts a batch name and displays all students who issued books from that batch.

CREATE PROCEDURE GetStudentsByBatch
@BatchName VARCHAR(50) AS 
SELECT DISTINCT s.name, s.id, i.dateofissues
FROM student s
INNER JOIN issues i ON s.id = i.iid
WHERE s.batch ='2082';

EXEC GetStudentsByBatch @BatchName='2082';


-- Q10 Create a stored procedure to calculate the total value of books issued by a student.

create procedure value_book as 
select sum(b.price) from bookid b;
exec value_book;

-- Q11 Create a stored procedure to update book price based on a given bid.

create procedure price_increment as 
update bookid
set price = price+10;
exec price_increment;
select * from bookid;

-- Q12 Create a stored procedure to delete issue records before a specified date.
create procedure delete_issues as 
delete  from issues
where iid = 2;

exec delete_issues;
select * from issues;





