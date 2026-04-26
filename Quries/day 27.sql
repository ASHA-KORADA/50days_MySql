

use 50days_mysql;

--1.Compare each employee's salary with overall average salary 
---(> avg → Above Avg, < avg → Below Avg,= avg → Equal)

SELECT emp_id,
    salary,
    avg(salary) over() as overall_avgsalary,
    case
        when salary > avg(salary) over() then "above avg"
        when salary > AVG(salary) over() then "Below avg"
        else "equal"
    end as salary_comparision
from cleaned_salaries 

--2.Compare employee salary with total salary of all employees
--salary > 10% of total salary → High Contributor, 
--else → Low Contributor)

select emp_id,
    salary,
    sum(salary) over() as overall_totalsalary,
    case
        when salary > sum(salary) over() * 0.1 then "high Contributor"
        else "low contributor"
    end as salary_contrubution
from cleaned_salaries


--3.Compare department total salary with overall total salary
-- (dept total > 30% of total → High Dept, else → Low Dept)

SELECT e.emp_id,
    e.dept_id,
    s.salary,
    SUM(s.salary) OVER(PARTITION BY dept_id) AS department_total,
    CASE
        WHEN SUM(s.salary) OVER(PARTITION BY dept_id) > (0.3 * SUM(s.salary) OVER()) THEN 'High Department'
        ELSE 'Low Department'
    END AS department_category
FROM cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id



