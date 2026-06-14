use 50_days_sql_challenge;

--1. to find the emp_name,dept_name and ratings

select e.emp_id, e.emp_name, d.dept_name, p.rating_2022,p.rating_2023,p.rating_2024
from cleaned_employees e
INNER JOIN 
cleaned_departments d
on e.dept_id = d.dept_id
INNER JOIN
cleaned_performance p
on e.emp_id = p.emp_id;

--2. what is the complete profile of each employee(dept,salary and rating)

select e.emp_id,e.emp_name,d.dept_name,s.salary,p.rating_2022,p.rating_2023,p.rating_2024
from cleaned_employees e
LEFT JOIN
cleaned_departments d
on e.dept_id = d.dept_id
INNER JOIN 
cleaned_salaries s
on e.emp_id = s.emp_id
inner JOIN
cleaned_performance p
on e.emp_id = p.emp_id;

--3.HOW many salary records does each employee has

SELECT e.emp_name,e.emp_id, count(s.salary_id) as total_salary_records
from cleaned_employees e
LEFT JOIN
cleaned_salaries s
on e.emp_id = s.emp_id
GROUP BY e.emp_id,e.emp_name;

--4. what is the total salary paid to each employee

SELECT e.emp_name,e.emp_id, sum(s.salary) as total_salary_paid
from cleaned_employees e
LEFT JOIN
cleaned_salaries s
on e.emp_id = s.emp_id
GROUP BY e.emp_id,e.emp_name;



