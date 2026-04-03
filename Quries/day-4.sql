


USE 50days_mysql

--employees table

with cte_dup as (
    select *,
        row_number() over(
            partition by emp_id,
            emp_name,
            city
            order by emp_id asc
        ) as rn
    from cleaned_employees
)
delete from cleaned_employees
where emp_id in (
        select emp_id
        from cte_dup
        where rn > 1
    )

--salaries table

    with cte_dups as (
    select *,
        row_number() over(
            partition by salary_id,
            emp_id,
            salary
            order by salary_id
        ) as rn
    from cleaned_salaries
)
delete from cleaned_salaries
where salary_id in(
        select salary_id
        from cte_dups
        where rn > 1
    )


-- performance table

with cte as(
    select *, row_number() over(partition by emp_id order by emp_id ) as rn 
     from cleaned_performance
)
    
delete from cleaned_performance
where emp_id in (
    select emp_id from cte
    where rn>1
)

select distinct city from cleaned_employees

select distinct dept_name from cleaned_departments

update cleaned_employees
set city=concat(upper(left(trim(city),1)),
lower(substring(trim(city),2))
)


update cleaned_employees
set city = case when city in ('Dlhi','New Delhi','Delhincr') then 'DELHI'
WHEN city IN ('Hydbd') then 'Hyderabad'
when city in ('Bangalore') then 'Bengaluru'
else city
end