use 50_days_sql_challenge;

update cleaned_employees
set emp_name ='unknown'
where emp_name is null or emp_name = '';

-- set emp_id 13 ='delhi'

update cleaned_employees
set city ='delhi'
where emp_id = '13';

update cleaned_employees
set city ='delhi'
where city is null or city ='';

--rating 2023 with 0

update performance
set rating_2023 = '0'
where rating_2023 is null or rating_2023 = '';

-- finding duplicate records in employees table

select emp_id,emp_name,city,count(*)
from cleaned_employees
GROUP BY emp_id,emp_name,city
having count(*)>1;

--finding duplicate records in department table

select dept_id,dept_name,count(*)
from cleaned_deparments
group by dept_id,dept_name
having count(*)>1;

--finding duplicate records  in attendance table

select attendance_id,emp_id,count(*)
from cleaned_attendance
GROUP BY attendance_id,emp_id
having count(*)>1;

-- finding duplicate records in performance table

select emp_id,rating_2022,rating_2023,rating_2024,count(*)
from cleaned_performance
group by emp_id,rating_2022,rating_2023,rating_2024
having count(*)>1;

--finding duplicate records in salaries table

select salary_id,emp_id,salary,salary_date,count(*)
from cleaned_salaries
GROUP BY salary_id,emp_id,salary,salary_date
having count(*)>1;


