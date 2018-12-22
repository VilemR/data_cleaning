setwd('/home/vilem_reznicek/Development/RStudio_projects/rstudio/coursera/UCI_HAR_Dataset')

library(plyr)
library(dplyr)

setwd('/home/vilem_reznicek/Development/RStudio_projects/rstudio/coursera/UCI_HAR_Dataset')

# STEP 1: Read features.txt, which gives the variable names for all 561 columns
features <- read.table("features.txt") # read table
features <- tbl_df(features) # convert to data frame tbl
features <- rename(features, variable = V2) # rename V2 to variable for sanity's sake

# STEP 2: Use features.txt to identify which columns measure mean and standard deviation
meanvarlist <- grep("mean(\\(\\))", features$variable) # list all column numbers measuring the mean
meanvarlist.text <- grep("mean(\\(\\))", features$variable, value = TRUE) # list all variable names measuring the mean
stdvarlist <- grep("std(\\(\\))", features$variable) # list all column numbers measuring the std
stdvarlist.text <- grep("std(\\(\\))", features$variable, value = TRUE) # list all variable names measuring the std

# STEP 3: Read the training set
train <- read.table("./train/X_train.txt") # read the training set into R
train <- tbl_df(train) # convert to data frame tbl

# STEP 4: Select only the mean and standard deviation columns from train, and rename them according to features
train.mean <- select(train, meanvarlist) # select only mean columns
# rename all columns in traintest_mean to the variable names found in meanvarlist_text
for (i in 1:length(meanvarlist.text)) {names(train.mean)[i] <- meanvarlist.text[i]} 
train.std <- select(train, stdvarlist) # select only std columns
# rename all columns in traintest_std to the variable names found in stdvarlist_text
for (i in 1:length(stdvarlist.text)) {names(train.std)[i] <- stdvarlist.text[i]}
train.meanstd <- cbind(train.mean, train.std) # combine mean and std columns into one data frame

# STEP 5: Add column from subject_train.txt, which provides info on what subject corresponds to each observation
subject_train <- read.table("./train/subject_train.txt") # read into R
subject_train <- rename(subject_train, subject = V1) # rename V1 column in subject table to 'subject'
train.meanstd <- cbind(subject_train, train.meanstd) # bind subject column to train.meanstd

# STEP 6: Add column from y_train.txt, which provides info on what activity corresponds to each observation
activity_train <- read.table("./train/y_train.txt") # read the column listing which activities correspond to which observation
activity_train <- rename(activity_train, activity = V1) # rename V1 column in activity table to 'activity'
train.meanstd <- cbind(activity_train, train.meanstd) # bind activity column to train.meanstd

train.meanstd <- tbl_df(train.meanstd) # convert to data frame tbl

# STEP 7: Repeat steps 3-6 for the test set
test <- read.table("./test/X_test.txt") # read the training set into R
test <- tbl_df(test) # convert to data frame tbl

test.mean <- select(test, meanvarlist) # select only mean columns
# rename all columns in traintest.mean to the variable names found in meanvarlist.text
for (i in 1:length(meanvarlist.text)) {names(test.mean)[i] <- meanvarlist.text[i]} 

test.std <- select(test, stdvarlist) # select only std columns
# rename all columns in traintest.std to the variable names found in stdvarlist.text
for (i in 1:length(stdvarlist.text)) {names(test.std)[i] <- stdvarlist.text[i]}

test.meanstd <- cbind(test.mean, test.std) # combine mean and std columns into one data frame

subject_test <- read.table("./test/subject_test.txt") # read the column listing which subjects correspond to which observation into R
subject_test <- rename(subject_test, subject = V1) # rename V1 column in subject table to 'subject'
test.meanstd <- cbind(subject_test, test.meanstd) # bind subject column to train.meanstd

activity_test <- read.table("./test/y_test.txt") # read the column listing which activities correspond to which observation
activity_test <- rename(activity_test, activity = V1) # rename V1 column in activity table to 'activity'
test.meanstd <- cbind(activity_test, test.meanstd) # bind activity column to train.meanstd

test.meanstd <- tbl_df(test.meanstd) # convert to data frame tbl

# STEP 8: Combine and sort the training and test sets
traintest.meanstd <- rbind(train.meanstd, test.meanstd) # bind train and test sets together
traintest.meanstd <- arrange(traintest.meanstd, subject) # arrange traintest.meanstd by subject, ascending

# STEP 9: Make the variable names more descriptive
names(traintest.meanstd) <- gsub("-", ".", names(traintest.meanstd)) # replace dashes with periods
names(traintest.meanstd) <- gsub("\\(\\)", "", names(traintest.meanstd)) # remove parentheses
names(traintest.meanstd) <- sub("^t", "time", names(traintest.meanstd)) # replace prefix "t" with "time"
names(traintest.meanstd) <- sub("^f", "frequency", names(traintest.meanstd)) # replace prefix "f" with "frequency"
names(traintest.meanstd) <- sub("BodyBody", "Body", names(traintest.meanstd)) # replace typo "BodyBody" with "Body"
names(traintest.meanstd) <- sub("std", "stdev", names(traintest.meanstd)) # replace "std" with "stdev"

# STEP 10: Replace activities 1-6 with descriptive names
activity_labels <- read.table("activity_labels.txt") # read into R
activity_labels <- rename(activity_labels, activity.label = V2) # rename V2 into activity.label
activity_labels$activity.label <- as.character(activity_labels$activity.label) # convert activity.label column from factor to character
for (i in 1:nrow(activity_labels)) {traintest.meanstd$activity[traintest.meanstd$activity == i] <- activity_labels$activity.label[i]} # rename values within activity column
traintest.meanstd$activity <- as.factor(traintest.meanstd$activity) # convert activity column from character to factor

# STEP 11: Create a new dataset with the average of each variable for each activity and each subject
traintest.final <- traintest.meanstd %>% group_by(activity, subject) %>% summarise_each(funs(mean))

# STEP 12: Write table to file
write.table(traintest.final, file = "getdata_project.txt", row.names = FALSE) 
# row.names = FALSE necessitates header = TRUE when reading the table