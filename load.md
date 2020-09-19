<h3>LOAD<h3>
<h4> SCHEMA <h4>
In creating our relational database we choose to use <a href=”https://www.genmymodel.com/”>GenMyModel</a> to design the entity relational diagram (ERD) to generate a schema framework. We choose to use this tool for it’s ability to visual our entities (tables) in our database and generate SQL starter code to create our database.
After analyzing the *extracted* and *transformed* csv’s it was clear that a relational database was the direction to go. The *County Health Ranking Dataset* and the *Food Desert Dataset* both had clear relationship links on *State* and *Counties*; however, this was not the initial case (see challenges section).

 <h5>GenMyModel<h5>
Creating the *County Health Ranking Dataset* and the *Food Desert Dataset* tables in GenMyModel were straight forward.
![ERD Diagram](/SQL_files/ERD_Diagram.png)

Once the ERD Diagram was complete GenMyModel has a menu to generate SQL starter code for the table schema.
![SQL](/images/generate_schema.png)

The starter code that is produced from GenMyModel is messy and needs to be cleaned.
* Example – The starter SQL schema code brought in multiple foreign keys and incorrect primary keys from previous iterations of the ERD. Make these are cleaned. 

Below is a code block of the final schema sql code.

```
    CREATE TABLE IF NOT EXISTS Food_Desert_Data
(
    "State" VARCHAR(250) NOT NULL,
    "County" VARCHAR(250) NOT NULL,
    "2010_Population" INTEGER,
    Food_Desert_Population INTEGER,
    Food_Desert_Low_Income INTEGER,
    PRIMARY KEY("State", "County")
);
```

<h4>pgAdmin – PostgreSQL<h4>
In order to trial our database we choose to use the tool known as <a href=”https://www.pgadmin.org/download//”>pgAdmin 4</a>. This tool gave us the ability to trial our Postgres database real time. Several iterations took place to successfully import data and run queries. See additional details below.
![PgAdmin](/images/pgadmin_tree.png)

* Loaded the following CSVs from the resource folder
    * (needed)
    * (needed)

* Sample queries ran on pgAdmin 4 database.
    * ```
        SELECT f."County", COUNT(f."County") AS "Frequency of County"
        FROM Food_Desert_Data f
        GROUP BY "County"
        ORDER BY "Frequency of County" DESC;
    ```