--Data Analysis & Business key Problems & answers

--Q1.write a sql query to retrive all columns for sale amde on '2022-11-05'
SELECT * FROM retail_Sales where 
sale_date='2022-11-05';

--Q2. Write a SQL query to retrieve all transactions where the category is 
     --'Clothing' and the quantity sold is more than 4 in the month of Nov-2022 

SELECT * FROM retail_Sales WHERE
category='Clothing' AND
TO_CHAR(sale_date,'YYYY-MM')='2022-11'
AND
quantiy >=4;

--Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT category,
sum(price_per_unit*quantiy) AS TOTAL_SALES
FROM retail_Sales
GROUP BY category;

--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

SELECT ROUND(AVG(age),2) AS AVG_AGE
FROM retail_Sales WHERE 
category='Beauty';

--Write a SQL query to find all transactions where the total_sale is greater than 1000.:

SELECT * FROM retail_Sales
WHERE total_sale >1000;

--Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
SELECT   category,gender,COUNT(*) AS N0_of_transaction
FROM retail_Sales GROUP BY category,gender ORDER BY category;

--Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
SELECT 
year,
month,
avg_sale_per_month
FROM
(
SELECT 
EXTRACT (YEAR FROM sale_date) AS year,
EXTRACT (MONTH FROM sale_date) AS month,
AVG(total_sale) AS avg_sale_per_month,
RANK() OVER(PARTITION BY EXTRACT (YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC ) AS RNK
FROM retail_Sales 
GROUP BY 1,2) AS T1
WHERE RNK=1;

--**Write a SQL query to find the top 5 customers based on the highest total sales **:
SELECT customer_id,
sum(total_sale) as total_sale
from retail_Sales 
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5;

--Write a SQL query to find the number of unique customers who purchased items from each category.:
SELECT 
category,
COUNT(DISTINCT customer_id)
as unique_customer
from 
retail_Sales
GROUP BY category;

--Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
WITH hourly_sale
AS(
SELECT *,
CASE 
	WHEN  EXTRACT (HOUR FROM sale_time) < 12 THEN 'morning'
	WHEN  EXTRACT (HOUR FROM sale_time) BETWEEN 12 AND 17 THEN'afternoon'
	ELSE 'evening'
	END as shift 
	from retail_Sales)
SELECT shift,COUNT(customer_id) AS total_order
from hourly_sale
group by shift ;





