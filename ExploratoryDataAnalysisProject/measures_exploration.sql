--Measures exploration
-- Find the Total Sales
SELECT sum(sales_sales) AS sales_sum
FROM gold.fact_sales

-- Find how many items are sold
SELECT sum(sales_quantity) AS sales_total_items_sold
FROM gold.fact_sales

-- Find the average selling price
SELECT avg(sales_price) AS sales_avg_price
FROM gold.fact_sales

-- Find the Total number of Orders
SELECT count(DISTINCT sales_order_number) AS sales_total_orders
FROM gold.fact_sales

-- Find the total number of products
SELECT count(DISTINCT product_id) AS products_total
FROM gold.dimension_products

-- Find the total number of customers
SELECT count(DISTINCT customer_id) AS customers_total
FROM gold.dimension_customers

-- Find the total number of customers that has placed an order
SELECT count(DISTINCT customer_id) AS total_customers_with_order
FROM gold.fact_sales

--show all key metrics of the business
SELECT sum(fs.sales_sales) AS sales_sum
	,sum(fs.sales_quantity) AS sales_total_items_sold
	,avg(fs.sales_price) AS sales_avg_price
	,count(DISTINCT fs.sales_order_number) AS sales_total_orders
	,count(DISTINCT dp.product_id) AS products_total
	,count(DISTINCT dc.customer_id) AS customers_total
	,count(DISTINCT fs.customer_id) AS total_customers_with_order
FROM gold.fact_sales AS fs
LEFT JOIN gold.dimension_customers AS dc ON fs.customer_id = dc.customer_id
LEFT JOIN gold.dimension_products AS dp ON fs.product_number = dp.product_number

SELECT 'Total Sales' AS measure_name
	,sum(sales_sales) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Items Sold' AS measure_name
	,sum(sales_quantity) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Average Price' AS measure_name
	,avg(sales_price) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Orders' AS measure_name
	,count(DISTINCT sales_order_number) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Products' AS measure_name
	,count(DISTINCT product_id) AS measure_value
FROM gold.dimension_products

UNION ALL

SELECT 'Total Customers' AS measure_name
	,count(DISTINCT customer_id) AS measure_value
FROM gold.dimension_customers

UNION ALL

SELECT 'Total Customers with at least 1 order' AS measure_name
	,count(DISTINCT customer_id) AS measure_value
FROM gold.fact_sales
	/*
select top 10 * from gold.fact_sales
select top 10 * from gold.dimension_customers
select top 10 * from gold.dimension_products*/