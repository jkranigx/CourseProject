#Code Book for Smart Phone Tidy Data Set Produced by run_analysis.R Script

##Data Overview

This code book provides a desciption of the variables and data in the 
data set produced by the run_analysis.R script. The source data contains
readings from subjects' smartphones captured while the subject performed 
specific physical activities. This raw data contains multiple  phone sensor readings
for each subject for each activity. The run_analysis.R script summarizes 
this data for each combination of subject and activity.

##Tidy Data Set Variables

SubjectId - SubjectId is an integer value representing a particular subject (person) 
in the experiment. The experiment included 30 subjects so the SubjectId includes the 
values 1 - 30.

ActivityLabel - A descriptive text label for each of the 6 activities 
subjects performed in the test. The possible values for ActivityLabel
are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,
and LAYING.
 
variable - The name of the summarized variable. Each variable represents a type of 
reading taken from one of the phone's sensors. For more specific details on
individual reading data see 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

mean - The mean value for each one of the variables described above.
