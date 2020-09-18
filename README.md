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
   <li>Create a GitHub repository for this project to hold .csv files and jupyter notebook files</li>
   <li>Clone the project repository to your local machine. 
      <ul>
         <li><strong>DO NOT clone this repository inside an existing repository</strong></li>
      </ul>
   </li>
   <li>Relocate downloaded .csv files into the repository folder</li>
   <li>Commit changes to GitHub frequently, as necessary</li>
   </ol>
<br>
<h3>Data Transformation: Cleaning and Restructuring Raw Data</h3>
<ol>
   <li>Create a new jupyter notebook .ipynb file inside your local repository folder</li>
   <li>Using Pandas, read in both .csv files for cleaning and restructuring</li>
   <ul>
      <li>The code for reading, cleaning, transforming, and exporting the .csv files can be found <a href="link_to_jupyter_notebook_file">here</a></li>
   </ul>
   <li>Determine which columns of data are of interest to your project</li>
   <li>Restructure dataframes to include only the columns of interest</li>
   <li>Ensure State names and County names follow the same Abbreviation, spelling, and capitalization format</li>
   <li>In tables where more than one row per County and State combination exists, Group by State and County</li>
   <li>Sum the columns of the State and County to find the population in each county that is represented by each column header</li>
   <li>Rename column headers to maintain clarity of values being identified</li>
   </ol>
 
    
  
