use 50_days_sql_challenge;

--1.salarry category (low for <30k, medimum for 30k to 60k, high for >60k)
-- for such, we use CASE WHEN

with cte as(
SELECT e.emp_id, e.emp_name,s.salary 
from cleaned_employees e
INNER JOIN
cleaned_salaries s
on e.emp_id=s.emp_id )
select emp_id,emp_name,salary,
case 
when salary<30000 then 'low'
when salary between 30000 and 60000 then 'medium'
else 'high'
end as category
from cte ORDER BY emp_id asc;


-- 2. performance rating (avg rating >4 good, >=3 avg, else poor)

with cte as(
    select e.emp_id,e.emp_name,(p.rating_2022+p.rating_2023+p.rating_2024)/3 as average_rating
    from cleaned_employees e
    INNER JOIN 
    cleaned_performance p
    on e.emp_id = p.emp_id
)
select emp_id,emp_name,average_rating, 
case 
when average_rating <3 then 'poor'
when average_rating between 3 and 4 then 'avergae'
else 'good'
end as performance_rating from cte
order by emp_id asc;

-- without using cte
SELECT e.emp_id,
       e.emp_name,
       (p.rating_2022 + p.rating_2023 + p.rating_2024)/3 AS average_rating,
       CASE 
           WHEN (p.rating_2022 + p.rating_2023 + p.rating_2024)/3 < 3 THEN 'poor'
           WHEN (p.rating_2022 + p.rating_2023 + p.rating_2024)/3 BETWEEN 3 AND 4 THEN 'average'
           ELSE 'good'
       END AS performance_rating
FROM cleaned_employees e
JOIN cleaned_performance p
  ON e.emp_id = p.emp_id
ORDER BY e.emp_id ASC;

-- experence category

SELECT emp_id,emp_name,year(CURRENT_DATE())-year(hire_date)as experence_years, 
case
when year(CURRENT_DATE())-year(hire_date) <2 then 'fresher'
when year(CURRENT_DATE())-year(hire_date) BETWEEN 2 and 5 then 'mid_level'
else 'experenced'
end as experence_level FROM cleaned_employees
ORDER BY emp_id asc;