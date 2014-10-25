## Readme
This file contain the prerequisite before running the script and the introduction to run_analysis.R script.

#### Prerequisite
1. dplyr package
2. download data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract to your working directory ("UCI HAR Dataset" folder should visible in your working directory)

#### Introduction to the run_analysis.R
The run_analysis.R script read the raw data from the following files;
- ./UCI HAR Dataset/features.txt
- ./UCI HAR Dataset/activity_labels.txt
- ./UCI HAR Dataset/test/X_test.txt
- ./UCI HAR Dataset/test/y_test.txt
- ./UCI HAR Dataset/test/subject_test.txt
- ./UCI HAR Dataset/train/X_train.txt
- ./UCI HAR Dataset/train/y_train.txt
- ./UCI HAR Dataset/train/subject_train.txt

and generates three tidy data set;
- complete_tbl  : Contain all observations from the source files.
- summarize_tbl : Contain the independent tidy data set with the average of each variable for each activity and each subject.
- subject_tbl   : Contain the link between subject and how the data obtained, train or test.

then export **summarize_tbl** data set as a text file, named "my_tidy_data.txt", to your working directory.
