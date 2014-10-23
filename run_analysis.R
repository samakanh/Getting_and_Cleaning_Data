### Load the necessary library
library(dplyr)
library(tidyr)

### Make features and activity label table
feature_label <- read.table("./UCI HAR Dataset/features.txt", 
                col.names = c("feature_id", "feature"), header = FALSE)
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                col.names = c("activity_id", "activity"), header = FALSE)

### Make the data of test subject table
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
colnames(test_data) <- feature_label[,"feature"]
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                col.names = c("activity"), header = FALSE)
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                col.names = c("subject_id"), header = FALSE)

### Make the data of train subject table
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
colnames(train_data) <- feature_label[,"feature"]
train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                             col.names = c("activity"), header = FALSE)
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                            col.names = c("subject_id"), header = FALSE)

### Merges the training and the test sets to create one data set.
complete_data <- rbind(test_data, train_data)
complete_activity <- rbind(test_activity, train_activity)
complete_subject <- rbind(test_subject, train_subject)
complete_tbl <- cbind(complete_subject, complete_activity, complete_data)
complete_tbl <- tbl_df(complete_tbl)

### Make table to clearify whether the subject is train or test
test_subject$subject_type <- "test"
train_subject$subject_type <- "train"
subject_tbl <- unique(rbind(test_subject, train_subject))
subject_tbl <- tbl_df(subject_tbl)
subject_tbl <- arrange(subject_tbl, subject_id)

### Extracts only the measurements on the mean and standard deviation
### for each measurement. 
complete_tbl <- complete_tbl[,c(TRUE, TRUE, grepl("mean\\(\\)|std\\(\\)", 
                                                  feature_label$feature))]
complete_tbl <- arrange(complete_tbl, subject_id)

### Uses descriptive activity names to name the activities in the data set
complete_tbl$activity <- factor(complete_tbl$activity, 
                                labels=activity_label[,"activity"])

### From the data set in step 4, creates a second, independent tidy data set 
### with the average of each variable for each activity and each subject.
summarize_tbl <- complete_tbl %>%
                 group_by(subject_id, activity) %>%
                 summarise_each(funs(mean))

### Cleanup the temporary data
rm(complete_data, complete_activity, complete_subject, test_data, 
   test_activity, test_subject, train_data, train_activity, train_subject, 
   activity_label, feature_label)

### Write into file
write.table(summarize_tbl, file="my_tidy_data.txt", row.name=FALSE)