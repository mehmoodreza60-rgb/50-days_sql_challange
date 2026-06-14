use 50_days_sql_challenge;

--1. current and next salary

select emp_id, salary, salary_date,
lead(salary) over(partition by emp_id order by salary_date) as next_salary
from cleaned_salaries ;

-- grouth analysis compare our current salary with next salary

