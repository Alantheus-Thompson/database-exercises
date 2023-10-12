SHOW databases;
USE albums_db;
SELECT database ();
SHOW tables;
SHOW databases;
USE employees;
SELECT database();
SHOW tables;
DESCRIBE employees; 
#11 Which tables do you think contain a numeric type column?  dept_emp, dept_mgr, employees, salaries, departments
#12 which tables contain a string type column? Departments, dept_emp, dept_manager, employees, titles
#13 which tables do you think contain a date type column?  dept_emp dept_manager, employees, salaries, titles
#14 What relationship between the employees and the department tables? there is no relationship to employees 
-- and department that I see unless emp no is generated using the department number as the base or a third table links them
SHOW tables;
DESCRIBE dept_manager;
SHOW CREATE TABLE dept_manager;
#15 Show the code that created the dept_manager table
-- #CREATE TABLE `dept_manager` (
--    #`emp_no` int NOT NULL,
--   #`dept_no` char(4) NOT NULL,
--   #`from_date` date NOT NULL,
--   #`to_date` date NOT NULL,
--  # PRIMARY KEY (`emp_no`,`dept_no`),
--   #KEY `dept_no` (`dept_no`),
--   #CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--   #CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- #) ENGINE=InnoDB DEFAULT CHARSET=latin1



