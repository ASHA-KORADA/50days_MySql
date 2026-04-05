
use 50days_mysql


select * from cleaned_salaries

alter table cleaned_salaries
modify salary int

select 
min(salary) as min_salary,
max(salary) as max_salary,
avg(salary) as avg_salary
from cleaned_salaries
where salary > 0

--max 2L,min 20k


 ALTER table cleaned_salaries
 add column is_outlier int

 update cleaned_salaries
 SET is_outlier = 
 case when salary >200000 or salary < 20000 then 1
 else 0
 END;

 SELECT * from cleaned_salaries
 where is_outlier = 1

 update cleaned_salaries
 set salary =
 case  emp_id when 35 then 65000
 when 262 then 97000
 END
 where is_outlier=1
