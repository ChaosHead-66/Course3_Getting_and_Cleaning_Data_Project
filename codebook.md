# codebook



## Datasource
"Human Activity Recognition Using Smartphones Data Set"

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

30 volunteers (19-48 years) wore a smartphone on the waist and performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The embedded accelerometer and gyroscope of the smartphone captured the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.



This repository is the project of the Course 3: "Getting and Cleaning Data" from the Data Science Specialization.
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.





## Analysis

    1) Merges the training and the test sets to create one data set.
    	subject_train.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
    	###### Variables:
    	subjectTrain: loads the data from UCI HAR Dataset/train/subject_train.txt - (7352 x 1) vector
    	X_train: loads the training set from UCI HAR Dataset/train/X_train.txt - (7352 x 561) matrix
    	y_train: loads the labels for training set from UCI HAR Dataset/train/y_train.txt - - (7352 x 1) vector

    	subjectTest: loads the data from UCI HAR Dataset/train/subject_test.txt - (2947 x 1) vector
    	X_train: loads the test set from UCI HAR Dataset/train/X_test.txt - (2947 x 561) matrix
    	y_train: loads the labels for test set from UCI HAR Dataset/train/y_test.txt - - (2947 x 1) vector

    	allData : merge the training and testing data into one big table.



    2) Extracts only the measurements on the mean and standard deviation for each measurement.

    	identify column names with 'mean' or 'std' and extract measurements for these columns only


    3) Uses descriptive activity names to name the activities in the data set
    	replace the digits for activity labels with the corresponding activity names.
    	activity names: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING


    4) Appropriately labels the data set with descriptive variable names.
    	replace the abbriviated names with the full names.

    5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each.

    	a new tidy set is created and provied in the reposiroty.



# FEATURE VARIABLES
## Time signals from accelerometer and gyroscope

    tBodyAcc-XYZ
    tGravityAcc-XYZ
    tBodyAccJerk-XYZ
    tBodyGyro-XYZ
    tBodyGyroJerk-XYZ
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag

## Frequency domain signals from accelerometer and gyroscope

    fBodyAcc-XYZ
    fBodyAccJerk-XYZ
    fBodyGyro-XYZ
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag

    
