create database ecommerce;
use ecommerce;
RENAME TABLE `sales data` TO sales_data;
SELECT * FROM sales_data;

SELECT COUNT(*) AS TOTAL_RECORDS
FROM SALES_DATA;

DESCRIBE SALES_DATA;

SELECT order_id, COUNT(*) AS DUPLICATE_COUNT
FROM SALES_DATA
GROUP BY order_id
HAVING COUNT(*)>1;

SELECT COUNT(DISTINCT customer_id) AS CUSTOMERS,
COUNT(DISTINCT product_category) AS CATEGORIES,
COUNT(DISTINCT region) AS REGIONS,
COUNT(DISTINCT payment_method) AS PAYMENT_METHODS
FROM SALES_DATA;
 
SELECT
MIN(order_date) as first_order,
MAX(order_date) as last_order
FROM sales_data;

SELECT SUM(revenue) as total_revenue
from sales_data;

select count(distinct customer_id) as customer_id
from sales_data;

SELECT SUM(quantity) AS total_quantity
FROM sales_data;

SELECT AVG(revenue) AS average_order_value
FROM sales_data;

SELECT product_category, sum(revenue) as revenue_category
FROM sales_data
GROUP BY product_category
ORDER BY revenue_category desc;

SELECT region, sum(revenue) as region_revenue
FROM sales_data
GROUP BY region
ORDER BY region_revenue desc;

SELECT payment_method, sum(revenue) as payment_revenue
FROM sales_data
GROUP BY payment_method
ORDER BY  payment_revenue desc;

SELECT order_date FROM sales_data LIMIT 5;

UPDATE sales_data
SET order_date = STR_TO_DATE(order_date, '%c/%e/%Y');

SET SQL_SAFE_UPDATES = 0;

select month(order_date) as month,
sum(revenue) as sales
from sales_data
group by month(order_date)
order by month;

select customer_id, sum(revenue) as total_spent
from sales_data
group by customer_id
order by total_spent desc
limit 10;

select customer_id, product_category, revenue from sales_data
where customer_id = 1955;

SELECT product_category, SUM(quantity) AS quantity_sold
FROM sales_data
GROUP BY product_category
ORDER BY quantity_sold DESC;

SELECT product_category, AVG(customer_rating) AS average_rating
FROM sales_data
GROUP BY product_category
ORDER BY average_rating DESC;

SELECT payment_method, COUNT(*) AS total_orders
FROM sales_data
GROUP BY payment_method
ORDER BY total_orders DESC;

select revenue from sales_data
order by revenue desc limit 10;

SELECT * FROM sales_data
WHERE revenue >(SELECT AVG(revenue)
FROM sales_data );

SELECT customer_id, SUM(revenue) AS total_revenue,
RANK() OVER(ORDER BY SUM(revenue) DESC) AS customer_rank
FROM sales_data
GROUP BY customer_id;

SELECT product_category, SUM(revenue) AS revenue,
DENSE_RANK() OVER(ORDER BY SUM(revenue) DESC) AS category_rank
FROM sales_data
GROUP BY product_category;

SELECT customer_id, SUM(revenue) AS total_revenue,
RANK() OVER (ORDER BY SUM(revenue) DESC) AS customer_rank
FROM sales_data
GROUP BY customer_id;

SELECT product_category, SUM(revenue) AS total_revenue,
DENSE_RANK() OVER (ORDER BY SUM(revenue) DESC) AS category_rank
FROM sales_data
GROUP BY product_category;

SELECT COUNT(DISTINCT order_id) AS total_orders,
COUNT(DISTINCT customer_id) AS total_customers,
SUM(quantity) AS total_quantity,
SUM(revenue) AS total_revenue,
AVG(customer_rating) AS average_rating,
AVG(delivery_days) AS average_delivery
from sales_data;






