--Dataset: https://catalog.data.gov/dataset/2010-census-populations-by-zip-code

--Before creating visuals in Tableau, I ran SQL to query some basic demographic data as follows.


--Finding the average number of population in LA

SELECT AVG(totalpopulation) 
  FROM Census;


--Listing the number of males and females

SELECT SUM(totalmales),
       SUM(totalfemales) 
  FROM Census;


--Finding the average household size

SELECT AVG(avghouseholdsize) 
  FROM Census;


--Finding all details about areas where the average age is above 60.

SELECT zipcode,
       medianage,
       avghouseholdsize,
       totalmales,
       totalfemales
  FROM Census
 WHERE medianage > 60
 ORDER BY medianage DESC;
