SHOW databases;
USE employees;
SELECT database();
SHOW tables;

-- #2 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results
-- returned by first name. In your comments, answer: What was the first and last name in 
-- the first row of the results? What was the first and last name of the last person in the
-- table?

select *
	FROM employees
		where first_name IN ('Irena', 'Vidya', 'Maya')
        order by first_name;

-- Answer: First person name is Irena Reutenauer, last person name is Vidya Simmen

-- #3 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results 
-- returned by first name and then last name. In your comments, answer: What was the first 
-- and last name in the first row of the results? What was the first and last name of the 
-- last person in the table?

select *
 from employees	
	where first_name = 'Irena'
    or first_name = 'Vidya'
    or first_name = 'Maya'
    order by first_name and last_name;
    
-- Answer: First person is Vidya Awdeh, last person is Maya melter

-- #4 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results 
-- returned by last name and then first name. In your comments, answer: What was the first 
-- and last name in the first row of the results? What was the first and last name of the 
-- last person in the table?

select *
	from employees
		where (first_name = 'Irena'
		or first_name = 'Vidya'
		or first_name = 'Maya')
        order by last_name and first_name;

-- Answer: Maya Melter

-- #5 Write a query to find all employees whose last name starts and ends with 'E'. Sort the
-- results by their employee number. Enter a comment with the number of employees returned, 
-- the first employee number and their first and last name, and the last employee number with 
-- their first and last name.

select distinct last_name, emp_no, first_name
	from employees
		where last_name like 'E%' and last_name like '%E'
	order by emp_no;

-- Answer: # of employees returned = 899 first employee # is 10021 (Ramzi Erde) last employee
-- # is 499648 (Tadahiro Erde)

-- #6 Write a query to find all employees whose last name starts and ends with 'E'. Sort the
-- results by their hire date, so that the newest employees are listed first. Enter a 
-- comment with the number of employees returned, the name of the newest employee, and the 
-- name of the oldest employee.

select last_name, hire_date, first_name
	from employees
		where last_name LIKE '%E' and last_name like 'E%'
			order by hire_date desc;

-- ANSWER: 899 employees returned, Newest emp is Teiji Eldridge; Oldest emp is Sergi Erde

-- #7 Find all employees hired in the 90s and born on Christmas. Sort the results so that 
-- the oldest employee who was hired last is the first result. Enter a comment with the 
-- number of employees returned, the name of the oldest employee who was hired last, and 
-- the name of the youngest employee who was hired first.
 
select distinct emp_no, hire_date, birth_date, first_name, last_name
	from employees
		where birth_date like '%12-25' and hire_date like '199%'
        order by birth_date, hire_date desc;


-- ANSWER: 362 results returned.  Khun Bernini is the oldest employee who was hired last
-- Douadi Pettis is the youngest emp hired first


