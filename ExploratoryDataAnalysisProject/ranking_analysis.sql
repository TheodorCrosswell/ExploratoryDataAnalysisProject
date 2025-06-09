--Ranking analysis
--Which 5 products generate the highest revenue?
WITH cte1
AS (
	SELECT product_number
		,sum(sales_sales) AS total_revenue
		,rank() OVER (
			ORDER BY sum(sales_sales) DESC
			) AS sales_rank
	FROM gold.fact_sales
	GROUP BY product_number
	)
SELECT product_number
	,total_revenue
	,sales_rank
FROM cte1
WHERE sales_rank <= 5
--What are the 5 worst-performing products in terms of sales?
WITH cte1 AS (
		SELECT product_number
			,sum(sales_sales) AS total_revenue
			,rank() OVER (
				ORDER BY sum(sales_sales) ASC
				) AS sales_rank
		FROM gold.fact_sales
		GROUP BY product_number
		)

SELECT product_number
	,total_revenue
	,sales_rank
FROM cte1
WHERE sales_rank <= 5
-- Find the top 10 customers who have generated the highest revenue
WITH cte1 AS (
		SELECT customer_id
			,sum(sales_sales) AS total_revenue
			,rank() OVER (
				ORDER BY sum(sales_sales) DESC
				) AS sales_rank
		FROM gold.fact_sales
		GROUP BY customer_id
		)

SELECT customer_id
	,total_revenue
	,sales_rank
FROM cte1
WHERE sales_rank <= 10
-- The 3 customers with the fewest orders placed
-- All customers have only 1 order each, so the query returns all customers as rank #1
WITH cte1 AS (
		SELECT customer_id
			,count(*) OVER (PARTITION BY customer_id) AS total_orders
		FROM gold.fact_sales
		GROUP BY customer_id
		)
	,cte2 AS (
		SELECT customer_id
			,total_orders
			,rank() OVER (
				ORDER BY total_orders ASC
				) AS orders_rank
		FROM cte1
		)

SELECT *
FROM cte2
WHERE orders_rank <= 3