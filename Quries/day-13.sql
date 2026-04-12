
use 50days_mysql;

--1.emp.who earns more than avg salary


SELECT * from cleaned_employees

select e.emp_name,
    e.emp_id,
    s.salary
from cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
WHERE salary > (
        select avg(salary)
        from cleaned_salaries
    )

--2.emp salary equal to max salary

select e.emp_name,
    e.emp_id,
    s.salary
from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id
where salary = (
        select max(salary)
        from cleaned_salaries
    )


--3.emp salary less than avg salary

select e.emp_name,
    e.emp_id,
    s.salary
from cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
WHERE salary < (
        select avg(salary)
        from cleaned_salaries
    )

--4.emp salary equal to min salary

select e.emp_name,
    e.emp_id,
    s.salary
from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id
where salary = (
        select min(salary)
        from cleaned_salaries
    )
