--For this project, I downloaded Spotify data from Kaggle.
--Then I created a table to insert Spotify data into.
--Finally, I performed analytics on the data using SQL. 

--Creating the table: 

CREATE TABLE BIT_DB.Spotifydata (
    id               INTEGER        PRIMARY KEY,
    artist_name      VARCHAR        NOT NULL,
    track_name       VARCHAR        NOT NULL,
    track_id         VARCHAR        NOT NULL,
    popularity       INTEGER        NOT NULL,
    danceability     DECIMAL (4, 3) NOT NULL,
    energy           DECIMAL (4, 3) NOT NULL,
    [key]            INTEGER        NOT NULL,
    loudness         DECIMAL (5, 3) NOT NULL,
    mode             INTEGER        NOT NULL,
    speechiness      DECIMAL (5, 4) NOT NULL,
    acousticness     DECIMAL (6, 5) NOT NULL,
    instrumentalness TEXT           NOT NULL,
    liveness         DECIMAL (5, 4) NOT NULL,
    valence          DECIMAL (4, 3) NOT NULL,
    tempo            DECIMAL (6, 3) NOT NULL,
    duration_ms      INTEGER        NOT NULL,
    time_signature   INTEGER        NOT NULL
);

--Then I inserted the Spotify Data .csv into the table.
--Next, I explored the data using the following SQL. 

SELECT *
  FROM Spotifydata;

-- TOP 15 most popular songs of 2021

SELECT artist_name,
       track_name,
       popularity
  FROM Spotifydata
 ORDER BY popularity DESC
 LIMIT 15;


-- The 15 most danceable popular songs of 2021

SELECT artist_name,
       track_name,
       popularity,
       danceability
  FROM Spotifydata
 ORDER BY danceability DESC,
          popularity DESC
 LIMIT 15;


--Calculate the average popularity for the artists in the Spotify data table. 

SELECT AVG(popularity) 
  FROM Spotifydata;

--Then, for every artist with an average popularity of 90 or above, show their name, their average popularity, and label them as a “Top Star”.

WITH popularity_average_CTE AS (
    SELECT s.artist_name,
           AVG(s.popularity) AS average_popularity
      FROM SpotifyData s
     GROUP BY s.artist_name
)
SELECT artist_name,
       average_popularity,
       'Top Star' AS tag
  FROM popularity_average_CTE
 WHERE average_popularity >= 90;
