
use 50days_mysql;

--1.Show each employee with avg salary of their dept

SELECT e.emp_id,
    e.dept_id,
    s.salary,
    AVG(s.salary) over(partition by e.dept_id) as dept_avgsalary
from cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id

--2.Show total salary of each department for every employee

select e.emp_id,
    e.dept_id,
    s.salary,
    sum(s.salary) over(PARTITION BY e.dept_id) as dept_totalsalary
from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id


--3.Show average performance rating of each department

select e.emp_id,
    e.dept_id,
    AVG((p.rating_2022 +p.rating_2023 + p.rating_2024)/3)
    over(partition by e.dept_id) as dept_avgrating
from cleaned_employees e 
    JOIN cleaned_performance p ON e.emp_id = p.emp_id