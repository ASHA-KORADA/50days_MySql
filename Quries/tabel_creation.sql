USE 50days_mysql

CREATE table departments
(dept_id varchar(40),
dept_name varchar(40)
);

CREATE table employees
(emp_id varchar(40),
emp_name varchar(40),
age varchar(40),
city varchar(40),
dept_id varchar(40),
hire_date varchar(40)
);

CREATE table attedance
(attendance_id varchar(40),
emp_id varchar(40),
attendance_date varchar(40),
status varchar(40)
);

CREATE table performance
(emp_id varchar(40),
rating_2022 varchar(40),
rating_2023 varchar(40),
rating_2024 varchar(40)
);


CREATE table salaries
(salary_id varchar(40),
emp_id varchar(40),
salary varchar(40),
salary_date varchar(40)
);


use 50days_mysql

CREATE table cleaned_departments
as SELECT * from departments

CREATE table cleaned_employees
as SELECT * from employees

CREATE table cleaned_attedance
as SELECT * from attedance

create table cleaned_performance
SELECT *from performance

create table cleaned_salaries
SELECT *
from salaries




