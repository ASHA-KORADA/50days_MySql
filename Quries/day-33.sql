

use 50days_mysql;


--1.Update emp data using a view

--creating the view

CREATE view empdata_update as
select emp_id,
    emp_name,
    city
from cleaned_employees

--using the view

select *
from empdata_update
where emp_id = 105

--updating the empdata

update empdata_update
set city = 'Mumbai'
where emp_id = 105

--2• Create view for high salary emp(salary>50000)& fetch data from it

create view highsalary_emp  as
select emp_id,
    salary,
    salary_id
from cleaned_salaries

select * from highsalary_emp
where salary > 50000

--3.• Create multi-table view combining
--  employee, department, and salary

create view multi_table as
select e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary,
    s.salary_id,
    d.dept_name
from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id
    join cleaned_departments d on e.dept_id = d.dept_id




--4 • Create HR dashboard view for high
--salary employees with department name

-- i didnt created a view here ..

-- just used the above multi table view

select emp_id,
    dept_name,
    salary
from multi_table
where salary > 80000






