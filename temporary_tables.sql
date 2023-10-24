-- create a temporary table called employees_with_departments that contains first_name, last_name,
--  and dept_name for employees currently with that department. Be absolutely sure to create 
-- this table on your own database. If you see "Access denied for user ...", it means that the 
-- query was attempting to write a new table to a database that you can only read.

use ursula_2326;
show tables;
drop table employees_with_departments; 
CREATE TEMPORARY TABLE employees_with_departments (
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees as e
JOIN employees.dept_emp as ede USING(emp_no)
JOIN employees.departments as ed USING(dept_no)
where ede.to_date>curdate()
);

select * 
	from employees_with_departments;

-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of 
-- the lengths of the first name and last name columns.    
Alter table employees_with_departments add full_name varchar(50);

-- Update the table so that the full_name column contains the correct data.
set sql_safe_updates = 0;

update employees_with_departments set full_name = concat(first_name,' ',last_name);
select *	
	from employees_with_departments;

set sql_safe_updates = 1;

-- Remove the first_name and last_name columns from the table.
set sql_safe_updates = 0;

Alter table employees_with_departments drop column first_name, drop column last_name;
select * 
	from employees_with_departments;
    
set sql_safe_updates = 1;

-- What is another way you could have ended up with this same table?
-- select
-- #2 Create a temporary table based on the payment table from the sakila database.
-- Write the SQL necessary to transform the amount column such that it is stored as an integer 
-- representing the number of cents of the payment. For example, 1.99 should become 199.
use sakila;
show tables;
Describe payment;

use ursula_2326;
drop table like_sak_pay_format;

CREATE TEMPORARY TABLE like_sak_pay_format (
Select
    payment_id,
	customer_id, 
	staff_id, 
	rental_id,
	CAST(amount*100 as signed) as amount_in_cents, 
    payment_date,
	last_update
from sakila.payment 
);

select *
	from like_sak_pay_format;

-- NOTES:  Created Temp Table "based" on Sakila but they want a new table that pulls from Sakila
-- use ursula_2326;
-- drop table like_sakila_table_format;
-- create temporary table if not exists like_sakila_table_format (
--     payment_id smallint unsigned,
--     customer_id smallint unsigned, 
--     staff_id tinyint unsigned, 
--     rental_id int,
--     cast(amount*100 as int) as amount_in_cents, ###cast not necessary when creating table from 
### scratch; could just define value;  cast will be necessary when pulling payments data
--     payment_date datetime,
--     last_update timestamp
-- ); 

-- Go back to the employees database. Find out how the current average pay in each department 
-- compares to the overall current pay for everyone at the company. For this comparison, you will 
-- calculate the z-score for each salary. In terms of salary, what is the best department right 
-- now to work for? The worst?

use employees;

-- department average query code ***will become a table***
select d.dept_name, round(avg(s.salary),0) as d_average_salary
	from employees as e
		inner join dept_emp as de
			on e.emp_no = de.emp_no
		inner join departments as d
			on de.dept_no = d.dept_no
		inner join salaries as s
			on e.emp_no = s.emp_no
		where s.to_date> curdate() and de.to_date>curdate()
		group by d.dept_name
        order by d_average_salary desc;  

-- overall avg salary and std***will become a table***
select round(avg(salary),2) as current_emp_salary_avg, round(std(salary),2) as current_emp_salary_std
	from salaries as s
	where s.to_date>curdate();
    

use ursula_2326;
-- convert department avg sal query to table in ursula
create temporary table department_avg_sals (
select d.dept_name, round(avg(s.salary),0) as d_average_salary
	from employees.employees as e
		inner join employees.dept_emp as de
			on e.emp_no = de.emp_no
		inner join employees.departments as d
			on de.dept_no = d.dept_no
		inner join employees.salaries as s
			on e.emp_no = s.emp_no
		where s.to_date> curdate() and de.to_date>curdate()
		group by d.dept_name
        order by d_average_salary desc
        );  
 -- check       
Select *
	from department_avg_sals;
    
-- convert employees overall avg and std to table in ursula
create temporary table overalls (
select round(avg(salary),2) as current_emp_salary_avg, round(std(salary),2) as current_emp_salary_std
	from employees.salaries as s
	where s.to_date>curdate()
    );
-- check
select *
	from overalls;

-- create base table structure for final answer 
-- department z score = ((d_avg_salary - current_emp_salary_avg)/current_emp_salary_std)

create table department_zs as 
select d.dept_name
			,round((d_average_salary - o.current_emp_salary_avg)/o.current_emp_salary_std,2) 
            as z_score
from department_avg_sals as d
	Inner join overalls as o
		on 1=1;
        
select *
	from department_zs
    order by z_score desc;
    


		
            