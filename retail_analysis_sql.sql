-- retail sales table
SELECT *
FROM retail_sales
LIMIT 3;

--retail state table
SELECT *
FROM retail_state
LIMIT 3;

--retail category table
SELECT *
FROM retail_category
LIMIT 3;

--retail manager table
SELECT *
FROM retail_manager
LIMIT 3;

-- Total number of orders in 2016
SELECT COUNT(order_id) AS total_orders
FROM retail_sales
WHERE date BETWEEN '2016-01-01' AND '2016-12-31';
-- Total Sales(2016)
SELECT 
        SUM(sale_price * total_units) AS total_sales
FROM retail_sales
WHERE date BETWEEN '2016-01-01' AND '2016-12-31';

 -- Total Cost of Sales (2016)
SELECT 
        SUM(cost_price * total_units) AS total_cost
FROM retail_sales 
WHERE date BETWEEN '2016-01-01' AND '2016-12-31';

-- Calculate gross profit and profit margin
-- Common Table Expression for Sales and Costs
WITH sales AS (
    SELECT 
            order_id,
            (sale_price * total_units) AS sale
    FROM retail_sales
    WHERE date BETWEEN '2016-01-01' AND '2016-12-31'
    ),
costs AS (
    SELECT 
            order_id,
            (cost_price * total_units) AS cost
    FROM retail_sales
)
-- Calculate total revenue, cost and profit 
SELECT 
    SUM(sale) AS total_sales,
    SUM(cost) AS total_cost,
    SUM(sale) - SUM(cost) AS gross_profit,
    ROUND((SUM(sale) - SUM(cost)) / SUM(sale),2) * 100 AS profit_margin

FROM sales AS s 
INNER JOIN costs AS c  
ON s.order_id = c.order_id;

-- 5 Best performing product category
SELECT
    manager,
    SUM(total_units * sale_price) AS total_sales
FROM retail_sales AS rs
INNER JOIN retail_manager AS rm
ON rs.postcode = rm.postcode
WHERE date BETWEEN '2016-01-01' AND '2016-12-31'
GROUP BY manager  
ORDER BY total_sales DESC
LIMIT 5;

-- States and their total sales
SELECT
    state,
    SUM(total_units * sale_price) AS total_sales
FROM retail_sales AS rs
INNER JOIN retail_state AS rt
ON rs.postcode = rt.postcode
WHERE date BETWEEN '2016-01-01' AND '2016-12-31'
GROUP BY state  
ORDER BY total_sales DESC;

-- Monthly Sales in 2016
SELECT 
	TO_CHAR(date, 'month') AS total_sales
	SUM(total_units * sale_price) AS total_sales
FROM retail_sales
WHERE date BETWEEN '2016-01-01' AND '2016-12-31'
GROUP BY month
ORDER BY TO_DATE(TO_CHAR(date,'month'),'month');

--Sales by Product Category
SELECT
        category,
        SUM(total_units * sale_price) AS sales
FROM retail_sales 
WHERE date BETWEEN '2016-01-01' AND '2016-12-31' 
GROUP BY category 
ORDER by sales DESC;

-- Profit by Product Category
SELECT
    category,
    SUM(total_units * sale_price) - SUM(total_units * cost_price) AS profits
FROM retail_sales
WHERE date BETWEEN '2016-01-01' AND '2016-12-31'
GROUP BY category
ORDER BY profits DESC;

-- Sales growth for first half of 2017
WITH sales_2016 AS (
	SELECT 
	TO_CHAR(date, 'month') AS total_sales
	SUM(total_units * sale_price) AS total_sales
FROM retail_sales
WHERE date BETWEEN '2016-01-01' AND '2016-06-30'
GROUP BY month
ORDER BY TO_DATE(TO_CHAR(date,'month'),'month'),	
sales_2017 AS(
	SELECT 
	TO_CHAR(date, 'month') AS total_sales
	SUM(total_units * sale_price) AS total_sales
FROM retail_sales
WHERE date BETWEEN '2017-01-01' AND '2017-06-30'
GROUP BY month
ORDER BY TO_DATE(TO_CHAR(date,'month'),'month')	
)
SELECT 
	sl.month,
	ROUND((sale_17 - sale_16)/sale_16 *100,2) AS sales_growth
FROM sales_2016 AS sl
	INNER JOIN sales_2017 AS st
	ON sl.month = st.month;


