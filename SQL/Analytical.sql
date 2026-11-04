
-----Overall business performance

Gives an overall summary of business performance.

What is the total revenue generated?
How many products have been sold?
How many orders have been placed?

SELECT
    SUM(total_amount) AS total_revenue,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT order_id) AS total_orders
FROM warehouse.fact_sales;


----Product-wise revenue analysis

Purpose: Identifies which products generate the highest revenue.

Which product generates the most revenue?
How much revenue does each product generate?
Which products are performing poorly?


SELECT
    p.product_name,
    SUM(f.quantity) AS total_quantity,
    SUM(f.total_amount) AS total_revenue
FROM warehouse.fact_sales f
JOIN warehouse.dim_product p
    ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-----Monthly revenue analysis

Purpose: Analyzes revenue generated each month.

What is the monthly revenue?
Which month has the highest sales?
During which months does revenue increase or decrease?



SELECT
    d.year_number,
    d.month_number,
    d.month_name,
    SUM(f.total_amount) AS monthly_revenue
FROM warehouse.fact_sales f
JOIN warehouse.dim_date d
    ON f.date_key = d.date_key
GROUP BY
    d.year_number,
    d.month_number,
    d.month_name
ORDER BY
    d.year_number,
    d.month_number;

------Top 10 best-selling products
----Finds the 10 products with the highest sales quantity.

Which are the top 10 best-selling products?
Which product categories sell the most?
Which products have the highest customer demand?





SELECT
    p.product_name,
    p.category,
    SUM(f.quantity) AS total_quantity_sold,
    SUM(f.total_amount) AS total_revenue
FROM warehouse.fact_sales f
JOIN warehouse.dim_product p
    ON f.product_key = p.product_key
GROUP BY
    p.product_name,
    p.category
ORDER BY total_quantity_sold DESC
LIMIT 10;


---- Customer purchase analysis

Purpose: Understands customer purchasing behavior.

Who are the highest-spending customers?
How many orders does each customer place?
Which customers purchase the most products?



SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT f.order_id) AS total_orders,
    SUM(f.quantity) AS total_quantity,
    SUM(f.total_amount) AS total_spending
FROM warehouse.fact_sales f
JOIN warehouse.dim_customer c
    ON f.customer_key = c.customer_key
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spending DESC;

 --Regional sales performance
 Purpose: Analyzes sales performance across different geographical regions.

Which state generates the highest revenue?
Which country has the highest sales?
Which region has the most orders?



SELECT
    c.state,
    c.country,
    COUNT(DISTINCT f.order_id) AS total_orders,
    SUM(f.quantity) AS total_quantity,
    SUM(f.total_amount) AS total_revenue
FROM warehouse.fact_sales f
JOIN warehouse.dim_customer c
    ON f.customer_key = c.customer_key
GROUP BY
    c.state,
    c.country
ORDER BY total_revenue DESC;

