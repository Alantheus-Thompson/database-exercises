SHOW databases;
USE albums_db;
SELECT database ();
SHOW tables;
SHOW databases;
USE employees;
SELECT database();
SHOW tables;
DESCRIBE employees; #employees contain emp num, birth, first & last, gender, and hire date...number type fields are emp no, birth, and hire dates
# string characters include first and last, and gender
# date types are birth and hire
# there is no relationship to employees and department that I see unless emp no is generated using the department number as the base or a third table links them
SHOW tables;
DESCRIBE dept_manager;
SHOW CREATE TABLE dept_manager;
#CREATE TABLE `dept_manager` (
   #`emp_no` int NOT NULL,
  #`dept_no` char(4) NOT NULL,
  #`from_date` date NOT NULL,
  #`to_date` date NOT NULL,
 # PRIMARY KEY (`emp_no`,`dept_no`),
  #KEY `dept_no` (`dept_no`),
  #CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  #CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
#) ENGINE=InnoDB DEFAULT CHARSET=latin1



