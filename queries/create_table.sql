
use 50_days_sql_challenge;

drop table if exists department;

CREATE TABLE department(
    dept_id VARCHAR(40),
    dept_name VARCHAR(40)
);

drop table if exists employees;

CREATE TABLE employees(
    emp_id VARCHAR(40),
    emp_name VARCHAR(40),
    age VARCHAR(40),
    city VARCHAR(40),
    dept_id VARCHAR(40),
    hire_date VARCHAR(40)
);

CREATE TABLE attendance (
    attendance_id VARCHAR(40),
    emp_id VARCHAR(40),
    attendance_date VARCHAR(40),
    status VARCHAR(40)
);


CREATE TABLE performance(
    emp_id VARCHAR(40),
    rating_2022 VARCHAR(40),
    rating_2023 VARCHAR(40),
    rating_2024 VARCHAR(40)
);

CREATE TABLE salaries(
    salary_id VARCHAR(40),
    emp_id VARCHAR(40),
    salary VARCHAR(40),
    salary_date VARCHAR(40)
);

--creating cleaned_table 


use 50_days_sql_challenge;

CREATE TABLE cleaned_deparments
as
select*from department;

CREATE TABLE cleaned_employees
as
select*from employees;


CREATE TABLE cleaned_attendance
as
select*from attendance;

CREATE TABLE cleaned_performance
as
select*from performance;


CREATE TABLE cleaned_salaries
as
select*from salaries;
