
use 50days_mysql;

/*Day 49: SQL Tasks (Advanced Business Analysis – CTE, Ranking & Stored Procedures)/*


/*1.Question: Find Top 5 Customers by Revenue using CTE.*/

    --CTE+WINDOW FUNCTION(RANK)
WITH customer_revenue AS
(
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(p.payment_amount) AS total_revenue,

        RANK() OVER
        (
            ORDER BY SUM(p.payment_amount) DESC
        ) AS rk

    FROM CLEANED_customers c
    JOIN CLEANED_orders o
        ON c.customer_id = o.customer_id
    JOIN CLEANED_payments p
        ON o.order_id = p.order_id

    GROUP BY 
        c.customer_id,
        c.customer_name
)

SELECT *
FROM customer_revenue
WHERE rk <= 5;

    --ONLY CTE

WITH customer_revenue AS
(
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(p.payment_amount) AS total_revenue
    FROM CLEANED_customers c
    JOIN CLEANED_orders o
        ON c.customer_id = o.customer_id
    JOIN CLEANED_payments p
        ON o.order_id = p.order_id
    GROUP BY 
        c.customer_id,
        c.customer_name
)

SELECT *
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 5;

/*2.Question: Find Top 5 Products by Quantity Sold using CTE.*/

WITH product_sales AS
(
    SELECT 
        p.product_id,
        p.product_name,
        SUM(od.qunatity) AS total_quantity_sold
    FROM CLEANED_products p
    JOIN CLEANED_order_details od
        ON p.product_id = od.product_id
    GROUP BY 
        p.product_id,
        p.product_name
)

SELECT *
FROM product_sales
ORDER BY total_quantity_sold DESC
LIMIT 5

/*3.Question: Rank customers based on generated revenue using DENSE_RANK().*/

WITH customer_revenue AS
(
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(p.payment_amount) AS total_revenue,

        DENSE_RANK() OVER
        (
            ORDER BY SUM(p.payment_amount) DESC
        ) AS drk

    FROM CLEANED_customers c
    JOIN CLEANED_orders o
        ON c.customer_id = o.customer_id
    JOIN CLEANED_payments p
        ON o.order_id = p.order_id

    GROUP BY 
        c.customer_id,
        c.customer_name
)

SELECT *
FROM customer_revenue
WHERE drk <= 5;

/*4.Question: Rank products based on quantity sold using RANK().*/


   SELECT p.product_id,
    p.product_name,
    SUM(od.qunatity) AS total_quantity_sold,
    RANK() OVER(
        ORDER by SUM(od.qunatity) desc
    ) as rk
FROM CLEANED_products p
    JOIN CLEANED_order_details od ON p.product_id = od.product_id
GROUP BY p.product_id,
    p.product_name


/*5.Question: Find category-wise revenue using CTE.*/

WITH category_revenue AS
(
    SELECT 
        p.category,
        SUM(od.qunatity * p.price) AS total_revenue
    FROM CLEANED_products p
    JOIN CLEANED_order_details od
        ON p.product_id = od.product_id
    GROUP BY p.category
)

SELECT *
FROM category_revenue
ORDER BY total_revenue DESC;


/*6.Question: Categorize customers into High, Medium, and Low Revenue groups using CASE.*/

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(p.payment_amount) AS total_revenue,

    CASE
        WHEN SUM(p.payment_amount) >= 100000 THEN 'High Revenue'
        WHEN SUM(p.payment_amount) BETWEEN 50000 AND 99999 THEN 'Medium Revenue'
        ELSE 'Low Revenue'
    END AS revenue_category

FROM CLEANED_customers c
JOIN CLEANED_orders o
    ON c.customer_id = o.customer_id
JOIN CLEANED_payments p
    ON o.order_id = p.order_id

GROUP BY 
    c.customer_id,
    c.customer_name;

/*7.Question: Create Stored Procedure for Customer Revenue Report.*/

CREATE PROCEDURE customer_revenue_report()

SELECT 
        c.customer_id,
        c.customer_name,
        SUM(p.payment_amount) AS total_revenue

    FROM CLEANED_customers c
    JOIN CLEANED_orders o
        ON c.customer_id = o.customer_id
    JOIN CLEANED_payments p
        ON o.order_id = p.order_id

    GROUP BY 
        c.customer_id,
        c.customer_name

    ORDER BY total_revenue DESC

--Execute Stored Procedure

CALL customer_revenue_report()






