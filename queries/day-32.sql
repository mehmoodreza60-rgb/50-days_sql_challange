use 50_days_sql_challenge;

-- learning avout view

-- create employee view
create view employee_view as
select emp_name,dept_id, city
from cleaned_employees;

select*from employee_view 
where city ='mumbai';

-- create salary view

CREATE view salary_view as 
select e.emp_id,e.emp_name,s.salary
from cleaned_employees e 
inner join cleaned_salaries s
on e.emp_id = s.emp_id;

select*from salary_view;

select * from salary_view 
where salary > 50000;