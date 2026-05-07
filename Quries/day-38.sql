
use 50days_mysql;


            /*triggers*/

--1•Create BEFORE UPDATE triggerto prevent
-- negative salary updates
--2•Create AFTER INSERT trigger to log attendance records
-- automatically
--3•Store attendance activity inside
-- attendance_logs table
--4•Test trigger execution using
-- UPDATE and INSERT operations


CREATE TRIGGER prevent_neg_sal
BEFORE UPDATE
ON cleaned_salaries
FOR EACH ROW

    BEGIN

IF  new.salary < 0 THEN
SET new.salary = old.salary;
END IF ;
    END;

SELECT * FROM cleaned_salaries
WHERE emp_id=164

update cleaned_salaries set salary = 55000
where emp_id = 164;


create table 
attendance_logs(emp_id INT,attendance_date date, message varchar(100));

create trigger attendance_insert_logs
after INSERT
on cleaned_attedance
for each row 

begin 

INSERT into attendance_logs(emp_id,attendance_date,message)

values(new.emp_id,new.attendance_date,'attendance added');
end;

select * from attendance_logs;

insert into cleaned_attedance
select(0705,101,'2026-05-07','present');









