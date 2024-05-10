-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

with cte as (select pizza_id,sum(quantity) as quantity from order_details group by pizza_id),

cte2 as(select a.pizza_type_id as pizza_type_id, sum(b.quantity*a.price) as sum from pizzas a join cte b on a.pizza_id = b.pizza_id group by a.pizza_type_id)

select a.name,a.category,sum(b.sum)
as sum from pizza_types a join cte2 b on a.pizza_type_id=b.pizza_type_id group by a.category,a.name order by sum desc limit 3;