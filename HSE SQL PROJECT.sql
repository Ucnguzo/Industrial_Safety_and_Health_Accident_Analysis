##CREATING A DATABASE
CREATE DATABASE HSE_PROJECT;

/*THIS IS TO USE THE DATABASE, TO MAKE IT ACTIVE*/
USE HSE_PROJECT;

CREATE TABLE ihmstefanini_industrial_safety_and_health_database;

SELECT * FROM ihmstefanini_industrial_safety_and_health_database;

/*RENAMING THE TABLE TO SAFETY AND HEALTH*/
RENAME TABLE ihmstefanini_industrial_safety_and_health_database TO SAFETY_AND_HEALTH;


##Rename the columns with  Alter Statement
ALTER TABLE safety_and_health RENAME column `Employee ou Terceiro` TO `Employee Third Party`,
RENAME COLUMN `Risco Critico` TO `Critical Risk`;

ALTER TABLE safety_and_health RENAME column Genre TO Gender;

ALTER TABLE safety_and_health RENAME column DATA TO Date;

##HOW TO CREATE A NEW COLUMN FOR SERIAL NUMBER
Alter Table safety_and_health
Add column `S/N` int primary key auto_increment first;

Alter table safety_and_health
ADD Column Accident_Level varchar(50) after `Accident Level`;

Alter table safety_and_health
ADD column Potential_Accident_Level varchar(50) after `Potential Accident Level`;

Alter Table safety_and_health
ADD Column Year varchar(50) after Date;

Alter Table safety_and_health
ADD Column Day varchar(50) after Date;

Alter Table safety_and_health
ADD Column Month varchar(50) after Day;


SELECT * FROM safety_and_health;

SET SQL_SAFE_UPDATES = 0;

/*Insert values*/
Update safety_and_health
Set Accident_Level = Case `Accident level`
WHEN 'I' THEN 'Negligible'
WHEN 'II' THEN 'Minor'
WHEN 'III' THEN 'Moderate'
WHEN 'IV' THEN 'Major'
WHEN 'V' THEN 'Critical'
ELSE Accident_Level
END;


Update safety_and_health
Set Potential_Accident_Level = Case `Potential Accident level`
WHEN 'I' THEN 'Negligible'
WHEN 'II' THEN 'Low Risk'
WHEN 'III' THEN 'Moderate Risk'
WHEN 'IV' THEN 'High Risk'
WHEN 'V' THEN 'Very High Risk'
WHEN 'VI' THEN 'Extreme Risk'
ELSE Potential_Accident_Level
END;

SELECT *FROM safety_and_health;

Alter Table safety_and_health
ADD Column `Compensation Amount $` varchar(50) after `Critical Risk`;


/*Insert values*/
Update safety_and_health
Set `Compensation Amount $` = Case `Accident level`
WHEN 'I' THEN 1200
WHEN 'II' THEN 1800
WHEN 'III' THEN 2500
WHEN 'IV' THEN 3000
WHEN 'V' THEN 4000
ELSE `Compensation Amount $`
END;

SELECT  `Compensation Amount $`, count(*)
FROM safety_and_health
Group by `Compensation Amount $`;

SELECT `Industry sector`, local, countries, gender, `Compensation Amount $` FROM safety_and_health;

SELECT * FROM safety_and_health
WHERE `Compensation Amount $` >= 2000
ORDER BY  Gender ASC;

SELECT Date, `Compensation Amount $` FROM safety_and_health
WHERE `Compensation Amount $` >1000 AND year(Date) = 2017
ORDER BY `Compensation Amount $`;

SELECT *FROM safety_and_health;

##HOW TO DROP A COLUMN FROM A TABLE
Alter Table safety_and_health
Drop column Date,
Drop column `Accident Level`,
Drop column `Potential Accident Level`;


SELECT GENDER, count(*) AS COUNT
FROM safety_and_health
WHERE GENDER IN ('MALE', 'FEMALE')
GROUP BY GENDER;

##HOW TO GET YEAR FROM THE DATE AND UPDATE IT IN THE COLUMN
Select Year(Date) AS Incidence_Year
From safety_and_health;

UPDATE safety_and_health
SET  Year = Year(Date);

##HOW TO GET DAYNAME FROM THE DATE AND UPDATE IT IN THE COLUMN
Select Dayname(Date) AS Incidence_Day
From safety_and_health;

UPDATE safety_and_health
SET  Day = Dayname(Date);

##HOW TO GET MONTHNAME FROM THE DATE AND UPDATE IT IN THE COLUMN
Select Monthname(Date) AS Incident_month
From safety_and_health;

UPDATE safety_and_health
SET  Month = Monthname(Date);

Select `S/N` from safety_and_health;

SELECT *FROM safety_and_health;

## HOW TO PERFORM A GROUP BY FUNCTION
SELECT ACCIDENT_LEVEL, COUNT(*) AS COUNT
FROM safety_and_health
GROUP BY ACCIDENT_LEVEL;


SELECT *FROM safety_and_health;


