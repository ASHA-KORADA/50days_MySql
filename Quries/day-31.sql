

use 50days_mysql;

--Nested CTE'S

--1.Find employees whose total salary > 100000

WITH totalsalary_cte1 AS(
    select emp_id,
        Sum(salary) as total_salary
        from cleaned_salaries
        group by emp_id
),
highsalary_cte2 as (
    select *
    from totalsalary_cte1
    where total_salary > 100000
)
SELECT *
from highsalary_cte2



--2.Show employee salary along with department average
--salary using CTE


with cte1_deptavgsalary as (
    select e.dept_id,
        round(avg(s.salary),0) as avg_salary
    from cleaned_employees e
        JOIN cleaned_salaries s ON e.emp_id = s.emp_id
    GROUP BY e.dept_id
),
cte2_empsalary as (
    select e.emp_id,e.dept_id,
        s.salary,da.avg_salary
    from cleaned_employees e
        join cleaned_salaries s on e.emp_id = s.emp_id
        join cte1_deptavgsalary da on e.dept_id = da.dept_id
    
)
select *
from cte2_empsalary
where dept_id = 2


--3.Find department with highest total salary


with cte1_depttotalsalary as (
    select e.dept_id,
        Sum(s.salary) as dept_totalsalary
    from cleaned_employees e
        join cleaned_salaries s on e.emp_id = s.emp_id
    group by e.dept_id
),
cte2_depmaxsalary as (
    select max(dept_totalsalary) as max_deptsalary
    from cte1_depttotalsalary
)
select *
from cte1_depttotalsalary dts
    join cte2_depmaxsalary dms 
    on dts.dept_totalsalary = dms.max_deptsalary








    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   