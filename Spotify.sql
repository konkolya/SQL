# For this project, I downloaded Spotify data from Kaggle.
# Then I created a table to insert Spotify data into.
# Finally, I performed analytics on the data using SQL. 

#Creating the table: 
CREATE TABLE BIT_DB.Spotifydata (
id integer PRIMARY KEY,
artist_name varchar NOT NULL,
track_name varchar NOT NULL,
track_id varchar NOT NULL,
popularity integer NOT NULL,
danceability decimal(4,3) NOT NULL,
energy decimal(4,3) NOT NULL,
key integer NOT NULL,
loudness decimal(5,3) NOT NULL,
mode integer NOT NULL,
speechiness decimal(5,4) NOT NULL,
acousticness decimal(6,5) NOT NULL,
instrumentalness text NOT NULL,
liveness decimal(5,4) NOT NULL,
valence decimal(4,3) NOT NULL,
tempo decimal(6,3) NOT NULL,
duration_ms integer NOT NULL,
time_signature integer NOT NULL 
)

#Then I inserted the Spotify Data .csv into the table.

#Next, I explored the data using the following SQL. 
SELECT * FROM Spotifydata;

-- TOP 15 most popular songs of 2021

SELECT artist_name, track_name, popularity 
FROM Spotifydata
ORDER BY popularity DESC
LIMIT 15;


-- The 15 most danceable popular songs of 2021

SELECT artist_name, track_name, popularity, danceability
FROM Spotifydata
ORDER BY danceability DESC, popularity DESC
LIMIT 15;


--Calculate the average popularity for the artists in the Spotify data table. 

SELECT AVG (popularity) FROM Spotifydata;

--Then, for every artist with an average popularity of 90 or above, show their name, their average popularity, and label them as a “Top Star”.

WITH popularity_average_CTE AS (
SELECT s.artist_name,
AVG(s.popularity) AS average_popularity
FROM SpotifyData s 
GROUP BY s.artist_name
)
 
SELECT  artist_name,
        average_popularity,
        'Top Star' AS tag
FROM popularity_average_CTE
WHERE average_popularity>=90;
