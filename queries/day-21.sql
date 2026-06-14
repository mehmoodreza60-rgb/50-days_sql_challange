use 50_days_sql_challenge;

--rank of employees by  salary
-- using rank or dense rank 

emp_id      salary   dense rank     rank
101         10000            3          4
102         35000           2           2
103         35000          2            2
104         40000          1            1

select emp_id,salary,
rank() over(order by salary desc) as salary_rank
from cleaned_salaries;

--departmentwise ranking 

select e.emp_id,e.dept_id,s.salary,
DENSE_RANK() over(PARTITION BY e.dept_id order by s.salary desc ) as dept_rank
from cleaned_employees e
INNER JOIN cleaned_salaries s
on 
e.emp_id =s.emp_id;

--3. top performer (calculate avg rating - rank)

select emp_id, (rating_2022 + rating_2023 + rating_2024)/3 as average_rating,
dense_rank() over (order by (rating_2022 + rating_2023 + rating_2024)/3 desc ) as performance_rank 
from cleaned_performance ;

-- salary ranking (top 3 empolyees)

with cte as(
select e.emp_id, e.emp_name, s.salary,
DENSE_RANK() over(ORDER BY s.salary desc) as salary_rank
from cleaned_employees e
inner JOIN cleaned_salaries s
on e.emp_id=s.emp_id
)
select emp_id, emp_name, salary
from cte 
where salary_rank = 1 or salary_rank =2 or salary_rank =3
;

with cte as(
select e.emp_id, e.emp_name, s.salary,
DENSE_RANK() over(ORDER BY s.salary desc) as salary_rank
from cleaned_employees e
inner JOIN cleaned_salaries s
on e.emp_id=s.emp_id
)
select emp_id, emp_name, salary
from cte 
where salary_rank limit 3 ;