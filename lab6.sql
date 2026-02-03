-----------------------lab 6 Title = Supplementary lab Feb,3,2026-----------------
use amann;
select * from teacher;
select * from student;
select * from employee;
select * from booklist;
select * from bookid;
select * from issues;

--2 Count the number of students in each batch.
select batch,count(name) as no_stud from student group by batch;

--4 Find the total number of books issued.
select count(b.bname) as book_issue from bookid b ;

--6 Find batches having one or more than one students.
select batch,COUNT(*) as total_students FROM student GROUP BY batch HAVING count(batch) > 0;

--8 Find students who have issued at least one book.
update student
set name='aman' where id= 1;

update student
set name='manu' where id= 2;

update student
set name='arjun' where id= 3;

update student
set name='aarogya' where id= 4;


SELECT s.name from student s
join bookid as B on  B.author = s.name
group by s.name
having count(s.name)<= 1;


--10 Display teachers earning more than all employees.
select t.tname from teacher t where t.salary > ( select MAX(e.salary) from employee e);

--12 List employees whose salary is equal to the maximum teacher salary.

alter table teacher add salary int;

update teacher
set salary = 20000 where tid=1;

update teacher
set salary = 10000 where tid=2;

update teacher
set salary = 5000 where tid=3;

update teacher
set salary = 3000 where tid=4;

update employee
set salary = 20000 where eid=4;

select * from teacher;


SELECT e.ename
FROM employee e
WHERE e.salary = (SELECT MAX(t.salary) FROM teacher t);

--14 Display teachers who joined before the earliest employee joining date.

SELECT tname
FROM  teacher t, employee e
WHERE dateofemployee < (SELECT MIN(dateofemployee) FROM employee);

--16 Retrieve students who issued the same book as another student.

SELECT DISTINCT s.name as stud_name, i.name as issue_stud_name from student s
JOIN issues i ON i.iid = s.id
ORDER BY s.name;

--18 Display teachers whose salary is higher than the faculty average (assume same faculty).
select * from teacher;
select AVG(t.salary) from teacher t;
select t.tname from teacher t where t.salary > ( select AVG(t.salary) from teacher t);

--20 List employees who earn more than at least 80% of employees.
select * from employee;

SELECT  TOP 80 percent ename from employee 
ORDER BY salary DESC;

--22 Find teachers whose salary rank is in the top 3.

select top(3) t.tname from teacher t
order by t.salary DESC;

--24 Find books that were issued by students from all batches.

select * from bookid;
select * from student;

SELECT b.bname
FROM bookid b
JOIN student s ON b.bname = s.name
GROUP BY b.bname
HAVING COUNT(DISTINCT s.batch) = (SELECT COUNT(DISTINCT batch) FROM student);