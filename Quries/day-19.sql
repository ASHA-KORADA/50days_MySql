use 50days_mysql;

--1.Categorize employees based on salary (Low /Medium / High)

select emp_id,
    salary,
case
        when salary < 30000 then 'low'
        when salary between 30000 and 60000 then 'medium'
        else 'high'
    end as Categorized
from cleaned_salaries

--2.Categorize employees based on performance rating (Good/Average/Poor)

select emp_id,
    avg(rating_2022 + rating_2023 + rating_2024) / 3 as avg_rating,
    case
        when (avg(rating_2022 + rating_2023 + rating_2024) / 3 )>= 4 then 'good'
        when (avg(rating_2022 + rating_2023 + rating_2024) / 3 )>= 3 then 'average'
        else 'poor'
    end as Categorized
from cleaned_performance
group by emp_id

--3.Categorize employees based on attendance status (Active / Inactive)

SELECT emp_id,status,
case when status = 'present' then 'active'
else 'inactive' end as Categorized
from cleaned_attedance

--4.Categorize employees based on experience level (Fresher/Mid-Level/Expd)

select emp_id,
    year(curdate()) - year(hire_date) as experience_years,
    case
        when year(curdate()) - year(hire_date) < 2 then 'fresher'
        when year(curdate()) - year(hire_date) between 2 and 5 then 'mid level'
        else 'experienced'
    end as Categorized
from cleaned_employees





