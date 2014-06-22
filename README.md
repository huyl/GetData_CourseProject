Course Project
==============
**Course Project for Coursera Getting and Cleaning Data 2014 course**

This repository consists of two other files:

- `run_analysis.R` contains the R code which downloads, filters, and tidies
  up the data
- `uci_har_tidy.txt` contains the data output by `run_analysis_R` after
  it has been filtered and tidied


Data Source
-----------
The raw data comes from the [HCI Machine Learning
Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
and is derived from recordings of 30 subjects performing activities of daily living
(ADL) while carrying a waist-mounted smartphone (Samsung Galaxy S II) with
embedded inertial sensors.


Because the raw input data file is very large, it isn't included in the repo. 
Instead, the `run_analysis.R` includes intructions that first downloads the
[data
and description file set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
and extracts the archive.

Data Cleaning and Tidying
-------------------------

The rest of the `run_analysis.R` script performs the following operations on
the files contained in HCI's archive:

1. To merge the training and test data sets to create one data set:
    1. It reads in the training data set from `X_train.txt`, which consists of
        measurements, and appends an `activity` column consisting of the
        training labels from the file `y_train.txt` and a `subject.ID` column
        consisting of the ID for the subject (volunteer) from the file
        `subject_train.txt`
    1. It does the same thing for the testing data set
    1. It combines the training and testing data set by row
1. To extract only the measurements on the mean and standard deviation for
   each signal:
    1. It reads in the names of the features from `features.txt`, verifying
        that the features are listed in the same order as the columns in
        `X_train.txt` and `X_test.txt`
    1. It figures out the relevant features by looking for `std()` or
       `var()` in the variable names.

       Note that we only look for means that have been computed *generally*
       rather than done for a specific purpose (e.g. the `meanFreq` feature) and
       computed by averaging the signals in a signal window sample
       (the angle() variable collumns).
1. To give descriptive activity names to the activities in the data set:
    1. It reads in descriptions of the activities
    1. It converts the activities in the data set, coded as a number from
       1-6, into a factor with descriptive labels from the file
       `activity_labels.txt`.  The mapping is as follows:

            1 WALKING
            2 WALKING_UPSTAIRS
            3 WALKING_DOWNSTAIRS
            4 SITTING
            5 STANDING
            6 LAYING
1. To label the columns in data set with descriptive variable names:
    1. It first corrects the typo "BodyBody" to "Body".  We assume it's a
       typo, based on descriptions in the `README.txt` file in the archive and
       the fact that the feature names stay distinct after the correction.
    1. We replace the abbreviations by more descriptive names, except
        for the standard deviation for which we assign the most common
        industry-accepted abbreviation "SD".
1. To create a second, independent tidy data set with the average of each
variable for each activity and each subject:
    1. It groups the data by subject ID and by activity
    1. It summarizes the data in the groups by averaging


Data Output
-----------

The summarized tidy data set is output to file `uci_har_tidy.txt` in a simple
space-separated text file with the first row serving as a header with the
column names.
