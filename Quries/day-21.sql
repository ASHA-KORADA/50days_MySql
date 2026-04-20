

use 50days_mysql;

--1.Rank employees based on salary

SELECT emp_id,
    salary,
    rank() over(
        order by salary desc
    ) as salary_ranking
from cleaned_salaries

 --2.Perform department-wise ranking of employees

select e.emp_id,
    e.dept_id,
    s.salary,
    dense_rank() over (
        partition by e.dept_id
        order by s.salary desc
    ) as dept_ranking
from cleaned_employees e
    join cleaned_salaries s ON e.emp_id = s.emp_id


--3.Identify top performers based on avg performance rating


select emp_id,
    (rating_2022 + rating_2023 + rating_2024) / 3 as avg_rating,
    dense_rank() over (
        order by (rating_2022 + rating_2023 + rating_2024) / 3 DESC
    ) as performance_rating
from cleaned_performance


---4.Find top 3 employees based on salary ranking

select *
from (
        SELECT emp_id,
            salary,
            rank() over(
                order by salary desc
            ) as salary_ranking
        from cleaned_salaries
    ) as m
where salary_ranking <= 3