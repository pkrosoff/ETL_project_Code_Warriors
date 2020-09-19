
-- This SQL query finds the total population of each state and the number of people in food deserts with low income.
-- It also shows the percentage of the population in food deserts with low income for each state.
SELECT f."State",  SUM(f."food_desert_low_income"), SUM(f."2010_Population"), 
	ROUND((CAST(SUM(f."food_desert_low_income") AS numeric) / CAST(SUM(f."2010_Population") AS numeric) * 100),0) AS "% Food Desert Low Income"
FROM "food_desert_data" f
GROUP BY f."State"
ORDER BY "% Food Desert Low Income" DESC

-- This SQL query finds the average percentage of people who report fair/poor health for each state.
SELECT h."State", ROUND(AVG(h."% Fair/Poor Health"),0) AS "Avg % Fair/Poor Health" 
FROM "2019_US_County_Health_Rankings" h
GROUP BY h."State"
ORDER BY "Avg % Fair/Poor Health" DESC

-- This SQL query combines the above queries to display both the percentage population in food deserts with low income and percentage of people who report fair/poor health for each state.
-- It is ordered by percentage population in food deserts with low income in each state.
SELECT f."State", 
	ROUND((CAST(SUM(f."food_desert_low_income") AS numeric) / CAST(SUM(f."2010_Population") AS numeric) * 100),0) AS "% Food Desert Low Income",
	ROUND(AVG(h."% Fair/Poor Health"),0) AS "% Fair/Poor Health"
FROM "food_desert_data" f
INNER JOIN "2019_US_County_Health_Rankings" h ON f."State" = h."State" AND f."County" = h."County"
GROUP BY f."State"
ORDER BY "% Food Desert Low Income" DESC

-- This SQL query combines the above queries to display both the percentage population in food deserts with low income and percentage of people who report fair/poor health for each state.
-- It is ordered by percentage of people who report fair/poor health for each state.
SELECT f."State", 
	ROUND((CAST(SUM(f."food_desert_low_income") AS numeric) / CAST(SUM(f."2010_Population") AS numeric) * 100),0) AS "% Food Desert Low Income",
	ROUND(AVG(h."% Fair/Poor Health"),0) AS "% Fair/Poor Health"
FROM "food_desert_data" f
INNER JOIN "2019_US_County_Health_Rankings" h ON f."State" = h."State" AND f."County" = h."County"
GROUP BY f."State"
ORDER BY "% Fair/Poor Health" DESC