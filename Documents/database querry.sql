
-- create database named hsms_db
CREATE DATABASE hsms_db;

-- create a user table
CREATE TABLE user_login(
	id INT AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(200) NOT NULL,
	pass VARCHAR(200) NOT NULL,
	userType INT NOT NULL,	-- student = 1,    teacher = 2,    admin = 3
	DOB DATE NOT NULL,
	gender VARCHAR(10),
	CHECK(LENGTH(pass) >= 6 AND LENGTH(pass) <= 12)
);

-- insert 10 rows for user_login table
INSERT INTO user_login (email, pass, userType, DOB, gender)
VALUES
    ('student1@example.com', 'studentpass', 1, '2000-01-01', 'Male'),
    ('teacher1@example.com', 'teacherpass', 2, '1985-05-15', 'Female'),
    ('admin1@example.com', 'adminpass', 3, '1990-08-20', 'Male'),
    ('student2@example.com', 'studentpass2', 1, '1999-03-10', 'Female'),
    ('teacher2@example.com', 'teacherpass2', 2, '1978-12-05', 'Male'),
    ('admin2@example.com', 'adminpass2', 3, '1982-07-25', 'Female'),
    ('student3@example.com', 'studentpass3', 1, '2002-09-30', 'Male'),
    ('teacher3@example.com', 'teacherpass3', 2, '1989-04-14', 'Female'),
    ('admin3@example.com', 'adminpass3', 3, '1995-11-08', 'Male'),
    ('student4@example.com', 'studentpass4', 1, '2001-06-18', 'Female');
    
-- crating a student_info table
CREATE TABLE students_info (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_class INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(255),    -- foreign key from user login
    phone VARCHAR(15),
    address TEXT,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- crating a teacher_info table
CREATE TABLE teachers_info (
  teacher_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255),
  date_of_birth DATE,
  gender ENUM('Male', 'Female', 'Other'),
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(15),
  address TEXT,
  qualification VARCHAR(255),
  department VARCHAR(255),
  designation TEXT,
  registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- creating attendence table
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    teacher_id INT NOT NULL,
    class_date DATE NOT NULL,
    is_present BOOLEAN NOT NULL,
    remarks TEXT,
    entry_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students_info(student_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers_info(teacher_id)
);
