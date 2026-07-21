-- Query 1: Display first 10 records
SELECT *
FROM cleaned_superstore
LIMIT 10;

-- Query 2: Sales greater than 1000
SELECT *
FROM cleaned_superstore
WHERE Sales > 1000;

-- Query 3: Top 10 highest sales
SELECT *
FROM cleaned_superstore
ORDER BY Sales DESC
LIMIT 10;

-- Query 4: Total Sales by Category
SELECT Category,
SUM(Sales) AS Total_Sales
FROM cleaned_superstore
GROUP BY Category;

-- Query 5: Categories having sales above 500000
SELECT Category,
SUM(Sales) AS Total_Sales
FROM cleaned_superstore
GROUP BY Category
HAVING SUM(Sales) > 500000;

-- Query 6: Top 5 Products by Sales
SELECT `Product Name`,
SUM(Sales) AS Total_Sales
FROM cleaned_superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 5;

-- Query 7: Monthly Sales Trend
SELECT MONTH(`Order Date`) AS Month,
SUM(Sales) AS Total_Sales
FROM cleaned_superstore
GROUP BY MONTH(`Order Date`)
ORDER BY Month;

-- Query 8: Customer Spending
SELECT `Customer Name`,
SUM(Sales) AS Total_Spent
FROM cleaned_superstore
GROUP BY `Customer Name`
ORDER BY Total_Spent DESC
LIMIT 10;

-- Query 9: Subquery
SELECT `Product Name`, Sales
FROM cleaned_superstore
WHERE Sales > (
    SELECT AVG(Sales)
    FROM cleaned_superstore
);

-- Query 10: CTE
WITH CategorySales AS (
    SELECT Category,
           SUM(Sales) AS Total_Sales
    FROM cleaned_superstore
    GROUP BY Category
)
SELECT *
FROM CategorySales;

-- Query 11: ROW_NUMBER
SELECT
`Product Name`,
Sales,
ROW_NUMBER() OVER(ORDER BY Sales DESC) AS Row_Num
FROM cleaned_superstore;

-- Query 12: RANK
SELECT
`Product Name`,
Sales,
RANK() OVER(ORDER BY Sales DESC) AS Sales_Rank
FROM cleaned_superstore;

-- Query 13: LAG
SELECT
`Order Date`,
Sales,
LAG(Sales) OVER(ORDER BY `Order Date`) AS Previous_Sales
FROM cleaned_superstore;

-- Query 14: LEAD
SELECT
`Order Date`,
Sales,
LEAD(Sales) OVER(ORDER BY `Order Date`) AS Next_Sales
FROM cleaned_superstore;

-- Query 15: Create View
CREATE VIEW category_sales AS
SELECT Category,
SUM(Sales) AS Total_Sales
FROM cleaned_superstore
GROUP BY Category;

-- Query 16: View the View
SELECT * FROM category_sales;