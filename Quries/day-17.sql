
use 50days_mysql;

--1.List employees with more than 2 salary records

SELECT emp_id,
    count(*) as salary_records
FROM cleaned_salaries
group BY emp_id
having count(*) > 2

--2.List departments with more than 3 employees

select count(e.emp_id) as count_emps,
    d.dept_name
from cleaned_employees e
    join cleaned_departments d on e.dept_id = d.dept_id
group by d.dept_name
having count(e.emp_id) > 3

--3.List employees with total salary greater than 100000

SELECT emp_id,sum(salary)as abv_salary
from cleaned_salaries s
group by emp_id
having sum(salary) > 100000

--4.List departments with high avg salary > 50000

SELECT d.dept_name,avg(salary) as avg_salary
from cleaned_salaries s
join cleaned_employees e on s.emp_id = e.emp_id
join cleaned_departments  d on d.dept_id = e.dept_id
group by d.dept_name
having avg(salary) > 50000

