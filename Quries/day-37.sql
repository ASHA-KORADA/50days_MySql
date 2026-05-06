

use 50days_mysql;

--1.Create procedure with IF condition to return
-- message based on salary

    --creating procedure

CREATE PROCEDURE empsalary(IN p_emp_id INT)

SELECT 
    CASE
        WHEN salary > 50000 THEN 'High salary'
        ELSE 'Low salary'
    END AS result
FROM cleaned_salaries
WHERE emp_id = p_emp_id;



    --checking procedures in entire database 

SHOW PROCEDURE STATUS
WHERE Db = '50days_mysql';



    -- checking procedure

SHOW PROCEDURE STATUS
WHERE Name = 'empsalary';

    -- calling procedure

CALL empsalary(181);


SELECT * from cleaned_salaries


--2.Create procedure with CASE statement to categorize
--employees(High/Medium/Low)


CREATE PROCEDURE emp_category()

SELECT 
    emp_id,
    salary,

    CASE
        WHEN salary > 80000 THEN 'High'
        WHEN salary > 40000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category

FROM cleaned_salaries;


CALL emp_category();



--3.• Create procedure with aggregation 
--to calculate total salary per employee

CREATE PROCEDURE total_salary()

SELECT 
    emp_id,
    SUM(salary) AS total_salary
FROM cleaned_salaries
GROUP BY emp_id;


CALL total_salary();






