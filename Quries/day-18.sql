
use 50days_mysql;

--1.emp's whose avg performance rating > 4

SELECT e.emp_id,
    e.emp_name,
    d.dept_name,
(p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 as avg_rating
from cleaned_employees e
    JOIN cleaned_departments d ON e.dept_id = d.dept_id
    join cleaned_performance p ON e.emp_id = p.emp_id
where (p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 > 4

--2.employees with more than 2 present days

select e.emp_id,e.emp_name,count(a.attendance_id) as emp_attedance
from cleaned_employees e join cleaned_attedance a
on e.emp_id= a.emp_id
where a.status = 'present'
GROUP BY emp_id,emp_name
having count(a.attendance_id)>2

--3.departments where total salary paid is > 200000

SELECT d.dept_name,sum(salary) as total_salary
from cleaned_salaries s
join cleaned_employees e on s.emp_id = e.emp_id
join cleaned_departments  d on d.dept_id = e.dept_id
group by d.dept_name
having sum(salary) > 200000


-4.employees whose total salary is > their department average salary


SELECT ee.emp_id,
    ee.emp_name,
    sum(ss.salary),
    ee.dept_id
from cleaned_employees ee
    JOIN cleaned_salaries ss ON ee.emp_id = ss.emp_id
group by ee.emp_id,
    ee.emp_name,
    ee.dept_id
having sum(ss.salary) > (
        SELECT AVG(s.salary)
        FROM cleaned_salaries s
            JOIN cleaned_employees e ON s.emp_id = e.emp_id
        where e.dept_id = ee.dept_id
    )