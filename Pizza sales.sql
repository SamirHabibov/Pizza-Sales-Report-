
-- 1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;


--2.Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales




--3.Total Pizzas Sold

SELECT SUM(quantity) AS pizza_sold FROM pizza_sales  


--4.Average Order Value

SELECT ROUND((SUM(total_price) / COUNT(DISTINCT order_id)),2) AS Avg_order_Value 
FROM pizza_sales




--5.Average Pizzas Per Order

SELECT ROUND(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
       CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) , 2) AS Avg_Pizzas_per_order
FROM pizza_sales;


--6.Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS order_day,COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY total_orders DESC



--7.Monthly Trend for Orders

SELECT DATENAME(MONTH, order_date) AS order_month, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY DATENAME(month,order_date)
ORDER BY Total_orders desc



--8.Percentage of Sales by Pizza Category
SELECT pizza_category, ROUND(SUM(total_price), 2) as Total_revenue, 
ROUND((SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100, 2) as Percentage_of_total_revenue
FROM pizza_sales
GROUP BY  pizza_category
ORDER BY  Percentage_of_total_revenue DESC;

--9.Percentage of Sales by Pizza Size
SELECT pizza_size, ROUND(SUM(total_price), 2) as Total_revenue, 
ROUND((SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100, 2) as Percentage_of_total_revenue
FROM pizza_sales
GROUP BY  pizza_size
ORDER BY  Percentage_of_total_revenue DESC;
	

--10.Total Pizzas Sold by Pizza Category

SELECT pizza_category ,ROUND(SUM(quantity),3) AS Total_sold  FROM pizza_sales
GROUP BY  pizza_category
ORDER BY Total_sold DESC

--11.Top 5 Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price)  AS total_revenue 
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY  total_revenue DESC


--12.Bottom 5 Pizzas by Revenue

SELECT TOP 5 pizza_name, SUM(total_price)  AS total_revenue 
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY  total_revenue ASC



--13.Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC



--14.BOTTOM 5 Pizzas by Quantity 


SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC


--15.Top 5 Pizzas by Total Orders

SELECT Top 5 pizza_name, COUNT (DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC


--16. Bottom 5 Pizzas by Total Orders

SELECT Top 5 pizza_name, COUNT (DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders ASC


