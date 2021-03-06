R.version.string          # Recommended version 3.0.0 and above

#install.packages('data.table')
#install.packages('dplyr')

#If you fail loading libraries below uncomment please two lines above in order to install both of required libraries. Then add comment sign (#) back
library(data.table)   #better for large datasets
library(dplyr)        #good for aggregations

#Link to download input dataset (if not loaded from this repository)
fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

#Change the working directory according to folder structure on the machine where running this script
setwd('/home/vilem_reznicek/Development/RStudio_projects/RStudio_projects/coursera')

#This runs only once if you still do not have prepared (downloaded) the input dataset archive
if (!file.exists('./download/UCI HAR Dataset.zip')){
  message("The Source data in a ZipArchive is being downloaded...")
  download.file(fileurl,'./download/UCI HAR Dataset.zip', mode = 'wb')
  unzip("./download/UCI HAR Dataset.zip", exdir = './')
}

#This runce once if you do not have extracted input files from the archive file yet
if (!file.exists('./UCI HAR Dataset/')){
  message("Source data is being extracted to folder : UCI HAR Dataset")
  unzip("./download/UCI HAR Dataset.zip", exdir = './')
}

#Read Feature column names from file ./UCI HAR Dataset/features.txt
featureColumnNames <- read.table("UCI HAR Dataset/features.txt",header = FALSE)
featureColumnNames <- as.character(featureColumnNames[,2])

#Read Activity names from file ./UCI HAR Dataset/activity_labels.txt (Activity names code table)
activityDictionaryTable <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Read sub sets Subjects, Features, Activities from Train and Test folders
temp_train_features = read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
temp_train_activity = read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

temp_test_features = read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
temp_test_activity = read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

temp_train_subject = read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
temp_test_subject  = read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

#RBIND - "UNION ALL" all three subsets  
temp_features_both = rbind(temp_train_features, temp_test_features)                   # Feature
rm(temp_train_features);
rm(temp_test_features)
temp_activity_both = rbind(temp_train_activity, temp_test_activity)                   # Activity
rm(temp_train_activity)
rm(temp_test_activity)
temp_subject_both = rbind(temp_train_subject, temp_test_subject)                      # Subject 
rm(temp_train_subject)
rm(temp_test_subject)

#Finally, assembling of the full source dataset : SUBJECT, ACTIVITY , X[] (features) into one dataset
fullSourceDataSet = cbind(temp_subject_both, temp_activity_both, temp_features_both  )
rm(temp_subject_both)
rm(temp_activity_both)
rm(temp_features_both)

colnames(fullSourceDataSet) <- c(c('SUBJECT','ACTIVITY'),featureColumnNames)

#GOAL1 : achieved - fullSourceDataSett contains merged training and testing dataset  

#Extracts only the measurements on the mean and standard deviation for each measurement (those -mean() or -std() only)
featureColumnNamesScope <-grep('-mean\\(\\)|-std\\(\\)',featureColumnNames , ignore.case=TRUE)
datasetScope <- fullSourceDataSet[,c(1,2,featureColumnNamesScope + 2)]
rm(fullSourceDataSet)

#GOAL2 : achieved - datasetScope contains only the measurements on the mean and standard deviation for each measurement 

names(datasetScope)

#Rename column labels in order to better describe variable names
names(datasetScope) <- gsub("[(][)]", "", names(datasetScope))
names(datasetScope) <- gsub("^t", "TIME_", names(datasetScope))
names(datasetScope) <- gsub("^f", "FREQ_", names(datasetScope))
names(datasetScope) <- gsub("Acc", "ACCEL_", names(datasetScope))
names(datasetScope) <- gsub("Gravity", "GRAV_", names(datasetScope))
names(datasetScope) <- gsub("Gyro", "GYRO_", names(datasetScope))
names(datasetScope) <- gsub("Mag", "MAGNIT_", names(datasetScope))
names(datasetScope) <- gsub("mean", "MEAN_", names(datasetScope))
names(datasetScope) <- gsub("std", "STDDEV_", names(datasetScope))
names(datasetScope) <- gsub("Jerk", "JERK_", names(datasetScope))
names(datasetScope) <- gsub("BodyBody", "Body", names(datasetScope))
names(datasetScope) <- gsub("Body", "BODY_", names(datasetScope))
names(datasetScope) <- gsub("-", "_", names(datasetScope))
names(datasetScope) <- gsub("__", "_", names(datasetScope))
names(datasetScope) <- gsub("\\_$","", names(datasetScope))

names(datasetScope) <- toupper(names(datasetScope))

# Change ActivityID (numeric code) to activity name (LAYING, WALKING, SITTING,...etc)
activityDictionaryLabels <- as.character(activityDictionaryTable[,2])
datasetScope$ACTIVITY <-activityDictionaryLabels[datasetScope$ACTIVITY]

#GOAL3 : achieved - datasetScope has appropriately labeled the data set with descriptive variable names and activity

# Aggregate the data set. Group by SUBJECT, ACTIVITY and calculate Mean() of all features
datasetTidy <- aggregate(datasetScope[,3:ncol(datasetScope)], by = list(ACTIVITY = datasetScope$ACTIVITY, SUBJECT = datasetScope$SUBJECT), FUN = mean)

#GOAL4 : achieved - datasetTidy created with the average of each variable for each activity and each subject

# Save aggregated data into file
write.table(x = datasetTidy, file = "tidyData.txt", row.names = FALSE)
str(datasetTidy)
