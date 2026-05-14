
use 50days_mysql;

-- 1.Find top customers by number of orders

select c.customer_id,
    c.customer_name,
    count(o.order_id) as top_orders
from cleaned_customers c
    join cleaned_orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
    ORDER BY top_orders DESC

--2.Find top customers by generated revenue

SELECT c.customer_id,c.customer_name, SUM(p.payment_amount) AS total_revenue
FROM cleaned_customers c
JOIN cleaned_orders o ON c.customer_id = o.customer_id
JOIN cleaned_payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC;

--3.Find customers with no orders

select c.customer_id,
    c.customer_name
    from cleaned_customers c
    left join cleaned_orders o ON c.customer_id = o.customer_id
where o.order_id is null

--4.Analyze new customer signup trend month-wise

SELECT YEAR(signup_date) as signup_year,
    month(signup_date) as signup_month,
    count(customer_id) as new_customers
FROM cleaned_customers
group by YEAR(signup_date),
    month(signup_date)
order by signup_year,signup_month


--5.Find repeat customers with multiple orders

select c.customer_id,
    c.customer_name,
    count(o.order_id) as multiple_orders
from cleaned_customers c
    join cleaned_orders o on c.customer_id = o.customer_id
group by c.customer_id,c.customer_name
having count(o.order_id)>1
order by multiple_orders desc


--6.Calculate customer lifetime value
select c.customer_id,
    c.customer_name,
    sum(p.payment_amount) as LTV
FROM cleaned_customers c
    JOIN cleaned_orders O ON C.customer_id = O.customer_id
    JOIN cleaned_payments P ON O.order_id = P.order_id
GROUP BY C.customer_id,
    C.customer_name
ORDER BY LTV DESC


--7.Calculate average spend per customer

select c.customer_id,
    c.customer_name,
    AVG(p.payment_amount) as AVG_SPENT
FROM cleaned_customers c
    JOIN cleaned_orders O ON C.customer_id = O.customer_id
    JOIN cleaned_payments P ON O.order_id = P.order_id
GROUP BY C.customer_id,
    C.customer_name
ORDER BY AVG_SPENT DESC


-- 8.Find total customers per city 
select city,count(*) as citywise_customers
 from cleaned_customers
group by city
order by city desc







