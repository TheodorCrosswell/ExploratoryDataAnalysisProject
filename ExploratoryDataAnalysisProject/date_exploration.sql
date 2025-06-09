--Date exploration
--Find min, max, age of sales dates from fact_sales
SELECT min(sales_order_date) AS min_of_sales_order_date
	,max(sales_order_date) AS max_of_sales_order_date
	,datediff(day, min(sales_order_date), max(sales_order_date)) AS datediff_sales_order_date
	,min(sales_due_dt) AS min_of_sales_due_date
	,max(sales_due_dt) AS max_of_sales_due_date
	,datediff(day, min(sales_due_dt), max(sales_due_dt)) AS datediff_sales_due_date
	,min(sales_ship_date) AS min_of_sales_ship_date
	,max(sales_ship_date) AS max_of_sales_ship_date
	,datediff(day, min(sales_ship_date), max(sales_ship_date)) AS datediff_sales_ship_date
FROM gold.fact_sales
	--Find youngest and oldest customers
	WITH min_and_max_birthdate AS (
		SELECT min(customer_birthdate) AS dates_of_interest
		FROM gold.dimension_customers
		
		UNION
		
		SELECT max(customer_birthdate)
		FROM gold.dimension_customers
		)

SELECT customer_id
	,customer_firstname
	,customer_lastname
	,customer_birthdate
	,datediff(year, customer_birthdate, getdate()) AS customer_age
FROM gold.dimension_customers
WHERE customer_birthdate IN (
		SELECT dates_of_interest
		FROM min_and_max_birthdate
		)