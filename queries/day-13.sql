use 50_days_sql_challenge;
--1. employees earning more than averagr salary
-- here sub_query is use , how to know when to use sub query? when we have to calculate first and then compare with the main query then we can use sub query

select e.emp_id,
    e.emp_name,
    s.salary
from cleaned_employees e
    INNER JOIN cleaned_salaries s on e.emp_id = s.emp_id
WHERE salary >(
        select avg(salary)
        from cleaned_salaries
    );

--2. employees with salary equals to maximum salary

select e.emp_id,
    e.emp_name,
    s.salary
from cleaned_employees e
    inner join cleaned_salaries s on e.emp_id = s.emp_id
where salary =(
        select max(salary)
        from cleaned_salaries
    );


--3.employee earning less than average salary

select e.emp_id,
    e.emp_name,
    s.salary
from cleaned_employees e
    INNER JOIN cleaned_salaries s on e.emp_id = s.emp_id
WHERE salary <(
        select avg(salary)
        from cleaned_salaries
    );


--4. employees with minimum salary

select e.emp_id,
    e.emp_name,
    s.salary
from cleaned_employees e
    inner join cleaned_salaries s on e.emp_id = s.emp_id
where salary =(
        select min(salary)
        from cleaned_salaries
    );