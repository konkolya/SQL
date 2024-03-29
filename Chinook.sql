--Show Customers (their full names, customer ID, and country) who are not in the US. (Hint: != or <> can be used to say "is not equal to").

SELECT FirstName,
       LastName,
       CustomerId,
       country
  FROM customers
 WHERE country != "USA"
 ORDER BY country;

--Show only the Customers from Brazil.

SELECT *
  FROM customers
 WHERE country = "Brazil";

--Find the Invoices of customers who are from Brazil. The resulting table should show the customer's full name, Invoice ID, Date of the invoice, and billing country.

SELECT c.FirstName,
       c.LastName,
       i.invoiceid,
       i.InvoiceDate,
       i.BillingCountry
  FROM customers c
       JOIN
       invoices i ON c.CustomerId = i.InvoiceId
 WHERE c.Country = "Brazil";

--Show the Employees who are Sales Agents.

SELECT *
  FROM employees
 WHERE Title LIKE "%Agent%";
 
 --Find a unique/distinct list of billing countries from the Invoice table.

SELECT DISTINCT BillingCountry
  FROM invoices
 GROUP BY BillingCountry;
 
--Provide a query that shows the invoices associated with each sales agent. The resulting table should include the Sales Agent's full name.

SELECT e.FirstName,
       e.LastName,
       i.*
  FROM employees e
       JOIN
       customers c ON e.EmployeeId = c.SupportRepId
       JOIN
       invoices i ON c.customerID = i.invoiceId
 WHERE Title LIKE "%Agent%";
 
--Show the Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers.

SELECT i.Total,
       c.FirstName,
       c.LastName,
       c.Country,
       e.FirstName AS sales_agents_first_name,
       e.LastName AS sales_agents_last_name
  FROM invoices i
       JOIN
       customers c ON i.CustomerId = c.CustomerId
       JOIN
       employees e ON c.SupportRepId = e.EmployeeId
 GROUP BY c.LastName;

--How many Invoices were there in 2009?

SELECT COUNT( * ) 
  FROM invoices
 WHERE InvoiceDate LIKE "%2009%";
 
--What are the total sales for 2009?

SELECT SUM(Total) AS total_sales
  FROM invoices
 WHERE InvoiceDate LIKE "%2009%";
 
--Write a query that includes the purchased track name with each invoice line ID.

SELECT t.Name,
       i.InvoiceLineId
  FROM tracks t
       JOIN
       invoice_items i ON t.TrackId = i.TrackId;
       
--Write a query that includes the purchased track name AND artist name with each invoice line ID.

SELECT t.Name AS track_name,
       ar.Name AS artist_name,
       i.InvoiceLineId
  FROM tracks t
       JOIN
       albums al ON t.AlbumId = al.AlbumId
       JOIN
       artists ar ON al.ArtistId = ar.ArtistId
       JOIN
       invoice_items i ON t.TrackId = i.TrackId;
 
 --Provide a query that shows all the Tracks, and include the Album name, Media type, and Genre.
 
 SELECT t.name,
       a.title,
       g.name AS genre,
       m.name AS media_type
  FROM tracks t
       JOIN
       albums a ON t.AlbumId = a.AlbumId
       JOIN
       genres g ON t.GenreId = g.GenreId
       JOIN
       media_types m ON t.MediaTypeId = m.MediaTypeId;
       
--Show the total sales made by each sales agent.

SELECT e.FirstName,
       e.LastName,
       SUM(i.Total) AS total_sales
  FROM invoices i
       JOIN
       customers c ON i.CustomerId = c.CustomerId
       JOIN
       employees e ON c.SupportRepId = e.EmployeeId
 GROUP BY e.LastName
 ORDER BY total_sales DESC;
 
 --Which sales agent made the most dollars in sales in 2009?
 
 SELECT e.FirstName,
       e.LastName,
       SUM(i.Total) AS total_sales
  FROM invoices i
       JOIN
       customers c ON i.CustomerId = c.CustomerId
       JOIN
       employees e ON c.SupportRepId = e.EmployeeId
 WHERE i.InvoiceDate LIKE "%2009%"
 GROUP BY e.LastName
 ORDER BY total_sales DESC;
