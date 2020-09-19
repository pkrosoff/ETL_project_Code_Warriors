# ETL_project_Code_Warriors
<h2>Code Warriors Team - ETL Project - University of Oregon/Trilogy Data Bootcamp</h2>
<br>
<h3>SCOPE</h3>
<br>
Team Code Warriors is planning on joining the following two datasets:
   <ul>
    <li><a href="https://www.kaggle.com/tcrammond/food-access-and-food-deserts">Census Food Deserts</a></li>
    <li><a href="https://www.countyhealthrankings.org/explore-health-rankings/rankings-data-documentation">County Health Rankings</a></li>
   </ul>
  <br>
<h3>CONNECTING</h3>
<br>
<p>We intend to connect the data on a county level by creating compound keys out of State and County name, and then joining the tables on that paramter.</p>
<br>
<h3>DATABASE TYPE</h3>
<ul>
    <li> PostGres </li>
    </ul>
<br><br>
<h1>Write-up</h1>
<br>
<h3>Initial Steps: Data <strong>Extraction</strong></h3>
<ol>
   <li>Retrieve .csv files from the data sources:
      <ul>
         <li>https://www.kaggle.com/tcrammond/food-access-and-food-deserts</li>
         <li>"https://www.countyhealthrankings.org/explore-health-rankings/rankings-data-documentation</li>
      </ul>
   </li>
   <li>Download files to local machine</li>
   <li>Save As .csv if data type is .xsls</li>
   <ul><li><strong>**See steps 9-13 in the "Data Transformation" section for transforming county health data into a .csv file from the source website, manual cleaning was implemented</strong></li></ul>
   <li>A data dictionary from the original source website was also saved for clarification of data used for the county health rankings data</li>
   <li>Create a GitHub repository for this project to hold resource data files, jupyter notebook files, and SQL files</li>
   <li>Clone the project repository to your local machine. 
      <ul>
         <li><strong>DO NOT clone this repository inside an existing repository</strong></li>
      </ul>
   </li>
   <li>Relocate downloaded data files into the repository folder</li>
   <li>Commit changes to GitHub frequently, as necessary</li>
   </ol>
<br>
<h3>Data Transformation: Cleaning and Restructuring Raw Data</h3>
<ol>
   <li>Create a new jupyter notebook .ipynb file inside your local repository folder</li>
   <li>Using Pandas, read in food desert .csv file for cleaning and restructuring</li>
   <li>Determine which columns of data are of interest to your project</li>
   <li>Restructure dataframes to include only the columns of interest</li>
   <li>Ensure State names and County names follow the same Abbreviation, spelling, and capitalization format</li>
   <li>In tables where more than one row per County and State combination exists, Group by State and County</li>
   <li>Sum the columns of the State and County to find the population in each county that is represented by each column header</li>
   <li>Rename column headers to maintain clarity of values being identified</li>
   <ul>
      <li>The code for reading the raw food desert data, cleaning, transforming, and exporting the cleaned .csv files can be found <a href="jupyter_notebooks/food_desert_data_cleaning.ipynb">here</a></li>
      <li>Run this code on your local machine:
         <ul><li>Save the code file into your jupyter_notebooks folder in your local copy of the repository</li>
            <li>Navigate to the file in your terminal on your machine</li>
            <li>Launch jupyter notebook</li>
            <li>Run all kernels</li></ul>
   </ul>
   <br>
   <li>**For the county health rankings data .xsls file, navigate to the workbook titled "Ranked Measure Data" and save that workbook specifically as its own .xsls file independent of the other workbooks, we only evaluated data from this specific workbook from this file</li>
   <li>This document was cleaned manually by highlighting the desired columns, copying their contents, and removing the rest</li>
   <li>The columns we chose to include were:
      <ol>
         <li>Premature Death: Years of Potential Life Lost Rate<li>
         <li>%Fair/Poor Health</li>
         <li>Avg. Physically Unhealthy Days</li>
         <li>Avg. Mentally Unhealthy Days</li>
         <li>%Adult Smokers</li>
         <li>% Adult Obesity</li>
         <li>Food Environment Index</li>
         <li>%Physically Inactive</li>
         <li>%Excessive Drinking<li>
         <li>Graduation Rate %</li>
         <li>% Some College</li>
         <li>% Unemployed</li>
         <li>% Children in Poverty</li>
         <li>Income Raito</li>
      </ol></li>
   <li>The first header row of the document was removed</li> 
   <li>The document was Saved As a new .csv format</li>
   </ol>
 
 
