# README - Getting and Cleaning Data - Project

The unique script contained in run_analysis.R performs the sequence of tasks specified in the 
project description:
	You should create one R script called run_analysis.R that does the following. 
	
		1. Merges the training and the test sets to create one data set.
		
		2. Extracts only the measurements on the mean and standard deviation for each measurement. 
		
		3. Uses descriptive activity names to name the activities in the data set
		
		4. Appropriately labels the data set with descriptive variable names. 
		
		5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

For simplicity and ease of reading, the script follows the same 5-step sequence, in the same order.  

As also commented within the script, the components of the script are as follows, 
together with further explanations:

## Note:
This script assumes that 

1) the Samsung data is unzipped in a subfolder of the working directory named "UCI HAR Dataset"

2) library dplyr has been installed (it is loaded by the scriipt)

## Script organization and components

###1.  Merge the training and the test sets to create one data set
-----------------------------------------------------------------
Training Set:  
Read subject, activities, measurements (aka results):  subject_train.txt, y_train.txt, X_train.txt 
Then construct the data through cbind:  subject (subject_train), activity codes (from y_train), results (from X_train)

Test Set:  do the same for the test set

Combine test and training set data through rbind

###2.	Extract only the measurements on the mean and standard deviation for each measurement. 
-------------------------------------------------------------------------------------------
Read result labels from "features.txt", add subject and activity to obtain an initial full 
set of column labels for the full data set

Select all column labels containing mean or std, excluding meanFreq which is not the mean of
an original measurement but the average of an intermediate calculation on that measurement.

Create an integer vector corresponding to the column positions for these names and use it to 
extract the corresponding subset of columns and corresponding variable names.

###3.	Use descriptive activity names to name the activities in the data set
-------------------------------------------------------------------------------------------
Read file of activity labels, and replace  the activity integer codes 
obtained from y_train and y_test with the corresponding descriptive activities through "mutate"
 1. WALKING
 2. WALKING_UPSTAIRS
 3. WALKING_DOWNSTAIRS
 4. SITTING
 5. STANDING
 6. LAYING

###4.	Appropriately label the data set with descriptive variable names.
-------------------------------------------------------------------------
Create clean and more descritive column names are created through the following steps:

a) eliminate semi-illegal characters () and -

b) eliminate instances of repeated "Body"

c) provide descriptive variable names by identifying the components of the original names
in features.txt, using the information in features_info.txt, and mapping these components 
as follows:
- t :			Time Domain
- f	:			Frequency Domain
- BodyAcc :		Body Linear Acceleration
- GravityAcc :	Gravity Acceleration
- BodyGyro :	Body Angular Velocity
- Jerk :		Jerk Signal
- Mag :			Magnitude
- XYZ :			X, Y or Z direction

###5.	From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
--------------------------------------------------------------------------------------

Data are grouped by subject and activity and  the average of each variable is then calculated through summarise_each(grouped_data,funs(mean)).

The resulting dataframe in a tidy data set (in wide form) where 
1.  all of the data for each observation (a unique pair of (subject, activity) are in one unique row across columns
2.  each variable is in one column and each column represents only one variable.

This meets the relevant requirements for tidy data, defined as:
1) Each variable forms a column
2) Each observation forms a row

The 3rd requirement is

	3) Each type of observational unit forms a table 

but these is only one observational unit here anyway (this dataset).

References: 	Forum discussion FAQ:  https://class.coursera.org/getdata-011/forum/thread?thread_id=69

				Original paper:  http://www.jstatsoft.org/v59/i10/paper


The data is written to the working directory, with row.names=FALSE as instructed.

It can be retrieved into R through
	read.table( "urladdress or file path", stringsAsFactors = FALSE, header = TRUE)
