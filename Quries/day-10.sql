use 50days_mysql;

---1.performance rating of the All employees 

SELECT e.emp_id,
    e.emp_name,
    p.rating_2022,
    p.rating_2023,
    p.rating_2024
from cleaned_employees e
    join cleaned_performance p on e.emp_id = p.emp_id

--2.which employee do not have any salary records

SELECT e.emp_id,
    e.emp_name
from cleaned_employees e
    left join cleaned_salaries s on e.emp_id = s.emp_id
where salary is null

--3.which employee do not have any attedence records


SELECT e.emp_id,
    e.emp_name , a.status
from cleaned_employees  e
    left join  cleaned_attedance a on e.emp_id = a.emp_id
where status is null


--4.employee name with their  deptname & salary 

SELECT e.emp_id,e.emp_name,d.dept_name,s.salary
from cleaned_employees e
left join cleaned_departments d
on e.dept_id = d.dept_id
left join cleaned_salaries s
on e.emp_id = s.emp_id
