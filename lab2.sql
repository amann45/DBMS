create database amann;
use amann;
create table employee(
eid int primary key,
ename varchar(15),
dateofemployee DATE DEFAULT ('01-01-2010'),
salary int
);

create table booklist(
isbn int primary key,
name varchar(15),
publication DATE,
);

create table bookid(
bid int primary key,
bname varchar(15),
author varchar(20),
price int
FOREIGN KEY (bid)
    REFERENCES booklist(isbn)
);

create table issues(
iid int primary key,
name varchar(15),
dateofissues varchar(20),
FOREIGN KEY (iid)
    REFERENCES employee(eid)
);

Insert into employee(eid,ename,salary) values
(1,'aman',10000),
(2,'arjun',1000),
(3,'aarogya',20000),
(4,'manu',6000)

Insert into booklist(isbn,name,publication) values
(289,'a','a_publication'),
(2876,'e','e_publication'),
(3676,'i','i_publication'),
(456,'0','o_publication');

 -- alter table booklist alter column publication varchar(20);

 Insert into bookid values
(289,'english','abcd_author',2000),
(2876,'nepali','efg_author',4000),
(3676,'math','hij_author',3000),
(456,'science','klm_author',1000);

Insert into issues values
(1,'santos','01-01-2011'),
(2,'baluuu','01-02-2012'),
(3,'bipin','01-03-2013'),
(4,'manish','01-04-2014');

alter table employee alter column ename varchar(20) NOT NULL;
alter table booklist alter column name varchar(20) NOT NULL;
alter table bookid alter column bname varchar(20) NOT NULL;
alter table issues alter column name varchar(20) NOT NULL;

ALTER TABLE bookid
ADD CONSTRAINT CHK_Price CHECK (price<5000);


-- display all record from all relation


select * from employee;
select * from booklist;
select * from bookid;
select * from issues;

-- price between 2500 and 5000
select * from bookid where price between 2500 and 5000;

-- publication starts with e.
select * from booklist where publication like 'e%';

-- name end with ya
select * from employee where ename like '%ya';

-- display eid and name from employee,EXACT 5 CHARACTER

select eid,ename from employee where len(ename)=5;

-- where name start with a and sal>10000
select * from employee where ename like'a%'and salary>10000;

-- display isbn number bookname where booklist must not contain 1003
select isbn,name from booklist where isbn!=1003;
