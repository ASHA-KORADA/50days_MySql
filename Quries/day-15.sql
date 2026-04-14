
use 50days_mysql;

--1.List employees with salary records (atleast once)

SELECT e.emp_id,
    e.emp_name
from cleaned_employees e
where EXISTS (
        select 1
        FROM cleaned_salaries s
        where s.emp_id = e.emp_id
    )


--2.List employees without salary records

SELECT e.emp_id,
    e.emp_name
from cleaned_employees e
where not exists (
        select 1
        from cleaned_salaries s
        where s.emp_id = e.emp_id
    )


--3.List employees with attendance records

select e.emp_id,
    e.emp_name
from cleaned_employees e
where exists (
        select 1
        from cleaned_attedance a
        where e.emp_id = a.emp_id
    )

--4.List employees without attendance records

select e.emp_id,
    e.emp_name
from cleaned_employees e
where not exists (
        select 1
        from cleaned_attedance a
        where e.emp_id = a.emp_id
    )