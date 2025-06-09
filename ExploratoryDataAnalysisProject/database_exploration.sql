--Database exploration
--Find all tables in database
SELECT *
FROM INFORMATION_SCHEMA.tables

--Find all columns in database
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS

--Find all columns in specific schema
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'gold'

--Find all columns in specific table
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'fact_sales'