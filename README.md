📘 Student Records Database
Overview

This project is a relational database system built with MySQL for managing student records. It demonstrates:

Proper table design with primary keys, foreign keys, and constraints.

Relationships: One-to-Many and Many-to-Many.

Sample data to test the database functionality.

📂 Database Schema

The database contains three tables:

Students

student_id (Primary Key, Auto Increment)

name (Not Null)

email (Unique, Not Null)

date_of_birth

Courses

course_id (Primary Key, Auto Increment)

course_name (Not Null)

credits (Must be > 0)

Enrollments

enrollment_id (Primary Key, Auto Increment)

student_id (Foreign Key → Students)

course_id (Foreign Key → Courses)

enrollment_date (Defaults to current date in MySQL 8.0.13+; otherwise handled via trigger/manual insert)

👉 The Enrollments table represents a Many-to-Many relationship between Students and Courses.

🚀 How to Run

Open MySQL Workbench or your MySQL CLI.

Create and use the database:

CREATE DATABASE student_records;
USE student_records;


Copy and paste the contents of student_records.sql into your SQL editor.

Execute the script. It will:

Create all tables with constraints.

Insert sample data.

📊 Example Queries

Show all students:

SELECT * FROM Students;


Show all courses:

SELECT * FROM Courses;


Show all enrollments with student and course details:

SELECT s.name, c.course_name, e.enrollment_date
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;
