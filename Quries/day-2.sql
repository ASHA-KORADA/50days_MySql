use 50days_mysql


--departments table

select *
from cleaned_departments
where dept_id is null
    or dept_id = ''
    or dept_name is null
    or dept_name = ''


--employees table

  SELECT *
from cleaned_employees
where emp_id is null
    or emp_id = ''
    or emp_name is null
    or emp_name = ''
    or age is null
    or age = ''
    or city is null
    or city = ''
    or dept_id is null
    or dept_id = ''
    or hire_date is null
    or hire_date = ''

--attedance table

  select *
from cleaned_attedance
where attendance_id is null
    or attendance_id = ""
    or emp_id is null
    or emp_id = ""
    or attendance_date is null
    or attendance_date = ""
    or status is null
    or status = ""
    
--performance table

select *
from cleaned_performance
where emp_id is null
    or emp_id = ""
    or rating_2022 is null
    or rating_2022 = ""
    or rating_2023 is null
    or rating_2023 = ""
    or rating_2024 is null
    or rating_2024 = ""

--salaries table

SELECT *
from cleaned_salaries
where salary_id is null
    or salary_id = ""
    or emp_id is null
    or emp_id = ""
    or salary is null
    or salary = ""
    or salary_date is null
    or salary_date = ""
