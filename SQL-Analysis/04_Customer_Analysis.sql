-- Project: Sales & Business Performance Analytics
-- SQL File: Customer Analysis
-- Database: global_superstore

USE global_superstore;


-- 1. Customer Segment Performance
SELECT
    segment,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT order_id) AS unique_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity_sold,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_percentage
FROM orders
GROUP BY segment
ORDER BY total_sales DESC;


-- 2. Top 10 Customers by Sales
SELECT
    customer_id,
    customer_name,
    segment,
    COUNT(DISTINCT order_id) AS unique_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_qty_purchased,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_percentage
FROM orders
GROUP BY customer_id, customer_name, segment
ORDER BY total_sales DESC
LIMIT 10;


-- 3. Customer Purchase Frequency Classification
WITH customer_summary AS (
    SELECT
        customer_id,
        customer_name,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id, customer_name
)
SELECT
    customer_id,
    customer_name,
    total_orders,
    ROUND(total_sales, 2) AS total_sales,
    CASE
        WHEN total_orders = 1 THEN 'One-time Customer'
        WHEN total_orders BETWEEN 2 AND 5 THEN 'Occasional Customer'
        WHEN total_orders BETWEEN 6 AND 10 THEN 'Regular Customer'
        WHEN total_orders > 10 THEN 'Frequent Customer'
    END AS customer_classification
FROM customer_summary
ORDER BY total_sales DESC;


-- 4. Customer Profitability Status
WITH customer_status AS (
    SELECT
        customer_id,
        customer_name,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY customer_id, customer_name
),
profitability AS (
    SELECT
        customer_id,
        customer_name,
        total_orders,
        ROUND(total_sales, 2) AS total_sales,
        ROUND(total_profit, 2) AS total_profit,
        CASE
            WHEN total_profit > 0 THEN 'Profitable'
            WHEN total_profit = 0 THEN 'Break-even'
            WHEN total_profit < 0 THEN 'Loss-making'
        END AS profitability_status
    FROM customer_status
)
SELECT
    profitability_status,
    COUNT(*) AS total_customers
FROM profitability
GROUP BY profitability_status
ORDER BY total_customers DESC;


-- 5. Customer Sales Contribution
WITH customer_sales AS (
    SELECT
        customer_id,
        customer_name,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id, customer_name
),
sales_contribution AS (
    SELECT
        customer_id,
        customer_name,
        ROUND(total_sales, 2) AS total_sales,
        SUM(total_sales) OVER () AS overall_sales,
        RANK() OVER (ORDER BY total_sales DESC) AS customer_rank
    FROM customer_sales
)
SELECT
    customer_id,
    customer_name,
    customer_rank,
    total_sales,
    ROUND(overall_sales, 2) AS overall_sales,
    ROUND(
        total_sales / NULLIF(overall_sales, 0) * 100, 2
    ) AS sales_contribution_percentage
FROM sales_contribution
ORDER BY sales_contribution_percentage DESC;


-- 6. Customer Profit Contribution
WITH customer_profit AS (
    SELECT
        customer_id,
        customer_name,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY customer_id, customer_name
),
profit_contribution AS (
    SELECT
        customer_id,
        customer_name,
        ROUND(total_profit, 2) AS total_profit,
        SUM(total_profit) OVER () AS overall_profit,
        RANK() OVER (ORDER BY total_profit DESC) AS customer_rank
    FROM customer_profit
)
SELECT
    customer_id,
    customer_name,
    total_profit,
    ROUND(overall_profit, 2) AS overall_profit,
    ROUND(
        total_profit / NULLIF(overall_profit, 0) * 100, 2
    ) AS profit_contribution_percentage,
    customer_rank
FROM profit_contribution
ORDER BY profit_contribution_percentage DESC;
