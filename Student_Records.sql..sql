-- Create the database
CREATE DATABASE student_records;
USE student_records;

-- Create Students table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE
);

-- Create Courses table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0)
);

-- Create Enrollments table (relationship table)
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE(student_id, course_id)
);

-- Optional: Insert sample data
INSERT INTO Students (name, email, date_of_birth) VALUES
('Alice Johnson', 'alice@example.com', '2001-05-14'),
('Bob Smith', 'bob@example.com', '2000-11-30'),
('Charlie Brown', 'charlie@example.com', '2002-02-21');

INSERT INTO Courses (course_name, credits) VALUES
('Mathematics', 3),
('English Literature', 2),
('Computer Science', 4);

INSERT INTO Enrollments (student_id, course_id) VALUES
(1, 1), (1, 3), (2, 2), (3, 1), (3, 3);
