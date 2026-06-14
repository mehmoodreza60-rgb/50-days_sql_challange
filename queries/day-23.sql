use 50_days_sql_challenge;

--1. current salary + previous salary
-- using lag function-- The LAG() function is a window function that allows you to access the value from a previous row without using a self-join.

select emp_id, salary, salary_date, 
lag(salary) over (PARTITION BY emp_id order by salary_date) as previous_salary
from cleaned_salaries; 

-- difference between current salary and previous salary

SELECT
    emp_id,
    salary,
    salary_date,
    LAG(salary) OVER (
        PARTITION BY emp_id
        ORDER BY salary_date
    ) AS previous_salary,

    salary - LAG(salary) OVER (
        PARTITION BY emp_id
        ORDER BY salary_date
    ) AS difference_in_salary
FROM cleaned_salaries;


--3. check if the attendence has improved or not
SELECT
    emp_id,
    attendance_date,
    status,
    LAG(status) OVER (
        PARTITION BY emp_id
        ORDER BY attendance_date
    ) AS previous_attendance_status
FROM cleaned_attendance;

