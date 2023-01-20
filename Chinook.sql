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
 
 
 
