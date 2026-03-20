--Import count the data so you identify that the data imported correctly
SELECT COUNT(*) FROM retail_Sales;

--Data cleaning 

-- check the null value

SELECT * FROM retail_Sales 
WHERE transactions_id IS NULL OR 
sale_date IS NULL OR 
sale_time IS NULL OR 
customer_id IS NULL OR 
gender IS NULL OR 
age IS NULL OR 
category IS NULL OR 
quantiy IS NULL OR 
price_per_unit IS NULL OR 
cogs IS NULL OR 
total_sale IS NULL;


--now we have to delete that record

DELETE FROM retail_Sales
where transactions_id IS NULL OR 
sale_date IS NULL OR 
sale_time IS NULL OR 
customer_id IS NULL OR 
gender IS NULL OR 
age IS NULL OR 
category IS NULL OR 
quantiy IS NULL OR 
price_per_unit IS NULL OR 
cogs IS NULL OR 
total_sale IS NULL;

-- how many sales we have ?
SELECT COUNT(*) AS total_sale from retail_Sales;

--how many customer we have?
SELECT COUNT(DISTINCT customer_id) AS total_customer from retail_Sales;

----how many category we have?
SELECT COUNT(DISTINCT category) AS total_category from retail_Sales;
