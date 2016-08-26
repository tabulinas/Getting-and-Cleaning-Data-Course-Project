##Getting and Cleaning Data Course Project
###Make tidy Human Activity Recognition Using Smartphones Dataset
Performed by Svetlana Tabulina

###Script run_analysis.R 
includes two functions: run_analysis() and read_test_and_train()

###Function read_test_and_train() 
is made to read test (or train) data and add subject and activity descriptive variables 
returns test (or train) dataset.

Function run_analysis() makes:

*  download and unzip data in working directory
*  read data (test and train data read with call of function read_test_and_train) 
*  Add descriptive variable names of labels as names of columns to test and train dataset
*  select only features colums with  mean and standard deviation
*  melt the data to make features to be variable
*  create tidy data set with the average of each variable for each activity and each subject.
*  write tidy data to file and View it

###To process the script please execute:
source("run_analysis.r")

run_analysis()

### CodeBook.md 
describes the variables, the data, and transformations

### Tidy data 
will be written in the file /tidy_data.txt in working directory

It consists of 4 variables and 14'220 entries

Variables is the following:

*  activity - one of six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
*  subject - subject (volunteere) who performed the activity for each window sample. Its range is from 1 to 30.
*  feature - mean and std features
*  average value - average value of each feature, for each activity and each subject