#In this SQL, I'm querying a database with multiple tables in it to quantify statistics about customer and order data. 


--How many orders were placed in January?
SELECT COUNT (orderID) 
FROM JanSales;


--How many of those orders were for an iPhone?
SELECT COUNT (orderID) from JanSales WHERE Product = "iPhone";


--Select the customer account numbers for all the orders that were placed in February.
SELECT c.acctnum
FROM customers AS c
INNER JOIN FebSales AS f
ON c.order_id = F.orderID;


--Which product was the cheapest one sold in January, and what was the price?
SELECT product, price
FROM JanSales
ORDER BY price ASC LIMIT 1;


--What is the total revenue for each product sold in January? (Revenue can be calculated using the number of products sold and the price of the products).
SELECT SUM(quantity)*price AS revenue, Product 
FROM JanSales
GROUP BY Product;


--Which products were sold in February at 548 Lincoln St, Seattle, WA 98101, how many of each were sold, and what was the total revenue?
SELECT SUM(Quantity)*price AS revenue, Product
FROM FebSales
WHERE location = "548 Lincoln St, Seattle, WA 98101"
GROUP BY Product;


--How many customers ordered more than 2 products at a time in February, and what was the average amount spent for those customers?
SELECT COUNT (distinct cust.acctnum) AS customer_no, AVG (quantity*price) AS revenue
FROM FebSales as feb
LEFT JOIN customers as cust
ON feb.orderid = cust.order_id
WHERE feb.quantity > 2;
