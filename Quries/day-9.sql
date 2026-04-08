

use 50days_mysql;

---1.All employees who have valid departments

SELECT e.emp_id,e.emp_name,d.dept_name 
from cleaned_employees e
join cleaned_departments d
on e.dept_id = d.dept_id

--2.All employess who even without department

SELECT e.emp_id,e.emp_name,d.dept_name 
from cleaned_employees e
left join cleaned_departments d
on e.dept_id = d.dept_id

--3.find employees without department

SELECT e.emp_id,e.emp_name,d.dept_name 
from cleaned_employees e
left join cleaned_departments d
on e.dept_id = d.dept_id
where dept_name is null

--4.who earns how much

SELECT e.emp_id,e.emp_name,s.salary 
from cleaned_employees e
join cleaned_salaries s
on e.emp_id = s.emp_id

--5.employees whose salary is null

SELECT e.emp_id,e.emp_name,s.salary 
from cleaned_employees e
left join cleaned_salaries s
on e.emp_id = s.emp_id
where salary is null