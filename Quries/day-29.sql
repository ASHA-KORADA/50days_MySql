

use 50days_mysql;

--1.Find latest salary per employee along with 
--total salary till that point


select *
from (
        SELECT emp_id,
            salary,
            salary_date,
            RANK() OVER(
                PARTITION BY emp_id
                ORDER BY salary_date
            ) as rk,
            Sum(salary) OVER(
                PARTITION BY emp_id
                ORDER BY salary
            ) as total_salary
        from cleaned_salaries
    ) m
where rk = 1




--2.Rank employees based on salary and compare with
--department average salary
SELECT *
from(
        SELECT e.emp_id,
            e.dept_id,
            s.salary,
            Avg(s.salary) OVER(PARTITION by e.dept_id) as dept_avgsalary,
            Rank() OVER(
                PARTITION by e.emp_id
                ORDER BY s.salary
            ) as rk
        from cleaned_employees e
            join cleaned_salaries s on e.emp_id = s.emp_id
    ) t

--3.Check whether salary has
--increased or decreased
--compared to previous record

select emp_id,
    salary,
    salary_date,
    lag(salary) over(
        PARTITION by emp_id
        ORDER BY salary_date
    ) as previous_salary,
    case
        when salary > lag(salary) over (
            partition by emp_id
            ORDER BY salary_date
        ) then "increased"
        when salary < lag(salary) over(
            partition by emp_id
            ORDER BY salary_date
        ) then "decreased"
        else "starting salary"
    end as salary_comparision
from cleaned_salaries






