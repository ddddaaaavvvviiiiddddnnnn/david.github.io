create database school;
use school;

create table student (
    adm_no int primary key,
    stud_name varchar(20),
    stud_phone_no varchar(20)
);

create table department (
    dept_id int primary key,
    dept_name varchar(20)
);

create table advisor (
    adv_id int primary key,
    adv_name varchar(20),
    adv_tel varchar(20),
    adv_dept varchar(20),
    dept_id int,
    foreign key (dept_id) references department(dept_id)
);

create table term (
    term_id int primary key,
    term_name varchar(20),
    dept_id int,
    adv_id int,
    adm_no int,
    foreign key (dept_id) references department(dept_id),
    foreign key (adv_id) references advisor(adv_id),
    foreign key (adm_no) references student(adm_no)
);

create table student_department (
    adm_no int,
    dept_id int,
    foreign key (adm_no) references student(adm_no),
    foreign key (dept_id) references department(dept_id),
    primary key (adm_no, dept_id)
);

create table advisor_department (
    adv_id int,
    dept_id int,
    foreign key (adv_id) references advisor(adv_id),
    foreign key (dept_id) references department(dept_id),
    primary key (adv_id, dept_id)
);

create table student_advisor (
    adm_no int,
    adv_id int,
    foreign key (adm_no) references student(adm_no),
    foreign key (adv_id) references advisor(adv_id),
    primary key (adm_no, adv_id)
);

create table term_enrollment (
    term_id int,
    adm_no int,
    foreign key (term_id) references term(term_id),
    foreign key (adm_no) references student(adm_no),
    primary key (term_id, adm_no)
);

INSERT INTO student (adm_no, stud_name, stud_phone_no)
VALUES (1, 'John', '123-456-7890'),
       (2, 'Jane', '987-654-3210'),
       (3, 'Michael', '456-789-0123');

INSERT INTO department (dept_id, dept_name)
VALUES (1, 'Computer Science'),
       (2, 'Mathematics'),
       (3, 'Physics');

INSERT INTO advisor (adv_id, adv_name, adv_tel, adv_dept, dept_id)
VALUES (1, 'Dr. Brown', '111-222-3333', 'Computer Science', 1),
       (2, 'Prof. Green', '444-555-6666', 'Mathematics', 2),
       (3, 'Dr. White', '777-888-9999', 'Physics', 3);

INSERT INTO term (term_id, term_name, dept_id, adv_id, adm_no)
VALUES (1, 'Fall 2023', 1, 1, 1),
       (2, 'Spring 2024', 2, 2, 2),
       (3, 'Winter 2023', 3, 3, 3);

INSERT INTO student_department (adm_no, dept_id)
VALUES (1, 1), -- John belongs to Computer Science
       (1, 2), -- John also belongs to Mathematics
       (2, 2), -- Jane belongs to Mathematics
       (3, 3); -- Michael belongs to Physics

INSERT INTO advisor_department (adv_id, dept_id)
VALUES (1, 1), -- Dr. Brown advises Computer Science
       (2, 2), -- Prof. Green advises Mathematics
       (3, 3); -- Dr. White advises Physics

INSERT INTO student_advisor (adm_no, adv_id)
VALUES (1, 1), -- John is advised by Dr. Brown
       (2, 2), -- Jane is advised by Prof. Green
       (3, 3); -- Michael is advised by Dr. White

INSERT INTO term_enrollment (term_id, adm_no)
VALUES (1, 1), -- John is enrolled in Fall 2023
       (2, 2), -- Jane is enrolled in Spring 2024
       (3, 3); -- Michael is enrolled in Winter 2023

SELECT * FROM student;
SELECT * FROM department;
SELECT * FROM advisor;
SELECT * FROM term;
SELECT * FROM student_department;
SELECT * FROM advisor_department;
SELECT * FROM student_advisor;
SELECT * FROM term_enrollment;
SELECT s.adm_no, s.stud_name, s.stud_phone_no, d.dept_name
FROM student s
JOIN student_department sd ON s.adm_no = sd.adm_no
JOIN department d ON sd.dept_id = d.dept_id;
SELECT a.adv_id, a.adv_name, a.adv_tel, d.dept_name
FROM advisor a
JOIN advisor_department ad ON a.adv_id = ad.adv_id
JOIN department d ON ad.dept_id = d.dept_id;
SELECT s.adm_no, s.stud_name, s.stud_phone_no, a.adv_name
FROM student s
JOIN student_advisor sa ON s.adm_no = sa.adm_no
JOIN advisor a ON sa.adv_id = a.adv_id;
SELECT t.term_id, t.term_name, s.stud_name, a.adv_name, d.dept_name
FROM term t
JOIN term_enrollment te ON t.term_id = te.term_id
JOIN student s ON te.adm_no = s.adm_no
JOIN advisor a ON t.adv_id = a.adv_id
JOIN department d ON t.dept_id = d.dept_id;
