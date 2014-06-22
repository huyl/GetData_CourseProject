Course Project for Coursera Getting and Cleaning Data 2014 course
=================================================================

This repository consists of two other files:

- `run_analysis.R` contains the R code which downloads, filters, and tidies
  up the data
- `uci_har_tidy.txt` contains the data output by `run_analysis_R` after
  it has been filtered and tidied


Data Source
-----------
Because the raw input data file is very large, it isn't included in the repo.

Instead, the `run_analysis.R` first includes intructions that downloads the
data file and extracts it.

Data Cleaning and Tidying
-------------------------

The rest of the `run_analysis.R` script performs the following operations:

1. It merges the training and test data sets to create one data set
    1. It reads in the training data set from `X_train.txt`, which consists of
        measurements, and appends an `activity` column consisting of the
        training labels from the file `y_train.txt` and a `subject.ID` column
        consisting of the ID for the subject (volunteer) from the file
        `subject_train.txt`
    1. It does the same thing for the testing data set
    1. It combines the training and testing data set by row
1. It extracts only the measurements on the mean and standard deviation for
   each signal
    1. It reads in the names of the features from `features.txt`, verifying
        that the features are listed in the same order as the columns in
        `X_train.txt` and `X_test.txt`
    1. It figures out the relevant features by looking for `std()` or
       `var()` in the variable names.

       Note that we only look for means that have been computed generally
       rather than done for a specific purpose (e.g. the `meanFreq` feature) and
       computed by averaging the signals in a signal window sample
       (the angle() variable collumns).
1. Use descriptive activity names to name the activities in the data set
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

