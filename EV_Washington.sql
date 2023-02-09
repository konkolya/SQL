--Dataset: https://catalog.data.gov/dataset/electric-vehicle-population-data

--Before creating Tableau visualizations, I ran some queries to have the basic numbers



--Selecting all EVs that actually have an electric range, sorted by max range

SELECT make,
       model,
       modelyear,
       MAX(electricrange),
       type
  FROM CARS
 WHERE electricrange != 0
 GROUP BY model
 ORDER BY electricrange DESC
 LIMIT 10;


--Finding details of Hyundai Konas

SELECT make,
       model,
       electricrange
  FROM CARS
 WHERE model LIKE "%KONA%";


--Finding the most popular cars

SELECT make,
       model,
       COUNT(model) 
  FROM CARS
 GROUP BY model
 ORDER BY COUNT(model) DESC;


--Counting all EVs in Washington State that actually have some electric range

SELECT COUNT(model) 
  FROM CARS
 WHERE electricrange != 0 AND 
       state = "WA";


--Counting all Teslas in the area with postal code 98052

SELECT make,
       COUNT(model) 
  FROM CARS
 WHERE make LIKE ("%TESLA%") AND 
       electricrange != 0 AND 
       postalcode = 98052;


--TOP 10 EV cars in Washington State

SELECT make,
       model,
       COUNT(model),
       modelyear,
       type
  FROM CARS
 WHERE electricrange != 0 AND 
       state = "WA"
 GROUP BY model
 ORDER BY COUNT(model) DESC
 LIMIT 10;
 
 
 --10 cars with the largest max electric range (ordered)
 
 SELECT make,
       model,
       modelyear,
       type,
       MAX(electricrange) 
  FROM CARS
 WHERE electricrange != 0
 GROUP BY model
 ORDER BY MAX(electricrange) DESC
 LIMIT 10;
