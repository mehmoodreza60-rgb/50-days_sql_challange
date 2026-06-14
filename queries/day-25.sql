use 50_days_sql_challenge;

--1.salary runing total (cumilative salary for each employee with time )

select emp_id,salary,salary_date 
,
sum(salary) over(PARTITION BY emp_id order by salary_date) as running_salary
from cleaned_salaries;