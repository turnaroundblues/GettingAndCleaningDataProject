# Code Book - Getting and Cleaning Data - Project

##Data Source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Further References: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


###Specific data used:
Training Set:  subject_train.txt, y_train.txt, X_train.txt

Test Set:  subject_test.txt, y_test.txt, X_test.txt


Subject codes are integers representing each of the 30 subjects.

Descriptive activity labels were obtained by matching the activity codes in y_train.txt and y_test.txt 
with the descriptive names in activity_labels.txt.  There are six such activity levels:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

Variable names were interpreted from "features_info.txt" as follows:
- t 			Time Domain
- f			Frequency Domain
- BodyAcc		Body Linear Acceleration
- GravityAcc	Gravity Acceleration
- BodyGyro	Body Angular Velocity
- Jerk		Jerk Signal
- Mag			Magnitude
- XYZ			X, Y or Z direction

(BodyBody was resolved to Body)

Per project instructions, the original variable set was subsetted to retain only the mean and standard deviation of measurements.

The average of each of 66 such variables was calculated and reported for each observation (i.e. each (Subject, Activity) pair).

The detailed steps are included in a single script contained in run_analysis.R, also in this repo.

Units of measurements are inherited from original variables.  As described in the README.txt included 
in the original data set, each variable was normalized to be bounded within [-1,1].

##Resulting data set:
- 180 rows:  30 subjects * 6 activities
- 68 columns:  2 categories (subject, activity) and 66 variables (average mean and average standard deviations)

###Observations (categories)
1. Subject   (integer, 1 to 30)
2. Activity  (character, see list above)

