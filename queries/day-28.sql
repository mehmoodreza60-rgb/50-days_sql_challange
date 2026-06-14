use 50_days_sql_challenge;

--find top two employees per deparment(higest played employee)

with cte as(
select e.emp_id,e.emp_name,e.dept_id,d.dept_name,s.salary,
DENSE_RANK() over(PARTITION BY d.dept_id order by s.salary desc) as rank_of_emp
from cleaned_employees e
join cleaned_departments d on e.dept_id = d.dept_id
join cleaned_salaries s
on e.emp_id =s.emp_id
)
select*from cte where rank_of_emp <=2;

--salary gap (difference between current salary and previous salary)

select emp_id,
    salary,
    salary_date,
    lag(salary) over(
        PARTITION BY emp_id
        ORDER BY salary_date
    ) as previous_salary,
    salary - lag(salary) over(
        PARTITION BY emp_id
        ORDER BY salary_date
    ) as salary_gap
from cleaned_salaries;

