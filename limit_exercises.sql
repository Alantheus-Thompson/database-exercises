SHOW databases;
USE employees;
select database();
show tables;
select *
	from titles;

-- #2 List the first 10 distinct last names sorted in descending order.

Use employees;
select distinct last_name
	from employees
		order by last_name desc
        limit 10;

-- ANSWER: # last_name
-- 'Zykh'
-- 'Zyda'
-- 'Zwicker'
-- 'Zweizig'
-- 'Zumaque'
-- 'Zultner'
-- 'Zucker'
-- 'Zuberek'
-- 'Zschoche'
-- 'Zongker'

-- #3 Find all previous or current employees hired in the 90s and born on Christmas. Find 
-- the first 5 employees hired in the 90's by sorting by hire date and limiting your 
-- results to the first 5 records. Write a comment in your code that lists the five names 
-- of the employees returned.

select distinct emp_no, hire_date, birth_date, first_name, last_name
	from employees
		where birth_date like '%12-25' and hire_date like '199%'
        order by hire_date
        limit 5;
        
-- ANSWER: Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup

-- #4 Try to think of your results as batches, sets, or pages. The first five results are 
-- your first page. The five after that would be your second page, etc. Update the query 
-- to find the tenth page of results.

select distinct emp_no, hire_date, birth_date, first_name, last_name
	from employees
		where birth_date like '%12-25' and hire_date like '199%'
        order by hire_date
        limit  5 offset 45;

-- LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship 
-- between OFFSET (number of results to skip), LIMIT (number of results per page), and the 
-- page number?

-- ANSWER: The relationship is they are multiples.  So (pg # -1) * limit