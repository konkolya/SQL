--Dataset: https://catalog.data.gov/dataset/2010-census-populations-by-zip-code

--Before creating visuals in Tableau, I ran SQL to query some basic demographic data as follows.

SELECT AVG(totalpopulation) 
  FROM Census;

SELECT SUM(totalmales),
       SUM(totalfemales) 
  FROM Census;


SELECT AVG(avghouseholdsize) 
  FROM Census;


SELECT zipcode,
       medianage,
       avghouseholdsize,
       totalmales,
       totalfemales
  FROM Census
 WHERE medianage > 60
 ORDER BY medianage DESC;
