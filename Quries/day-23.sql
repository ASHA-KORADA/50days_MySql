
use 50days_mysql;

--1.Show current salary along with previous salary for each employee

SELECT emp_id,
    salary,
    salary_date,
    LAG(salary) over(
        PARTITION BY emp_id
        ORDER BY salary_date
    ) AS previous_salary
FROM cleaned_salaries

--2.Calculate difference between current salary & previous salary

SELECT emp_id,
    salary,
    salary_date,
    lag(salary) OVER(PARTITION BY emp_id) as previous_salary,
    salary - LAG(salary) OVER (
        PARTITION BY emp_id
        ORDER BY salary_date
    ) as diff_salary
from cleaned_salaries

--3.Analyze attendance trend (compare current status with previous status)

select emp_id,
    status,
    attendance_date,
    lag(status) over(
        partition by emp_id
        ORDER by attendance_date
    ) as attendance_trend
from cleaned_attedance




