
USE 50days_mysql


/*
1.Question: Find number of orders placed daily.
2.Question: Find monthly order trend.
3.Question: Find the highest value order.
4.Question: Find the lowest value order.
5.Question: Find average qunatity per order.
6.Question: Categorize orders by qunatity size (Small / Medium / Large Orders).
7.Question: Find the day with the highest number of orders.
*/


select count(order_id) as daily_orders,
    order_date
from cleaned_orders
group by order_date
order by order_date

select YEAR(order_date) as Year,
    MONTH(order_date) as Month,
    MONTHNAME(order_date) AS Month_Name,
    count(order_id) as orders_count
from cleaned_orders
group by Year,
    Month,
    Month_Name
order by Year,
    Month


SELECT o.order_id,
    SUM(P.payment_amount) AS highest_order
FROM cleaned_orders O
    JOIN cleaned_payments P ON O.order_id = P.order_id
group by o.order_id
order by highest_order DESC
limit 1

SELECT o.order_id,
    SUM(P.payment_amount) AS least_order
FROM cleaned_orders O
    JOIN cleaned_payments P ON O.order_id = P.order_id
group by o.order_id
order by least_order ASC
limit 1

select avg(ordersize) as avg_quantity
from (
        select order_id,
            sum(qunatity) as ordersize
        from cleaned_order_details
        group by order_id
    ) a

select case
        when qunatity <= 2 then "low orders"
        when qunatity <= 5 then "medium orders"
        else "large orders"
    end as quantitysize,
    count(*) as size
from cleaned_order_details
group by quantitysize
order by quantitysize DESC

SELECT order_date,
    count(order_id) as peak_orders
from cleaned_orders
group by order_date
order by peak_orders desc
LIMIT 1







