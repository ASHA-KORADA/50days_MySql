

use 50days_mysql;

--1.what is empname,dept,performance rating...

SELECT e.emp_name,
    d.dept_name,
    p.rating_2022,
    p.rating_2023,
    p.rating_2024
from cleaned_employees e
    join cleaned_departments d on e.dept_id = d.dept_id
    join cleaned_performance p on e.emp_id = p.emp_id

--2.complete profile of each employee

SELECT e.emp_id,
    e.emp_name,
    d.dept_name,
    s.salary,
    p.rating_2022,
    p.rating_2023,
    p.rating_2024
from cleaned_employees e
    left join cleaned_departments d on e.dept_id = d.dept_id
    left join cleaned_salaries s on e.emp_id = s.emp_id
    join cleaned_performance p on e.emp_id = p.emp_id

--3.how many slary records does each employee have 

select e.emp_name,
    e.emp_id,
    count(s.salary_id) as salary_occurances
from cleaned_employees e
    LEFT JOIN cleaned_salaries s ON e.emp_id = s.emp_id
group by e.emp_id,
    e.emp_name

--4.total salary paid to each employee
select e.emp_name,
    e.emp_id,
    sum(s.salary) as total_salary
from cleaned_employees e
    LEFT JOIN cleaned_salaries s ON e.emp_id = s.emp_id
group by e.emp_id,
    e.emp_name
