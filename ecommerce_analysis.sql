CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE sales (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(255),
    Segment VARCHAR(50),
    Country VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code INT,
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name TEXT,
    Sales FLOAT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT
);
SHOW TABLES;
SELECT COUNT(*) FROM sales;
SELECT ROUND(SUM(Sales),2) AS Total_Sales 
FROM sales;
SELECT ROUND(SUM(Profit),2) AS Total_Profit 
FROM sales;
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders 
FROM sales;
SELECT Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT Category, ROUND(SUM(Profit),2) AS Total_Profit
FROM sales
GROUP BY Category
ORDER BY Total_Profit DESC;
SELECT Product_Name, ROUND(SUM(Sales),2) AS Sales
FROM sales
GROUP BY Product_Name
ORDER BY Sales DESC
LIMIT 10;
SELECT Product_Name, ROUND(SUM(Profit),2) AS Profit
FROM sales
GROUP BY Product_Name
HAVING Profit < 0
ORDER BY Profit ASC;
SELECT Region, ROUND(SUM(Sales),2) AS Total_Sales
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;
SELECT 
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM sales
GROUP BY Year, Month
ORDER BY Year, Month;
SELECT 
    AVG(DATEDIFF(Ship_Date, Order_Date)) AS Avg_Delivery_Days
FROM sales;
SELECT 
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT 
    Category,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin_Percentage
FROM sales
GROUP BY Category
ORDER BY Profit_Margin_Percentage DESC;
SELECT 
    Segment,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM sales
GROUP BY Segment
ORDER BY Total_Sales DESC;
SELECT 
    Customer_Name,
    ROUND(SUM(Sales),2) AS Total_Spent
FROM sales
GROUP BY Customer_Name
ORDER BY Total_Spent DESC
LIMIT 10;
SELECT 
    Discount,
    ROUND(AVG(Profit),2) AS Avg_Profit
FROM sales
GROUP BY Discount
ORDER BY Discount;
SELECT 
    Sub_Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM sales
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;
SELECT 
    YEAR(Order_Date) AS Year,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM sales
GROUP BY Year
ORDER BY Year;
SELECT 
    City,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

