--Write your own SQL that will give us the following data:
--The account numbers, the count of order IDs, product, quantity, price, order date, and location for all orders that were placed in February.


SELECT cust.acctnum,
       COUNT(cust.order_id) AS orders,
       feb.Product,
       feb.Quantity,
       feb.price,
       feb.orderdate,
       feb.location
  FROM BIT_DB.customers cust
       JOIN
       BIT_DB.FebSales feb ON cust.order_id = feb.orderid
 GROUP BY cust.acctnum,
          feb.product,
          feb.quantity,
          feb.price,
          feb.orderdate,
          feb.location;
