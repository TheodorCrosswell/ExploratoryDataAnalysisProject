# Exploratory Data Analysis (EDA) in SQL

## 📖 Project Overview

This project demonstrates a comprehensive Exploratory Data Analysis (EDA) process performed entirely in SQL. The objective is to systematically investigate a sales dataset to uncover patterns, identify anomalies, check assumptions, and answer key business questions.

The analysis is structured to emulate a real-world workflow, starting from basic database discovery and progressing to complex performance and ranking analysis. The queries are designed against a data warehouse-style star schema, consisting of a central fact table (`fact_sales`) and multiple dimension tables (`dimension_customers`, `dimension_products`).

---

## 🎯 Key Business Questions Addressed

This analysis seeks to answer critical business questions, including:

*   **Performance Metrics:** What are our core business metrics like total sales, total orders, and average order value?
*   **Customer Insights:** Who are our most valuable customers? What is the demographic distribution (e.g., by country, gender) of our customer base?
*   **Product Performance:** Which products are the top and bottom performers by revenue? What is the average cost and total revenue for each product category?
*   **Sales Trends:** What is the distribution of items sold across different countries? What is the time range of our sales data?

---

## 🗄️ Assumed Database Schema

The queries in this project are written based on an assumed star schema, a common data warehousing model. The tables are organized within a `gold` schema, suggesting they are cleaned, transformed, and ready for analytics.

*   `gold.fact_sales`: Contains quantitative transactional data, such as sales figures, quantities, prices, and foreign keys to dimension tables.
*   `gold.dimension_customers`: Contains descriptive attributes about customers, such as name, country, gender, and birthdate.
*   `gold.dimension_products`: Contains descriptive attributes about products, including category, subcategory, name, and cost.

---

## 💡 Analytical Approach & Methodology

My approach to EDA is broken down into a logical sequence of steps, with each step building upon the last. This ensures a thorough and structured exploration of the data.

1.  **Database & Schema Exploration (`database_exploration.sql`)**: The first step is to understand the landscape. I use `INFORMATION_SCHEMA` to programmatically discover all available tables, schemas, and column details. This is fundamental for navigating any new database.

2.  **Dimension & Date Exploration (`dimension_exploration.sql`, `date_exploration.sql`)**: Before analyzing transactions, I inspect the dimensions. This involves finding distinct values within categorical columns (like `customer_country`), understanding the range of dates, and examining demographic data (like customer age).

3.  **Core Measures Calculation (`measures_exploration.sql`)**: I establish a baseline by calculating the primary key performance indicators (KPIs) for the business. This includes total sales, total items sold, number of unique customers, and total orders.

4.  **Magnitude & Distribution Analysis (`magnitude_analysis.sql`)**: With the basics covered, I move on to more granular analysis. This involves using `GROUP BY` to segment data and understand distributions, such as customer counts by country, revenue by product category, and the percentage of items sold in each region.

5.  **Ranking & Performance Analysis (`ranking_analysis.sql`)**: The final step is to identify outliers and key performers. I use advanced SQL window functions like `RANK()` to find the top/bottom products by revenue and the most valuable customers, providing actionable insights for the business.

---

## 🛠️ Technical Skills Demonstrated

This project showcases a strong command of SQL for data analysis, including:

*   **Advanced SQL**:
    *   **Window Functions**: Proficient use of `RANK()` and `PARTITION BY` for sophisticated ranking and segmentation without self-joins.
    *   **Common Table Expressions (CTEs)**: Extensive use of `WITH` clauses to improve code readability, modularity, and to break down complex queries into logical, sequential steps.
    *   **Subqueries**: Used effectively for filtering and conditional logic.

*   **Data Aggregation & Manipulation**:
    *   **Aggregate Functions**: Mastery of `SUM()`, `COUNT()`, `AVG()`, `MIN()`, `MAX()` with `GROUP BY` for insightful data summarization.
    *   **Joins**: Use of `INNER JOIN` and `LEFT JOIN` to combine data from fact and dimension tables correctly.
    *   **Data Type Conversion**: `CAST()` and `CONCAT()` for formatting results and performing calculations across different data types.

*   **Database Metaprogramming**:
    *   Querying the `INFORMATION_SCHEMA` to dynamically explore database objects, a key skill for data discovery and automation.

*   **Analytical Thinking**:
    *   Translating business questions into structured SQL queries.
    *   Structuring an EDA process logically, from high-level discovery to deep-dive analysis.
    *   Creating complex metrics, such as percentage distribution calculations.

---

## 📂 Code Overview

The repository is organized into distinct SQL scripts, each with a clear purpose in the EDA lifecycle.

*   `database_exploration.sql`: Queries to discover the database structure, tables, and columns.
*   `date_exploration.sql`: Scripts to analyze date ranges and calculate age-related metrics.
*   `dimension_exploration.sql`: Queries to explore the attributes and distinct values within the dimension tables.
*   `measures_exploration.sql`: Scripts to calculate high-level business KPIs.
*   `magnitude_analysis.sql`: In-depth analysis of data distribution and segmentation.
*   `ranking_analysis.sql`: Queries using window functions to rank customers and products based on performance.

---

## 🚀 How to Use

1.  Connect to your SQL database server using a client of your choice (e.g., DBeaver, SSMS, Azure Data Studio).
2.  Ensure you have a database with the assumed schema (`gold.fact_sales`, `gold.dimension_customers`, etc.).
3.  Open any of the `.sql` files.
4.  Execute the queries to see the analysis results. The queries are self-contained and can be run independently.
