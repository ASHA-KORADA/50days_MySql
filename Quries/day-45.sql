
use 50days_mysql;

select * from cleaned_customers

select * from cleaned_Products

select * from cleaned_orders

select * from cleaned_order_details

select * from cleaned_payments


/* 1.Find top customers by number of orders
2. • Find top customers by generated revenue
3. • Find customers with no orders
4. • Analyze new customer signup trend month-wise
5. • Find repeat customers with multiple orders
6. • Calculate customer lifetime value
7. • Calculate average spend per customer
8. • Find total customers per city */


select customer_id,
    count(customer_id) as top_customers
from cleaned_orders
GROUP BY customer_id
having count(customer_id) > 4


select order_id,
    count(order_id) as top_orders
from cleaned_order_details
group by order_id
having count(order_id) > 4 


select c.customer_id,
    c.customer_name,
    count(distinct o.order_id) as total_orders,
    coalesce(sum(p.payment_amount), 0) as customer_lifetime_value
from cleaned_customers c
left join cleaned_orders o
    on c.customer_id = o.customer_id
left join cleaned_payments p
    on o.order_id = p.order_id
group by c.customer_id,
    c.customer_name
order by customer_lifetime_value desc
