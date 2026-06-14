use 50_days_sql_challenge;

--nested cte

--1.finding employees whoes salary is >1lach

with total_salary as(
    select emp_id,sum(salary) as total_salary
    from cleaned_salaries
    group by emp_id
),
high_earner as(
    select * from total_salary
    where total_salary>100000
)
select * from high_earner;

-- show employee salary with department avg salary

select e.emp_id,e.emp_name,e.dept_id,s.salary,
avg(s.salary) over(PARTITION BY e.dept_id) as dept_avg_salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id;