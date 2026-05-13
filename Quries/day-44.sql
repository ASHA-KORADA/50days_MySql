

use 50days_mysql;

• Find total number of customers
• Find total number of orders
• Calculate total revenue from payments
• Calculate average order value
• Find total products sold
• Calculate orders per customer using GROUP BY


select count(customer_id) as total_customers
from cleaned_customers

select count(order_id) as total_orders
from cleaned_orders

select sum(payment_amount) as revenue 
from cleaned_payments

select round(avg(payment_amount),2) as Aov 
from cleaned_payments

select sum(qunatity) as total_products
from cleaned_order_details

select customer_id,count(customer_id) as orders_per_customer
from cleaned_orders
group by customer_id
having count(customer_id) > 3






