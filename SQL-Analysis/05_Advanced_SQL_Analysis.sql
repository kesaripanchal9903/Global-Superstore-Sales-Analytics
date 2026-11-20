-- Project: Sales & Business Performance Analytics
-- SQL File: Advanced SQL Analysis
-- Database: global_superstore

USE global_superstore;


-- 1. Year-over-Year Sales Growth
WITH yearly_sales AS (
    SELECT
        YEAR(order_date) AS sales_year,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY YEAR(order_date)
),
sales_comparison AS (
    SELECT
        sales_year,
        total_sales,
        LAG(total_sales) OVER (ORDER BY sales_year) AS previous_year_sales
    FROM yearly_sales
)
SELECT
    sales_year,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(previous_year_sales, 2) AS previous_year_sales,
    ROUND(total_sales - previous_year_sales, 2) AS sales_difference,
    ROUND(
        (total_sales - previous_year_sales)
        / NULLIF(previous_year_sales, 0) * 100, 2
    ) AS sales_growth_percentage
FROM sales_comparison
ORDER BY sales_year;


-- 2. Month-over-Month Sales Growth
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS sales_year,
        MONTH(order_date) AS sales_month,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY YEAR(order_date), MONTH(order_date)
),
sales_comparison AS (
    SELECT
        sales_year,
        sales_month,
        total_sales,
        LAG(total_sales) OVER (
            ORDER BY sales_year, sales_month
        ) AS previous_month_sales
    FROM monthly_sales
)
SELECT
    sales_year,
    sales_month,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(previous_month_sales, 2) AS previous_month_sales,
    ROUND(total_sales - previous_month_sales, 2) AS sales_difference,
    ROUND(
        (total_sales - previous_month_sales)
        / NULLIF(previous_month_sales, 0) * 100, 2
    ) AS sales_growth_percentage
FROM sales_comparison
ORDER BY sales_year, sales_month;


-- 3. Cumulative Monthly Sales
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS sales_year,
        MONTH(order_date) AS sales_month,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT
    sales_year,
    sales_month,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(
        SUM(total_sales) OVER (
            ORDER BY sales_year, sales_month
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ), 2
    ) AS cumulative_sales
FROM monthly_sales
ORDER BY sales_year, sales_month;


-- 4. Product Ranking by Sales Within Each Category
WITH product_sales AS (
    SELECT
        category,
        product_id,
        product_name,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY category, product_id, product_name
),
product_ranking AS (
    SELECT
        category,
        product_id,
        product_name,
        total_sales,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_sales DESC
        ) AS sales_rank
    FROM product_sales
)
SELECT
    category,
    product_id,
    product_name,
    ROUND(total_sales, 2) AS total_sales,
    sales_rank
FROM product_ranking
ORDER BY category, sales_rank;


-- 5. Top 5 Products by Sales Within Each Category
WITH product_sales AS (
    SELECT
        category,
        product_id,
        product_name,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY category, product_id, product_name
),
product_ranking AS (
    SELECT
        category,
        product_id,
        product_name,
        ROUND(total_sales, 2) AS total_sales,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_sales DESC, product_id
        ) AS product_rank
    FROM product_sales
)
SELECT
    category,
    product_id,
    product_name,
    total_sales,
    product_rank
FROM product_ranking
WHERE product_rank <= 5
ORDER BY category, product_rank;


-- 6. Category-wise Year-over-Year Sales Growth
WITH yearly_category_sales AS (
    SELECT
        YEAR(order_date) AS sales_year,
        category,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY YEAR(order_date), category
),
previous_year_sales AS (
    SELECT
        sales_year,
        category,
        ROUND(total_sales, 2) AS total_sales,
        LAG(total_sales) OVER (
            PARTITION BY category
            ORDER BY sales_year
        ) AS previous_sales
    FROM yearly_category_sales
)
SELECT
    sales_year,
    category,
    total_sales,
    ROUND(previous_sales, 2) AS previous_sales,
    ROUND(
        (total_sales - previous_sales)
        / NULLIF(previous_sales, 0) * 100, 2
    ) AS yoy_growth_percentage,
    RANK() OVER (
        PARTITION BY sales_year
        ORDER BY total_sales DESC
    ) AS category_rank
FROM previous_year_sales
ORDER BY sales_year, category_rank;


-- 7. Top 3 Products by Profit Each Year
WITH product_sales AS (
    SELECT
        YEAR(order_date) AS sales_year,
        product_id,
        product_name,
        category,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY
        YEAR(order_date), product_id, product_name, category
),
top_products AS (
    SELECT
        sales_year,
        product_id,
        product_name,
        category,
        ROUND(total_profit, 2) AS total_profit,
        RANK() OVER (
            PARTITION BY sales_year
            ORDER BY total_profit DESC
        ) AS product_rank
    FROM product_sales
)
SELECT
    sales_year,
    product_id,
    product_name,
    category,
    total_profit,
    product_rank
