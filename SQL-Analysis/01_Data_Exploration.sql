-- Project: Sales & Business Performance Analytics
-- Dataset: Global Superstore
-- Database: global_superstore
-- Tables: Orders

USE global_superstore;
-- 1. Explore the database
select * from orders;

-- 2. Check the total number of columns
select 
  count(*) as total_columns
from information_schema.columns
where table_schema = 'global_superstore'
  and table_name = ' orders';

--3. check the order and shipping date range
select 
  min(order_date) as first_order_date,
  max(order_date) as last_order_date,
  min(ship_date) as first_ship_date,
  max(ship_date) as last_ship_date
from orders;

-- 4. overall business performance
select
  round(sum(sales),2) as total_sales,
  round(sum(profit),2) as total_profit,
  sum(quantity) as total_quantity,
  round(avg(discount)*100,2) as avg_discount_percentage,
  count(distinct(order_id)) as unique_orders,
  count(distinct(customer_id) as unique_customers
from orders;

