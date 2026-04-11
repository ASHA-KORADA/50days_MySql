
use 50days_mysql;

---1.check the avg salary in each dept.

SELECT d.dept_name,
    AVG(salary) as avg_salary_dept
from cleaned_departments d
    join cleaned_employees e ON d.dept_id = e.dept_id
    join cleaned_salaries s  on s.emp_id=e.emp_id 
GROUP BY dept_name


--2.how many days the emp. was present

select e.emp_name,
    e.emp_id,
    count(a.attendance_date) as emp_days present
from cleaned_employees e
    JOIN cleaned_attedance a ON e.emp_id = a.emp_id
group by e.emp_id,
    e.emp_name
   

--3.which emp. belong to same dept.

select dept_id,
    group_concat(emp_name) as employees_names
from cleaned_employees
group by dept_id
having count(*) > 1


--4.Which employees have more than one salary record?

SELECT e.emp_id,
    e.emp_name,
    count(s.salary_id) as salary_count
from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id
group by e.emp_id,
    e.emp_name
having count(*) > 1