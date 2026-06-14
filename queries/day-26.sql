use 50_days_sql_challenge;

--combination of window function and joins

--find rank of employyees within each department based on salary

select e.emp_id,e.emp_id,s.salary,
DENSE_RANK() over (PARTITION BY e.dept_id order BY s.salary desc) as dept_rank
from cleaned_employees e
join cleaned_salaries s
on e.emp_id = s.emp_id;

--compare each employees salary with their department avg salary(if salary>avg - above average if salary<avg salary then below avg)

select e.emp_id,e.dept_id,s.salary,avg(s.salary) over(PARTITION BY e.dept_id) as avg_salary,
case when s.salary> avg(s.salary) over (PARTITION BY e.dept_id) then 'above average'
when s.salary< avg(s.salary) over (PARTITION BY e.dept_id) then 'below average'
else 'equal'
end as comparition

from cleaned_employees e
join cleaned_salaries s
on e.emp_id = s.emp_id;

-- top three higest  employee in each department 
with cte as (
select e.emp_id,e.emp_name,e.dept_id,s.salary,
DENSE_RANK() over (PARTITION BY e.dept_id ORDER BY s.salary desc) as ranked_emp
from cleaned_employees e  JOIN
cleaned_salaries s
on e.emp_id = s.emp_id)
select emp_id,emp_name,dept_id, salary
from cte
where ranked_emp limit 3;



WITH latest_salary AS (
    SELECT emp_id,
           salary,
           ROW_NUMBER() OVER (
               PARTITION BY emp_id
               ORDER BY salary_date DESC
           ) AS rn
    FROM cleaned_salaries
),

employee_salary AS (
    SELECT e.emp_id,
           e.emp_name,
           d.dept_name,
           ls.salary
    FROM cleaned_employees e
    JOIN cleaned_departments d
        ON e.dept_id = d.dept_id
    JOIN latest_salary ls
        ON e.emp_id = ls.emp_id
    WHERE ls.rn = 1
),

ranked_employees AS (
    SELECT *,
           DENSE_RANK() OVER (
               PARTITION BY dept_name
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employee_salary
)

SELECT emp_id,
       emp_name,
       dept_name,
       salary
FROM ranked_employees
WHERE salary_rank <= 3
ORDER BY dept_name, salary DESC;