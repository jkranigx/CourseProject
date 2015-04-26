# run_analysis.R
# The run_analysis function:
# 1. Reads the UCI HAR dataset files from disk.
#    Note: the function assumes the data set is
#    located in the "UCI HAR Dataset" directory
#    which must be a subdirectory of the working
#    directory.
# 2. Combines the subject, activities, and sensor 
#    readings into one data set for training and 
#    test data.
# 3. Combines the test and training data into
#    one data set.
# 4. Removes all sensor reading columns except 
#    those representing mean and standard
#    deviation from the data set.
# 5. Produces a summary data set from the 
#    combined data set with the mean reading
#    for each combination of subject and
#    activity.

run_analysis = function() {
    
    #read activity and feature names.
    activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt", 
                               header=FALSE, sep="")
    
    names(activityLabels) <- c("ActivityId", "ActivityLabel")
    
    features <- read.csv("UCI HAR Dataset/features.txt", 
                         header=FALSE,sep="")
    
    # Read test data.
    testSubjects <- read.csv("UCI HAR Dataset/test/subject_test.txt", 
                        header=FALSE,sep="")
    
    testActivities <- read.csv("UCI HAR Dataset/test/y_test.txt", 
                        header=FALSE,sep="")
    
    testReadings <- read.csv("UCI HAR Dataset/test/X_test.txt", 
                        header=FALSE,sep="")
    
    # Combine subjects, activities, and readings for test data.
    testData <- cbind(testSubjects,testActivities,testReadings)
    
    
    # Read training data
    trainSubjects <- read.csv("UCI HAR Dataset/train/subject_train.txt", 
                             header=FALSE,sep="")
    
    trainActivities <- read.csv("UCI HAR Dataset/train/y_train.txt", 
                               header=FALSE,sep="")
    
    trainReadings <- read.csv("UCI HAR Dataset/train/X_train.txt", 
                             header=FALSE,sep="")
    
    # Combine subjects, activities, and readings for training data.
    trainData <- cbind(trainSubjects,trainActivities,trainReadings)
    
    #append training data to test data.
    combinedData <- rbind(testData, trainData)
    
    #set column names for combined data frame
    names(combinedData) <- c("SubjectId", "ActivityId");
    names(combinedData)[3:563] <- as.vector(features[,2])
    
    #merge the activity labels into the combined data.
    mergedCombinedData <- merge(activityLabels, combinedData, by.x="ActivityId", by.y="ActivityId")
 
    #Reduce reading cols in data frame to only those with mean or std in cole name.
    selectedCols <- c(2:3, grep("mean|std", names(mergedCombinedData), ignore.case=TRUE))    
    mergedCombinedReducedData <- mergedCombinedData[,selectedCols]
    
    # melt merged data.
    meltedData <- melt(mergedCombinedReducedData, id.vars=c("SubjectId", "ActivityLabel"))
    
    # Create final tidy data set.
    tidyData <- ddply(meltedData,c("SubjectId","ActivityLabel","variable"),
                      summarise,mean=mean(value))
  
    write.table(tidyData,file="smart_phone_data.txt", row.name=FALSE)
    
    return(tidyData)
}
