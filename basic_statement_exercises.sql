SHOW databases;
USE albums_db;
SELECT database();
SHOW tables;
DESCRIBE albums;
#What is the primary key of albums table?
## The Primary Key is ID
#What does the column name represent?
## The column name represents varchar(240)
#What do you think the sales column represents?
## The sales column is a float integer which indicates it has decimales so maybe price
## but since it is float and flot can only be positive it could be a measure to avoid 
## negative inputs
SELECT artist, name FROM albums WHERE artist = "Pink Floyd"; 
#Find the name of all albums by Pink Floyd
## The Dark Side of the Moon & The Wall
SELECT name, release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
#What Year was Sgt. Peppers...release date?
## It was released in 1967
SELECT name, genre FROM albums WHERE name = "Nevermind";
#What is the genre of Nevermind?
## Nevermind
SELECT release_date, name FROM albums WHERE release_date between 1990 AND 1999;
#Which albums were released in the 1990s?
## # release_date, name
-- '1992', 'The Bodyguard'
-- '1995', 'Jagged Little Pill'
-- '1997', 'Come On Over'
-- '1996', 'Falling into You'
-- '1997', 'Let\'s Talk About Love'
-- '1991', 'Dangerous'
-- '1990', 'The Immaculate Collection'
-- '1997', 'Titanic: Music from the Motion Picture'
-- '1991', 'Metallica'
-- '1991', 'Nevermind'
-- '1999', 'Supernatural'
SELECT name, sales FROM albums WHERE sales < 20;
#which albums had < 20 million sales?
 ## # name, sales
-- 'Grease: The Original Soundtrack from the Motion Picture', '14.4'
-- 'Bad', '19.3'
-- 'Sgt. Pepper\'s Lonely Hearts Club Band', '13.1'
-- 'Dirty Dancing', '17.9'
-- 'Let\'s Talk About Love', '19.3'
-- 'Dangerous', '16.3'
-- 'The Immaculate Collection', '19.4'
-- 'Abbey Road', '14.4'
-- 'Born in the U.S.A.', '19.6'
-- 'Brothers in Arms', '17.7'
-- 'Titanic: Music from the Motion Picture', '18.1'
-- 'Nevermind', '16.7'
-- 'The Wall', '17.6'
SELECT name as low_selling_albums, sales FROM albums WHERE sales < 20;
#Renamed sales < 20 as low_selling_albums