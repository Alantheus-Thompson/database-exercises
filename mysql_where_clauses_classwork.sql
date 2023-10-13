SHOW databases; 
USE chipotle;
SELECT database();
SHOW tables;
SELECT * from chipotle.orders;
DESCRIBE orders;
SELECT * FROM orders;
## LIKE \ NOT LIKE
-- to find things that aren't an exact match, use LIKE
-- with its associated wildcard %

-- Where we put % specifies where the wild values are 

-- Find all items that are bowls

Select item_name, choice_description
	FROM orders
Where item_name LIKE '%bowl%' or choice_description LIKE '%bowl%';

SELECT DISTINCT item_name
	FROM orders 
WHERE item_name LIKE '%bowl%';

-- BETWEEN is inclusive

Select *
from orders
where quantity between 1 and 5;

-- IN will select multiple values in our conditional statemnet form one column_name
-- FORMAT: WHERE [column_name] IN ('STRING/VALUES', '')

select *
from orders
where item_name IN ('chicken bowl','veggie bowl'); 

-- NULL/NOT NULL

-- FORMAT: WHERE [column_name] IS [NOT] NULL

SHOW databases;
USE join_example_db; -- requires a ; after to execute CAN'T STRING
SELECT database(); -- requires a ; after to execute *CANT'T STRING
Show tables;

-- Come back to

-- CHAINING uses AND/OR to chain conditional statements in WHERE Clause
-- FORMAT: WHERE [column name1] operator [value1] AND/OR [column name2] operator [value2]

select * 
from users
WHERE role_id = 3 
	and name = 'sally';
    
select * 
from users
	where role_id = 3 
		or name = 'jane';
        
SELECT * 
	from users
		where role_id = 3
        or w