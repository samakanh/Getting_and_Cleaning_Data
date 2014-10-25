## Readme
This file contain the prerequisite before running the script and the explaination of run_analysis.R script.

#### Prerequisite
1. dplyr package
2. tidyr package
3. download data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract to your working directory ("UCI HAR Dataset" folder should visible in your working directory)

#### Introduction to the run_analysis.R
The run_analysis.R script read the raw data from the following files;
- features.txt
- activity_labels.txt
- X_test.txt
- y_test.txt
- subject_test.txt
- X_train.txt
- y_train.txt
- subject_train.txt

and generates three tidy data set;
- complete_tbl  : Contain all observations from the source files.
- summarize_tbl : Contain the independent tidy data set with the average of each variable for each activity and each subject.
- subject_tbl   : Contain the link between subject and how the data obtained, train or test.

then export **summarize_tbl** data set as a text file, named "my_tidy_data.txt", in your working directory.

#### run_analysis.R script explaination
1. Load require library, dplyr and tidyr.
2. Load files using read.table() with header = FALSE
  - Load ./features.txt into **feature_label** data frame this contains two column, *feature_id* and *feature*
  - Load ./activity.txt into **activity_label** data frame this contains two column, *activity_id* and *activity*
  - Load ./test/X_test.txt into **test_data** data frame 
  - Load ./test/y_test.txt into **test_activity** data frame this contains one column, *activity_name*
  - Load ./test/subject_test.txt into **test_subject** data frame this contains one column, *subject*

