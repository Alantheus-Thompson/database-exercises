-- class work follow along

use chipotle;
show tables;

select distinct item_name
	from orders
		where item_name like '%chicken%';
        
-- IF FUNCTION ---
-- It is recommended to only use the IF() function if you are evaluating a true/false condition, 
-- as the code can get messy and hard to follow very quickly if you are going beyond that.

-- --- format: if(condition, value if true, value if false)

### find if item has chicken

select distinct item_name,
	if(item_name like '%chicken%', 'yes', 'no') as 'has_chicken'
from orders
;

### make outcome T/F

select distinct item_name
	,if(item_name like '%chicken%', True, false) as 'has_chicken'
    ,if(item_name like '%steak%', true, false) as 'has_steak'
from orders
;

-- Make a lazy if statement
select distinct item_name
, item_name like '%chicken%' as 'has_chicken'
	from orders
	;
    
-- make a subquery to count chicken items
select sum(has_chicken) -- have to use sum not count
	from (
		select distinct item_name
		, item_name like '%chicken%' as 'has_chicken'
		from orders
            ) as is_chicken
            ;
            
-- Case Statements
-- FORMAT:
-- SELECT
-- 		CASE
-- 			WHEN column_a operator condition_a THEN value_a
-- 			when column_b operator condition_b then value_b
-- 			else value_c
-- 		END as new_column_name
-- 	FROM
-- There is an alternative method but this one allows for more flexibility 
-- system checks sequence in order and exits case statement once first condition is
-- met
select
	order_id
	, item_name
    , CASE
		WHEN item_name like '%chicken%' then 'is_chicken'
        when item_name like '%steak%' then 'is_steak'
        else 'not chicken or steak'
	END as 'is_food'
from orders
;

## BUILD CATEGORIES ###

select 
    CASE 
		when quantity = 1 then 'single_order'
        when quantity <= 5 then 'middle_size_order'
        else 'large_order'
	END as 'order_size', count(*)
From orders
group by order_size
;