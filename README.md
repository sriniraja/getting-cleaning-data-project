# Getting and Cleaning Data - Course Project

### Introduction
The data used for this project is from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data represents information collected from accelerometers and gyroscope of a Samsung Galaxy S smartphone.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

30 different users performed six activities - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

The goal of the project is to create one R script called run_analysis.R that does the following. 

 - Step 1: Merges the training and the test sets to create one data set.
 - Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
 - Step 3: Uses descriptive activity names to name the activities in the data set
 - Step 4: Appropriately labels the data set with descriptive variable names. 
 - Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 

### Steps to Run the Project
1. Download the data from the source provided above
2. Copy run_analysis.R in the parent folder of UCI HAR Dataset folder.
3. Set the parent folder as your working directory
4. Run source("run_analysis.R"). The script will product a file called tiny_data.txt

### Dependencies
The script run_analysis.R requires data.table package and reshape2 package.

### Code Book
Please see the CodeBook.md for details
