SELECT * 
FROM retail_orders;

-- Dropping the table
DROP TABLE retail_orders;

-- Creating the table with correct datatypes and data will be inserted from the python code
CREATE TABLE retail_orders(
	order_id			int primary key,
	order_date			date,
	ship_mode			varchar(20),
	segment				varchar(20),
	country				varchar(20),
	city				varchar(20),
	state				varchar(20),
	postal_code			varchar(20),
	region				varchar(20),
	category			varchar(20),
	sub_category		varchar(20),
	product_id			varchar(20),
	quantity			int,
	discount_price		decimal(10, 2),
	sale_price			decimal(10, 2),
	total_sale_price	decimal(10, 2),
	total_cost_price	int,
	profit				decimal(10, 2)
);

-- Checking if the datas are inserted properly into the newly created table
SELECT * 
FROM retail_orders;

-- Let's do some data analysis to get some insights from the data

-- 1. Find TOP 10 highest revenue generating products
SELECT TOP 10 
	product_id, 
	SUM(total_sale_price) as sales
FROM 
	retail_orders
GROUP BY
	product_id
ORDER BY 
	sales DESC;


-- 2. Find TOP 5 highest selling products in each region
SELECT
	x.region, 
	x.product_id,
	x.sales
FROM (
	SELECT 
		region, 
		product_id, 
		SUM(total_sale_price) as sales,
		DENSE_RANK() OVER(PARTITION BY region ORDER BY SUM(total_sale_price) DESC) as ranking
	FROM 
		retail_orders
	GROUP BY 
		region, product_id
	)x
WHERE
	x.ranking <= 5;


-- 3. Find Month Over Month growth comparison for 2022 and 2023 sales eg: jan 2022 vs jan 2023

-- First way just using CASE Statement
SELECT 
    MONTH(order_date) AS mnth, 
    SUM(CASE WHEN YEAR(order_date) = 2022 THEN total_sale_price ELSE 0 END) AS sales_2022,
    SUM(CASE WHEN YEAR(order_date) = 2023 THEN total_sale_price ELSE 0 END) AS sales_2023
FROM 
    retail_orders
GROUP BY 
    MONTH(order_date)
ORDER BY 
    mnth;


-- Second Way usign the Sub Query and CASE Statement
SELECT
	x.mnth,
	SUM(CASE WHEN x.yr = 2022 THEN x.total_sales ELSE 0 END) as sales_2022,
	SUM(CASE WHEN x.yr = 2023 THEN x.total_sales ELSE 0 END) as sales_2023
FROM (
	SELECT 
		MONTH(order_date) as mnth, 
		YEAR(order_date) as yr,
		SUM(total_sale_price) as total_sales
	FROM 
		retail_orders
	GROUP BY
		MONTH(order_date),
		YEAR(order_date)
	)x
GROUP BY
	x.mnth
ORDER BY
	x.mnth;
	

-- 4. For each category which month had highest sales
WITH cte as(
	SELECT 
		category, 
		MONTH(order_date) as mnth,
		YEAR(order_date) as yr,
		SUM(total_sale_price) as total_sales,
		RANK() OVER(PARTITION BY category ORDER BY SUM(total_sale_price) DESC) as rnk
	FROM 
		retail_orders
	GROUP BY
		category,
		MONTH(order_date),
		YEAR(order_date))
SELECT 
	category,
	mnth,
	yr,
	total_sales
FROM
	cte
WHERE
	rnk = 1;


-- 5. Which sub category had highest growth by profit in 2023 compared to 2022
WITH cte as(
	SELECT
		x.sub_category,
		x.profit_2023,
		x.profit_2022,
		x.profit_difference,
		RANK() OVER(ORDER BY x.profit_difference DESC) as rnk
	FROM (
		SELECT 
			sub_category,
			SUM(CASE WHEN YEAR(order_date) = 2023 THEN profit ELSE 0 END) as profit_2023,
			SUM(CASE WHEN YEAR(order_date) = 2022 THEN profit ELSE 0 END) as profit_2022,
			((SUM(CASE WHEN YEAR(order_date) = 2023 THEN profit ELSE 0 END)) - (SUM(CASE WHEN YEAR(order_date) = 2022 THEN profit ELSE 0 END))) as profit_difference
		FROM 
			retail_orders
		GROUP BY
			sub_category
		)x)
SELECT 
    sub_category,
    profit_2023,
    profit_2022,
    profit_difference
FROM
    cte
WHERE
    rnk = 1;



