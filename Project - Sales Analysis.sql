CREATE DATABASE MarketSales;
  
USE MarketSales;

-- SELECT * FROM `retail sales analysis`;

-- SELECT COUNT(*) FROM `retail sales analysis`;

-- SELECT COUNT(DISTINCT customer_id) AS unique_customers
-- FROM `retail sales analysis`; ----> 155 Unique Customers

 
-- SELECT DISTINCT category
-- FROM `retail sales analysis`; ---> Ans: Clothing, Beauty, and Electronics.

SELECT *
FROM `retail sales analysis`
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantiy IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

SELECT *
FROM `retail sales analysis`
WHERE sale_date = '2022-11-05';


-- SELECT gender, COUNT(*) AS total_customers
-- FROM `retail sales analysis`
-- WHERE sale_date = '2022-11-05'
-- GROUP BY gender;  ----> 6 Males and 5 Females.


SELECT gender, category, COUNT(*) AS total_purchases
FROM `retail sales analysis`
GROUP BY gender, category
ORDER BY gender, total_purchases DESC;

SELECT 
  gender, 
  category, 
  COUNT(*) AS total_purchases
FROM `retail sales analysis`
WHERE sale_date = '2022-11-05'
GROUP BY gender, category
ORDER BY gender, category;


SELECT 
  gender, 
  category, 
  AVG(age) AS average_age
FROM `retail sales analysis`
WHERE sale_date = '2022-11-05'
GROUP BY gender, category
ORDER BY gender, category;


SELECT *
FROM `retail sales analysis`
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
  AND quantiy >= 4
LIMIT 0, 50000;

SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM `retail sales analysis`
GROUP BY 1;

SELECT *
FROM `retail sales analysis`
WHERE total_sale > 1000;

SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM `retail sales analysis`
GROUP 
    BY 
    category,
    gender
ORDER BY 1;

-- Part 1: Calculate the average sale for each month
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale
FROM `retail sales analysis`
GROUP BY year, month
ORDER BY year, month;

-- Part 2: Find the best-selling month in each year (highest total sale)
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    SUM(total_sale) AS total_sales
FROM `retail sales analysis`
GROUP BY year, month
ORDER BY year, total_sales DESC;


