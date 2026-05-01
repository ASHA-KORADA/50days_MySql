

use 50days_mysql;

--1 • Create emp view to store reusable emp details

create view emp_view as
select emp_id,
    emp_name,
    dept_id,
    city
from cleaned_employees

        --using view


select * from emp_view
where city like 'Delhi'


--2•Create salary view to store salary-related data

create view salary_view as 
select emp_id,salary,salary_date
from cleaned_salaries

select * from salary_view 
where salary >= 70000

--3• Create joined view combining
-- employee and salary details

create view empsalary_view as
select e.emp_id,e.emp_name,
    e.dept_id,
    e.city,
    s.salary
from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id

  drop view empsalary_view

--4• Use created view to filter
employees with salary > 50000


select * from empsalary_view
where salary > 50000 


select * from empsalary_view
where salary > 50000 and dept_id=5
ORDER BY salary DESC;






