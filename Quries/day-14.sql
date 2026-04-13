


use 50days_mysql;

--1.emp.who earns more than the department avg salary

SELECT ee.emp_id,
    ee.emp_name,
    ss.salary,
    ee.dept_id
from cleaned_employees ee
    JOIN cleaned_salaries ss ON ee.emp_id = ss.emp_id
where ss.salary > (
        SELECT AVG(s.salary)
        FROM cleaned_salaries s
            JOIN cleaned_employees e ON s.emp_id = e.emp_id
        where e.dept_id = ee.dept_id
    )

--2.emp salary is equal to the highest salary in their dept

SELECT ee.emp_id,
    ee.emp_name,
    ss.salary,
    ee.dept_id
from cleaned_employees ee
    JOIN cleaned_salaries ss ON ee.emp_id = ss.emp_id
where ss.salary = (
        SELECT max(s.salary)
        FROM cleaned_salaries s
            JOIN cleaned_employees e ON s.emp_id = e.emp_id
        where e.dept_id = ee.dept_id
    )

----3.emp salary is equal to the lowest salary in their dept

SELECT ee.emp_id,
    ee.emp_name,
    ss.salary,
    ee.dept_id
from cleaned_employees ee
    JOIN cleaned_salaries ss ON ee.emp_id = ss.emp_id
where ss.salary = (
        SELECT min(s.salary)
        FROM cleaned_salaries s
            JOIN cleaned_employees e ON s.emp_id = e.emp_id
        where e.dept_id = ee.dept_id
    )


