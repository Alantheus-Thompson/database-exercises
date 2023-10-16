Show databases;
use employees;
select database();
Show tables;
select * 
	from titles;
Select distinct title
	from titles;
-- #2 How many unique titles have there ever been? Answer that in a comment in your SQL file.

-- ANSWER: 7 unique titles

-- #3 Write a query to find a list of all unique last names that start and end with 'E' using 
-- GROUP BY.

use employees;
select distinct last_name, count(last_name) # used emp_no as well in case emp have same last name but are 
-- different people...also because otherwise I don't see the purpose of the group by function 
-- since the where function would produce the same output but using emp_no didn't work with group by 
-- function...the plot grows thicker my dear Watson.
	from employees
		where last_name like 'E%E' -- WHERE used with count() doesn't work; purpose of group is not
        -- just that it is often used with aggregate functions but seems to be it has to be used with
        -- with aggregate functions.
			group by last_name; 
        
-- ANSWER: There are 5 unique last names totaling 899 counts fairly equally divided (likely within 1 SD)

-- #4 Write a query to to find all unique combinations of first and last names of all employees 
-- whose last names start and end with 'E'.

select distinct concat(first_name,' ',last_name) as Full_Name -- Tried to use count in 
-- several places but gives error message can't group on full_name.  Group by full_name works without
-- count though.  
	from employees
		where last_name like 'E%E'
			group by Full_Name;
		
-- ANSWER: Run code for output

-- #5 Write a query to find the unique last names with a 'q' but not 'qu'. Include those names 
-- in a comment in your sql code.

select distinct count(last_name)
	from employees
		where last_name like '%q%' and last_name not like '%qu%'
			group by last_name;

-- ANSWER: Chelq (168), Lindquist (189), Qiwen (190)

-- #6 Add a COUNT() to your results for exercise 5 to find the number of employees with the 
-- same last name.

-- ANSWER: refer to #'s next to names in #5

-- #7 Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP 
-- BY to find the number of employees with those names for each gender.

select distinct first_name, gender, count(*) as employee_count
	from employees
		where first_name IN ('Irena', 'Vidya', 'Maya')
			group by first_name, gender;

-- ANSWER: Run code above

-- #8 Using your query that generates a username for all employees, generate a count of employees
-- with each unique username.

Select distinct lower(concat(substr(first_name, 1, 1),substr(last_name,1,4),'_', 
date_format(birth_date,'%m%y'))) as username, count(*) as unique_username_count
	from employees
    group by username;

-- ANSWER: Run code above

-- #9 From your previous query, are there any duplicate usernames? What is the highest number 
-- of times a username shows up? Bonus: How many duplicate usernames are there?

Select distinct lower(concat(substr(first_name, 1, 1),substr(last_name,1,4),'_', 
date_format(birth_date,'%m%y'))) as username, count(*) as duplicate_count
-- When I tried to call
-- the alias username without the prior function it didn't work.  Naming an alias only works in 
-- same query line?  Could create sub-query which is probably beneficial to start practicing for
-- larger data sets.
	from employees
		group by username
        having duplicate_count >1
			order by duplicate_count desc;


-- ANSWER: Yes there are.  Highest # of time a username shows up is 6.  
## playing around: could not run when select calls out column in select function and not in group
## by. 

-- #9 BONUS: 

-- Using sum(duplicate_count) as total_duplicate_count in select distinct line did not work
-- response was unknown colunn duplicate_count in field list...REASON: you can't use the alias 
-- duplicate_count in the same SELECT clause where it's defined. Aliases defined in the SELECT 
-- clause can't be used within the same SELECT clause at the same level of the query. 

SELECT username, duplicate_count
FROM (
    SELECT LOWER(CONCAT(SUBSTRING(first_name, 1, 1), SUBSTRING(last_name, 1, 4), '_', 
			DATE_FORMAT(birth_date, '%m%y'))) AS username, COUNT(*) AS duplicate_count
		FROM employees
			GROUP BY username
				HAVING duplicate_count > 1
) AS duplicates
ORDER BY duplicate_count DESC;

-- To calculate the total count of duplicates:
SELECT SUM(duplicate_count) AS total_duplicate_count
FROM (
    SELECT LOWER(CONCAT(SUBSTRING(first_name, 1, 1), SUBSTRING(last_name, 1, 4), '_', DATE_FORMAT(birth_date, '%m%y'))) AS username, COUNT(*) AS duplicate_count
    FROM employees
    GROUP BY username
    HAVING duplicate_count > 1
) AS duplicates;


-- ANSWER: 27403

-- Bonuses:
-- #1 Determine the historic average salary for each employee. When you hear, read, or think 
-- "for each" with regard to SQL, you'll probably be grouping by that exact column.

show tables;
select emp_no, avg(salary) as historical_avg
	from salaries
    group by emp_no;

-- ANSWER: See code for answer

-- #2 Using the dept_emp table, count how many current employees work in each department. The 
-- query result should show 9 rows, one for each department and the employee count.

select dept_no, count(*) as employees_in_each_department
	from dept_emp
    group by dept_no;
    
-- ANSWER: Run code above

-- #3 Determine how many different salaries each employee has had. This includes both historic 
-- and current.

select distinct emp_no, count(emp_no) as num_of_diff_salaries
	from salaries
		group by emp_no;

-- ANSWER: Run code above.

-- #4 Find the maximum salary for each employee.

select distinct emp_no, max(salary)
	from salaries
    group by emp_no;

-- ANSWER: see above code

-- #5 Find the minimum salary for each employee.

select distinct emp_no, min(salary)
	from salaries
		group by emp_no;

-- #6 Find the standard deviation of salaries for each employee.

select emp_no, stddev(salary) 
	from salaries
     group by emp_no;

-- ANSWER: see above

-- #7 Find the max salary for each employee where that max salary is greater than $150,000.

select emp_no, salary
	from salaries
		where salary > 150000
			group by emp_no, salary;

-- ANSWER: see above

-- #8 Find the average salary for each employee where that average salary is between $80k and 
-- $90k.

select emp_no, avg(salary) as average_salary
	from salaries
        group by emp_no
			having average_salary between 80000 and 90000;
       