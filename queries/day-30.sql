use 50_days_sql_challenge;

--create a temporary table of salay

with cte as (
    select emp_id,salary
    from cleaned_salaries
)
select*from cte
where emp_id =62;

--combine employees and salaries using cte

with emp_salary as(
    select e.emp_id,e.emp_name,s.salary
    from cleaned_employees e
    inner join cleaned_salaries s 
    on e.emp_id = s.emp_id
)
select*from emp_salary;

--caculate department average salary 

with cte as (
select d.dept_name,d.dept_id,
avg(s.salary) as dept_average_salary
from cleaned_employees e 
join cleaned_departments d
on e.dept_id = d.dept_id 
join cleaned_salaries s
on e.emp_id = s.emp_id
GROUP BY d.dept_id,d.dept_name)
SELECT*from cte;