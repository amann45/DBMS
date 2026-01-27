-- implementation of JOINS, VIEWS and STORE PROCEDURES.

use amann;

select * from teacher;
select * from student;
select * from booklist;
select * from bookid;
select * from issues;
select * from employee;

-- q1 perform join operation on teacher and employee table. display ename, faculty and salary

select e.ename, t.faculty, e.salary
from employee as e
JOIN teacher as t
ON t.tid= e.eid;

-- q2 perform left join on booklist and bookid table

select * from booklist as bl
left join bookid as b
on b.bid=bl.isbn;

-- q3 perform right join on booklist and bookid table

select * from booklist as bl
right join bookid as b
on b.bid=bl.isbn;

-- q4 perform full join on issues and student table

select * from student as s
FULL outer join issues as i
on i.iid= s.id;

-- q5 display employee name starts with 'a' and contains sub string 'ro'

select ename from employee where ename like'a%' and ename like'%ro%';

-- q6 display all employee who is also teacher

select e.ename from employee e
inner join teacher t on e.eid=t.tid;

-- q7 display all employee except those are teacher

select e.ename from employee e where e.ename NOT IN(
select e.ename from employee e
inner join teacher t on e.eid=t.tid);

-- q8 create view employee_view which consists of eid, ename and salary as attributes

create view employee_view as
select e.eid, e.ename, e.salary 
from employee as e ;

-- q9 display all records of employee_view just created

select * from employee_view;

-- q10 delete from view records where salary is less than 29000 

delete from employee_view where salary < 29000 and eid <2;
select * from employee_view;

-- STORED PROCEDURES IMPLEMENTATION

create procedure salary_increment as 
update employee
set salary = salary+10;

exec salary_increment;
select salary from employee;
