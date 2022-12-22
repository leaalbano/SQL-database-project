DROP DATABASE IF EXISTS cat;
CREATE DATABASE cat;

Use cat;


CREATE TABLE PROFESSORS(
    SSN VARCHAR(9) PRIMARY KEY,
    name VARCHAR(255),
    street_address VARCHAR(255),
    state_address VARCHAR(255),
    city_address VARCHAR(255),
    zip_address VARCHAR(255),
    phone_num_area VARCHAR(3),
    phone_num_code VARCHAR(7),
    sex VARCHAR(1),
    title VARCHAR (255),
    salary VARCHAR(255)
);

CREATE TABLE DEPARTMENTS(
    dept_num VARCHAR(9) PRIMARY KEY,
    name VARCHAR(255),
    phone_num VARCHAR(10),
    location VARCHAR (255),
    SSN VARCHAR(9),
    FOREIGN KEY (SSN) REFERENCES PROFESSORS(SSN)
);

CREATE TABLE COURSES(
  course_number VARCHAR(255) PRIMARY KEY,
  title VARCHAR(255),
  textbook VARCHAR(255),
  units VARCHAR(255),
  prerequisites VARCHAR(255),
  dept_number VARCHAR(9),
  FOREIGN KEY (dept_number) REFERENCES DEPARTMENTS(dept_num)
);

CREATE TABLE SECTIONS(
  section_number VARCHAR(255),
  course_number VARCHAR(255),
  CONSTRAINT sect_course PRIMARY KEY (course_number, section_number),
  classroom VARCHAR(255),
  number_of_seats VARCHAR(255),
  meeting_days VARCHAR(255),
  beginning_time TIME(6),
  end_time TIME(6),
  FOREIGN KEY(course_number) REFERENCES COURSES(course_number),
  SSN VARCHAR(9),
  FOREIGN KEY(SSN) REFERENCES PROFESSORS(SSN)
);

CREATE TABLE STUDENT_RECORDS(
  CWID VARCHAR(9) PRIMARY KEY,
  fname VARCHAR(255),
  lname VARCHAR(255),
  address VARCHAR(255),
  telephone_number VARCHAR(10),
  dept_num VARCHAR(9),
  FOREIGN KEY (dept_num) REFERENCES DEPARTMENTS(dept_num),
  dept_num_minor VARCHAR(9),
  FOREIGN KEY (dept_num_minor) REFERENCES DEPARTMENTS(dept_num)
);

CREATE TABLE ENROLLMENT_RECORDS(
  CWID VARCHAR(9),
  student VARCHAR(255),
  course_number VARCHAR(255),
  course_section VARCHAR(255),
  CONSTRAINT sect_course FOREIGN KEY (course_number, course_section) REFERENCES SECTIONS(course_number, section_number),
  grade VARCHAR(255),
  FOREIGN KEY (CWID) REFERENCES STUDENT_RECORDS(CWID)
);

CREATE TABLE DEGREES(
  degrees VARCHAR(255),
  SSN VARCHAR(255),
  CONSTRAINT pk_degrees PRIMARY KEY( degrees, SSN),
  FOREIGN KEY (SSN) REFERENCES PROFESSORS(SSN)
);

CREATE TABLE PREREQUISITES(
  prerequisite_number VARCHAR(255),
  prerequisites VARCHAR(255),
  CONSTRAINT pkey PRIMARY KEY(prerequisites, prerequisite_number),
  FOREIGN KEY (prerequisite_number) REFERENCES COURSES(course_number)
);

CREATE TABLE MEETING_DAYS(
  meeting_days VARCHAR(255),
  section_number VARCHAR(255),
  course_number VARCHAR(255),
  CONSTRAINT pkey_mdays PRIMARY KEY(meeting_days, section_number, course_number),
  CONSTRAINT section_course FOREIGN KEY (course_number, section_number) REFERENCES SECTIONS(course_number, section_number)
);

