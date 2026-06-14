use 50_days_sql_challenge;

--1. to find performance rating of each employee

select e.emp_id,e.emp_name,p.rating_2022,p.rating_2023,p.rating_2024
from cleaned_employees e
INNER JOIN
cleaned_performance p
on e.emp_id = p.emp_id;

--2. which employee do not have any salary record

select e.emp_id,e.emp_name, s.salary
from cleaned_employees e
left JOIN
cleaned_salaries s
on e.emp_id = s.emp_id
where salary is null;

--3. which employee do not have attendance record

select e.emp_id,e.emp_name, a.attendance_id
from cleaned_employees e
left join 
cleaned_attendance a
on e.emp_id = a.emp_id
where attendance_id is null;

--4. what is emp name, department name and salary of each employee

select e.emp_id,e.emp_name,d.dept_name,s.salary
FROM cleaned_employees e
INNER JOIN
cleaned_departments d
on e.dept_id = d.dept_id
INNER JOIN
cleaned_salaries s
on e.emp_id = s.emp_id;

