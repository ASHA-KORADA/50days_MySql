
use 50days_mysql;


describe cleaned_employees

update cleaned_employees
set emp_name = trim(emp_name)

-- changing datatypes 

--1.employees table

alter table cleaned_employees
modify emp_id int,
modify emp_name varchar(100),
modify age int,modify city varchar(50),
modify dept_id int,
modify hire_date DATE;

--2.departments table 

alter table cleaned_departments
modify dept_id int,
modify dept_name varchar(100)

describe cleaned_departments

--3. employees table

describe cleaned_salaries

alter table cleaned_salaries
modify salary_id int,
modify emp_id int,
modify salary int,
modify salary_date date,
modify is_outlier int;


-- 4. performance table 

describe cleaned_performance

alter table cleaned_performance
modify emp_id int,
MODIFY rating_2022 int,
modify rating_2023 int,
MODIFY rating_2024 int;


-- attendance table

describe cleaned_attedance

alter table cleaned_attedance
modify attendance_id int,
modify emp_id int,
modify attendance_date DATE,
MODIFY status varchar(50);