-- Data
INSERT INTO PROFESSORS(SSN, name, street_address, state_address, city_address, zip_address,
phone_num_area, phone_num_code, sex, title, salary)
VALUES
('192847560', 'Jopseph Campos', '123 milbury', 'CA', 'Corona', '92868',
'219', '1234567', 'M', 'Biologist', '10'),
('777123554', 'KANYE EAST', 'LEMON', 'CA', 'Irvine', '92869',
'332', '6789393', 'M', 'Software engineer', '80000'),
('546421567', 'Phillip J. FRY', 'Citrus', 'CA', 'Orange', '92867',
'332', '2224489', 'M', 'Data scientist', '1000000');

INSERT INTO DEPARTMENTS(dept_num, name, phone_num, location, SSN)
VALUES
('CPSC', 'Computer science', '546124078', 'CS Building', '546421567'),
('BIOL', 'Biology', '890281345', 'Mccarthy', '192847560');

INSERT INTO STUDENT_RECORDS(CWID, fname, lname, address, telephone_number, dept_num, dept_num_minor)
VALUES
('887958338', 'Lea', 'Albano', '3136 East Yorba Linda Blvd', '5105665754', 'CPSC', 'BIOL'),
('887543742', 'Frank', 'Salgado-Gonzalez', '1148 North Lemon Street', '7148550891', 'CPSC', NULL),
('564778994', 'Idell', 'Saul', '1800 H Street', '4087735612', 'BIOL', NULL),
('116723442', 'Solana', 'Rowe', '5528 Faith Home Rd', '6507634567', 'CPSC', 'BIOL'),
('887612909', 'Kim', 'Lee', '313 Chapman Ave', '8089796422', 'BIOL', NULL),
('887953423', 'Bryan', 'Nguyen', '9136 Rothbury Dr', '3019266328', 'CPSC', 'BIOL'),
('675787990', 'Oma', 'Purdy', '	1606 Main St', '7079270117','CPSC', 'BIOL'),
('334562334', 'Lydia', 'Blanda', '4509 Lyndale Ave S', '9543492434','BIOL', 'CPSC');

INSERT INTO COURSES(course_number, title, textbook, units, dept_number)
VALUES
('332', 'File Structures and Database Systems', 'yes', '5', 'CPSC'),
('440', 'Computer System Architectures', 'yes', '3', 'CPSC'),
('151', 'Cellular Biology', 'yes', '3', 'BIOL'),
('152', 'Evolution Biology', 'no', '4', 'BIOL');

INSERT INTO SECTIONS(section_number, course_number, classroom, number_of_seats, beginning_time, end_time, SSN)
VALUES
('01', '332', 'HUM 412', '30', '10:00:00', '11:15:00', '546421567'),
('01', '440', 'EC 127', '30', '17:30:00', '18:45:00', '546421567'),
('02', '440', 'E 202', '30', '14:00:00', '15:15:00', '546421567'),
('01', '151', 'HUM 110', '50', '11:30:00', '12:45:00', '192847560'),
('02', '151', 'HUM 300', '30',  '09:00:00', '11:15:00', '192847560'),
('01', '152', 'E 110', '30', '08:30:00', '09:45:00', '192847560');

INSERT INTO ENROLLMENT_RECORDS(CWID, student, course_section, course_number, grade)
VALUES
('887958338', 'Lea Albano','01', '332', 'A'),
('887543742', 'Frank Salgado-Gonzalez', '01', '332', 'F'),
('564778994', 'Idell Saul', '01', '332', 'B'),
('116723442', 'Solana Rowe', '01', '332', 'C'),
('887612909', 'Kim Lee', '02', '151', 'D'),
('887953423', 'Bryan Nguyen', '02', '151', 'A'),
('675787990', 'Oma Purdy', '01', '152', 'C'),
('334562334', 'Lydia Blanda', '01', '151', 'A'),
  
('887958338', 'Lea Albano', '01', '151', 'C'),
('887543742', 'Frank Salgado-Gonzalez', '01', '151',  'B'),
('564778994', 'Idell Saul', '01', '151',  'B'),
('116723442', 'Solana Rowe', '01', '151',  'C'),
('887612909', 'Kim Lee', '01', '152', 'D'),
('887953423', 'Bryan Nguyen', '01', '152', 'A'),
('675787990', 'Oma Purdy', '01', '152', 'C'),
('334562334', 'Lydia Blanda', '01', '152', 'A'),
  
