use 50_days_sql_challenge;

--1. employees with salary records atleast once

SELECT e.emp_id, e.emp_name
from cleaned_employees e
where EXISTS(
    select 1 from cleaned_salaries s
    where s.emp_id = e.emp_id
);

--2. employees without salary and total count of employees without salary

SELECT e.emp_id, e.emp_name
from cleaned_employees e
where NOT EXISTS(
    select 1 from cleaned_salaries s
    where s.emp_id = e.emp_id
);


SELECT COUNT(*) AS employees_without_salary
FROM cleaned_employees e
LEFT JOIN cleaned_salaries s 
ON e.emp_id = s.emp_id
WHERE s.emp_id IS NULL;


-- another way to find total employees without salary using CTE

with cte as(
 SELECT e.emp_id, e.emp_name
from cleaned_employees e
where NOT EXISTS(
    select 1 from cleaned_salaries s
    where s.emp_id = e.emp_id
)) SELECT count(*) 
as employees_without_salary from cte
;


--3. list of employees with attendance records

SELECT e.emp_id, e.emp_name
from cleaned_employees e
where EXISTS(
    select 1 from cleaned_attendance a
    where a.emp_id = e.emp_id
);

--4. list of employees without attendance records

SELECT e.emp_id, e.emp_name
from cleaned_employees e    
where NOT EXISTS(
    select 1 from cleaned_attendance a
    where a.emp_id = e.emp_id
);

