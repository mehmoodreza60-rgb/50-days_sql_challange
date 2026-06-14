use 50_days_sql_challenge;

-- total salary per employee

SELECT e.emp_id,
    e.emp_name,
    sum(s.salary) AS total_salary
from cleaned_salaries s
    INNER JOIN cleaned_employees e on e.emp_id = s.emp_id
GROUP BY e.emp_id,
    e.emp_name;

--2. avg salary per employee

SELECT e.emp_id,e.emp_name, avg(s.salary) as avg_salary
from cleaned_employees e
INNER JOIN 
cleaned_salaries s
on e.emp_id=s.emp_id
GROUP BY e.emp_id,e.emp_name 
ORDER BY e.emp_id asc;

--count of salary record for each employee

SELECT e.emp_id,
       e.emp_name,
       COUNT(s.salary_id) AS salary_count
FROM cleaned_employees e
LEFT JOIN cleaned_salaries s
  ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;

-- maximum salary per employee

SELECT e.emp_id,e.emp_name,max(s.salary) as max_salary
from cleaned_salaries s
INNER JOIN cleaned_employees e
on e.emp_id = s.emp_id
GROUP BY e.emp_id,e.emp_name
ORDER BY e.emp_id ASC;

