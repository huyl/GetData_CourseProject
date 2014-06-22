# 2014-06-22 huy

# Only enable this the first time as some operations take a long time
INIT = 1

### Download data (62.6MB)

if (INIT) {
  download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile="UCI HAR Dataset.zip")
  unzip("UCI HAR Dataset.zip", overwrite=T)
}

### 1. Merge the training and the test sets to create one data set.

# NOTE: we don't include the data from the "Inertial Signals" folder because
# we filter them out in step 2 anyway

if (INIT) {
  train = read.table("UCI HAR Dataset/train/X_train.txt", header=F)
}
trainActivities = read.table("UCI HAR Dataset/train/y_train.txt", header=F)
train$activity = trainActivities$V1
trainSubjects = read.table("UCI HAR Dataset/train/subject_train.txt", header=F)
train$subject.ID= trainSubjects$V1

if (INIT) {
  test = read.table("UCI HAR Dataset/test/X_test.txt", header=F)
}
testActivities = read.table("UCI HAR Dataset/test/y_test.txt", header=F)
test$activity = testActivities$V1
testSubjects = read.table("UCI HAR Dataset/test/subject_test.txt", header=F)
test$subject.ID = testSubjects$V1

df = rbind(train, test)


### 2. Extract only the measurements on the mean and standard deviation for each measurement


# Read in the measurement names

features = read.table("UCI HAR Dataset/features.txt", header=F)
names(features) = c("column.number", "variable.name")
str(features)

# Verify that the features are listed in order with the row number matching
# the column number ("column" from the point of view of the X_train.txt and
# X_test.txt tables) so that it can be used below
if (sum(features$column.number != as.numeric(rownames(features))) > 0) {
  stop()
}

# Filter the measures to only those related to mean and standard deviation
#
# NOTE: I interpret this to mean "only the measurements on the mean and
# standard deviation for each _signal_", and I assume that the mean is
# general rather than done for a specific purpose such as meanFreq and the
# vectors obtained by averaging the signals in a signal window sample
# (the angle() variable collumns)

relevantVars = grep("std\\(\\)|mean\\(\\)", features$variable.name)
features$variable.name[relevantVars]
relevantVars

# Create a new dataset with just those measurements, but keeping the subject
# and activity columns

relevantDf = df[, relevantVars]

# Give variable names semi-descriptive names

names(relevantDf) = make.names(features[relevantVars, "variable.name"])

# Re-add the subject and activity columns that we'll need in later steps

relevantDf$subject.ID = df$subject.ID
relevantDf$activity = df$activity


### 3. Use descriptive activity names to name the activities in the data set


# Read in descriptions of activites

activities = read.table("UCI HAR Dataset/activity_labels.txt", header=F)


# Convert activity code to a factor with descriptive names as listed
# in activity_labels.txt

relevantDf$activity = factor(relevantDf$activity, levels=activities$V1,
                             labels=activities$V2)


### 4. Appropriately label the data set with descriptive variable names.

# NOTE: I've already given preliminary descriptive names for each column in
# Step 2, as generated from the file features.txt

ns = features[relevantVars, "variable.name"]

# Correct what looks like a typo in the features.txt file, based on the
# README.txt :
# "BodyBody" is written instead of "Body".  If we convert these feature names
# to "Body", the feature names are still distinct.

ns = gsub("BodyBody", "Body", ns)

ns = gsub("^t", "time.", ns)
ns = gsub("^f", "frequency.", ns)
ns = gsub("Body", "body", ns)
ns = gsub("Gravity", "gravity", ns)
ns = gsub("Acc", ".acceleration", ns)
ns = gsub("Gyro", ".gyroscope", ns)
ns = gsub("Jerk", ".jerk", ns)
ns = gsub("Mag", ".magnitude", ns)
ns = gsub("std", "SD", ns)
ns = gsub("\\(\\)", "", ns)
ns

names(relevantDf) = make.names(c(
  as.vector(ns),
  "subject.ID",
  "activity"))


### 5. Creates a second, independent tidy data set with the average of each
### variable for each activity and each subject. 

# NOTE: dplyr is the next iteration of plyr by the same author
library(dplyr)
tidyDf = relevantDf %.%
  group_by("subject.ID", "activity") %.%
  summarise_each(funs(mean))

# Rename the variable names to reflect averaging
ns = colnames(tidyDf)
ns = c(ns[1:2], paste(ns[3:length(ns)], ".average", sep=""))
colnames(tidyDf) = ns

#dim(tidyDf)


### Write out data set

write.table(tidyDf, file="uci_har_tidy.txt", row.names=F)
