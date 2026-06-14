use 50_days_sql_challenge;

--compare each employee salary with the overall average salary (> then above avg, < then below avg)

select e.emp_id, e.emp_name , s.salary,
avg(s.salary) over() as overall_avg_salary,
case when salary > avg(s.salary) over() then 'above avg'
when salary<avg(s.salary) over() then 'below avg'
end  as comperison
from cleaned_employees e
JOIN
cleaned_salaries s
on e.emp_id = s.emp_id;

-- compare employee salary with total salary of all employee(sum(salary)*10% > then high contributer else low contributer)

select e.emp_id,e.emp_name, s.salary,
sum(s.salary) over()*0.1 as total_salary_,
case when s.salary>sum(s.salary) over()*0.1 then 'high contributer'
else 'low contributer '
end as contribution
from cleaned_employees e
join cleaned_salaries s
on e.emp_id = s.emp_id;


with cte as(
select e.emp_id,e.emp_name, s.salary,
sum(s.salary) over()*0.1 as total_salary_,
case when s.salary>sum(s.salary) over()*0.1 then 'high contributer'
else 'low contributer '
end as contribution
from cleaned_employees e
join cleaned_salaries s
on e.emp_id = s.emp_id)
select * from cte where contribution ='high contribution'

--compare depaprtment salary with overall total (dept_total_salary>30% of total salary then high dept else low dept contribution)



SELECT d.dept_id,
       d.dept_name,
       SUM(s.salary) AS dept_total_salary,
       (SELECT SUM(salary) * 0.3
        FROM cleaned_salaries) AS total_salary_30,
       CASE
           WHEN SUM(s.salary) >
                (SELECT SUM(salary) * 0.3
                 FROM cleaned_salaries)
           THEN 'high_contribution'
           ELSE 'low_contribution'
       END AS contribution
FROM cleaned_employees e
JOIN cleaned_departments d
    ON e.dept_id = d.dept_id
JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
GROUP BY d.dept_id, d.dept_name;


select d.dept_id,d.dept_name,
sum(s.salary) as dept_total_salary
from cleaned_employees e
join cleaned_departments d
on e.dept_id=d.dept_id
join cleaned_salaries s
on e.emp_id = s.emp_id
GROUP BY d.dept_id,d.dept_name;

