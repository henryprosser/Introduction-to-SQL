-- https://replit.com/@henryprosser/Databases-Lab-1-Intro-to-SQL#main.sql --

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1), checkups SMALLINT UNSIGNED, birth DATE, death DATE);

INSERT INTO pet (name,owner,species,sex,checkups,birth,death)VALUES
('Fluffy','Harold','cat','f',5,'2001-02-04',NULL),
('Claws','Gwen','cat','m',2,'2000-03-17',NULL),
('Buffy','Harold','dog','f',7,'1999-05-13',NULL),
('Fang','Benny','dog','m',4,'2000-08-27',NULL),
('Bowser','Diane','dog','m',8,'1998-08-31','2001-07-29'),
('Chirpy','Gwen','bird','f',0,'2002-09-11',NULL),
('Whistler','Gwen','bird','',1,'2001-12-09',NULL),
('Slim','Benny','snake','m',5,'2001-04-29',NULL);

----------------------------- QUESTION 1 -----------------------------
-- 1.1 --
.print "Q1-1. The names of owners and their pet's name for all pets who are female."
SELECT owner, name FROM pet WHERE sex = "f";
.print

-- 1.2 --
.print "Q1-2. The names and birth dates of pets which are dogs."
SELECT name, birth FROM pet WHERE species = "dog";
.print

-- 1.3 --
.print "Q1-3. The names of the owners of birds."
SELECT DISTINCT owner FROM pet WHERE species = "bird";
.print

-- 1.4 --
.print "Q1-4. The species of pets who are female."
SELECT species FROM pet WHERE sex = "f";
.print

-- 1.5 --
.print "Q1-5. The names and birth dates of pets which are cats or birds."
SELECT name, birth FROM pet WHERE species = "cat" OR species = "bird";
.print

-- 1.6 --
.print "Q1-6. The names and species of pets which are cats or birds and which are female."
SELECT name, species FROM pet WHERE sex IS ("f") AND species = "cat" OR sex is ("f") AND species = "bird"; 
.print

----------------------------- QUESTION 2 -----------------------------
-- 2.1 --
.print "Q2-1. The names of owners and their pets where the pet's name ends with 'er' or 'all'"
SELECT owner, name FROM pet WHERE name LIKE "%er" or "%all";
.print

-- 2.2 --
.print "Q2-2. The names of any pets whose owner's name contains an 'e'"
SELECT name FROM pet WHERE owner LIKE "%e%";
.print

-- 2.3 --
.print "Q2-3. The names of all pets whose name does not end with 'fy'"
SELECT name FROM pet WHERE name NOT LIKE "%fy";
.print

-- 2.4 --
.print "Q2-4. All pet names whose owners name is only four characters long"
SELECT name FROM pet WHERE LENGTH(owner) = 4;
.print

-- 2.5 --
.print "Q2-5. All owners whose names begin and end with one of the first five letters of the alphabet"
SELECT owner FROM pet WHERE 
(SUBSTR(OWNER,1,1) IN ('A','B','C','D','E') OR SUBSTR(OWNER,1,1) IN ('a','b','c','d','e')) 
AND 
(SUBSTR(OWNER,-1,1) IN ('A','B','C','D','E') OR SUBSTR(OWNER,-1,1) IN ('a','b','c','d','e')); 
.print

----------------------------- QUESTION 3 -----------------------------
-- 3.1 --
.print "Q3-1. The average number of check-ups that each owner has made with their pets"
SELECT owner, AVG(checkups) FROM pet GROUP BY owner;
.print

-- 3.2 --
.print "Q3-2. The number of pets of each species in ascending order"
SELECT species, COUNT(species) FROM pet GROUP BY species ORDER BY COUNT(species);
.print

-- 3.3 --
.print "Q3-3. The number of pets of each species that each owner has"
SELECT owner, species, COUNT(species) FROM pet GROUP BY owner, species;
.print

-- 3.4 --
.print "Q3-4. The number of distinct species of pet each owner has"
SELECT owner, COUNT(DISTINCT species) FROM pet GROUP BY owner;
.print

-- 3.5 --
.print "Q3-5. The number of pets of each gender there are in the database, where the gender is known"
SELECT sex, COUNT(sex) FROM pet WHERE sex IS NOT ('') GROUP BY sex;
.print

-- 3.6 --
.print "Q3-6. The number of birds each owner has"
SELECT owner, COUNT(species) FROM pet WHERE species = 'bird' GROUP BY owner;
.print

-- 3.7 --
.print "Q3-7. The total number of check-ups each owner has made with all their pets"
SELECT owner, SUM(checkups) FROM pet GROUP BY owner;
.print