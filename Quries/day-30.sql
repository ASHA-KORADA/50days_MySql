

use 50days_mysql;


--1.Create a temporary result set using CTE and 
--filter data from it

with cte_salary as (
    select emp_id,
        salary
    from cleaned_salaries
)
select *
from cte_salary
where emp_id = 11


--2•Combine employees and  salaries using CTE

with cte_empsalary as (
    select e.emp_id,
        e.dept_id,
        s.salary
    from cleaned_employees e
        join cleaned_salaries s on e.emp_id = s.emp_id
)
select *
from cte_empsalary
where dept_id =5


--3• Calculate department avg salary using CTE

with cte_deptavgsalary as (
    select 
        e.dept_id,
        round(avg(s.salary),0) as avg_salary
    from cleaned_employees e
        join cleaned_salaries s on e.emp_id = s.emp_id
        GROUP BY e.dept_id
        Order BY avg_salary desc
)
select *
from cte_deptavgsalary




 
--4• Find employees earning more than dept avg using CTE

with cte_deptavgsalary as (
    select e.dept_id,
        avg(s.salary) as avg_salary
    from cleaned_employees e
        join cleaned_salaries s on e.emp_id = s.emp_id
    GROUP BY e.dept_id
)
select e.emp_id,
    e.dept_id,
    s.salary
from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id
    join cte_deptavgsalary da on e.dept_id = da.dept_id
where s.salary > da.avg_salary





