

create database university_db

use university_db;

create table students(
	student_id int primary key,
	student_name varchar(100),
	age int,
	email varchar(100),
	front_mark int,
	backend_mark int,
	status varchar(100)
	
);

create table courses(
course_id int primary key,
course_name varchar(255),
credits int	
);


CREATE TABLE enrollment (
 enrollment_id SERIAL primary key,
 student_id integer references students(student_id),
 course_id integer references courses(course_id)
	);

select * from students
select * from courses
select * from enrollment

Insert the data into the "students" table:

INSERT INTO students (student_id,student_name, age, email, front_mark, backend_mark)
values
     (1,'kamal', 23, 'kamal@gmail.com', 80, 85),
     (2,'gokul', 22, 'gokul@gmail.com', 40, 70),
     (3,'vijay', 23, 'vijay@gmail.com', 55, 60),
     (4,'hamsa', 24, 'hamsa@gmail.com', 70, 60),
     (5,'Suresh', 24, 'Suresh@gmail.com', 45, 34),
     (6,'Dhanesh', 22, 'Dhanesh@gmail.com', 46, 42);
Insert the following data into the "courses" table values

INSERT INTO courses (course_id,course_name, credits)
 VALUES
     (1,'Next.js', 3),
     (2,'React.js', 4),
     (3,'Databases.js',3),
     (4,'Prisma', 3);
Insert the following data into the "enrollment" table values

INSERT INTO enrollment (student_id, course_id)
 VALUES
     (1, 1),
     (1, 2),
     (2, 1),
     (3, 2);
	 
Query 1;	 
Insert a new student record with the following details:
        •   id:7
		•	Name: kamalesh S
		•	Age: 23
		•	Email: kamalesh@gmail.com
		•	Frontend-Mark: 98
		•	Backend-Mark: 97
		•	Status: NULL
 INSERT INTO students (student_id,student_name, age, email, front_mark, backend_mark, status)
 VALUES (7,'kamalesh S', 23, 'kamalesh@gmail.com', 98, 97, NULL);
 
 Query 2;
 
 Retrieve the names of all students who are enrolled in the course titled 'Next.js'. 
 SELECT s.student_name
 FROM students s
 JOIN enrollment e ON s.student_id = e.student_id
 JOIN courses c ON e.course_id = c.course_id
 WHERE c.course_name = 'Next.js';
 
 Query 3;
 Update the status of the student with the highest total (frontend_mark + backend_mark) mark to 'Awarded'
  UPDATE students
 SET status = 'Awarded'
 WHERE student_id = (
     SELECT student_id
     FROM (
        SELECT student_id, (front_mark + backend_mark) AS total_mark
         FROM students
        ORDER BY total_mark DESC
        LIMIT 1
     ) AS highest_mark
);


Query 4;
Delete all courses that have no students enrolled.

 DELETE FROM courses
 WHERE course_id NOT IN (SELECT DISTINCT course_id FROM enrollment);
 
 
 Query 5;
 Retrieve the names of students using a limit of 2, starting from the 3rd student.
 
SELECT student_name
 FROM students
 LIMIT 2 OFFSET 2;
 
 Query 6;
 Retrieve the course names and the number of students enrolled in each course.
 
 SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
 FROM courses c
 LEFT JOIN enrollment e ON c.course_id = e.course_id
 GROUP BY c.course_name;
 
 Query 7;
 Calculate and display the average age of all students.
 SELECT AVG(age) AS average_age
 FROM students;

Query 8;

Retrieve the names of students whose email addresses contain 'gmail.com'.


SELECT student_name
 FROM students
 WHERE email LIKE '%gmail.com';

 