

use 50days_mysql;

select * from cleaned_customers

select * from cleaned_Products

select * from cleaned_orders

select * from cleaned_order_details

select * from cleaned_payments
WHERE payment_date = '2023-04-07'

/* Date formatting*/

UPDATE cleaned_payments
SET payment_date =
CASE
-- DD-MM-YYYY
WHEN CAST(SUBSTRING(payment_date,1,2) AS UNSIGNED) > 12
THEN DATE_FORMAT(
STR_TO_DATE(payment_date,'%d-%m-%Y'),
'%Y-%m-%d'
)
-- MM-DD-YYYY
WHEN CAST(SUBSTRING(payment_date,4,2) AS UNSIGNED) > 12
THEN DATE_FORMAT(
STR_TO_DATE(payment_date,'%m-%d-%Y'),
'%Y-%m-%d'
)
ELSE payment_date
END;


UPDATE cleaned_payments
SET payment_date =
DATE_FORMAT(
STR_TO_DATE(payment_date,'%d-%m-%Y'),
'%Y-%m-%d'
);

/*Datatype Fix & Add Constraints*/

ALTER TABLE cleaned_customers
MODIFY customer_id INT PRIMARY KEY,
MODIFY customer_name VARCHAR(100),
MODIFY city VARCHAR(100),
MODIFY signup_date DATE;


ALTER TABLE cleaned_products
MODIFY product_id INT PRIMARY KEY,
MODIFY product_name VARCHAR(100),
MODIFY category VARCHAR(100),
MODIFY price DECIMAL(10,2);


ALTER TABLE cleaned_orders
MODIFY order_id INT PRIMARY KEY,
MODIFY customer_id INT,
MODIFY order_date DATE;

ALTER TABLE cleaned_orders
ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id)
REFERENCES
cleaned_customers(customer_id);

ALTER table cleaned_order_details
MODIFY order_details_id INT PRIMARY KEY,
MODIFY order_id INT,
MODIFY product_id INT,
MODIFY qunatity INT

ALTER TABLE cleaned_order_details
ADD CONSTRAINT fk_order FOREIGN KEY (order_id)
REFERENCES
cleaned_orders(order_id);

ALTER TABLE cleaned_order_details
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES cleaned_products(product_id);

ALTER TABLE cleaned_payments
MODIFY payment_id INT PRIMARY KEY,
MODIFY order_id INT,
MODIFY payment_amount DECIMAL(10,2),
MODIFY payment_date DATE;








