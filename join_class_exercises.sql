show databases;
use pizza;
select database();
describe pizzas;
show tables;

select topping_name, count(*) as cnt
	from pizzas as p 
		inner join pizza_toppings as pt
			on pt.pizza_id=p.pizza_id
		inner join toppings as top
			on top.topping_id=pt.topping_id ### does order matter???  doesn't seem to.
	Group by topping_name
	order by cnt desc
    limit 10;
    
### From clause dictates "left" table that is being pulled from.  Left join attaches 
### second table and prioritizes showing all left table information; right join prioritizes
### "right" table or second table

