
use 50days_mysql

--finding anomalies in salaries table

select * from cleaned_salaries
where salary < 0

----finding anomalies in performance table 

select * from cleaned_performance
where rating_2022 < 0 or rating_2022 > 5
or rating_2023 < 0 or rating_2023 > 5
or rating_2024 < 0 or rating_2024 > 5

----finding anomalies in employees table 

select * from cleaned_employees
where age < 18 or age > 65

--imputing the age values in employees table

UPDATE cleaned_employees
SET age = CASE emp_id
    WHEN 20 THEN 32
    WHEN 24 THEN 28
    WHEN 44 THEN 35
    WHEN 65 THEN 40
    WHEN 66 THEN 30
    WHEN 67 THEN 27
    WHEN 110 THEN 38
    WHEN 134 THEN 29
    WHEN 147 THEN 33
    WHEN 188 THEN 36
    WHEN 216 THEN 31
    WHEN 223 THEN 26
    WHEN 266 THEN 42
    WHEN 295 THEN 34
    WHEN 318 THEN 28
    WHEN 347 THEN 37
    WHEN 360 THEN 39
    WHEN 387 THEN 25
    WHEN 420 THEN 41
    WHEN 428 THEN 33
    WHEN 440 THEN 29
    WHEN 460 THEN 36
    WHEN 466 THEN 27
    WHEN 469 THEN 32
    WHEN 471 THEN 35
END
where age < 18 or age > 65

--imputing the salary values in salaries table

UPDATE cleaned_salaries
SET salary = CASE emp_id
    WHEN 463 THEN 55000
    WHEN 142 THEN 60000
    WHEN 100 THEN 45000
    WHEN 30  THEN 70000
    WHEN 54  THEN 52000
    WHEN 310 THEN 48000
    WHEN 183 THEN 51000
    WHEN 168 THEN 47000
    WHEN 126 THEN 46000
    WHEN 206 THEN 58000
    WHEN 76  THEN 49000
    WHEN 433 THEN 62000
    WHEN 43  THEN 53000
    WHEN 324 THEN 55000
    WHEN 226 THEN 51000
    WHEN 113 THEN 50000
    WHEN 273 THEN 52000
    WHEN 200 THEN 48000
    WHEN 160 THEN 47000
    WHEN 42  THEN 46000
    WHEN 150 THEN 49000
    WHEN 45  THEN 53000
    WHEN 65  THEN 54000
    WHEN 488 THEN 60000
    WHEN 8   THEN 45000
    WHEN 121 THEN 50000
    WHEN 78  THEN 47000
    WHEN 94  THEN 46000
    WHEN 353 THEN 52000
END
where salary < 0;

