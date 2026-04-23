

use 50days_mysql;

--1.Show current salary along with next salary for each employee

SELECT emp_id,
    salary,
    salary_date,
    lead(salary) over(
        partition by emp_id
        order by salary_date
    ) as next_salary
from cleaned_salaries

--2.Compare current salary with next salary for growth analysis

SELECT emp_id,
    salary,
    salary_date,
    lead(salary) OVER (PARTITION BY emp_id) as next_salary,
     salary - lead(salary) over(
        partition by emp_id
        order by salary_date
    ) as salary_growth
from cleaned_salaries

--3.Predict attendance trend by comparing current and next status

select emp_id,
    status,
    attendance_date,
    lead(status) over (
        partition by emp_id
        order by attendance_date
    ) as attendance_trend
from cleaned_attedance


