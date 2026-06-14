use 50_days_sql_challenge;


-- learning advance view quries
--1.update employees data using view 

CREATE view employee_basic as
select emp_id,
    emp_name,
    city
from cleaned_employees;

-- now update it

select*from employee_basic 
where emp_id=110;

update employee_basic 
set city ='mumbai'
where emp_id =110;

--2 create view for high salary  employee if salary < 50k

create view emp_salary_high as
select e.emp_id, e.emp_name,s.salary
from cleaned_employees e
inner join cleaned_salaries s
on e.emp_id = s.emp_id
where s.salary > 50000;

select*from emp_salary_high;