--List all the products sold in Los Angeles in February, and include how many of each were sold.

SELECT product,
       SUM(quantity) 
  FROM FebSales
 WHERE location LIKE "%Los Angeles%"
 GROUP BY product;


--Which locations in New York received at least 3 orders in January, and how many orders did they each receive?

SELECT DISTINCT location,
                count(orderID) 
  FROM JanSales
 WHERE location LIKE "%NY%"
 GROUP BY location
HAVING count(orderID) > 2;


--How many of each type of headphone were sold in February?

SELECT product,
       SUM(quantity) AS quantity
  FROM FebSales
 WHERE product LIKE "%headphone%"
 GROUP BY product;


--What was the average amount spent per account in February?

SELECT AVG(price * quantity) 
  FROM FebSales Feb
       LEFT JOIN
       customers cust ON FEB.orderid = cust.order_id;


--What was the average quantity of products purchased per account in February?

SELECT SUM(quantity) / COUNT(cust.acctnum) 
  FROM FebSales Feb
       LEFT JOIN
       customers cust ON Feb.orderid = cust.order_id;


--Which product brought in the most revenue in January and how much revenue did it bring in total?

SELECT product,
       SUM(price * quantity) AS revenue
  FROM JanSales
 GROUP BY product
 ORDER BY sUM(price * quantity) DESC
 LIMIT 1;
