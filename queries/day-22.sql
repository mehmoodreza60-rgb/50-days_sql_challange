use 50_days_sql_challenge;

--department average slary(show each employee with average salary of their department )

select e.emp_id, e.emp_name, e.dept_id, s.salary,
avg(s.salary) over(PARTITION BY e.dept_id)as dept_avg_salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id = s.emp_id
order by e.dept_id ASC;

--2. total salary of each department 
select e.dept_id as dept_id, d.dept_name, s.salary,
sum(s.salary) over(PARTITION BY e.dept_id ) as total_salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id = s.emp_id
JOIN cleaned_departments d on
 e.dept_id = d.dept_id;