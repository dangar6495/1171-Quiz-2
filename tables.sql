

CREATE TABLE albums(
albumID INT NOT NULL,
albumName VARCHAR(100) NOT NULL,
artist VARCHAR(100) NOT NULL,
year int NOT NULL, 
PRIMARY KEY (albumID)
);

INSERT INTO albums VALUES (1,'The Slow Rush', 'Tame Impala',2020),
(2,'In Rainbows', 'Radiohead',2007),
(3,'Kid A', 'Radiohead',2000),
(4,'Currents', 'Tame Impala',2015),
(5,'Reflektor', 'Arcade Fire',2013),
(6,'get to Heaven', 'Everythhing Everythhing',2015),
(7,'Melophobia', 'Cage The Elephant',2013),
(8,'Lonerism', 'Tame Impala',2012),
(9,'InnerSpeaker', 'Tame Impala',2010),
(10,'OK Computer', 'Radiohead',1997);

CREATE TABLE tracks(
trackID INT NOT NULL,
title VARCHAR(100) NOT NULL,
length VARCHAR(100) NOT NULL, 
PRIMARY KEY (trackID)
);

INSERT INTO tracks VALUES (1,'Breath Deeper','6:13'),
(2,'Is it True','3:58'),
(3,'Borderline','3:58'),
(4,'15 Step','3:58'),
(5,'Jigsaw Falling Into Place','4:09'),
(6,'Idioteque','5:09'),
(7,'Optimistic','5:16'),
(8,'How to Disappear Completely','5:56'),
(9,'let it Happen','7:47'),
(10,'Joan of Arc','5:26'),
(11,'Paranoid Android','6:24'),
(12,'No Surprises','3:49'),
(13,'Let Down','4:59');

CREATE TABLE album_track(
id serial PRIMARY KEY,
albumID integer REFERENCES albums(albumID),
trackID integer REFERENCES tracks(trackID)
);

INSERT INTO album_track(trackID,albumID)
VALUES
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,3),
(7,3),
(8,3),
(9,4),
(10,5),
(11,10),
(12,10),
(13,10),
(2,10),
(12,3),
(13,3),
(3,10),
(6,6),
(7,7),
(8,8),
(13,9),
(9,7),
(12,9);

--question 5
SELECT A.albumName as album, STRING_AGG(T.title, ', ') AS tracks FROM album_track AS AT INNER JOIN albums as A ON A.albumID = AT.albumID INNER JOIN tracks AS T ON AT.trackID = T.trackID GROUP BY A.albumName ORDER BY A.albumName ASC;

--question 6
SELECT T.title as track, STRING_AGG(A.albumName, ', ') AS albums FROM album_track AS AT INNER JOIN albums as A ON A.albumID = AT.albumID INNER JOIN tracks AS T ON AT.trackID = T.trackID GROUP BY T.title ORDER BY T.title ASC;

--question 7
SELECT A.albumName as  album , COUNT(*) AS Track_COUNT FROM album_track AS AT INNER JOIN albums as A ON A.albumID = AT.albumID INNER JOIN tracks AS T ON AT.trackID = T.trackID GROUP BY A.albumName ORDER BY A.albumName ASC;

--question 8
SELECT T.title as  track , COUNT(*) AS Album_COUNT FROM album_track AS AT INNER JOIN albums as A ON A.albumID = AT.albumID INNER JOIN tracks AS T ON AT.trackID = T.trackID GROUP BY T.title ORDER BY T.title ASC;

--normal innerjoin
SELECT A.albumName as  album , T.title AS Tracks FROM album_track AS AT INNER JOIN albums as A ON A.albumID = AT.albumID INNER JOIN tracks AS T ON AT.trackID = T.trackID ORDER BY A.albumName ASC;