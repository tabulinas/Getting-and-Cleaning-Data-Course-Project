This is Code Book of making tidy Human Activity Recognition Using Smartphones Dataset.
Performed by Svetlana Tabulina.

Input Data:  Zip folder with the dataset with files:
1)  /UCI HAR Dataset/activity_labels.txt
	Links the class labels with their activity name
2)	/UCI HAR Dataset/features.tx
	List of all features
3) 	/UCI HAR Dataset/test/X_test.txt
    Test set
4)	/UCI HAR Dataset/test/y_test.txt
	Test labels
5)	/UCI HAR Dataset/test/subject_test.txt
    Test set of rows identifies the subject who performed the activity for each window sample
6)  /UCI HAR Dataset/train/X_train.txt
    Train set
7)  /UCI HAR Dataset/train/y_train.txt
    Train labels
8)  /UCI HAR Dataset/train/subject_train.txt
    Train set of rows identifies the subject who performed the activity for each window sample
    
Analysis performed with function run_analysis(), which uses function read_test_and_train() function.

Function read_test_and_train() is made to read test (or train) data and add subject and activity descriptive variables 
returns test (or train) dataset.


Function run_analysis() makes:
	-download and unzip data in working directory
	-read data (test and train data read with call of function read_test_and_train) 
	-Add descriptive variable names of labels as names of columns to test and train dataset
	-select only features colums with  mean and standard deviation
	-melt the data to make features to be variable
	-create tidy data set with the average of each variable for each activity and each subject.
	-write tidy data to file and View it

Tidy data will be written in the file /tidy_data.txt in working directory.
It consists of 4 variables and 14'220 entries.

Variables is the following:
	activity - one of six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
	subject - subject (volunteere) who performed the activity for each window sample. Its range is from 1 to 30.
	feature - mean and std features
	average value - average value of each feature, for each activity and each subject