FROM top_products
WHERE product_rank <= 3
ORDER BY sales_year, product_rank;


-- 8. Monthly Sales Growth by Region
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS sales_year,
        MONTH(order_date) AS sales_month,
        region,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY YEAR(order_date), MONTH(order_date), region
),
previous_month_sales AS (
    SELECT
        sales_year,
        sales_month,
        region,
        ROUND(total_sales, 2) AS total_sales,
        LAG(total_sales) OVER (
            PARTITION BY region
            ORDER BY sales_year, sales_month
        ) AS previous_monthly_sales,
        RANK() OVER (
            PARTITION BY sales_year, sales_month
            ORDER BY total_sales DESC
        ) AS sales_rank
    FROM monthly_sales
)
SELECT
    sales_year,
    sales_month,
    region,
    total_sales,
    ROUND(previous_monthly_sales, 2) AS previous_monthly_sales,
    ROUND(
        (total_sales - previous_monthly_sales)
        / NULLIF(previous_monthly_sales, 0) * 100, 2
    ) AS mom_growth_percentage,
    sales_rank
FROM previous_month_sales
ORDER BY sales_year, sales_month, sales_rank;


-- 9. Regional Sales Contribution by Year
WITH yearly_sales AS (
    SELECT
        YEAR(order_date) AS sales_year,
        region,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY YEAR(order_date), region
),
company_sales AS (
    SELECT
        sales_year,
        region,
        total_sales,
        SUM(total_sales) OVER (
            PARTITION BY sales_year
        ) AS company_sales_by_year
    FROM yearly_sales
)
SELECT
    sales_year,
    region,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(company_sales_by_year, 2) AS company_sales_by_year,
    ROUND(
        total_sales / NULLIF(company_sales_by_year, 0) * 100, 2
    ) AS regional_sales_contribution_percentage,
    RANK() OVER (
        PARTITION BY sales_year
        ORDER BY total_sales DESC
    ) AS regional_rank
FROM company_sales
ORDER BY sales_year, regional_sales_contribution_percentage DESC;


-- 10. Year-over-Year Profit Growth by Region
WITH regional_analysis AS (
    SELECT
        YEAR(order_date) AS profit_year,
        region,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY YEAR(order_date), region
),
profit_growth AS (
    SELECT
        profit_year,
        region,
        ROUND(total_profit, 2) AS total_profit,
        LAG(total_profit) OVER (
            PARTITION BY region
            ORDER BY profit_year
        ) AS previous_year_profit
    FROM regional_analysis
)
SELECT
    profit_year,
    region,
    total_profit,
    ROUND(previous_year_profit, 2) AS previous_year_profit,
    ROUND(total_profit - previous_year_profit, 2) AS profit_difference,
    ROUND(
        (total_profit - previous_year_profit)
        / NULLIF(previous_year_profit, 0) * 100, 2
    ) AS yoy_profit_growth_percentage
FROM profit_growth
ORDER BY region, profit_year;


-- 11. Overall Business Performance Summary by Year
WITH order_summary AS (
    SELECT
        YEAR(order_date) AS sales_year,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        COUNT(DISTINCT order_id) AS unique_orders,
        COUNT(DISTINCT customer_id) AS unique_customers
    FROM orders
    GROUP BY YEAR(order_date)
),
previous_year_cal AS (
    SELECT
        sales_year,
        ROUND(total_sales, 2) AS total_sales,
        ROUND(total_profit, 2) AS total_profit,
        unique_orders,
        unique_customers,
        ROUND(
            total_profit / NULLIF(total_sales, 0) * 100, 2
        ) AS profit_margin,
        LAG(total_sales) OVER (
            ORDER BY sales_year
        ) AS previous_year_sales,
        LAG(total_profit) OVER (
            ORDER BY sales_year
        ) AS previous_year_profit
    FROM order_summary
)
SELECT
    sales_year,
    total_sales,
    total_profit,
    unique_orders,
    unique_customers,
    profit_margin,
    ROUND(
        (total_sales - previous_year_sales)
        / NULLIF(previous_year_sales, 0) * 100, 2
    ) AS yoy_sales_growth_percentage,
    ROUND(
        (total_profit - previous_year_profit)
        / NULLIF(previous_year_profit, 0) * 100, 2
    ) AS yoy_profit_growth_percentage
FROM previous_year_cal
ORDER BY sales_year;
