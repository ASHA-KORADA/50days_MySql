

use 50days_mysql;


--1.Create BEFORE INSERT trigger to 
--prevent -ve salary insertion

--2.Automatically convert negative salary 
--values to 0 before inserting data


CREATE TRIGGER before_salary_insert
BEFORE INSERT ON clean_salaries
FOR EACH ROW
BEGIN
IF NEW.salary < 0 THEN
SET NEW.salary = 0;
END IF;
END;

INSERT INTO cleaned_salaries (salary_id,emp_id,salary,salary_date)
values(602,854,-4500,'2024-01-01')

--3.Create AFTER UPDATE trigger to
--track salary changes

--4.Store old salary and new salary
--records inside salary_logs table

CREATE TABLE salary_logs (
employee_id INT,
salary INT,
old_salary INT,
new_salary INT
);

CREATE TRIGGER salary_update_trigger
AFTER UPDATE ON clean_salaries
FOR EACH ROW
BEGIN
INSERT INTO salary_logs (employee_id, old_salary, new_salary)
VALUES (OLD.employee_id, OLD.salary, NEW.salary);
END;






