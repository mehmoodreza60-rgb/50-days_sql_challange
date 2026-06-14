use 50_days_sql_challenge;
-- what is the average salary department wise

select d.dept_name,
    avg(s.salary) as avg_salary
from cleaned_departments d
    INNER JOIN cleaned_employees e on e.dept_id = d.dept_id
    INNER JOIN cleaned_salaries s on e.emp_id = s.emp_id
GROUP BY d.dept_name;

--2. how many days was each employee present

select count(a.attendance_id) as total_days_present,
    e.emp_id,
    e.emp_name
from cleaned_employees e
    LEFT JOIN cleaned_attendance a on e.emp_id = a.emp_id
GROUP BY e.emp_id,
    e.emp_name;
    
--3. which employee belong to same department

SELECT dept_id,
    GROUP_CONCAT(emp_name) as employees
from cleaned_employees
group by dept_id
having count(*) > 1;


SELECT d.dept_name,
    GROUP_CONCAT(
        e.emp_name
        ORDER BY e.emp_name SEPARATOR ', '
    ) AS employees
FROM cleaned_departments d
    JOIN cleaned_employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

--4.which employee has more than one salary record

select e.emp_id, e.emp_name,count(s.salary_id) FROM 
cleaned_employees e
INNER JOIN 
cleaned_salaries s
on e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name
having count(s.salary_id) >1;

