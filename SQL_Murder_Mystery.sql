# SQL Murder Mystery

--First, I was to find out what happened on 15/01/2018 in SQL City:

SELECT *
  FROM crime_scene_report
 WHERE date LIKE 20180115 AND 
       city = "SQL City";

--Result: Murder. Security footage shows that there were 2 witnesses. 
--The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- Next, I was looking for the first witness in the person table (looking for the house with the highest number in the street):

SELECT *
  FROM person
 WHERE address_street_name LIKE "Northwe%"
 ORDER BY address_number DESC;

--First witness is: Morty Schapiro (id:	14887,  4919 Northwestern Dr, license ID: 118009, SSN: 111564949)

--Let's look for the second witness: 

SELECT *
  FROM person
 WHERE name LIKE "%Annab%" AND 
       address_street_name LIKE "%Franklin%";

--Second witness is: Annabel Miller (id: 16371, 103 Franklin Ave, license ID: 490173, SSN: 318771143)

--Let's check their interview:

SELECT *
  FROM interview
 WHERE person_id IN (14887, 16371);

--SCHAPIRO: "I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". 
--Only gold members have those bags. The man got into a car with a plate that included "H42W"."
--MILLER: "I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th."

--Let's check gold members of the gym that have a membership number started with "48Z".

SELECT *
  FROM get_fit_now_member
 WHERE membership_status = "gold" AND 
       id LIKE "%48Z%";

--Two possible persons:
--Joe GERMUSKA (id: 48Z7A, person id: 28819, membership start date: 20160305) OR
--Jeremy BOWERS (id: 48Z55, person id: 67318, membership start date: 20160101)

--Let's check who out of the two was there in the gym on 9 January:

SELECT *
  FROM get_fit_now_check_in
 WHERE membership_id IN ("48Z7A", "48Z55");

--Apparently, both of them (GERMUSKA checked in at 16:00 and out at 17:30, BOWERS checked in at 15:30 and checked out at 17:00). 
--Let's find out then who owns a car with the given licence plate number:

SELECT person.name,
       drivers_license.*
  FROM drivers_license
       JOIN
       person ON drivers_license.id = person.license_id
 WHERE plate_number LIKE "%H42W%";

--It's BOWERS (id: 423327, age: 30, height: 70, eye: brown, hair: brown, licence plate: 0H42W2, car: Chevrolet Spark LS)

INSERT INTO solution VALUES (
                         1,
                         'Jeremy Bowers'
                     );

SELECT value
  FROM solution;
        
--"Congrats, you found the murderer! But wait, there's more... 
--If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. 
--If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. 
--Use this same INSERT statement with your new suspect to check your answer."


  SELECT *
  FROM interview
 WHERE person_id IN (67318);


--I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
--She has red hair and she drives a Tesla Model S. 
--I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT p.*,
       d.gender,
       d.height,
       d.hair_color,
       d.car_make,
       d.car_model
  FROM drivers_license AS d
       JOIN
       person AS p ON d.id = p.license_id;

--limiting the results to red haired females of the given height that drive a Tesla Model S

WHERE d.gender = "female"
	AND d.height BETWEEN 65 AND 67
	AND d.hair_color = "red"
	AND d.car_make = "Tesla"
	AND d.car_model = "Model S"
	
--further narrowing the search by looking for her personal ID number in the list of participants of the SQL Concert:
AND p.id IN (SELECT f.person_id
	        FROM facebook_event_checkin AS f
		WHERE f.event_name = "SQL Symphony Concert");

--The mastermind is Miranda Priestly.

INSERT INTO solution VALUES (1, 'Miranda Priestly');
        
        SELECT value FROM solution;

--"Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. Time to break out the champagne!"
