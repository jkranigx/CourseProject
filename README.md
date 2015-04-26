# Using run_analysis.R Script to Generate a Tidy Data Set

This README file contains information about how to use the 
contained run_analysis.R script to generate a tidy summary data set 
from the "UC Irvine Human Activity Recognition Using 
Smartphones Data Set". In addition, this file describes how the
run_analysis.R script works.

## Generating the Tidy Data Set

To generate the tidy data set, follow these steps:

1. Unpack the input data 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   to a disk directory.
2. Download the script run_analysis.R to the same directory.
3. Start R Studio.
4. Make the R Studio working directory the same directory you 
   unpacked the source data to.
5. In the R Studio Console, type the following to source the 
   run_activity.R script:
       source('~/Coursera/run_analysis.R')
6. In the R Studio Console, execute the script by typing
       run_analysis()

The script generates the data file

smart_phone_data.txt

which will be located in your working directory. 

## How the run_analysis.R Script Works

1. Reads the UCI HAR dataset files from disk.
   Note: the function assumes the data set is
   located in the "UCI HAR Dataset" directory
   which must be a subdirectory of the working
   directory.
2. Combines the subject, activities, and sensor 
   readings into one data set for training and 
   test data.
3. Combines the test and training data into
   one data set.
4. Removes all sensor reading columns except 
   those representing mean and standard
   deviation from the data set.
5. Produces a summary data set from the 
   combined data set with the mean reading
   for each combination of subject and
   activity.

