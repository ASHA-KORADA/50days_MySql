


use 50days_mysql;

/*What is a Stored Procedure? 
It is a set of SQL statements that are stored and named, 
allowing you to perform complex tasks by simply calling 
the procedure's name */

--1.Create a procedure to get all employee data


--use DELIMITER IN MYSQL WORKBENCH
/*
DELIMITER $$

CREATE PROCEDURE get_emp_info()
BEGIN
    SELECT * FROM cleaned_employees ;
END $$

DELIMITER ;
*/


CREATE PROCEDURE get_emp_info()

    SELECT * FROM cleaned_employees ;


    --execution of procedure

CALL get_emp_info() ;

    --CHECKING WEATHER PROCEDURE CTEATED OR NOT

SHOW PROCEDURE STATUS WHERE Name = 'get_emp_info';



--2.Create a procedure with input parameter 
--to find employee by emp_id

--CREATING
CREATE PROCEDURE get_emp_by_id(IN P_emp_id INT)
SELECT * FROM cleaned_employees
WHERE emp_id = P_emp_id
--CHECKING
SHOW PROCEDURE STATUS WHERE Name = 'get_emp_by_id'
--CALLING/USING
CALL get_emp_by_id(115);


--3.Create a procedure using JOIN to
--fetch employee and salary details

CREATE PROCEDURE get_empsal()
select e.emp_id,e.emp_name,s.salary from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id;
SHOW PROCEDURE STATUS WHERE Name = 'get_empsal'
CALL get_empsal();
--dropping procedure
DROP procedure if exists get_empsal;

--4.Create a procedure for salary report 
--(employees with salary > 50000)

CREATE PROCEDURE hiempsal()
SELECT e.emp_id,e.emp_name,s.salary from
cleaned_employees e join cleaned_salaries s 
on e.emp_id = s.emp_id
where s.salary > 50000 
order by s.salary desc;

call hiempsal();

--by passing the input parameter 

CREATE PROCEDURE sal_above(IN P_SALARY INT)
SELECT e.emp_id,e.emp_name,s.salary FROM 
cleaned_employees e join cleaned_salaries s
on e.emp_id = s.emp_id
where s.salary > P_SALARY

call sal_above(50000);





