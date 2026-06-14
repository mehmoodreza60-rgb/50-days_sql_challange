use 50_days_sql_challenge;

-- finding invalid age (min age = 18 and max age = 65)

select*from cleaned_employees
where age<18 or age>65;

--invalid salary 

select*from cleaned_salaries
where salary<0;

--invalid rating

select*from cleaned_performance
where rating_2024<0 or rating_2024>5;

select*from cleaned_performance
where rating_2023<0 or rating_2023>5;

select*from cleaned_performance
where rating_2022<0 or rating_2022>5;

--fixing invalid age

update cleaned_employees
set age = case
when emp_id = 20 then 32
when emp_id = 24 then 28
when emp_id = 44 then 35
when emp_id = 65 then 40
when emp_id = 66 then 30
when emp_id = 67 then 27
when emp_id = 110 then 38
when emp_id = 134 then 29
when emp_id = 147 then 33
when emp_id = 188 then 36
when emp_id = 216 then 31
when emp_id = 223 then 26
when emp_id = 266 then 42
when emp_id = 295 then 34
when emp_id = 318 then 28
when emp_id = 347 then 37
when emp_id = 360 then 39
when emp_id = 387 then 25
when emp_id = 420 then 41
when emp_id = 428 then 33
when emp_id = 440 then 29
when emp_id = 460 then 36
when emp_id = 466 then 27
when emp_id =469 then 32
when emp_id =471 then 35

else age end
where age<18 or age>65;

else age end
where age<18 or age>65;

-- fixing invalid salary
update cleaned_salaries
set salary = case   
WHEN emp_id = 463 THEN 55000
           WHEN emp_id = 142 THEN 60000
           WHEN emp_id = 100 THEN 45000
           WHEN emp_id = 30  THEN 70000
           WHEN emp_id = 54  THEN 52000
           WHEN emp_id = 310 THEN 48000
           WHEN emp_id = 183 THEN 51000
           WHEN emp_id = 168 THEN 47000
           WHEN emp_id = 126 THEN 46000
           WHEN emp_id = 206 THEN 58000
           WHEN emp_id = 76  THEN 49000
           WHEN emp_id = 433 THEN 62000
           WHEN emp_id = 43  THEN 53000
           WHEN emp_id = 324 THEN 55000
           WHEN emp_id = 226 THEN 51000
           WHEN emp_id = 113 THEN 50000
           WHEN emp_id = 273 THEN 52000
           WHEN emp_id = 200 THEN 48000
           WHEN emp_id = 160 THEN 47000
           WHEN emp_id = 42  THEN 46000
           WHEN emp_id = 150 THEN 49000
           WHEN emp_id = 45  THEN 53000
           WHEN emp_id = 65  THEN 54000
           WHEN emp_id = 488 THEN 60000
           WHEN emp_id = 8   THEN 45000
           WHEN emp_id = 121 THEN 50000
           WHEN emp_id = 78  THEN 47000
           WHEN emp_id = 94  THEN 46000
           WHEN emp_id = 353 THEN 52000
           else salary end
where salary<0;


