-- Project: Sales & Business Performance Analytics
-- SQL File: Profitability Analysis
-- Database: global_superstore

USE global_superstore;


-- 1. Identify Loss-Making Products
SELECT
    product_id,
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_qty_sold
FROM orders
GROUP BY product_id, product_name, category, sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- 2. Discount Impact on Profitability
SELECT
    ROUND(discount * 100, 2) AS discount_percentage,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_qty_sold,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit), 2) AS avg_profit
FROM orders
GROUP BY discount_percentage
ORDER BY discount_percentage ASC;


-- 3. Regional Profitability Classification
WITH regional_profit AS (
    SELECT
        region,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY region
),
profit_analysis AS (
    SELECT
        region,
        ROUND(total_sales, 2) AS total_sales,
        ROUND(total_profit, 2) AS total_profit,
        ROUND(
            total_profit / NULLIF(total_sales, 0) * 100, 2
        ) AS profit_margin_percentage
    FROM regional_profit
)
SELECT
    region,
    total_sales,
    total_profit,
    profit_margin_percentage,
    CASE
        WHEN profit_margin_percentage > 15 THEN 'High Profitability'
        WHEN profit_margin_percentage BETWEEN 5 AND 15 THEN 'Medium Profitability'
        WHEN profit_margin_percentage < 5 THEN 'Low Profitability'
    END AS profit_status,
    RANK() OVER (ORDER BY total_profit DESC) AS regional_rank
FROM profit_analysis
ORDER BY regional_rank;


-- 4. Sales vs Profit Performance by Category
WITH category_analysis AS (
    SELECT
        category,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY category
),
profitability AS (
    SELECT
        category,
        ROUND(total_sales, 2) AS total_sales,
        ROUND(total_profit, 2) AS total_profit,
        ROUND(
            total_profit / NULLIF(total_sales, 0) * 100, 2
        ) AS profit_margin_percentage
    FROM category_analysis
),
category_benchmark AS (
    SELECT
        *,
        AVG(total_sales) OVER () AS avg_sales,
        AVG(total_profit) OVER () AS avg_profit
    FROM profitability
)
SELECT
    category,
    total_sales,
    total_profit,
    profit_margin_percentage,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank,
    RANK() OVER (ORDER BY total_profit DESC) AS profit_rank,
    CASE
        WHEN total_sales > avg_sales AND total_profit > avg_profit
            THEN 'Strong Performer'
        WHEN total_sales > avg_sales AND total_profit < avg_profit
            THEN 'High Sales, Low Profit'
        WHEN total_sales < avg_sales AND total_profit > avg_profit
            THEN 'Low Sales, High Profit'
        ELSE 'Low Performer'
    END AS performance_category
FROM category_benchmark
ORDER BY sales_rank, profit_rank;


-- 5. Regional Profit Margin Comparison by Year
WITH regional_profit AS (
    SELECT
        YEAR(order_date) AS profit_year,
        region,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY YEAR(order_date), region
),
profit_margin AS (
    SELECT
        profit_year,
        region,
        total_sales,
        total_profit,
        ROUND(
            total_profit / NULLIF(total_sales, 0) * 100, 2
        ) AS regional_profit_margin
    FROM regional_profit
)
SELECT
    profit_year,
    region,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(total_profit, 2) AS total_profit,
    regional_profit_margin,
    RANK() OVER (
        PARTITION BY profit_year
        ORDER BY regional_profit_margin
    ) AS region_rank
FROM profit_margin
ORDER BY profit_year, region_rank ASC;
