#run_analysis script

#download the data
library(dplyr)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./dataset.zip")
unzip("dataset.zip")

#1. Merges the training and the test sets to create one data set.
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

test <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train, y_train, x_train)
data <- rbind(test, train)
names(data)[1:2] <- c("sub", "y")

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

##find variable names (columns) used originally in X_train and X_test tables.
feature <- read.table("./UCI HAR Dataset/features.txt")

##find the variables that contain the expression "mean" and the variables that contain the expression "std"
mean_extract <- feature[grep("mean", feature$V2), ]
std_extract <- feature[grep("std", feature$V2), ]
extract <- arrange(unique(rbind(mean_extract, std_extract)), V1)

##remove the "V" from the measurements names on the data
names(data) <- gsub("V", "", names(data))

##create a logical vector for the variables
data <- cbind(data[, 1:2], data[, sort(match(extract$V1, names(data)))])


#3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
data <- merge(data, activity_labels, by.x = "y", by.y = "V1")
data <- data %>% select(sub, -y, V2, "1":"552")

#4. Appropriately labels the data set with descriptive variable names.
names(data)[3:length(colnames(data))] <- as.character(extract$V2)
names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("^f", "frequency", names(data))
names(data) <- gsub("Acc", "Acceleration", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("-", "", names(data))
names(data) <- gsub("\\()", "", names(data))
names(data)[1:2] <- c("subject", "activity")

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- data %>% group_by(subject, activity) %>% summarize_all(mean)
write.table(x = tidy_data, file = "tidy_data.txt", row.names = FALSE)