<h3>Loading Data into a Database<h3>
<h4> Schema </h4>
In creating our relational database we choose to use <a href=”https://www.genmymodel.com/”>GenMyModel</a> to design the entity relational diagram (ERD) to generate a schema framework. We choose to use this tool for it’s ability to visual our entities (tables) in our database and generate SQL starter code to create our database.
   After analyzing the <strong>extracted</strong> and <strong>transformed</strong> csv’s it was clear that a relational database was the direction to go. The <strong>County Health Ranking Dataset</strong> and the <strong>Food Desert Dataset</strong> both had clear relationship links on <strong>State</strong> and <strong>Counties</strong>; however, this was not the initial case (see challenges section).

<h5>GenMyModel</h5>
<ol>
<li>Creating the *County Health Ranking Dataset* and the *Food Desert Dataset* tables in GenMyModel were straight forward.
<img src=SQL_Files/ERD_Diagram.png></li>

<li>Once the ERD Diagram was complete GenMyModel has a menu to generate SQL starter code for the table schema.
<img src=images/generate_schema.PNG></li>

<li>The starter code that is produced from GenMyModel is messy and needs to be cleaned</li>
<ul><li>The starter SQL schema code brought in multiple foreign keys and incorrect primary keys from previous iterations of the ERD which needs to be cleaned </li>

<li>Below is the cleaned code block for the final schema sql code:

```
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
```
</li></ul></ol>
<h5>pgAdmin – PostgreSQL</h5>
In order to trial our database we choose to use the tool known as <a href=”https://www.pgadmin.org/download//”>pgAdmin 4</a>. This tool gave us the ability to trial our Postgres database real time. Several iterations took place to successfully import data and run queries. See additional details below.
<img src=images/pgadmin_tree.PNG>

<ol>
   <li>Create a new database in PgAdimn
      <ul><li>Open the "Query Tool"</li>
         <li>Copy <a href=SQL_Files/schema.sql>schema file</a> contents into query tool</li>
         <li>Run code block</li></ul>
         
   <li>Load the CSVs from the resource folder
    <ol>
       <li>Open the "Schema" tab in the database navigation menu</li>
       <li>Open "Tables" dropdown section</li>
       <li>Select the 2019_US_County_Health_Rankings table</li>
       <li>Right click-->Import/Export</li>
       <li>Select slider to read "Import"</li>
       <li>Navigate to the .csv file in your local machine</li>
       <li>Select "header"=yes, delimiter= ",", format=".csv"</li>
       <li>Copy steps 2-7 using Food_Desert_Data</li>
       <li><img src=images/
     </ol></li>
   <li>Sample queries ran on pgAdmin 4 database:
    ```
        SELECT f."County", COUNT(f."County") AS "Frequency of County"
        FROM Food_Desert_Data f
        GROUP BY "County"
        ORDER BY "Frequency of County" DESC;
    ```
   </li>
       <li> (another sample query?)</li>
      </ul></li>


 
 
 
 <br><br><br>
<h3> Challenges </h3>
<p>One of the challenges we faced was determining the dataset to pair with the food desert data. Our original choice was one with fast food restaurants to determine the ratio of these types of restaurants in food deserts vs. non-food deserts. Unfortunately, the food desert dataset contained State and County, while the fast food dataset contained State and City. We tried using a junction table to bridge the two by using a third data set, but there ended up being a lot of missing data and we felt we would lose out on much of the analysis that would have been available.</p>
<p>To solve this problem, we found another dataset that included State and County as well as some interesting health data to replace the fast food data we originally wanted to use. We felt this new dataset was a good measure of the effects of a food desert on a population and it was easier to match with the food desert data without sacrificing valuable records.</p>






    
  
