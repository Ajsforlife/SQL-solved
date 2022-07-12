-- Drop table if exists
DROP TABLE firepower;

-- Create new table to import data
CREATE TABLE firepower (
	country VARCHAR,
	ISO3 VARCHAR,
	rank INT,
	TotalPopulation INT,
	ManpowerAvailable INT,
	TotalMilitaryPersonnel INT,
	ActivePersonnel INT,
	ReservePersonnel INT,
	TotalAircraftStrength INT,
	FighterAircraft INT,
	AttackAircraft INT,
	TotalHelicopterStrength INT,
	AttackHelicopters INT
);

-- Import data from firepower.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM firepower;

--alter table to add 'id' as primary key
ALTER TABLE firepower
ADD id INT;

ALTER TABLE firepower
ADD PRIMARY KEY (id);

--Find the rows that have a `ReservePersonnel` of 0 and delete these rows from the dataset.
SELECT *
FROM firepower
WHERE reservepersonnel = 0;

DELETE FROM firepower WHERE reservepersonnel = 0;

--Every country in the world at least deserves one `FighterAircraft`—it only seems fair. Let's add one to each nation that has none.
SELECT *
FROM firepower
WHERE fighteraircraft = 0;

UPDATE firepower
SET
    fighteraircraft = 1
WHERE
    fighteraircraft = 0;
    
SELECT * FROM firepower
WHERE fighteraircraft = 1;

--Oh no! By updating this column, the values within `TotalAircraftStrength` column are now off for those nations! We need to [add 1](https://stackoverflow.com/a/2680352) to the original number.
UPDATE firepower SET totalaircraftstrength = totalaircraftstrength +1;

--Find the [Averages](https://www.w3schools.com/sql/sql_count_avg_sum.asp) for `TotalMilitaryPersonnel`, 
--`TotalAircraftStrength`, `TotalHelicopterStrength`, and `TotalPopulation`, 
--and rename the columns with their designated average.
SELECT AVG(totalmilitarypersonnel)
--SELECT AVG(totalaircraftstrength)
--SELECT AVG(totalhelicopterstrength)
--SELECT AVG(totalpopulation)
FROM firepower

ALTER TABLE firepower
RENAME COLUMN totalmilitarypersonnel TO totalmilitarypersonnel_AVG_524357

SELECT * FROM firepower;


SELECT AVG(totalaircraftstrength)
--SELECT AVG(totalhelicopterstrength)
--SELECT AVG(totalpopulation)
FROM firepower

ALTER TABLE firepower
RENAME COLUMN totalaircraftstrength TO totalaircraftstrength_AVG_457


SELECT AVG(totalhelicopterstrength)
--SELECT AVG(totalpopulation)
FROM firepower

ALTER TABLE firepower
RENAME COLUMN totalhelicopterstrength TO totalhelicopterstrength_AVG_183


SELECT AVG(totalpopulation)
FROM firepower

ALTER TABLE firepower
RENAME COLUMN totalpopulation TO totalpopulation_AVG_60069024

--Add the following data for each column into the `firepower` table with the name of a country of your choice.
INSERT INTO firepower (Country, totalpopulation_AVG_60069024, totalmilitarypersonnel_AVG_524357, totalaircraftstrength_AVG_457, totalhelicopterstrength_AVG_183)
VALUES ('Netherlands',60069024, 524358, 457, 183); 
--didnt realize there was a netherlandsa already
SELECT * FROM firepower;