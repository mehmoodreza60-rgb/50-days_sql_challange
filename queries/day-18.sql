use 50_day_sql_challenge;

--1. employees whoes performance rating greater than 5 (2022+2023+2024)/3

SELECT e.emp_id,
    e.emp_name,
    d.dept_name,
    (p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 as avg_rating
from cleaned_employees e
    join cleaned_departments d on e.dept_id = d.dept_id
    join cleaned_performance p on e.emp_id = p.emp_id
WHERE(p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 > 4;

--employees attendance more than 2 days present

SELECT e.emp_id,
    e.emp_name,
    count(a.attendance_id) as present_days
from cleaned_attendance a
    join cleaned_employees e on e.emp_id = a.emp_id
WHERE a.status = 'present'
GROUP BY e.emp_id,
    e.emp_name
having count(a.attendance_id) > 2;

--department where total salary paid is>200000

select d.dept_name,
    sum(s.salary) as total_salary
FROM cleaned_departments d
    INNER JOIN cleaned_employees e on d.dept_id = e.dept_id
    INNER JOIN cleaned_salaries s on e.emp_id = s.emp_id
GROUP BY d.dept_name
HAVING total_salary > 20000


 --employees whoes salary is greater than dept avg salary


SELECT e.emp_id,
    e.emp_name,
    d.dept_name,
    s.salary
FROM cleaned_employees e
    JOIN cleaned_departments d ON e.dept_id = d.dept_id
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
WHERE s.salary > (
        SELECT AVG(s2.salary)
        FROM cleaned_salaries s2
            JOIN cleaned_employees e2 ON s2.emp_id = e2.emp_id
        WHERE e2.dept_id = e.dept_id
    );