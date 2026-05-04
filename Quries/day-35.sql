

use 50days_mysql;

--no index

SELECT * from cleaned_employees

--1.Analyze query performance before applying index 
-- using "EXPLAIN ANALYZE"

EXPLAIN ANALYZE
select e.emp_name,
    s.salary
from cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id

    --Apply index

CREATE index idx_emp on cleaned_employees(emp_id);
CREATE index idx_salary on cleaned_salaries(emp_id)

    --after applying index


    --2.Apply index on join columns and compare performance after
    --indexing


explain Analyze
select e.emp_name,
    s.salary
from cleaned_employees e
    join cleaned_salaries s ON e.emp_id = s.emp_id

    -- /* conclusion:
    --Shows the syntax for creating indexes on specific columns
    --and compares execution times before and
    --after indexing,
    --it demonstrating a clear reduction in latency (
    --from 1.48 ms down to 0.195 ms in the example)


--3. Analyze query using multiple
--conditions (emp_id, salary_date) and
--optimize using composite index

EXPLAIN ANALYZE
select *
from cleaned_salaries
where emp_id = 115
    and salary_date = '2023-11-01'


    --creating index

    create index idx_empsal on cleaned_salaries (emp_id,salary_date)


    --4.Compare query performance before
    --and after applying index on emp_id

    ---after creating index on composite columns

 explain Analyze
select *
from cleaned_salaries
where emp_id = 115
    and salary_date = '2023-11-01'






    