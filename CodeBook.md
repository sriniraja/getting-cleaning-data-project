# Getting and Cleaning Data - Course Project - Code Book

### Introduction
The data used for this project is from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data represents information collected from accelerometers and gyroscope of a Samsung Galaxy S smartphone.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

30 different users performed six activities - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

### Details about tidy_data.txt

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals . 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.

All the data in tidy_data.txt is an average grouped by Subject and Activity ( Id/Name)

1. Subject - Denotes the 1 of the 30 volunteers who performed this observation
2. ActivityId - Denotes the ActivityId of the observation. Values are 1-6
3. ActivityName - Denotes the Activity Name performed by the Subject. Values include - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
4. tBodyAccMean-X, tBodyAccMeanY, tBodyAccMeanZ contains the average value of the Mean Body Accelerator Data observed in the test grouped by Subject and Activity
	'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
5. tBodyAccStdX, tBodyAccStdY, tBodyAccStdZ - contains the average value of the Standard Deviation of "Body Accelerator" Data observed in the test grouped by Subject and Activity
6. tGravityAccMeanX, tGravityAccMeanY, tGravityAccMeanZ - contains the average value of Mean "Gravity Accelerator" Data observed in the test grouped by Subject and Activity
7. tGravityAccStdX, tGravityAccStdY, tGravityAccStdZ - contains the average value of the Standard Deviation of "Gravity Accelerator" Data observed in the test grouped by Subject and Activity
8. tBodyAccJerkMeanX,tBodyAccJerkMeanY, tBodyAccJerkMeanZ, tBodyAccJerkStdX, tBodyAccJerkStdY, tBodyAccJerkStdZ - contains the average value of the Mean and Standard Deviation of "Accelerometer Jerk Signals" observed grouped by Subject and Activity
9. tBodyGyroMeanX, tBodyGyroMeanY, tBodyGyroMeanZ, tBodyGyroStdX, tBodyGyroStdY, tBodyGyroStdZ - contains the average value of Mean, Standard Deviation "Body Gyroscope" Data observed in the test grouped by Subject and Activity
10. tBodyGyroJerkMeanX, tBodyGyroJerkMeanY, tBodyGyroJerkMeanZ, tBodyGyroJerkStdX, tBodyGyroJerkStdY, tBodyGyroJerkStdZ - contains the average value of Mean, Standard Deviation "Body Gyroscope Jerk" Data observed in the test grouped by Subject and Activity
11. tBodyAccMagMean, tBodyAccMagStd - average value of Mean and Standard Deviation of "Body Accelerometer Signal's Magnitude"
12. tGravityAccMagMean, tGravityAccMagStd - average value of Mean and Standard Deviation of "Gravity Accelerometer Signal's Magnitude"
13. tBodyAccJerkMagMean, tBodyAccJerkMagStd - average value of Mean and Standard Deviation of "Body Jerk Accelerometer Signal's Magnitude"
14. tBodyGyroMagMean, tBodyGyroMagStd - average value of Mean and Standard Deviation of "Body Gyroscope Signal's Magnitude"
15. tBodyGyroJerkMagMean, tBodyGyroJerkMagStd - average value of Mean and Standard Deviation of "Body Jerk Gyroscope Signal's Magnitude"
16. f denotes frequency domain signals, the data in the columns below denote the same format as for the time domain signals described above.
	- The columns start with fBodyAccMeanX, fBodyAccMeanY, .... and ends with fBodyGyroJerkMagMeanFreq
17. angle - denotes angle between two vectors - The column data starts with "angletBodyAccMean,gravity", "angletBodyAccJerkMean,gravityMean"... and ends with "angleZ,gravityMean"


### Steps to achieve tidy_data.txt set for this project

The original dataset from UCI includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

1. Load the features.txt data and perform the following changes to the names of columns
2. Replace -mean with Mean
3. Replace -std with Std
4. Replace BodyBody with Body
5. Replace () with empty string ""
6. Let us now start with Test Data. The data is present in the test Folder.
7. Labels for X_test.txt is present at the features.txt file. Merge them to create the test data with labels.
8. In the above step, Please note that we will be merging with the features data obtained from Step 1-5
9. Each Row in y_test.txt corresponds to a row in X_test.txt. y_test descibes the activity for each Test observation.
10. Map y_test.txt with the activity name from activity_labels.txt. Also add the labels "ActivityId" and "ActivityName" to the columns
11. subject_test.txt contains the subject identification for each activity. Let us add a name "Subject" to the column
12. Merge the mapped y_test.txt (obtained from Step 10) tith the X_test.txt obtained from Step 7 and the subject_test.txt
13. This will give you a test data set, complete with proper column names
14. Perform the steps 7 - 12 on Training Data also. The training data is present in the train Folder.
15. Now combine the test and train data and this will give you the complete data set
16. Take only the rows that has Mean or Std in their names as our focus in this project is only on those columns. Also take the Subject, ActivityId and ActivityName columns. This subset is what we need for our project.
17. Let us now melt the data obtained in Step 16 based on Subject,ActivityId,ActivityName. This will get us a clean, tidy data.
18. Now let us create a second, independent tidy data set with the average of each variable for each activity (ActivityId+ActivityName) and each subject.
19. Let us write this obtained data into a file tidy_data.txt file with tab delimitation. 









