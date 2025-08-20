SELECT *
FROM orders;

--------- TOTAL SALES ---------
SELECT SUM(sales) AS Total_Sales
FROM orders;

--------- MONTLY SALES ---------
SELECT to_char(order_date, 'YYYY-MM') AS month, SUM(sales) AS monthly_sales
FROM orders
GROUP BY to_char(order_date, 'YYYY-MM')
ORDER BY month;

--------- TOP 10 CUSTOMERS --------- 
SELECT customer_name, SUM(sales) AS Total_Sales
FROM orders
GROUP BY customer_name
ORDER BY Total_Sales DESC
LIMIT 10;

--------- MOST POPULAR PRODUCTS --------- 
SELECT product_name, SUM(sales) AS Total_Sales
FROM orders
GROUP BY product_name
ORDER BY Total_Sales DESC;

--------- TOTAL PROFIT --------- 
SELECT SUM(Profit) * 1.0 / SUM(Sales) AS Profit_Margin
FROM orders;

--------- MONTHLY SALES + YEAR-OVER-YEAR GROWTH ---------
WITH m AS (
  SELECT date_trunc('month', order_date) AS month,
         SUM(sales) AS sales
  FROM orders
  GROUP BY 1
)
SELECT m.month,
       m.sales,
       LAG(m.sales, 12) OVER (ORDER BY m.month) AS sales_last_year,
       ROUND(100.0 * (m.sales - LAG(m.sales,12) OVER (ORDER BY m.month))
             / NULLIF(LAG(m.sales,12) OVER (ORDER BY m.month),0), 2) AS yoy_growth_pct
FROM m
ORDER BY 1;

--------- 3-MONTH ROLLING AVERAGE OF SALES BY REGION --------- 
SELECT date_trunc('month', order_date) AS month,
       region,
       SUM(sales) AS sales,
       ROUND(
         AVG(SUM(sales)) OVER (
           PARTITION BY region
           ORDER BY date_trunc('month', order_date)
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
         ), 2
       ) AS ma3_sales
FROM orders
GROUP BY 1,2
ORDER BY 2,1;

--------- TOP-1 PER GROUP --------- 
WITH p AS (
  SELECT sub_category, product_name, SUM(sales) AS sales,
         RANK() OVER (PARTITION BY sub_category ORDER BY SUM(sales) DESC) AS rnk
  FROM orders
  GROUP BY 1,2
)
SELECT sub_category, product_name, sales
FROM p
WHERE rnk = 1
ORDER BY sub_category;

--------- CLV --------- 
WITH by_order AS (
  SELECT order_id, customer_id, customer_name,
         SUM(sales) AS order_sales, MAX(order_date) AS order_date
  FROM orders
  GROUP BY 1,2,3
)
SELECT customer_id, customer_name,
       COUNT(*) AS orders_cnt,
       SUM(order_sales) AS clv,          
	   AVG(order_sales) AS avg_order_value,
       MAX(order_date)  AS last_order_date,
       CURRENT_DATE - MAX(order_date) AS recency_days
FROM by_order
GROUP BY 1,2
ORDER BY clv DESC
LIMIT 50;




