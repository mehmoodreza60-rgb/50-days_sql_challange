use 50_days_sql_challenge;


--latest salary per employee and total salary till that point

with cte as(
SELECT e.emp_id,e.emp_name,s.salary,s.salary_date,
ROW_NUMBER() over(PARTITION BY e.emp_id ORDER BY s.salary_date desc) as rank_of_emp,
sum(s.salary)over(PARTITION BY e.emp_id ORDER BY s.salary_date)
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id)
select*from cte where rank_of_emp =1;


-- rank employees based on salary and compare with department average



 SELECT e.emp_id,
       e.emp_name,
       d.dept_name,
       s.salary,
       RANK() OVER(
           PARTITION BY d.dept_id
           ORDER BY s.salary DESC
       ) AS salary_rank,
       AVG(s.salary) OVER(
           PARTITION BY d.dept_id
       ) AS dept_avg_salary,
       CASE
           WHEN s.salary > AVG(s.salary) OVER(PARTITION BY d.dept_id)
           THEN 'Above Dept Avg'
           WHEN s.salary < AVG(s.salary) OVER(PARTITION BY d.dept_id)
           THEN 'Below Dept Avg'
           ELSE 'Equal Dept Avg'
       END AS comparison
FROM cleaned_employees e
JOIN cleaned_departments d
    ON e.dept_id = d.dept_id
JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
ORDER BY d.dept_name, salary_rank;

-- compare if salary is increase or decrease compared to previous salary

SELECT e.emp_id,
       e.emp_name,
       s.salary_date,
       s.salary,
       LAG(s.salary) OVER(
           PARTITION BY e.emp_id
           ORDER BY s.salary_date
       ) AS previous_salary,
       CASE
           WHEN s.salary > LAG(s.salary) OVER(
                              PARTITION BY e.emp_id
                              ORDER BY s.salary_date
                          )
           THEN 'Increased'
           WHEN s.salary < LAG(s.salary) OVER(
                              PARTITION BY e.emp_id
                              ORDER BY s.salary_date
                          )
           THEN 'Decreased'
           ELSE 'No Change'
       END AS salary_status
FROM cleaned_employees e
JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
ORDER BY e.emp_id, s.salary_date;


