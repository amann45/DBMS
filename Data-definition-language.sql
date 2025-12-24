create database aman4545;
use aman4545;
 create table students(
  stu_id int,
  name varchar(10),
  grade varchar(10) UNIQUE,
  roll_no int,
  address varchar(20)
  );
  INSERT into students values
  (1,'aman','Bct',10,'mirchaiya');
  
  insert into students (stu_id,grade,roll_no) values
  (2,'bei',11);

  insert into students (name,grade,roll_no) values
  ('aarogya','bca',14);

  insert into students (stu_id,name,roll_no) values
  (4,'manu',37);

  insert into students (name,grade,stu_id,roll_no) values
  ('arjun','ban',5,38);

  select * from students;


 create table subjects(
 subcode int,
 subname varchar(20)
 );
 insert into subjects values
 (001,'english'),
  (002,'dbms'),
   (003,'web programming'),
    (004,'computer org & arc');
	select * from subjects;

	 create table course(
 subcode int,
 subname varchar(20)
 );
 insert into course values
 (001,'english'),
  (002,'dbms'),
   (003,'web programming'),
    (004,'computer org & arc');
	select * from course;

	
	drop table subjects;

	truncate table course;

	select * from subjects;
	select * from course;