#Getting and Cleaning Data Course Project :)

install.packages(dplyr)
library(dplyr)

#Reading data 
list.files("UCI HAR Dataset")
list.files("UCI HAR Dataset/train")
list.files("UCI HAR Dataset/test")
training_measurements <- read.table("UCI HAR Dataset/train/X_train.txt")
training_activities <- read.table("UCI HAR Dataset/train/y_train.txt")
training_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_measurements <- read.table("UCI HAR Dataset/test/X_test.txt")
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#1. Merging training and test sets to create one dataset 
names(training_measurements) <- features[, 2]
names(test_measurements) <- features[, 2]
training_data <- cbind(training_subjects, training_activities, training_measurements)
names(training_data)[1:2] <- c("subject", "activity")
test_data <- cbind(test_subjects, test_activities, test_measurements)
names(test_data)[1:2] <- c("subject", "activity")
combined_data <- rbind(training_data, test_data)

#2. Extracting mean and SD
wanted_measurements <- grep("mean\\(\\)|std\\(\\)", names(combined_data), value = TRUE) 
suacwa <- select(combined_data, subject, activity, all_of(wanted_measurements)) 

#3. Use decsriprtive activity names
suacwa$activity <- activity_labels$V2[match(suacwa$activity, activity_labels$V1)]
unique(suacwa$activity)

#4. Appropriately label variables of dataset with decsriptive variable names
names(suacwa) <- gsub("^t", "Time", names(suacwa))
names(suacwa) <- gsub("^f", "Frequency", names(suacwa))
names(suacwa) <- gsub("Acc", "Accelerometer", names(suacwa))
names(suacwa) <- gsub("Gyro", "Gyroscope", names(suacwa))
names(suacwa) <- gsub("Mag", "Magnitude", names(suacwa))
names(suacwa) <- gsub("mean\\(\\)", "Mean", names(suacwa))
names(suacwa) <- gsub("std\\(\\)", "StandardDeviation", names(suacwa))
names(suacwa) <- gsub("-", "", names(suacwa))

#5. Creating a second, independent tidy data set with average of each variable for each activity and subject 
tidy_data <- suacwa %>% group_by(subject, activity) %>% summarise(across(everything(), mean))