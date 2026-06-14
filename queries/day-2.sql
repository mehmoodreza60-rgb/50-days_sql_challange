SELECT*from cleaned_deparments
where dept_name is null or dept_name = ''
OR
dept_id is null or dept_id = '';

select*from cleaned_employees
where emp_name is null or emp_name = ''
OR
emp_id is null or emp_id = ''
OR
age is null or age = ''
or
city is null or city = ''
or 
dept_id is null or dept_id = '';\

-- attendence

select*from cleaned_attendance
where emp_id is null or emp_id = ''
OR
attendance_date is null or attendance_date = ''
OR
status is null or status = ''
OR
attendance_id is null or attendance_id = '';

-- performance

select*from cleaned_performance
where emp_id is null or emp_id = ''
OR
rating_2022 is null or rating_2022 = ''
OR
rating_2023 is null or rating_2023 = ''
OR
rating_2024 is null or rating_2024 = '';

-- salaries

select*from cleaned_salaries
where emp_id is null or emp_id = ''
OR
salary is null or salary = ''
OR
salary_date is null or salary_date = ''
OR
salary_id is null or salary_id = '';




