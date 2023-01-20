--Let's say you work as a data analyst for your city, and your boss wants a list of all the bike lanes that have
--an average safety rating of 4.0 or higher. She also wants to see the average safety rating for each of those 
--bike lanes, and a label that says "Safe Lane".

WITH SafeRoads AS (
SELECT street,
AVG (safetyrating) average_safety
FROM CityBikeLanes c
GROUP BY c.street
)

SELECT street,
        average_safety,
        "Safe Lane" AS tag
FROM SafeRoads
WHERE average_safety >= 4.0


--You need to give your boss the list of:
--all bike lanes,
--both safety ratings for each lane given by the two technicians
--the average safety rating for each lane
--and a label with the recommendation as "Remove" (average < 2.5), "Leave As-Is" (average > 4), or "Improvements Needed"

SELECT street, safetyrating, 
AVG(safetyrating) OVER (PARTITION BY street) as "average_safety_rating",
    CASE 
        WHEN AVG(safetyrating) OVER (PARTITION BY safetyrating) <2.5 THEN "Remove"
        WHEN AVG(safetyrating) OVER (PARTITION BY safetyrating) >=4 THEN "Leave As-Is"
        ELSE "Improvements Needed"
    END as "recommendation"
FROM CityBikeLanes
GROUP BY street;
