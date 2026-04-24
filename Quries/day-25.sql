


use 50days_mysql;


--1.Calculate running total salary for each employee overtime 

select emp_id,
    salary,
    salary_date,
    sum(salary) over(
        partition by emp_id
        order by salary_date
    ) as running_salary
from cleaned_salaries

--2.Calculate running attendance count for each employee

select emp_id,
    attendance_date,
    count(emp_id) over(
        partition by emp_id
        ORDER BY attendance_date
    ) as attedence_count
from cleaned_attedance


--3.Calculate cumulative salary for each department over time

select d.dept_id,
    s.salary,
    s.salary_date,
    e.emp_id,
    sum(salary) over(
        partition by dept_id
        order by salary_date
    ) as cumulative_dept_salary
from cleaned_departments d
    join cleaned_employees e on d.dept_id = e.dept_id
    JOIN cleaned_salaries s on s.emp_id = e.emp_id