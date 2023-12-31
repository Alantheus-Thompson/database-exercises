show databases;
use employees;
select database();
show tables;
-- #1 Find all the current employees with the same hire date as employee 101010 using a subquery.

select first_name, last_name
	from employees as emps
		join dept_emp as de
			on emps.emp_no = de.emp_no
		where hire_date = 
			(
			select hire_date
			from employees
			where emp_no = '101010'
				) and de.to_date > curdate();

-- ANSWER: Run code above

-- #2 Find all the titles ever held by all current employees with the first name Aamod.

select distinct title
	from ( 	
		select *
		from employees
		where first_name = 'Aamod'
           ) as aamod_employees
		join titles on aamod_employees.emp_no = titles.emp_no
		where titles.to_date > curdate();
-- Alternative option        
select distinct title
	from titles
		where emp_no IN (
						select emp_no
                        from employees
                        where first_name = 'Aamod'
                        ) 
                        and titles.to_date>curdate();

-- #3 How many people in the employees table are no longer working for the company? Give the 
-- answer in a comment in your code.

select count(*)
	from employees as emps
		where emp_no not in ( -- returns inverse 
							select emp_no 
                            from dept_emp
                            where to_date>curdate()
                            );
-- ANSWER: 59900

-- FAILED WORK FOR #3--

-- select count(no_longer_working.emp_no)
-- 	from (
-- 		select distinct emps.emp_no
-- 		from employees as emps
-- 			join dept_emp as depts
-- 				on emps.emp_no = depts.emp_no
-- 			-- join salaries as sals
-- -- 				on emps.emp_no = sals.emp_no
-- 		where depts.to_date < curdate() -- and sals.emp_no < curdate()
--         ) as no_longer_working

### I structured the query with multiple to_dates i.e sal.to_date, dept_emp.to_date and recieved
### different answers.  I then ran them together with a different result. 

-- ANSWER: 85,108

-- #3 With IN 
-- select *
-- 	from employees as emps
-- 		join dept_emp as depts
-- 			on emps.emp_no = depts.emp_no
-- 		where depts.to_date IN (
-- 								select emp_no
--                                 from dept.emp_no
-- 								where dept.to_date<curdate()
--                                 );

-- #4 Find all the current department managers that are female. List their names in a comment 
-- in your code.

select *
	from (
		select emps.first_name, emps.last_name
			from employees as emps
				join dept_manager as dmgrs
				on emps.emp_no = dmgrs.emp_no
			where dmgrs.to_date > curdate() and gender = 'F'
            ) as current_female_dept_mgrs;

-- Option 2

select *
	from employees
		where gender = 'F'
			and emp_no IN (
							select emp_no
                            from dept_manager
                            where to_date>curdate()
                            );

-- #5 Find all the employees who currently have a higher salary than the companie's overall, 
-- historical average salary.

select avg(salary)
	from salaries;
                
select count(*)
	from salaries
		where to_date > curdate()
			and salary > (
						select avg(salary)
							from salaries
                            );
						
-- #6 How many current salaries are within 1 standard deviation of the current highest salary? 

select max(salary) - std(salary)
from salaries 
where salaries.to_date > curdate();

select count(*)
	from salaries
    where salary >= (
					select max(salary) - std(salary)
					from salaries 
                    where to_date > curdate() -- need curdate or std will be skewed
                    ) and to_date > curdate(); -- need again to filter results in main query
 
-- ANSWER: 83

-- (Hint: you can use a built-in function to calculate the standard deviation.) 
-- What percentage of all salaries is this?
select (cnt/(
			select count(*) 
            from salaries
            where to_date>curdate() -- question does not specify all current salaries but 
            -- assumption is that since they are looking at the std of current salaries that
            -- they would want to compare results to current salaries.
			)
            *100) as percentage_all_salaries_within_1SD_of_max_salary
	from (
			select count(*) as cnt
            from salaries
			where salary >= (
					select max(salary) - std(salary)
					from salaries
                    where to_date>curdate()
                    )  and to_date > curdate()
				) as cnt_sub;

-- .0034%

-- Hint You will likely use multiple subqueries in a variety of ways

-- Hint It's a good practice to write out all of the small queries that you can. Add a comment 
-- above the query showing the number of rows returned. You will use this number (or the query 
-- that produced it) in other, larger queries.

-- BONUS

-- #1 Find all the department names that currently have female managers.
-- #2 Find the first and last name of the employee with the highest salary.
-- #3 Find the department name that the employee with the highest salary works in.

-- #4 Who is the highest paid employee within each department.