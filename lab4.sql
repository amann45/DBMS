---------------------------lab 4 2025 dec 30-------------------------------

-- q4/q5 add attribute bid on issues relation and insert data in bid column
use amann;
alter table issues
add bid int;
select * from issues;

update issues
set bid=1 where iid=1;

update issues
set bid=2 where iid=2;

update issues
set bid=3 where iid=3;

update issues
set bid=4 where iid=4;

select * from issues;

-- q8 update bookname '0' as 'DBMS' in booklist.
update booklist
set name='DBMS'
where name='0';
select * from booklist;

-- q9 update salary of all employee by 20% whose sal is less than 5000
update employee set salary=salary*1.2
where salary< 5000;
select * from employee;

-- q10 provide 5% increment to all salaries whose salary is greater than 20000 and 20% increment in rest of others sal(use case,when,then,else,end)
update employee
set salary=CASE
when salary>20000 then salary *1.05
when salary<20000 then salary *1.2
else salary
end
select * from employee;

-- q11 delete records from issues whose bid=1
select * from issues;
DELETE issues
where bid=1;

select * from issues;

-- q12 use sub query to  find the all teacher name and faculty whose date of employee is 1jan,2011

update employee
set dateofemployee='01-01-2011' where eid=1;
select * from employee;


SELECT t.tname, t.faculty
FROM teacher as t
WHERE t.tname IN (
   select e.ename from employee as e where e.dateofemployee='01-01-2011' and t.tname=e.ename
);

-- q13 use sub query to find book name and author name whose publication is 'o_publication'
select * from booklist;   -- esma publication xa
select * from bookid;   --- esma author name,bname xa

select b.bname,b.author from bookid as b
where b.bid IN(
select bl.isbn from booklist as bl where bl.publication='o_publication' and b.bid=bl.isbn ); 



---------------------------lab 4 2025 dec 30----------------------------


-- q1: sort the employee records in descending order
 select * from employee order by salary DESC;

-- q2: sort name and publication in ascending order
select * from booklist;
select * from booklist order by name;
select * from booklist order by publication;

-- q3: Top 3 records from teachers relation
select top(3) * from teacher;

-- q4: sum of salary of all employees
select sum(salary) as sum_sal from employee;

-- q5: min salary of employee
select min(salary) as min_sal from employee;

-- q6: average price of book written by same author
select * from bookid;
select avg(price) as avg_price  from bookid group by author;

-- q7: display publication name, no of books published list by publication wise
select publication, count(*) as total_books from booklist group by publication;

-- q8: display bid, bname of books whose price is greater than average prices of book
select bid,bname from bookid where price> (select avg(price) from bookid );

-- q9: find bid, bname, author in ascending order where author name starts with m
select bid, bname, author from bookid where author like'm%' order by author ASC;

-- q10: find teachers name and book taken by them. the teacher's salary who takes the book should be the max salary
select * from employee;--salary
select * from teacher;-- teacher name
select * from bookid;--book name
select max(salary) as max_salary from employee;


SELECT t.tname,b.bname,e.salary
FROM teacher as t
JOIN employee as e ON t.tid = e.eid
JOIN bookid  as b ON t.tname = b.author
WHERE e.salary = (SELECT MAX(salary) FROM employee);

-- q11: find the authors name who have written more than one books
select author from bookid 
group by author having count(bname)>=1;