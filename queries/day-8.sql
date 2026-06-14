use 50_days_sql_challenge;

-- removing leading and trailing space

UPDATE cleaned_employees 
set emp_name = trim(emp_name);

--conversion of data types
-- 1. employees

alter TABLE cleaned_employees
modify emp_id int,
modify emp_name varchar(40),
modify age int,
modify city varchar(40),
modify dept_id int,
modify hire_date date;

DESCRIBE cleaned_employees;

-- 2. department table

alter TABLE cleaned_deparments
modify dept_id int,
modify dept_name varchar(40);

RENAME TABLE cleaned_deparments TO cleaned_departments;

DESCRIBE cleaned_departments;

-- 3. attendance table


alter table cleaned_attendance
modify attendance_id int,
modify emp_id int,
modify attendance_date date,
modify status varchar(40);


--4. performance table

ALTER TABLE cleaned_performance
MODIFY emp_id int,
MODIFY rating_2022 int,
MODIFY rating_2023 int,
MODIFY rating_2024 int;

update cleaned_performance
set rating_2023 = 5
where rating_2023 is null or rating_2023 = '';

SELECT*from cleaned_performance;

DESCRIBE cleaned_performance;

--5. salaries table

ALTER TABLE cleaned_salaries
modify salary_id int,
modify emp_id int,
modify salary int,
modify salary_date date;

DESCRIBE cleaned_salaries;