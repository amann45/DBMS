--- DBMS assignment SQL Queries ----

create database dbms_assignment;
use dbms_assignment;

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    year INT
);

CREATE TABLE Instructor (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(100) NOT NULL,
    department VARCHAR(50)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Insert data into Student
INSERT INTO Student VALUES
(1, 'Aman', 'Computer Science', 2),
(2, 'Aarogya', 'Mathematics', 3),
(3, 'Manu', 'Physics', 1),
(4, 'Arjun', 'Computer Science', 4);

-- Insert data into Instructor
INSERT INTO Instructor VALUES
(1, 'Er. RG', 'Computer Science'),
(2, 'Er. RP', 'Mathematics'),
(3, 'Er. gg', 'Physics'),
(4, 'Er. DP', 'Computer Science');

-- Insert data into Course
INSERT INTO Course VALUES
(101, 'Data Structures', 4, 1),
(102, 'Calculus III', 3, 2),
(103, 'Quantum Mechanics', 4, 3),
(104, 'Operating Systems', 4, 4);

-- Insert data into Enrollment
INSERT INTO Enrollment  VALUES
(1, 1, 101, 'Fall 2025', 85),
(2, 2, 102, 'Fall 2025', 90),
(3, 3, 103, 'Spring 2026', 88),
(4, 4, 104, 'Fall 2025', 92);

select * from  Student;
select * from  Instructor;
select * from  Course;
select * from  Enrollment;

-- Q1. Display the name of all students belongs to computer science department.
SELECT student_name
FROM Student
WHERE department = 'Computer Science';

-- Q2. List all courses that have more than 3 credits
SELECT course_name
FROM Course
WHERE credits > 3;

-- Q3. Find the names of students who enrolled in the Fall2024 semester
SELECT DISTINCT s.student_name
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
WHERE e.semester = 'Fall2024';

-- Q4. Find the average marks obtained by students in each course
SELECT c.course_name, AVG(e.marks) AS average_marks
FROM Course c
JOIN Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Q5. Count the number of students enrolled in each course
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM Course c
JOIN Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Q6. Display each department along with the total number of students in that department
SELECT department, COUNT(student_id) AS total_students
FROM Student
GROUP BY department;

-- Q7. Display student names along with the course names they are enrolled in
SELECT s.student_name, c.course_name
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
JOIN Course c ON e.course_id = c.course_id;

-- Q8. List course names along with the instructor names who teach them
SELECT c.course_name, i.instructor_name
FROM Course c
JOIN Instructor i ON c.instructor_id = i.instructor_id;


-- Q9. Display student name
SELECT student_name
FROM Student;

-- Q10. Find students who scored more than the average marks of all students
SELECT DISTINCT s.student_name
FROM Student s
JOIN Enrollment e ON s.student_id = e.student_id
WHERE e.marks > (
    SELECT AVG(marks)
    FROM Enrollment
);


-- Q11. Display courses that are taught by instructors from the Computer Science department
SELECT c.course_name
FROM Course c
JOIN Instructor i ON c.instructor_id = i.instructor_id
WHERE i.department = 'Computer Science';

-- Q12. Find courses that have more than 5 students enrolled
SELECT c.course_name
FROM Course c
JOIN Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING COUNT(e.student_id) > 5;