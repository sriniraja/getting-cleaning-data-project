
# Goals for the Script
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Load Activity Labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Load Features Information
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Tidy up the Labels
features = gsub('-mean','Mean', features)
features = gsub('-std', 'Std', features)
features = gsub('BodyBody', 'Body', features)
features = gsub('[-()]', '', features)

# Loading Test Data
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Set labels for Test Data from Features	
names(test_data) = features

# Loading Test Labels 
y_test_data <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Merge Activity Labels with Test Labels
y_test_labels <- merge(y_test_data,activity_labels,by="V1")

# Load Subject Information 
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject_test) = "Subject"

# Combine All information into test_data
test_data <- cbind(subject_test,y_test_labels,test_data)

# Set the correct Labels for the Test Data, Now Test Data is ready
colnames(test_data)[2]<-"ActivityId"
colnames(test_data)[3]<-"ActivityName"


	
# Loading Training Data
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Set labels for Training Data from Features	
names(train_data) = features
	
# Loading Training Labels
y_train_data <- read.table("./UCI HAR Dataset/train/y_train.txt")
	
# Merge Activity Labels with Train Labels
y_train_labels <- merge(y_train_data,activity_labels,by="V1")

# Load Subject Information 
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_train) = "Subject"

# Combine All information into train_data
train_data <- cbind(subject_train,y_train_labels,train_data)

# Set the correct Labels for the Training Data
colnames(train_data)[2]<-"ActivityId"
colnames(train_data)[3]<-"ActivityName"

# all_data contains the merged train and test data. Goal #1 is achieved
all_data <- rbind(train_data,test_data)

# Now we extract only Mean and Standard Deviation Columns
colsWeWant <- grep(".*Mean.*|.*Std.*", names(all_data))
# We also want the Subject, ActivityId and ActivityName
colsWeWant<-append(colsWeWant,1:3,after=0)

#This subset contains all the columns we want. Goal #2,#3 and #4 are achieved
selectedData<-all_data[,colsWeWant]

#Melt based on Subject, ActivityId and Activity Name
require(reshape2)
melted_data <- melt(selectedData, id=c("Subject","ActivityId","ActivityName"))

#dcast on Subject+ActivityId+ActivityName to get mean and obtain the final result for upload
tidy_data <- dcast(melted_data, formula = Subject + ActivityId + ActivityName ~ variable, mean)

#write the tidy_data data frame into a tab separated file. Goal #5 is achieved.
write.table(tidy_data, "tidy_data.txt", sep="\t", row.names=FALSE)
