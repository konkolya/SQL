CREATE TABLE shop (
    id         INTEGER PRIMARY KEY,
    name       TEXT,
    price      INTEGER,
    popularity INTEGER,
    pieces     INTEGER
);

INSERT INTO shop VALUES (
                     1,
                     "books",
                     10,
                     8,
                     34
                 );

INSERT INTO shop VALUES (
                     2,
                     "bikes",
                     45,
                     9,
                     43
                 );

INSERT INTO shop VALUES (
                     3,
                     "PC",
                     34,
                     9,
                     432
                 );

INSERT INTO shop VALUES (
                     4,
                     "pens",
                     3,
                     10,
                     333
                 );

INSERT INTO shop VALUES (
                     5,
                     "pencils",
                     3,
                     8,
                     343
                 );

INSERT INTO shop VALUES (
                     6,
                     "paper",
                     4,
                     9,
                     243
                 );

INSERT INTO shop VALUES (
                     7,
                     "water bottles",
                     24,
                     8,
                     943
                 );

INSERT INTO shop VALUES (
                     8,
                     "watches",
                     122,
                     5,
                     34
                 );

INSERT INTO shop VALUES (
                     9,
                     "mobile phones",
                     250,
                     10,
                     32
                 );

INSERT INTO shop VALUES (
                     10,
                     "chargers",
                     13,
                     9,
                     55
                 );

INSERT INTO shop VALUES (
                     11,
                     "tyres",
                     33,
                     5,
                     22
                 );

INSERT INTO shop VALUES (
                     12,
                     "screens",
                     120,
                     7,
                     30
                 );

INSERT INTO shop VALUES (
                     13,
                     "phones",
                     30,
                     5,
                     10
                 );

INSERT INTO shop VALUES (
                     14,
                     "sodas",
                     5,
                     10,
                     400
                 );

INSERT INTO shop VALUES (
                     15,
                     "teas",
                     10,
                     10,
                     120
                 );

--cheapest most popular items

SELECT *
  FROM shop
 WHERE popularity > 9
 ORDER BY price ASC;



--5 most popular items

SELECT name,
       price,
       popularity
  FROM shop
 ORDER BY popularity DESC
 LIMIT 5;



--largest quantities of anything

SELECT name,
       pieces
  FROM shop
 ORDER BY pieces DESC;
