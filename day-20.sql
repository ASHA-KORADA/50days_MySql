

use 50days_mysql;

--1.Retrieve latest salary record for each employee

select *
from (
        select *,
            row_number() over (
                partition by emp_id
                order by salary_date DESC
            ) as rn
from cleaned_salaries ) as m
where rn = 1

--2.Retrieve first(oldest) salary record for each employee

select *
from (
        select *,
            row_number() over(
                partition by emp_id
                order by salary_date asc
            ) as rn
        from cleaned_salaries
    ) as m
where rn = 1

--3.Rank salary entries for each employee

select *
from (
        select emp_id,
    salary,salary_date,
            row_number() over(
                partition by emp_id
                ORDER BY salary_date desc
            ) as rank_number
        from cleaned_salaries
    ) as m


--4.Get top 2 salary records per employee


select *
from (
        select emp_id,
    salary,salary_date,
            row_number() over(
                partition by emp_id
                ORDER BY salary_date desc
            ) as rank_number
        from cleaned_salaries
    ) as m
    where rank_number<=2


