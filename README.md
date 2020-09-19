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
   <ul><li><strong>**See steps below for transforming county health data into a .csv file from the source website, manual cleaning was implemented</strong></li></ul>
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
 
 
 
 <br><br><br>
<h3> Challenges </h3>
<p>One of the challenges we faced was determining the dataset to pair with the food desert data. Our original choice was one with fast food restaurants to determine the ratio of these types of restaurants in food deserts vs. non-food deserts. Unfortunately, the food desert dataset contained State and County, while the fast food dataset contained State and City. We tried using a junction table to bridge the two by using a third data set, but there ended up being a lot of missing data and we felt we would lose out on much of the analysis that would have been available.</p>
<p>To solve this problem, we found another dataset that included State and County as well as some interesting health data to replace the fast food data we originally wanted to use. We felt this new dataset was a good measure of the effects of a food desert on a population and it was easier to match with the food desert data without sacrificing valuable records.</p>






    
  
