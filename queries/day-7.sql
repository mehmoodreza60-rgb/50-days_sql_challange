use 50_days_sql_challenge;

-- 1. remove invalid month

UPDATE cleaned_employees
SET hire_date = NULL
WHERE CAST(
    SUBSTRING_INDEX(SUBSTRING_INDEX(hire_date, '-', 2), '-', -1)
    AS UNSIGNED
) > 12;

-- suppose out date is in 25-02-2022    SUBSTRING_INDEX(hire_date, '-', 2) this code what does is extracts 25-02

--step 2  
-- convert dd-mm-yyyy to yyyy-mm-dd
-- 28-02-2021 to 2021-02-28

select hire_date from cleaned_employees;

UPDATE cleaned_employees
set hire_date = concat
(right(hire_date,4),'-',substring(hire_date,4,2),'-',left(hire_date,2)
)
where hire_date like '__-__-____';

--The CONCAT() function is used to join (concatenate) two or more strings into a single string.

--The CONCAT() function is used to join (concatenate) two or more strings into a single string

-- remove invalid dates

UPDATE cleaned_employees
set hire_date = null
where cast(right(hire_date,2)  as unsigned) >31;


alter table cleaned_employees
modify hire_date date;


select * from cleaned_employees
where hire_date is null;

update cleaned_employees
set hire_date = case 
when emp_id = 62 then '2024-02-25'
when emp_id = 88 then '2024-02-25'
when emp_id = 97 then '2024-02-25'
when emp_id = 132 then '2024-02-25'
else hire_date end;


-- now or attendance table

--1. removing invalid months

update cleaned_attendance
set attendance_date = null
where cast(
    SUBSTRING_INDEX(SUBSTRING_INDEX(attendance_date,'-',2),'-',-1) AS UNSIGNED
) >12;

--convert dd-mm-yyyy to yyyy-mm-dd

SELECT attendance_date from cleaned_attendance;

update cleaned_attendance
set attendance_date = concat
(right(attendance_date,4),'-',SUBSTRING(attendance_date,4,2),'-',left(attendance_date,2))
where attendance_date like '__-__-____';

-- removing invalid dates

update cleaned_attendance
set attendance_date = null
where cast(left(attendance_date,2) as unsigned) >31;

select * from cleaned_attendance
where attendance_date is null;

UPDATE cleaned_attendance
modify attendance_date date;

-- now for salary table 

update cleaned_salaries
set salary_date = null
where cast(
    SUBSTRING_INDEX(SUBSTRING_INDEX(salary_date,'-',2),'-',-1) AS UNSIGNED
) >12;

SELECT salary_date from cleaned_salaries;

update cleaned_salaries
set salary_date = concat
(right(salary_date,4),'-',SUBSTRING(salary_date,4,2),'-',left(salary_date,2))
where salary_date like '__-__-____';

update cleaned_salaries
set salary_date = null
where cast(right(salary_date,2) as unsigned) >31; 

alter table cleaned_salaries
modify salary_date date;

select*from cleaned_salaries
where salary_date is null;

update cleaned_salaries
set salary_date ='2022-01-18' where salary_id = 16;


