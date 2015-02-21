## This script assumes that 
##   1) the Samsung data is available in the working directory, and unzipped in a folder named "UCI HAR Dataset"
##   2) library dplyr has been installed
##

path <- "./UCI HAR Dataset/"
library(dplyr)

## 1.  Merges the training and the test sets to create one data set
## -----------------------------------------------------------------
## Training Set
## read subject, activities, measurements (aka results) 
## construct the data:  subject, activity codes, results
traindata_subjectid <- read.table(paste(path,"train/subject_train.txt",sep=""), stringsAsFactors = FALSE)
traindata_activitycodes <- read.table(paste(path,"train/y_train.txt",sep=""), stringsAsFactors = FALSE)
traindata_results <- read.table(paste(path,"train/X_train.txt",sep=""), stringsAsFactors = FALSE)
traindata <- cbind(traindata_subjectid, traindata_activitycodes, traindata_results)

## Test Set
## do the same for the test set
testdata_subjectid <- read.table(paste(path,"test/subject_test.txt",sep=""), stringsAsFactors = FALSE)
testdata_activitycodes <- read.table(paste(path,"test/y_test.txt",sep=""), stringsAsFactors = FALSE)
testdata_results <- read.table(paste(path,"test/X_test.txt",sep=""), stringsAsFactors = FALSE)
testdata <- cbind(testdata_subjectid, testdata_activitycodes, testdata_results)

## combine test and training set data
alldata <- rbind(traindata, testdata)

## check dims make sense
print(dim(traindata))
print(dim(testdata))
print(dim(alldata))

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## -------------------------------------------------------------------------------------------
## read result labels 
## Add subject and activity to obtain an initial full set of column labels matching the full data set
result_labels <- read.table(paste(path,"features.txt",sep=""), stringsAsFactors = FALSE)
full_column_labels <- c("Subject","Activity",result_labels[[2]])

## Select all column labels containing mean or std, excluding meanFreq which is not the mean of
## an original measurement but the average of an intermediate calculation on that measurement.
mean_select <- grep("mean",full_column_labels, value=TRUE)
mean_select <- grep("meanFreq",mean_select, value=TRUE, invert = TRUE)
std_select <- grep("std",full_column_labels, value=TRUE)
select_labels <- c("Subject","Activity", mean_select, std_select)

## create an integer vector corresponding to the column positions for these names 
## and use it to subset the columns
v <- integer()
for (i  in  seq_along(full_column_labels) )  
  {if (full_column_labels[i] %in% select_labels) 
    {v <- c(v, i)}   
  }

## Extracts desired variables (together with Subject and Activity codes)
mean_std_data <- alldata[, v]
colnames(mean_std_data) <- select_labels

## 3. Uses descriptive activity names to name the activities in the data set
## -------------------------------------------------------------------------
## read file of activity labels, and create a simple vector of activity names
## use it to replace activity codes with descriptive labels
activity_labels <- read.table(paste(path,"activity_labels.txt",sep=""), stringsAsFactors = FALSE)
activity_names <- activity_labels[[2]]
mean_std_data <- mutate(mean_std_data, Activity = activity_names[Activity])

## 4. Appropriately labels the data set with descriptive variable names.
## -------------------------------------------------------------------------
##
## Create clean column names

## a) eliminate semi-illegal characters () and -
clean_labels <- gsub("\\(\\)","",select_labels)
clean_labels <- gsub("\\-)","_",clean_labels)

## b) eliminate instances of repeated "Body"
clean_labels <- gsub("BodyBody","Body", clean_labels)

## c) provide descriptive variable names
for (i  in  3:length(clean_labels) )  
{
  newname <- character()
  
  if (substr(clean_labels[i],1,1) == "t") 
    {newname <- paste(newname, "Time Domain", sep="")}
  else if  (substr(clean_labels[i],1,1) == "f") 
    {newname <- paste(newname, "Frequency Domain", sep="")}
  else {}
  
  if ( grepl("BodyAcc",clean_labels[i]) ) 
    {newname <- paste(newname, "Body Linear Acceleration", sep="_")}
  else if  ( grepl("GravityAcc",clean_labels[i]) )
    {newname <- paste(newname, "Gravity Acceleration", sep="_")}
  else if  ( grepl("BodyGyro",clean_labels[i]) )
    {newname <- paste(newname, "Body Angular Velocity", sep="_")}
  else {}
  
  if ( grepl("Jerk",clean_labels[i]) ) {newname <- paste(newname, "Jerk Signal", sep="_")}
  if ( grepl("Mag",clean_labels[i]) ) {newname <- paste(newname, "Magnitude", sep="_")}
  
  if ( grepl("X",clean_labels[i]) ) 
    {newname <- paste(newname, "3-axial_X direction", sep="_")}
  else if  ( grepl("Y",clean_labels[i]) )
    {newname <- paste(newname, "3-axial_Y direction", sep="_")}
  else if  ( grepl("Z",clean_labels[i]) )
    {newname <- paste(newname, "3-axial_Z direction", sep="_")}
  else {}

  if ( grepl("mean",clean_labels[i]) ) 
    {newname <- paste(newname, "Mean", sep="_")}
  else if  ( grepl("std",clean_labels[i]) )
    {newname <- paste(newname, "Standard Deviation", sep="_")}
  else {}
  
  clean_labels[i] <- newname
}

## rename variables in the data set with the clean column labels
colnames(mean_std_data) <- clean_labels

## 5. From the data set in step 4, creates a second, independent 
##    tidy data set with the average of each variable for each activity and each subject.
## --------------------------------------------------------------------------------------
##
grouped_data <- group_by(mean_std_data,Subject,Activity)
tidydata <- summarise_each(grouped_data,funs(mean))
tidydata_labels <- c(clean_labels[1:2], paste("Average of ",clean_labels[3:length(clean_labels)] ) )
colnames(tidydata) <- tidydata_labels

## write data output to working directory 
write.table(tidydata, file="project_output.txt", row.names=FALSE, col.names=TRUE)


## Pull up into R with read.table( "urladdress or file path", stringsAsFactors = FALSE, header = TRUE)
