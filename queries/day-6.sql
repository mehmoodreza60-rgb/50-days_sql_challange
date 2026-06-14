use 50_days_sql_challenge;

--outliers are data points that differ significantly from other observations. They can occur due to errors in data collection, data entry, or they may represent true variability in the data. Identifying and handling outliers is crucial for accurate data analysis and modeling.

ALTER table cleaned_salaries
MODIFY salary INT;

-- basic understanding

SELECT
min(salary) AS min_salary,
max(salary) AS max_salary,
avg(salary) AS avg_salary
from cleaned_salaries where salary>0;

--here can be seen that there might be outliers now ask the head of the company about the maximum salary and if it is correct or not. If it is correct then we can keep it otherwise we can remove it from our dataset.

--client rules min salary is 20k and max salary is 200k

alter TABLE cleaned_salaries 
add column is_outlier int;

select*from cleaned_salaries;

update cleaned_salaries
set is_outlier = case 
when 
salary <20000 or salary > 200000 then 1
else 0
end;

select*from cleaned_salaries
where is_outlier =1;

UPDATE cleaned_salaries 
set salary = case 
when salary_id = 17 then 65000
when salary_id = 37 then 97000
else salary end ;

