clean_data <- function() {
    # This function downloads the data set and clean it the following way:
    # - Merges the training and the test sets to create one data set.
    # - Extracts only the measurements on the mean and standard deviation for each measurement.
    # - Uses descriptive activity names to name the activities in the data set
    # - Appropriately labels the data set with descriptive variable names.
    #
    # Return:
    # data frame: contains the data with columns: SUBJECTS, ACTIVITIES, and all mean and std data

    download_data("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
    data <- merge_data("/home/vilem_reznicek/Development/RStudio_projects/rstudio/coursera/UCI_HAR_Dataset")
    data <- extract_mean_and_std(data)
    data <- labels_data(data)
}

write_avg_tidy_dataset <- function(data) {
    # This functions takes the processed data returned by clean_data and
    # writes a .txt file containing the data set with the average of each
    # variable for each activity and each subject
    #
    # Parameters:
    # data -> clean data frame
    #
    # Return:
    # nothing, but writes a .txt file of the tidy data set

    avgtidy <- create_average_data_set(data)
    f <- "avg_tidy_dataset_getdata-005.txt"
    print(sprintf("Writing average tidy data set to file: %s", f))
    write.table(avgtidy, file=f, row.names=FALSE)
}

download_data <- function(url) {
    # Download and extract the data from the specified location.
    #
    # Parameters:
    # url -> An url
    #
    # Return:
    # nothing, but extract the downloaded file on disk

    print("Downloading file")
    download.file(url, "dataset.zip")
    print("Unziping file")
    unzip("dataset.zip")
}

merge_data <- function(directory) {
    # Merge and return the data from the train and test sets.
    #
    # Parameters:
    # directory -> name of a directory where the data are stored
    #
    # Return:
    # a data frame containing the merged data
    print("Merging training and test data sets")
    train <- merge_internal_data(directory, "train")
    test <- merge_internal_data(directory, "test")
    rbind(train, test)
}

merge_internal_data <- function(directory, dataset) {
    # Merge and return the data from the given set (should be train or test).
    #
    # Parameters:
    # directory -> name of a directory where the data are stored
    # dataset -> name of the set (train or test)
    #
    # Return:
    # a data frame containing the merged data

    print(paste("--> Merging internal data set: ", dataset, sep=""))
    subjects <- read.table(file.path(directory, dataset,
                                     paste("subject_", dataset, ".txt", sep="")))
    activities <- read.table(file.path(directory, dataset,
                                       paste("y_", dataset, ".txt", sep="")))
    features <- read.table(file.path(directory, dataset,
                                     paste("x_", dataset, ".txt", sep="")))
    cbind(subjects, activities, features)
}

extract_mean_and_std <- function(data){
    # Keep only the means and stds from the given data frame
    #
    # Parameters:
    # data -> a data frame
    #
    # Return:
    # the data frame with just the columns subject, activity and means and stds variables

    # mean and std are offset by 2 since we bound the subjects and activites
    print("Extracting data about mean and std")
    data[-c(9:42, 49:82, 89:122, 129:162, 169:202, 205:215, 218:228, 231:241, 244:254,
                                 257:267, 274:346, 353:425, 432:504, 507:517, 520:530,
                                 533:543, 546:563)]
}

labels_data <- function(data) {
    # Give label for each column of the data frame
    #
    # Parameters:
    # data -> a data frame
    #
    # Return:
    # the labeled data frame

    print("Labeling data")
    print("--> Giving column names")
    colnames(data) <- get_colnames()
    print("--> Replacing activity ID by names")
    data$ACTIVITIES <- as.character(data$ACTIVITIES)
    data$ACTIVITIES[data$ACTIVITIES == 1] <- "WALKING"
    data$ACTIVITIES[data$ACTIVITIES == 2] <- "WALKING_UPSTAIRS"
    data$ACTIVITIES[data$ACTIVITIES == 3] <- "WALKING_DOWNSTAIRS"
    data$ACTIVITIES[data$ACTIVITIES == 4] <- "SITTING"
    data$ACTIVITIES[data$ACTIVITIES == 5] <- "STANDING"
    data$ACTIVITIES[data$ACTIVITIES == 6] <- "LAYING"
    data
}

create_average_data_set <- function(data) {
    # create a tidy data set with the average of each variable colums for each
    # subject, activity pair.
    #
    # Parameters:
    # data -> a data frame
    #
    # Return:
    # the data frame for the create data set

    print("Creating average tidy data set")
    result <- matrix(ncol=ncol(data))
    for (subject in c(1:30)){
        for (activity in c("WALKING",
                           "WALKING_UPSTAIRS",
                           "WALKING_DOWNSTAIRS",
                           "SITTING",
                           "STANDING",
                           "LAYING")) {
            ## print(sprintf("Subject: %d, Activity: %s", subject, activity))
            sub <- subset(data, data$SUBJECTS == subject &
                                data$ACTIVITIES == activity)
            v <- c(subject, activity, t(colMeans(sub[3:ncol(data)])))
            result <- rbind(result, v[1:ncol(data)])
        }
    }
    result <- result[-1,]
    colnames(result) <- get_colnames()
    result
}

get_colnames <- function() {
    # Return a vector of names to be used with the data frame and the create
    # tidy data set.
    #
    # Return:
    # a vector with the names

    c("SUBJECTS",
      "ACTIVITIES",
      "BodyAccX_Mean",
      "BodyAccY_Mean",
      "BodyAccZ_Mean",
      "BodyAccX_Std",
      "BodyAccY_Std",
      "BodyAccZ_Std",
      "GravityAccX_Mean",
      "GravityAccY_Mean",
      "GravityAccZ_Mean",
      "GravityAccX_Std",
      "GravityAccY_Std",
      "GravityAccZ_Std",
      "BodyAccJerkX_Mean",
      "BodyAccJerkY_Mean",
      "BodyAccJerkZ_Mean",
      "BodyAccJerkX_Std",
      "BodyAccJerkY_Std",
      "BodyAccJerkZ_Std",
      "BodyGyroX_Mean",
      "BodyGyroY_Mean",
      "BodyGyroZ_Mean",
      "BodyGyroX_Std",
      "BodyGyroY_Std",
      "BodyGyroZ_Std",
      "BodyGyroJerkX_Mean",
      "BodyGyroJerkY_Mean",
      "BodyGyroJerkZ_Mean",
      "BodyGyroJerkX_Std",
      "BodyGyroJerkY_Std",
      "BodyGyroJerkZ_Std",
      "BodyAccMag_Mean",
      "BodyAccMag_Std",
      "GravityAccMag_Mean",
      "GravityAccMag_Std",
      "BodyAccJerkMag_Mean",
      "BodyAccJerkMag_Std",
      "BodyGyroMag_Mean",
      "BodyGyroMag_Std",
      "BodyGyroJerkMag_Mean",
      "BodyGyroJerkMag_Std",
      "BodyAccX_Mean",
      "BodyAccY_Mean",
      "BodyAccZ_Mean",
      "BodyAccX_Std",
      "BodyAccY_Std",
      "BodyAccZ_Std",
      "BodyAccJerkX_Mean",
      "BodyAccJerkY_Mean",
      "BodyAccJerkZ_Mean",
      "BodyAccJerkX_Std",
      "BodyAccJerkY_Std",
      "BodyAccJerkZ_Std",
      "BodyGyroX_Mean",
      "BodyGyroY_Mean",
      "BodyGyroZ_Mean",
      "BodyGyroX_Std",
      "BodyGyroY_Std",
      "BodyGyroZ_Std",
      "BodyAccMag_Mean",
      "BodyAccMag_Std",
      "BodyAccJerkMag_Mean",
      "BodyAccJerkMag_Std",
      "BodyGyroMag_Mean",
      "BodyGyroMag_Std",
      "BodyGyroJerkMag_Mean",
      "BodyGyroJerkMag_Std")
}