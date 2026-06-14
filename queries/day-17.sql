use 50_days_sql_challenge;

--finding the employee with more than 2 salary records

select emp_id,count(*) as total_records
from cleaned_salaries
GROUP BY emp_id
having count(*)>2;

WITH cte as(
SELECT e.emp_id,e.emp_name
FROM cleaned_employees e
INNER JOIN cleaned_salaries s
on e.emp_id = s.emp_id)
SELECT emp_id,emp_name,count(*) as salary_count
from cte GROUP BY emp_id,emp_name having count(*)>2
ORDER BY emp_id ASC;


SELECT e.emp_id,
       e.emp_name,
       COUNT(*) AS salary_count
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING COUNT(*) > 2
ORDER BY emp_id ASC;

--employee with total salary>100000

SELECT e.emp_id,
    e.emp_name,
    sum(s.salary) AS total_salary
from cleaned_salaries s
    INNER JOIN cleaned_employees e on e.emp_id = s.emp_id
GROUP BY e.emp_id,
    e.emp_name
HAVING total_salary>100000
ORDER BY e.emp_id ASC;