show databases;
use employees;
select database();
show tables;
-- #2 Write a query to find all employees whose last name starts and ends with 'E'. Use 
-- concat() to combine their first and last name together as a single column named 
-- full_name.

select CONCAT(first_name,' ',last_name) as Full_Name
	from employees
		where last_name like 'E%E';

-- #3 Convert the names produced in your last query to all uppercase.	

select UPPER(CONCAT(first_name,' ',last_name)) as Full_Name
	from employees
		where last_name like 'E%E';
			
-- #4 Use a function to determine how many results were returned from your previous query

Select count(upper(concat(first_name,' ',last_name))) as Number_of_Employees
	from employees
		where last_name like 'E%E';
        
-- ANSWER 899

-- #5 Find all employees hired in the 90s and born on Christmas. Use datediff() function to 
-- find how many days they have been working at the company (Hint: You will also need to 
-- use NOW() or CURDATE()),

select emp_no, first_name, last_name, birth_date, hire_date, datediff(now(),hire_date)+1 as 
Days_Worked
	from employees	
		 where hire_date like '199%'
         and birth_date like '%12-25';

-- #6 Find the smallest and largest current salary from the salaries table

select *
	from salaries;
select min(salary), max(salary)
	from salaries
    order by to_date desc;
    
-- ASNWER: min salary = $38,623 & max salary = $158,220

-- # 7 Use your knowledge of built in SQL functions to generate a username for all of the 
-- employees. A username should be all lowercase, and consist of the first character of 
-- the employees first name, the first 4 characters of the employees last name, an 
-- underscore, the month the employee was born, and the last two digits of the year that 
-- they were born. Below is an example of what the first 10 rows will look like:

Select lower(concat(substr(first_name, 1, 1),substr(last_name,1,4),'_', 
date_format(birth_date,'%m%y'))) as username, first_name, last_name, birth_date
	from employees
    limit 10;
    
-- ANSWER: see above to generate answer1