-- 11.	Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC
;

-- 12. Analyze the cumulative revenue generated over time.

select order_date, sum(revenue) over (order by order_date) as cum_revenue
from 
(select orders.order_date,sum(order_details.quantity * pizzas.price) as revenue 
from order_details join pizzas 
on order_details.pizza_id = pizzas.pizza_id
join orders 
on orders.order_id = order_details.order_id 
group by orders.order_date) as sales
;


