use 50_days_sql_challenge;

--1. to find the employees who have valid departments
-- department name and employee name are in different tables so we need to use joins

SELECT e.emp_id,e.emp_name,d.dept_name
from cleaned_employees e
INNER JOIN
cleaned_departments d
on e.dept_id = d.dept_id;

--2. find all employees even  without valid departments

select e.emp_id,e.emp_name,d.dept_name
from cleaned_employees e
left JOIN
cleaned_departments d
on e.dept_id = d.dept_id;

--3. list of employees without valid departments

select e.emp_id,e.emp_name,d.dept_name
from cleaned_employees e
left join 
cleaned_departments d
on e.dept_id = d.dept_id
where dept_name is null;

--4. find who earns how much

select e.emp_id,e.emp_name, s.salary
from cleaned_employees e
INNER JOIN
cleaned_salaries s
on e.emp_id = s.emp_id;

-- list of employees without salary

select e.emp_id,e.emp_name, s.salary
from cleaned_employees e
left JOIN
cleaned_salaries s
on e.emp_id = s.emp_id
where salary is null;