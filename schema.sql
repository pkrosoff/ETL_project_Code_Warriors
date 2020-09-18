-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS Food_Desert_Data
(
    
    "State" VARCHAR(250) NOT NULL UNIQUE,
    "County" VARCHAR(250) NOT NULL UNIQUE,
    2010_Population INTEGER,
    Food_Desert_Population INTEGER,
    Food_Desert_Low_Income INTEGER,
    PRIMARY KEY(State, County)
    
);

CREATE TABLE IF NOT EXISTS 2019_US_County_Health_Rankings
(
    FIPS INTEGER,
    "State" VARCHAR(250) NOT NULL UNIQUE,
    "County" VARCHAR(250) NOT NULL UNIQUE,
    "Years of Potential Life Lost Rate" INTEGER,
    "% Fair/Poor Health" INTEGER,
    "Avg. Physically Unhealthy Days" INTEGER,
    "Avg. Mentally Unhealthy Days" INTEGER,
    "% Adult Smokers" INTEGER,
    "% Adult Obesity" INTEGER,
    "Food Environment Index" INTEGER,
    "% Physically Inactive" INTEGER,
    "% Excessive Drinking" INTEGER,
    "Graduation Rate %" INTEGER,
    "% Some College" INTEGER,
    "% Unemployed" INTEGER,
    "% Children in Poverty" INTEGER,
    "Income Ratio" INTEGER,
    PRIMARY KEY(State, County)
);


-- Create FKs       
ALTER TABLE "Food Desert Data"
    ADD    FOREIGN KEY (State)
    REFERENCES "2019 U.S County Health Rankings"(State)
    MATCH FULL
;
    
ALTER TABLE "2019 U.S County Health Rankings"
    ADD    FOREIGN KEY (State)
    REFERENCES "Food Desert Data"(State)
    MATCH SIMPLE
;
    

-- Create Indexes

