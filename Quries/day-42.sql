

use 50days_mysql;



CREATE table cleaned_customers (
    customer_id VARCHAR(50),
    customer_name VARCHAR(50),
    city VARCHAR(50),
    singup_date date
) 
CREATE table cleaned_Products(
    product_id varchar(50),
    product_name varchar(50),
    category varchar(50),
    price int
) 
CREATE table cleaned_orders(
    payment_id varchar(50),
    customer_id varchar(50),
    order_date date
) 
CREATE table cleaned_order_details(
    order_details_id varchar(50),
    payment_id varchar(50),
    product_id varchar(50),
    qunatity int
) 
CREATE table cleaned_payments(
    payment_id varchar(50),
    payment_id varchar(50),
    payment_amount int,
    payment_date date
)


select * from cleaned_customers

select * from cleaned_Products

select * from cleaned_orders

select * from cleaned_order_details

select * from cleaned_payments

/*Removeing Spaces*/

update cleaned_products
SET category=TRIM(category),
price=TRIM(price),
product_id=TRIM(product_id),
product_name=TRIM(product_name)

UPDATE cleaned_customers
SET customer_id=TRIM(customer_id),
customer_name=TRIM(customer_name),
city=TRIM(city),
singup_date=TRIM(singup_date)


UPDATE cleaned_orders
SET payment_id = TRIM(payment_id),
customer_id = TRIM(customer_id),
order_date = TRIM(order_date)


UPDATE cleaned_order_details
SET order_details_id = TRIM(order_details_id),
payment_id = TRIM(payment_id),
product_id = TRIM(product_id),
qunatity = TRIM(qunatity)


UPDATE cleaned_payments
SET payment_id = TRIM(payment_id),
payment_id = TRIM(payment_id),
payment_amount =TRIM(payment_amount),
payment_date =  TRIM(payment_date)


/* Standardize Text */

UPDATE cleaned_customers
SET customer_name = UPPER(customer_name),
city = UPPER(city)

UPDATE cleaned_Products
SET product_name = UPPER(product_name),
category = UPPER(category)

/*Replace NULL Values*/

UPDATE cleaned_customers
SET city = 'UNKNOWN'
where city IS NULL

UPDATE cleaned_customers
SET customer_name = 'UNKNOWN'
WHERE customer_name IS NULL;

UPDATE cleaned_customers
SET singup_date = '01-01-2024'
WHERE singup_date IS NULL;

ALTER TABLE cleaned_customers
RENAME COLUMN singup_date TO signup_date;

/* finding duplicates*/

/*method-1*/

SELECT customer_id,
    count(*)
from cleaned_customers
GROUP BY customer_id
HAVING count(*) > 1

/*method-2*/

with dup_cte as (
    SELECT customer_id,
        ROW_NUMBER() OVER(
            PARTITION BY customer_id
            ORDER BY customer_id
                ) as rn
from cleaned_customers
)
select customer_id
from dup_cte
where rn > 1



/*delete duplicates in cleaned_customers*/ 

delete from cleaned_customers
where customer_id in (
        select customer_id
        from (
                select customer_id,
                    ROW_NUMBER() OVER(
                        PARTITION by customer_id
                        ORDER BY customer_id
                    ) as rn
        from cleaned_customers
    ) t
where rn > 1
)

/*delete duplicates in cleaned_products*/ 

delete from cleaned_products
where product_id in (
        select product_id
        from (
                select product_id,
                    ROW_NUMBER() OVER(
                        PARTITION by product_id
                        ORDER BY product_id
                    ) as rn
                from cleaned_Products
            ) m
        where rn > 1
    )

    /*duplicate checking cleaned_orders*/

   with dup_cte as (
    select *,
        ROW_NUMBER() OVER(
            PARTITION by payment_id
            ORDER BY payment_id
        ) as rn
    from cleaned_orders
)
select * from dup_cte
where rn>1


/*duplicate check cleaned_order_details*/


with dup_cte as (
    select *,
        ROW_NUMBER() OVER(
            PARTITION by order_details_id
            ORDER BY order_details_id
        ) as rk
    from cleaned_order_details
)
select *
from dup_cte
where rk > 1

/*duplicate check cleaned_payments*/

  with dup_cte as (
    select *,
        ROW_NUMBER() OVER(
            PARTITION by payment_id
            ORDER BY payment_id
        ) as rn
    from cleaned_payments
)
select * from dup_cte
where rn>1