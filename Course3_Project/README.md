README.md file by Sergio Gregorio (Jan 31, 2016)
================================================================

This document enumerates the steps you need to take to replicate my analysis. 

1. Download the raw data here:

   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

   Full description of the data set can be found here:

   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2. Unzip the file to your preferred location or directory.  For purposes of this 
   document, the root directory of the unzipped files shall be referred to as 
   ZIP_ROOT.   

3. If you have not done this yet, go to this Github repo (mine - Serge) and download 
   a copy of the run_analyis.R script:
   
   https://github.com/segregorio/datasciencecoursera/tree/master/Course3_Project

   Copy the R script into ZIP_ROOT folder.  Optionally, you may also download
   other related files from the repo such as codebook.txt and the output data 
   sets.

4. Run R or RStudio.  

5. Set the working directory to ZIP_ROOT.  For example, if ZIP_ROOT is 
   "C:/DS/c3/data/assign", type the following in your R prompt:

   > setwd("C:/DS/c3/data/assign") 

6. Verify if your analysis script and other data files are indeed in ZIP_ROOT with 
   this command:

   > dir()

7. Run the run_analysis.R script like below:

   > source("run_analysis.R")
   > run_analysis()

   Optionally, you may want to save the result in a variable like this:

   > source("run_analysis.R")
   > mydata <- run_analysis()

   The script returns the large data set (merger of training and test sets) by default.

8. Open ZIP_ROOT in your file explorer.  You should see the following files:

   all_data.txt - This is the output data set required by STEP 1 of the project. 
   summary_data.txt - This is the output data set required by STEP 5 of the project.  

   You're done!