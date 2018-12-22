#https://github.com/VilemR/data_cleaning.git

R.version.string #"R version 3.0.2 (2013-09-25)"

#TODO : prejmenovat promenne
#TODO : documenter
#TODO : prejmenovat headlines sloupce

#install.packages('data.table')
#install.packages('dplyr')

library(data.table) #better for large datasets
library(dplyr) #good for aggregations

#You should create one R script called run_analysis.R that does the following.

#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
setwd('/home/vilem_reznicek/Development/RStudio_projects/RStudio_projects/coursera')

if (!file.exists('./download/UCI HAR Dataset.zip')){
  message("The Source data in a ZipArchive is being downloaded...")
  download.file(fileurl,'./download/UCI HAR Dataset.zip', mode = 'wb')
  unzip("./download/UCI HAR Dataset.zip", exdir = './')
}

if (!file.exists('./UCI HAR Dataset/')){
  message("Source data is being extracted to folder : UCI HAR Dataset")
  unzip("./download/UCI HAR Dataset.zip", exdir = './')
}

#Read Feature column names from file
featureColumnNames <- read.table("UCI HAR Dataset/features.txt",header = FALSE)
featureColumnNames <- as.character(featureColumnNames[,2])

#Read Activity names from file
activityDictionaryTable <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Read sub sets Subjects, Features, Activities from Train and Test folders
temp_train_features = read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
temp_train_activity = read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

temp_test_features = read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
temp_test_activity = read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

temp_train_subject = read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
temp_test_subject  = read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

#RBIND - UNION ALL subsets
temp_features_both = rbind(temp_train_features, temp_test_features)                   # Feature
temp_activity_both = rbind(temp_train_activity, temp_test_activity)                   # Activity
temp_subject_both = rbind(temp_train_subject, temp_test_subject) # Subject 

#Finally, assembling of the full source dataset : SUBJECT, ACTIVITY , X[] (features)
fullSourceDataSett = cbind(temp_subject_both, temp_activity_both, temp_features_both  )
colnames(fullSourceDataSett) <- c(c('SUBJECT','ACTIVITY'),featureColumnNames)

#Select STDDEV & MEAN columns and apply naming conventions
featureColumnNamesScope <-grep('.*mean.*|.*std.*',featureColumnNames , ignore.case=TRUE)
datasetScope <- fullSourceDataSett[,c(1,2,featureColumnNamesScope + 2)]

names(datasetScope) <- gsub("[(][)]", "", names(datasetScope))
names(datasetScope) <- gsub("^t", "TIME_", names(datasetScope))
names(datasetScope) <- gsub("^f", "FREQ_", names(datasetScope))
names(datasetScope) <- gsub("Acc", "ACCEL_", names(datasetScope))
names(datasetScope) <- gsub("Gyro", "GYRO_", names(datasetScope))
names(datasetScope) <- gsub("Mag", "MAGNIT_", names(datasetScope))
names(datasetScope) <- gsub("mean", "MEAN_", names(datasetScope))
names(datasetScope) <- gsub("std", "STDDEV_", names(datasetScope))
names(datasetScope) <- gsub("BodyBody", "Body", names(datasetScope))
names(datasetScope) <- gsub("Body", "BODY_", names(datasetScope))
names(datasetScope) <- gsub("-", "_", names(datasetScope))
names(datasetScope) <- gsub("__", "_", names(datasetScope))
names(datasetScope) <- toupper(names(datasetScope))

# Change ActivityID (numeric code) to activity name (LAYING, WALKING, SITTING,...etc)
activityDictionaryLabels <- as.character(activityDictionaryTable[,2])
datasetScope$ACTIVITY <-activityDictionaryLabels[datasetScope$ACTIVITY]

# Aggregate the data set. Group by SUBJECT, ACTIVITY and calculate Mean() of all features
datasetTidy <- aggregate(datasetScope[,3:88], by = list(ACTIVITY = datasetScope$ACTIVITY, SUBJECT = datasetScope$SUBJECT),FUN = mean)

# Save aggregated data into file
write.table(x = datasetTidy, file = "data_tidy.txt", row.names = FALSE)


