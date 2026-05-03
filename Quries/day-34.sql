

use 50days_mysql;

---1 • Create index on emp_id to speed up emp search

-- creating index for faster apporch 

CREATE index idx_empid on cleaned_employees(emp_id)


select *
from cleaned_employees
where emp_id = 105


--2•Create index on dept id for faster dept - based filtering

Create index idex_deptid on cleaned_departments(dept_id)


select *
from cleaned_departments
where dept_id = 5


--3 • Create "composite index" on
---(emp_id, salary_date) for optimized multi-column queries

Create index idx_empsalary on cleaned_salaries(emp_id, salary_date)



select *
from cleaned_salaries
where emp_id = 276
    and salary_date = '2023-02-08'





    

