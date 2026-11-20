-- Project: Sales & Business Performance Analsytica
-- SQL File: Sales analystics
-- Database: global_superstore

USE global_superstore;

-- 1. Regional Sales performance
select
  region,
  round(sum(sales),2) as total_sales,
  round(sum(profit),2) as total_profit,
  sum(quantity) as total_quntity_sold,
  count(distinct(order_id)) as unique_orders
from orders
group by region
order by total_sales desc;

--2.category and sub-category sales performance
select
  category,
  sub0category,
  round(sum(sales),2) as total_sales,
  round(sum(profit),2) as total_profit,
  sum(quantity) as total_quantity_sold,
  round(avg(discount)*100,2) as avg_discount_percentage
from orders
group by category, sub-category
order by total_sales desc;

--3.Monthly sales and profit trend
select
  year(order_date) as sales_year,
  monthname(order_date) as sales_month,
  round(sum(sales),2) as total_sales,
  round(sum(profit),2) as total_profit,
  count(distinct(order_id)) as total_orders
from orders
group by year(order_date), month(order_date), monthname(order_date)
order by sales_year,month(order_date);

--4.Top 10 product by sales
select
  product_id,
  product_name,
  category,
  sub-category,
  round(sum(sales),2) as total_sales,
  round(sum(profit),2) as total_profit,
  sum(quantity) as total_quantity_sold
from orders
group by product_id, product_name, category sub-category
order by total_sales desc
limit 10;

--5. Top 10 product by profit
select
  product_id,
  product_name,
  category,
  sub_category,
  ROUND(SUM(sales)) AS total_sales,
  ROUND(SUM(profit)) AS total_profit,
  SUM(quantity) AS total_qty_sold
FROM orders
GROUP BY product_id, product_name, category, sub_category
ORDER BY total_profit DESC
LIMIT 10;
