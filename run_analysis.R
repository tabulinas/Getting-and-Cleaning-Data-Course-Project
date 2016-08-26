
# run_analysis is the main function, that input data url 
run_analysis <- function(Zip_file_url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"){

#for this script we will need libraries dplyr and reshape2
  library(dplyr)  
  library(reshape2)
  
# download and unzip data in working directory  
#  download.file(Zip_file_url,"./data.zip")
#  unzip("./data.zip")

#get the paths to data files 
    #Links the class labels with their activity name
      activity_labels <- "./UCI HAR Dataset/activity_labels.txt"
    #List of all features
      features <- "./UCI HAR Dataset/features.txt"
    #Test set
      Data_test <- "./UCI HAR Dataset/test/X_test.txt"
    #Test labels
      Labels_test <- "./UCI HAR Dataset/test/y_test.txt"
    #Test set of rows identifies the subject who performed the activity for each window sample
      Subject_test <- "./UCI HAR Dataset/test/subject_test.txt"
    #Train set
      Data_train <- "./UCI HAR Dataset/train/X_train.txt"
    #Train labels
      Labels_train <- "./UCI HAR Dataset/train/y_train.txt"
    #Train set of rows identifies the subject who performed the activity for each window sample
      Subject_train <- "./UCI HAR Dataset/train/subject_train.txt"

#Read activity labels
      activity_label <<- read.table(activity_labels ,sep="")

#With help of function read_test_and_train() read test and train data,
#add descriptive activity names to name the activities in the data set
#and merges the training and the test sets to create one data set.
      test_data<-read_test_and_train()
      train_data<-read_test_and_train(Data_directory = Data_train, Labels_directory = Labels_train ,Subject_directory = Subject_train)
      
      test_and_train_data<-rbind(test_data,train_data)
      
      
      #REad features and identify vector of indices in features with mean and standard deviation
features <- read.table(features,header=FALSE, sep="",stringsAsFactors = F)
ifmean<-grep(("mean|std"),features$V2)

#Add descriptive variable names of labels as names of columns to test and train dataset
names(test_and_train_data) <- c(features$V2,"activity","subject") 

#select only features colums with  mean and standard deviation
ncol <- ncol(test_and_train_data)
mean_and_std_data <- test_and_train_data[,c(ifmean,ncol-1,ncol)]

#melt the data to make features to be variable
molten_data<-melt(mean_and_std_data,c("activity","subject"))


#create tidy data set with the average of each variable for each activity and each subject.
final_data <- summarise(group_by(molten_data,activity,subject,variable), mean(value))
names(final_data)<-c("activity","subject","feature","average value")

#write tidy data to file and View it
write.table(final_data,"./tidy_data.txt")
View(final_data)

}


#function read_test_and_train is made to read test (or train) data and add subject and activity descriptive variables 
#REturns test (or train) dataset
read_test_and_train<-function(Data_directory="./UCI HAR Dataset/test/X_test.txt", Labels_directory="./UCI HAR Dataset/test/y_test.txt", Subject_directory="./UCI HAR Dataset/test/subject_test.txt"){
  x_data<-read.csv(Data_directory, header=FALSE, sep="")
  
  y_data <- read.csv(Labels_directory, header=FALSE, sep="")
  names(y_data)<-"activity"
  
  data1<-cbind(x_data,y_data)
  data2<-mutate(data1,activity=activity_label$V2[activity])
  
  
  subject_data <- read.csv(Subject_directory, header=FALSE, sep="")

  names(subject_data)<-"subject"
  data3<-cbind(data2,subject_data)
  data3
}