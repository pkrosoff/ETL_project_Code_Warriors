-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS Food_Desert_Data
(
    
    "State" VARCHAR(250) NOT NULL,
    "County" VARCHAR(250) NOT NULL,
    "2010_Population" INTEGER,
    Food_Desert_Population INTEGER,
    Food_Desert_Low_Income INTEGER,
    PRIMARY KEY("State", "County")
    
);

CREATE TABLE IF NOT EXISTS "2019_US_County_Health_Rankings"
(
    FIPS INTEGER,
    "State" VARCHAR(250) NOT NULL,
    "County" VARCHAR(250) NOT NULL,
    "Years of Potential Life Lost Rate" INTEGER,
    "% Fair/Poor Health" DECIMAL,
    "Avg. Physically Unhealthy Days" DECIMAL,
    "Avg. Mentally Unhealthy Days" DECIMAL,
    "% Adult Smokers" DECIMAL,
    "% Adult Obesity" DECIMAL,
    "Food Environment Index" DECIMAL,
    "% Physically Inactive" DECIMAL,
    "% Excessive Drinking" DECIMAL,
    "Graduation Rate %" DECIMAL,
    "% Some College" DECIMAL,
    "% Unemployed" DECIMAL,
    "% Children in Poverty" DECIMAL,
    "Income Ratio" DECIMAL,
    PRIMARY KEY("State", "County")
);

-- Create Indexes
-- Recommended IMPORT CSV FILE ORDER: 2019_US_County_Health_Rankings, Food_Desert_Data
