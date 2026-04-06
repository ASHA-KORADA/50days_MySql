

use 50days_mysql;

--employees table 

--1.remove invalid month>12
--date 20-06-2023 -> 20-06 -> it keeps
--date 20-15-2023 -> 20-15 -> here month 15>12 so it shows null 

update cleaned_employees
set hire_date = null
where cast(
        SUBSTRING_INDEX(SUBSTRING_INDEX(hire_date,'-', 2), '-', -1) AS UNSIGNED) > 12



--2.formating date DD-MM-YYYY to YYYY-MM-DD

UPDATE cleaned_employees
SET hire_date = CONCAT
(
    RIGHT(hire_date,4) , '-',SUBSTRING(hire_date,4,2),'-',LEFT(hire_date,2)
)
WHERE hire_date like '__-__-____'


--3.remove invalid date

update cleaned_employees
SET hire_date = NULL
where CAST(RIGHT(hire_date,2)AS UNSIGNED) > 31 ;

alter TABLE cleaned_employees
modify hire_date DATE

SELECT DISTINCT hire_date from cleaned_employees

--4.replace null and empty values with '2024-02-25'


UPDATE cleaned_employees
set hire_date = '2024-02-25'
where hire_date is NULL


-- attedance table

select * from cleaned_attedance


update cleaned_attedance
set attendance_date = null
where
cast(substring_index(
    substring_index(attendance_date,'-',2),'-',-1) as unsigned ) > 12 


update cleaned_attedance
set attendance_date = CONCAT
(
    RIGHT(attendance_date,4),'-',SUBSTRING(attendance_date,4,2),'-',LEFT(attendance_date,2)
)
where attendance_date like '__-__-____'


update cleaned_attedance
SET attendance_date  = NULL
WHERE CAST(RIGHT(attendance_date,2) AS UNSIGNED) > 31


ALTER TABLE cleaned_attedance
MODIFY attendance_date DATE


SELECT DISTINCT attendance_date FROM cleaned_attedance


UPDATE cleaned_attedance
set attendance_date = '2024-02-25'
where attendance_date is NULL


--salaries table 

select * from cleaned_salaries

update cleaned_salaries
set salary_date = null 
where cast(substring_index(substring_index(salary_date,'-',2),'-',-1) as UNSIGNED ) >12


update cleaned_salaries
set salary_date = concat
(
    RIGHT(salary_date,4),'-',SUBSTRING(salary_date,4,2),'-',LEFT(salary_date,2)
)
where salary_date like '__-__-____'

update cleaned_salaries
SET salary_date  = NULL
WHERE CAST(RIGHT(salary_date,2) AS UNSIGNED) > 31


SELECT * from cleaned_salaries


ALTER table cleaned_salaries
modify salary_date date


UPDATE cleaned_salaries
set salary_date = '2024-02-25'
where salary_date  is NULL

