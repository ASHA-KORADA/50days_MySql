
use 50days_mysql;


--1•Create temporary table for employee salary summary

CREATE temporary table temp_salary(emp_id INT, salary INT);

--2•Insert aggregated salary data into temporary table

Insert INTO temp_salary(emp_id, salary)
SELECT emp_id,
    sum(salary)
FROM cleaned_salaries
group by emp_id;

SELECT * from temp_salary


--3.Join temporary table with employee table to fetch employee details


SELECT e.emp_id,e.emp_name,t.salary 
from cleaned_employees e 
JOIN temp_salary t
on e.emp_id = t.emp_id;


--4•Drop temporary table after usage

drop temporary table temp_salary;






