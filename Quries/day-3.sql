

USE 50days_mysql

select * from cleaned_employees

update cleaned_employees
set emp_name = 'UNKNOWN'
where emp_name is null or emp_name = ''


update cleaned_employees
SET city = 'DELHI'
where emp_id = 13 

update cleaned_employees
SET city = 'DELHINCR'
where city is null or city = ""



select * from cleaned_performance

update cleaned_performance
SET rating_2023 =  0
where rating_2023 is null or rating_2023=""



--finding duplicates

--employees table

select emp_id,
    emp_name,
    city,
    count(*)
from cleaned_employees
group by emp_id,
    emp_name,
    city
having count(*) > 1

--performance table

select emp_id,
    rating_2022,
    rating_2023,
    rating_2024,
    count(*)
from cleaned_performance
group by emp_id,
    rating_2022,
    rating_2023,
    rating_2024
having count(*) > 1 

use 50days_mysql

--salaries table


select *
from cleaned_salaries


select salary_id,
    emp_id,
    salary_date,
    count(*)
from cleaned_salaries
group by salary_id,
    emp_id,
    salary_date
having count(*) > 1


--departments table

select *
from cleaned_departments


select dept_id,
    dept_name
from cleaned_departments
group by dept_id,
    dept_name
having count(*) > 1


--attendance table


select *
from cleaned_attedance


select attendance_id,
    emp_id,
    status,
    count(*)
from cleaned_attedance
group by attendance_id,
    emp_id,
    status
having count(*) > 1