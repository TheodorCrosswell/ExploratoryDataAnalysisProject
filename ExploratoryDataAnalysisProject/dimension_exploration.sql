--Dimension exploration
--Find all distinct values of customer_country
SELECT DISTINCT customer_country
FROM gold.dimension_customers

--Find all columns in fact_sales
SELECT column_name
	,data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'fact_sales'

--explore each column in fact_sales
/*
product_number
customer_id
sales_order_date
sales_ship_date
sales_due_dt
sales_sales
sales_quantity
sales_price
*/
SELECT DISTINCT sales_quantity
FROM gold.fact_sales

--Find all catergories and subcategories from dimension_products
SELECT DISTINCT product_category
	,product_subcategory
	,product_name
FROM gold.dimension_products
ORDER BY 1
	,2
	,3