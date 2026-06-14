USE 50_days_sql_challenge;
--1. employees earning more than department avg salary

SELECT e1.emp_id,
    e1.emp_name,
    e1.dept_id
from cleaned_employees e1
    INNER JOIN cleaned_salaries s1 on e1.emp_id = s1.emp_id
where s1.salary >(
        select avg(s.salary)
        FROM cleaned_salaries s
            INNER JOIN cleaned_employees e on s.emp_id = e.emp_id
        where e.dept_id = e1.dept_id
    );

--2. list the employees whoes salary the highest in their department

SELECT e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary
FROM cleaned_employees e
    INNER JOIN cleaned_salaries s ON e.emp_id = s.emp_id
WHERE s.salary = (
        SELECT MAX(s2.salary)
        FROM cleaned_salaries s2
            INNER JOIN cleaned_employees e2 ON s2.emp_id = e2.emp_id
        WHERE e2.dept_id = e.dept_id
    );
SELECT d.dept_name,
    e.emp_id,
    e.emp_name
FROM cleaned_employees e
    JOIN cleaned_departments d ON e.dept_id = d.dept_id
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
WHERE s.salary = (
        SELECT MAX(s2.salary)
        FROM cleaned_salaries s2
            JOIN cleaned_employees e2 ON s2.emp_id = e2.emp_id
        WHERE e2.dept_id = e.dept_id
    );
SELECT d.dept_name,
    e.emp_id,
    e.emp_name
FROM cleaned_employees e
    JOIN cleaned_departments d ON e.dept_id = d.dept_id
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
WHERE s.salary = (
        SELECT MAX(s2.salary)
        FROM cleaned_salaries s2
            JOIN cleaned_employees e2 ON s2.emp_id = e2.emp_id
        WHERE e2.dept_id = e.dept_id
    );
--list the employees whoes salary the lowest in their department

select e.emp_id,
    e.emp_name,
    d.dept_name
from cleaned_employees e
    inner join cleaned_departments d on e.dept_id = d.dept_id
    join cleaned_salaries s on e.emp_id = s.emp_id
where s.salary =(
        select min(s2.salary)
        from cleaned_salaries s2
            inner join cleaned_employees e2 on e2.emp_id = s2.emp_id
        where e2.dept_id = e.dept_id
    );