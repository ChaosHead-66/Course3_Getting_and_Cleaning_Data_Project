
setwd("~/Desktop/Deep Learning Codes/DataScienceSP/Course3/Course3_Project")


# 1 - Merges the training and the test sets to create one data set.

# loaded the label files, label index & label name.
activityLabels <- read.table('./UCI HAR Dataset/activity_labels.txt', col.names = c('activityLabels', 'activityName'), quote = "")


# list of all features (holds the attributes names)
features <- read.table('./UCI HAR Dataset/features.txt',col.names = c('featureLabels', 'featureName'), quote = "")



# Loading Traing data.

#Read in training data
# subject_train.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
#Because The experiments have been carried out with a group of 30 volunteers with each performing six activities. The obtained 
#dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

subjectTrain <- read.table('./UCI HAR Dataset/train/subject_train.txt', col.names = c('subjectId'))
X_Train <- read.table('./UCI HAR Dataset/train/X_train.txt')
# y_train hold the activity label(number)
y_Train <- read.table('./UCI HAR Dataset/train/y_train.txt')


#Loading test data
subjectTest <- read.table('./UCI HAR Dataset/test/subject_test.txt', col.names = c('subjectId'))
X_Test <- read.table('./UCI HAR Dataset/test/X_test.txt')
y_Test <- read.table('./UCI HAR Dataset/test/y_test.txt')



#Combining training data and give column names
colnames(X_Train) <- features$featureName
colnames(y_Train) <- c('activityLabels')
trainingData <- cbind(subjectTrain, X_Train, y_Train)

#Combining testing data and give column names

colnames(X_Test) <- features$featureName
colnames(y_Test) <- c('activityLabels')
testingData <- cbind(subjectTest, X_Test, y_Test)


# merginf training and testing data
allData <- rbind(trainingData, testingData)





# 2 : Extracts only the measurements on the mean and standard deviation for each measurement.

features_with_mean_std <- grepl("(mean|std)\\(\\)", colnames(allData))

mean_std_meaurements <- allData[, features_with_mean_std]


# 3 - Uses descriptive activity names to name the activities in the data set

#allData[["activityLabels"]] <- factor(allData$activityLabels, labels= activityLabels$activityName)

allData$activityLabels <- factor(allData$activityLabels, levels = activityLabels$activityLabels, labels= activityLabels$activityName)

allData$subjectId <- as.factor(allData$subjectId)



#4- Appropriately labels the data set with descriptive variable names. 

names(allData)<-gsub("^t", "time", names(allData))
names(allData)<-gsub("^f", "frequency", names(allData))
names(allData)<-gsub("std()", "SD", names(allData))
names(allData)<-gsub("mean()", "MEAN", names(allData))
names(allData)<-gsub("Acc", "Accelerometer", names(allData))
names(allData)<-gsub("Gyro", "Gyroscope", names(allData))




# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
# each activity and each subject.


library(dplyr)
# remove duplicate column names
allData_2 <- allData[, !duplicated(colnames(allData))]
allData_2 <- tbl_df(allData_2)


allData_2 <- group_by(allData_2, subjectId, activityLabels) %>% summarise_all(list(mean = mean))

#summarise(allData_2, mean)

write.table(allData_2, file = 'tidyDataMean.txt', row.names = F, quote = F, sep = "\t")

#remove("tempData")
#rlang::last_error()






