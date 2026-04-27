

use 50days_mysql;

1--Find top 2 highest paid employees in each department

select *
from (
        SELECT e.emp_id,
            e.dept_id,
            s.salary,
            dense_rank() over(
                partition by e.dept_id
                order by s.salary desc
            ) as drk
        from cleaned_employees e
            join cleaned_salaries s on e.emp_id = s.emp_id
    ) as t
where drk <= 2

--2.Calculate salary gap
--diff between current salary and previous salary


select emp_id,
    salary,
    salary_date,
    lag(salary) over(
        partition by emp_id
        order by salary_date
    ) as prev_salary,
    salary - lag(salary) over(
        partition by emp_id
        order by salary_date
    ) as salary_gap
from cleaned_salaries

--3.Calculate performance gap
(change in performance between years)

select emp_id,
    rating_2022,
    rating_2023,
    rating_2024,
    rating_2023 - rating_2022 as firstgap,
    rating_2024 - rating_2023 as secondgap
from cleaned_performance

--4.• Filter only top performers based on ranking


select *
from(
        select e.emp_id,
            e.dept_id,
            s.salary,
            dense_rank() over(
                partition by e.dept_id
                order by s.salary desc
            ) as dk
        from cleaned_employees e
            join cleaned_salaries s on e.emp_id = s.emp_id
    ) as mk
where dk = 1