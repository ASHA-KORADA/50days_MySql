
use 50days_mysql;

--1.Calculate total salary paid to each employee

SELECT e.emp_id,
    e.emp_name,
    sum(s.salary) as total_salary
from cleaned_salaries s
JOIN cleaned_employees e ON s.emp_id = e.emp_id
GROUP BY e.emp_id,e.emp_name

--2.Calculate avg salary paid to each employee

select e.emp_id,
    e.emp_name,
    avg(s.salary) as avg_salary
from cleaned_salaries s
    join cleaned_employees e on s.emp_id = e.emp_id
GROUP by e.emp_id,
    e.emp_name

--3.count of salary records of each emp

select e.emp_id,
    e.emp_name,
    count(e.emp_id) as count_salary
from cleaned_salaries s
    join cleaned_employees e on s.emp_id = e.emp_id
group by e.emp_id,
    e.emp_name

--4.max of salary of each emp

select e.emp_id,
    e.emp_name,
    max(s.salary) as max_salary
from cleaned_salaries s
    join cleaned_employees e on s.emp_id = e.emp_id
group by e.emp_id,
    e.emp_name