###Variables:  (numeric)
- 3 Average of  Time Domain_Body Linear Acceleration_3-axial_X direction_Mean
- 4 Average of  Time Domain_Body Linear Acceleration_3-axial_Y direction_Mean
- 5 Average of  Time Domain_Body Linear Acceleration_3-axial_Z direction_Mean
- 6 Average of  Time Domain_Gravity Acceleration_3-axial_X direction_Mean
- 7 Average of  Time Domain_Gravity Acceleration_3-axial_Y direction_Mean
- 8 Average of  Time Domain_Gravity Acceleration_3-axial_Z direction_Mean
- 9 Average of  Time Domain_Body Linear Acceleration_Jerk Signal_3-axial_X direction_Mean
- 10 Average of  Time Domain_Body Linear Acceleration_Jerk Signal_3-axial_Y direction_Mean
- 11 Average of  Time Domain_Body Linear Acceleration_Jerk Signal_3-axial_Z direction_Mean
- 12 Average of  Time Domain_Body Angular Velocity_3-axial_X direction_Mean
- 13 Average of  Time Domain_Body Angular Velocity_3-axial_Y direction_Mean
- 14 Average of  Time Domain_Body Angular Velocity_3-axial_Z direction_Mean
- 15 Average of  Time Domain_Body Angular Velocity_Jerk Signal_3-axial_X direction_Mean
- 16 Average of  Time Domain_Body Angular Velocity_Jerk Signal_3-axial_Y direction_Mean
- 17 Average of  Time Domain_Body Angular Velocity_Jerk Signal_3-axial_Z direction_Mean
- 18 Average of  Time Domain_Body Linear Acceleration_Magnitude_Mean
- 19 Average of  Time Domain_Gravity Acceleration_Magnitude_Mean
- 20 Average of  Time Domain_Body Linear Acceleration_Jerk Signal_Magnitude_Mean
- 21 Average of  Time Domain_Body Angular Velocity_Magnitude_Mean
- 22 Average of  Time Domain_Body Angular Velocity_Jerk Signal_Magnitude_Mean
- 23 Average of  Frequency Domain_Body Linear Acceleration_3-axial_X direction_Mean
- 24 Average of  Frequency Domain_Body Linear Acceleration_3-axial_Y direction_Mean
- 25 Average of  Frequency Domain_Body Linear Acceleration_3-axial_Z direction_Mean
- 26 Average of  Frequency Domain_Body Linear Acceleration_Jerk Signal_3-axial_X direction_Mean
- 27 Average of  Frequency Domain_Body Linear Acceleration_Jerk Signal_3-axial_Y direction_Mean
- 28 Average of  Frequency Domain_Body Linear Acceleration_Jerk Signal_3-axial_Z direction_Mean
- 29 Average of  Frequency Domain_Body Angular Velocity_3-axial_X direction_Mean
- 30 Average of  Frequency Domain_Body Angular Velocity_3-axial_Y direction_Mean
- 31 Average of  Frequency Domain_Body Angular Velocity_3-axial_Z direction_Mean
- 32 Average of  Frequency Domain_Body Linear Acceleration_Magnitude_Mean
- 33 Average of  Frequency Domain_Body Linear Acceleration_Jerk Signal_Magnitude_Mean
- 34 Average of  Frequency Domain_Body Angular Velocity_Magnitude_Mean
- 35 Average of  Frequency Domain_Body Angular Velocity_Jerk Signal_Magnitude_Mean
- 36 Average of  Time Domain_Body Linear Acceleration_3-axial_X direction_Standard Deviation
- 37 Average of  Time Domain_Body Linear Acceleration_3-axial_Y direction_Standard Deviation
- 38 Average of  Time Domain_Body Linear Acceleration_3-axial_Z direction_Standard Deviation
- 39 Average of  Time Domain_Gravity Acceleration_3-axial_X direction_Standard Deviation
- 40 Average of  Time Domain_Gravity Acceleration_3-axial_Y direction_Standard Deviation
- 41 Average of  Time Domain_Gravity Acceleration_3-axial_Z direction_Standard Deviation
- 42 Average of  Time Domain_Body Linear Acceleration_Jerk Signal_3-axial_X direction_Standard Deviation
- 43 Average of  Time Domain_Body Linear Acceleration_Jerk Signal_3-axial_Y direction_Standard Deviation
- 44 Average of  Time Domain_Body Linear Acceleration_Jerk Signal_3-axial_Z direction_Standard Deviation
- 45 Average of  Time Domain_Body Angular Velocity_3-axial_X direction_Standard Deviation
- 46 Average of  Time Domain_Body Angular Velocity_3-axial_Y direction_Standard Deviation
- 47 Average of  Time Domain_Body Angular Velocity_3-axial_Z direction_Standard Deviation
- 48 Average of  Time Domain_Body Angular Velocity_Jerk Signal_3-axial_X direction_Standard Deviation
- 49 Average of  Time Domain_Body Angular Velocity_Jerk Signal_3-axial_Y direction_Standard Deviation
- 50 Average of  Time Domain_Body Angular Velocity_Jerk Signal_3-axial_Z direction_Standard Deviation
- 51 Average of  Time Domain_Body Linear Acceleration_Magnitude_Standard Deviation
- 52 Average of  Time Domain_Gravity Acceleration_Magnitude_Standard Deviation
- 53 Average of  Time Domain_Body Linear Acceleration_Jerk Signal_Magnitude_Standard Deviation
- 54 Average of  Time Domain_Body Angular Velocity_Magnitude_Standard Deviation
- 55 Average of  Time Domain_Body Angular Velocity_Jerk Signal_Magnitude_Standard Deviation
- 56 Average of  Frequency Domain_Body Linear Acceleration_3-axial_X direction_Standard Deviation
- 57 Average of  Frequency Domain_Body Linear Acceleration_3-axial_Y direction_Standard Deviation
- 58 Average of  Frequency Domain_Body Linear Acceleration_3-axial_Z direction_Standard Deviation
- 59 Average of  Frequency Domain_Body Linear Acceleration_Jerk Signal_3-axial_X direction_Standard Deviation
- 60 Average of  Frequency Domain_Body Linear Acceleration_Jerk Signal_3-axial_Y direction_Standard Deviation
- 61 Average of  Frequency Domain_Body Linear Acceleration_Jerk Signal_3-axial_Z direction_Standard Deviation
- 62 Average of  Frequency Domain_Body Angular Velocity_3-axial_X direction_Standard Deviation
- 63 Average of  Frequency Domain_Body Angular Velocity_3-axial_Y direction_Standard Deviation
- 64 Average of  Frequency Domain_Body Angular Velocity_3-axial_Z direction_Standard Deviation
- 65 Average of  Frequency Domain_Body Linear Acceleration_Magnitude_Standard Deviation
- 66 Average of  Frequency Domain_Body Linear Acceleration_Jerk Signal_Magnitude_Standard Deviation
- 67 Average of  Frequency Domain_Body Angular Velocity_Magnitude_Standard Deviation
- 68 Average of  Frequency Domain_Body Angular Velocity_Jerk Signal_Magnitude_Standard Deviation
