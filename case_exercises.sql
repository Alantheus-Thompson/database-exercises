use employees;
select database();
show tables;


--  #1 Write a query that returns all employees, their department number, their start date, their 
--  end date, and a new column 'is_current_employee' that is a 1 if the employee is still with 
--  the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.


select emps.emp_no, de.dept_no, de.from_date, de.to_date,
	if(de.to_date>curdate(), 1, 0) as 'is_current_employee'
from employees as emps
	join dept_emp as de
	on emps.emp_no = de.emp_no
	;

-- #2 Write a query that returns all employee names (previous and current), and a new column 
-- 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last 
-- name.        

select distinct concat(first_name,' ',last_name) as full_name, 
		case 
			when left(last_name,1) <= 'H' then 'A-H'
            when left(last_name,1) <= 'Q' then 'I-Q'
            when left(last_name,1) <= 'Z' then 'R-Z'
            else 'no_last_name'
		End as 'alpha_group'
		from employees;

-- #3 How many employees (current or previous) were born in each decade?
select min(birth_date)
from employees; -- 1952

select max(birth_date)
from employees;-- 1962

select distinct 
	case
		when birth_date like '195%' then 'born_in_50s'
        when birth_date like '196%' then 'born_in_60s'
        else 'Jesus'
	end as 'emps_birth_decades', count(*)
from employees
group by emps_birth_decades;
	
        
--  #4 What is the current average salary for each of the following department groups: R&D, 
-- Sales & Marketing, Prod & QM, Finance & HR, Customer Service?        
select *
from departments; -- Research + Dev = R&D, Sales + Marketing = Sales & Marketing, Production + Quality 
-- Management = Prod & QM, Finance + Human Resources = Finance & HR, Customer Service = Customer
-- Service
select 
	case
		when depts.dept_name IN ('Research','Development') then 'R&D'
        when depts.dept_name IN ('Sales', 'Marketing') then 'Sales_&_Marketing'
        when depts.dept_name IN ('Production','Quality Management') then 'Prod_&_QM'
        when depts.dept_name IN ('Finance','Human Resources') then 'Finance_&_HR'
        when depts.dept_name IN ('Customer Service') then 'Customer_Service'
        else 'Other'
	end as 'department_groups',avg(sals.salary) as 'average_salary'
from departments as depts
	join dept_emp as de
		on depts.dept_no = de.dept_no
	join salaries as sals
		on de.emp_no = sals.emp_no
where de.to_date>curdate() and sals.to_date>curdate()
group by department_groups
;
