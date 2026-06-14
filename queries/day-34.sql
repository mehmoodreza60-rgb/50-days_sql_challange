use 50_days_sql_challenge;

-- learning about indexes,, indexing makes it faster,better

--1 create index on employee id

create index idx_emp_id
on cleaned_employees (emp_id);

SELECT*from cleaned_employees 
where emp_id =101;


--1 create index on on dept_id

create index idx_dept_id
on cleaned_departments (dept_id);