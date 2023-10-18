show databases;
use join_example_db;
select database();
show tables;

-- Join Example Database Exercises --
-- Inner Join --
select *
	from users
		inner join roles 
			on users.role_id = roles.id;
-- EXPECTATION: I expected to only get shared key outputs...confirmed
-- Left Join 
select * 
	from users
		left join roles
			on users.role_id = roles.id;
-- EXPECTATION: To return null values in users...confirmed
-- Right Join
select *
	from users 
		right join roles 
			on users.role_id = roles.id;
            
-- EXPECTATION: to return null values in roles...confirmed
-- Aggregate Function
 select count(users.id) as cnt, roles.name
	from users
		left join roles
			on users.role_id = roles.id
				Group by roles.name;
                
 
-- Employee Database Exercises -- 

use employees; 

### "Formuala" 
### select x, y, z
### 	from database table
###			inner join ::table you wish to connect:: AS if you want an alias
### 			on ::database table in from.whatever the key is:: = ::inner join table
###					.key::
###			inner join ::repeat as required based on chaining requirement::

-- #2 write a query that shows each department along with the name of the current 
-- manager for that department.

select depts.dept_name, concat(emp.first_name,' ', emp.last_name) as Department_Manager
	from employees as emp
		inner join dept_manager as dept_mgr
			on emp.emp_no = dept_mgr.emp_no
		inner join departments as depts
			on dept_mgr.dept_no = depts.dept_no
		where to_date > curdate() 
		group by dept_name, first_name, last_name
        order by dept_name;

-- ANSWER: run code above

# 3 Find the name of all departments currently managed by women.

select depts.dept_name, concat(emp.first_name,' ', emp.last_name) as Department_Manager, gender
	from employees as emp
		inner join dept_manager as dept_mgr
			on emp.emp_no = dept_mgr.emp_no
		inner join departments as depts
			on dept_mgr.dept_no = depts.dept_no
		where to_date > curdate() and gender = 'F'
		group by dept_name, first_name, last_name
        order by dept_name;

-- ANSWER: run code above

# 4 Find the current titles of employees currently working in the Customer Service 
-- department.

select employee_title.title, count(*) as cnt
	from employees as emp
		inner join dept_emp as dept_employees
			on emp.emp_no = dept_employees.emp_no
		inner join departments as depts
			on dept_employees.dept_no = depts.dept_no
		inner join titles as employee_title
			on emp.emp_no = employee_title.emp_no
		where employee_title.to_date > curdate() and depts.dept_name = 
        'Customer Service'
        group by employee_title.title
        order by employee_title.title;
        
### where to_date did not work.  dept_mgr and titles tables both
## have to_dates.  Need to clearly point to which one

-- ANSWER: run code above
		
#5 Find the current salary of all current managers.

select depts.dept_name, concat(emp.first_name,' ', emp.last_name) as 'Current Manager', salary 
	from employees as emp
		inner join dept_manager as dept_mgr
			on emp.emp_no = dept_mgr.emp_no
		inner join departments as depts
			on dept_mgr.dept_no = depts.dept_no
		inner join salaries as employee_salaries
			on emp.emp_no = employee_salaries.emp_no
		where employee_salaries.to_date > curdate() and dept_mgr.to_date > curdate()
        order by depts.dept_name;
			
-- ANSWER: Run code above

# 6 Find the number of current employees in each department.

select depts.dept_no, depts.dept_name, count(*) as 'num_employees'
	from employees as emp
		inner join dept_emp as dept_employees
			on emp.emp_no = dept_employees.emp_no
		inner join departments as depts
			on dept_employees.dept_no = depts.dept_no
		where dept_employees.to_date > curdate()
        group by depts.dept_name
        order by depts.dept_no;

-- ANSWER: run code above

-- #7 Which department has the highest average salary? Hint: Use current not historic 
-- information.

select depts.dept_name, round(avg(employee_salaries.salary),2) as average_salary
	from employees as emp
		inner join dept_emp as dept_employees
			on emp.emp_no = dept_employees.emp_no
		inner join departments as depts
			on dept_employees.dept_no = depts.dept_no
		inner join salaries as employee_salaries
			on emp.emp_no = employee_salaries.emp_no
		where employee_salaries.to_date > curdate() and dept_employees.to_date > curdate() 
		group by depts.dept_name
        order by average_salary desc
        limit 1;

-- ANSWER: See above

-- #8 who is the highest paid employee in the Marketing department?

select emp.first_name, emp.last_name
	from employees as emp
		inner join dept_emp as dept_employees
			on emp.emp_no = dept_employees.emp_no
		inner join departments as depts
			on dept_employees.dept_no = depts.dept_no
		inner join salaries as employee_salaries
			on emp.emp_no = employee_salaries.emp_no
		where depts.dept_name = 'Marketing' and employee_salaries.to_date > curdate()
        order by employee_salaries.salary desc        
        limit 1;
        
-- ANSWER: See above

-- #9 Which current department manager has the highest salary?

select emp.first_name, emp.last_name, emp_salaries.salary, depts.dept_name
	from employees as emp
		inner join dept_manager as mgrs
			on emp.emp_no = mgrs.emp_no
		inner join salaries as emp_salaries
			on mgrs.emp_no = emp_salaries.emp_no
		inner join departments as depts
			on mgrs.dept_no = depts.dept_no
		where mgrs.to_date > curdate() 
        order by emp_salaries.salary desc
        limit 1;
        
-- ANSWER: see above

-- #10 Determine the average salary for each department. Use all salary information 
-- and round your results.

select depts.dept_name, round(avg(employee_salaries.salary),0) as average_salary
	from employees as emp
		inner join dept_emp as dept_employees
			on emp.emp_no = dept_employees.emp_no
		inner join departments as depts
			on dept_employees.dept_no = depts.dept_no
		inner join salaries as employee_salaries
			on emp.emp_no = employee_salaries.emp_no
		group by depts.dept_name
        order by average_salary desc;        

-- ANSWER: run code above

-- BONUS #11 Find the names of all current employees, their department name, and 
-- their current manager's name.

select concat(emp.first_name,' ',emp.last_name) as 'Employee Name', 
depts.dept_name as 'Department Name', concat(mgr.first_name,' ',mgr.last_name) as
'Manager Name'
	from employees as emp
		inner join dept_emp as dept_emps 
			on emp.emp_no = dept_emps.emp_no
		inner join departments as depts 
			on dept_emps.dept_no = depts.dept_no
		inner join dept_manager as mgrs 
			on dept_emps.dept_no = mgrs.dept_no
		inner join employees as mgr 
			on mgr.emp_no = mgrs.emp_no
		inner join salaries as emp_salaries 
			on emp.emp_no = emp_salaries.emp_no
	where dept_emps.to_date>curdate()
    group by depts.dept_name;
    
    