use 50_days_sql_challenge;

--removing ddublicate vales from employees table

with cte as (
    select*, row_number() over (partition by emp_id,emp_name,city order by emp_id) as rn
    from cleaned_employees)
    delete from cleaned_employees
    where emp_id in
    (select emp_id from cte where rn>1);


-- removing dublicate values from salaries table 

with cte as (
    SELECT*, ROW_NUMBER() OVER(
        PARTITION BY salary_id, emp_id, salary ORDER BY salary_id) as rn
        from cleaned_salaries
)
delete from cleaned_salaries 
where salary_id in (select salary_id from cte where rn>1); 

-- removing dublicate from performance table 

with cte as (
    select*, row_number() over (
        PARTITION BY emp_id,rating_2022,rating_2023,rating_2024 
        ORDER BY emp_id ) as rn
        from cleaned_performance
)
delete from cleaned_performance
where emp_id in(select emp_id from cte 
where rn>1);


-- identifying text inconsistancy
--city

SELECT DISTINCT city from cleaned_employees;

UPDATE cleaned_employees
set city =concat(upper(LEFT(trim(city),1)),lower(SUBSTRING(trim(city),2)));

update cleaned_employees 
set city = case
when 
city in('dlhi','delhi','New delhi') then 'Delhi'
when city in('Hydbd','hydrabade') then 'Hyderabad'
when city in('banglore') then 'bangaluru'

ELSE city 
end;