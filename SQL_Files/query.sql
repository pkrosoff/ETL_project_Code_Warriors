
-- Testing that uploaded data from 2019_US_County_Health_Rankings.csv works
-- NOTE: Need to wrap table 2019_US_County_Health_Rankings in "" because it starts with a digit
SELECT *
FROM "2019_US_County_Health_Rankings"
LIMIT 5;

SELECT *
FROM food_desert_data
LIMIT 5;

-- List the following details of each county
-- county's that start with the letter B, population, food desert population, years of potential life lost in 2019
SELECT f."County", f."State", "2010_Population", f.Food_Desert_Population, h."Years of Potential Life Lost Rate"
FROM Food_Desert_Data f
INNER JOIN "2019_US_County_Health_Rankings" h ON
f."State" = h."State" AND f."County" = h."County"
WHERE f."County" LIKE 'B%';

-- In descending order, list the frequency of county's, i.e., how many states share county names
SELECT f."County", COUNT(f."County") AS "Frequency of County"
FROM Food_Desert_Data f
GROUP BY "County"
ORDER BY "Frequency of County" DESC;