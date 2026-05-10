
use 50days_mysql;

CREATE table raw_customers (
    customer_id VARCHAR(50),
    customer_name VARCHAR(50),
    city VARCHAR(50),
    singup_date date
) 
CREATE table raw_Products(
    product_id varchar(50),
    product_name varchar(50),
    category varchar(50),
    price int
) 
CREATE table raw_orders(
    order_id varchar(50),
    customer_id varchar(50),
    order_date date
) 
CREATE table raw_order_details(
    order_details_id varchar(50),
    order_id varchar(50),
    product_id varchar(50),
    qunatity int
) 
CREATE table raw_payments(
    payment_id varchar(50),
    order_id varchar(50),
    payment_amount int,
    payment_date date
)


select * from raw_Products
select * from raw_customers
select * from raw_order_details
select * from raw_orders
select * from raw_payments