('887958338', 'Lea Albano', '01', '152',  'A'),
('887543742', 'Frank Salgado-Gonzalez', '01', '152', 'F'),
('564778994', 'Idell Saul', '01', '152',  'B'),
('116723442', 'Solana Rowe', '01', '152',  'C');

INSERT INTO DEGREES(degrees, SSN)
VALUES
('B.A. Computer Science', '192847560'),
('B.A. Mechanical Engineering', '546421567');

INSERT INTO PREREQUISITES(prerequisite_number, prerequisites)
VALUES
('151', 'FILE STRUCTURES'),
('332', 'SOFTWARE ENGINEERING');

INSERT INTO MEETING_DAYS(meeting_days, section_number, course_number)
VALUES 
('MoWed', '01', '332'),
('TueTh', '01', '440'),
('MoWed', '02', '440'),
('Fri',   '01', '151'),
('TueTh', '02', '151'),
('TueTh', '01', '152');
--PROFESSOR QUERIES:
--a)
SELECT classroom, beginning_time, end_time, COURSES.title
FROM SECTIONS, COURSES
WHERE '192847560'=SECTIONS.SSN AND COURSES.course_number=SECTIONS.course_number;

SELECT MEETING_DAYS.meeting_days, course_number, section_number
FROM MEETING_DAYS, SECTIONS
WHERE '192847560'=SECTIONS.SSN AND MEETING_DAYS.section_number = SECTIONS.section_number AND MEETING_DAYS.course_number = SECTIONS.course_number;

--b)
SELECT grade, COUNT(grade)
FROM ENROLLMENT_RECORDS
WHERE grade='A' AND '152-01'=CONCAT(ENROLLMENT_RECORDS.course_number, '-', ENROLLMENT_RECORDS.course_section);

SELECT grade, COUNT(grade)
FROM ENROLLMENT_RECORDS
WHERE grade='B' AND '152-01'=CONCAT(ENROLLMENT_RECORDS.course_number, '-', ENROLLMENT_RECORDS.course_section);

SELECT grade, COUNT(grade)
FROM ENROLLMENT_RECORDS
WHERE grade='C' AND '152-01'=CONCAT(ENROLLMENT_RECORDS.course_number, '-', ENROLLMENT_RECORDS.course_section);

SELECT grade, COUNT(grade)
FROM ENROLLMENT_RECORDS
WHERE grade='D' AND '152-01'=CONCAT(ENROLLMENT_RECORDS.course_number, '-', ENROLLMENT_RECORDS.course_section);

SELECT grade, COUNT(grade)
FROM ENROLLMENT_RECORDS
WHERE grade='F' AND '152-01'=CONCAT(ENROLLMENT_RECORDS.course_number, '-', ENROLLMENT_RECORDS.course_section);
--STUDENT QUERIES:
--a) Given a course number list the sections of the course, including the classrooms, the meeting days and time, and the number of students enrolled in each section.
SELECT SECTIONS.section_number, classroom, beginning_time, end_time, MEETING_DAYS.meeting_days
FROM SECTIONS
JOIN MEETING_DAYS
ON SECTIONS.course_number = '151' AND SECTIONS.course_number =  MEETING_DAYS.course_number AND SECTIONS.section_number = MEETING_DAYS.section_number;
SELECT course_section, COUNT(*)
FROM ENROLLMENT_RECORDS
WHERE ENROLLMENT_RECORDS.course_number = '151' AND course_section = '01';
SELECT course_section, COUNT(*)
FROM ENROLLMENT_RECORDS
WHERE ENROLLMENT_RECORDS.course_number = '151' AND course_section = '02';



--b
-- Given the campus wide ID of a student, list all courses the student took and the grades.
SELECT course_number, course_section, grade
FROM ENROLLMENT_RECORDS
WHERE '887543742'= CWID;