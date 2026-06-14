use 50_days_sql_challenge;

--learning window function
--1.latest salary

select * from (
select emp_id, salary,
row_number() over(partition by emp_id order by salary_date desc) as rn

from cleaned_salaries) as t
where rn = 1;

--2. first salary