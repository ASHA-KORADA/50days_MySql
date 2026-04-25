


use 50days_mysql;

--1.Find rank of employees within each department based on salary

select *
from cleaned_salaries

select * from cleaned_departments

select *
from cleaned_employees

select e.emp_id,
    e.dept_id,
    s.salary,
    dense_rank() OVER(
        PARTITION BY e.dept_id
        ORDER BY s.salary asc
    ) as dept_rank_salary
from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id

--2.Compare each employee’s salary 
--with their department average(AboveAvg/BelowAvg/Equal)

select e.emp_id,
    e.dept_id,
    s.salary,
    avg(s.salary) over(PARTITION BY e.dept_id) as dept_avgsalary,
    case
        when s.salary > avg(s.salary) over(PARTITION BY e.dept_id) then "above avg"
        when s.salary < avg(s.salary) over(PARTITION BY e.dept_id) then "below avg"
        else "equal"
    end as comparision
from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id

--3.Find top 3 highest paid
--employees in each department

select *
from(
        select e.emp_id,
            e.dept_id,
            s.salary,
            rank() OVER (
                PARTITION BY dept_id
                ORDER BY salary DESC
            ) as mk
        from cleaned_employees e
            JOIN cleaned_salaries s ON e.emp_id = s.emp_id
    ) AS m
where mk <= 3

--4.• Find lowest salary employee in each department


select *
from (
        select e.emp_id,
            e.dept_id,
            s.salary,
            rank() OVER(
                partition by e.dept_id
                ORDER BY s.salary asc
            ) as rk
        from cleaned_employees e
            join cleaned_salaries s on e.emp_id = s.emp_id
    ) as mk
where rk <= 3






