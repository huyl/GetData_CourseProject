Code Book for `uci_har_tidy.txt`
================================

Data Set Information
--------------------

Smartlab (Non-Linear Complex Systems Laboratory) at the DITEN Department of the University of Genova carried out experiments with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experimenters captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to enable labeling the activities manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The raw data originally came from the [HCI Machine Learning
Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones),
and can be obtained in a [data
and description file archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The raw data was filtered and summarized as described in later sections.

Table Structure
---------------

Data is grouped by `subject.id` and `activity`; for each subject (study
volunteer) and for each activity for that subject, measurements are summarized
in the other table columns for each of 66 features.

Since there are 30 subjects and six possible activites (WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), there are a total of 180 rows in the
table.

Variable Names for grouping
---------------------------

- `subject.id`: number from 1 to 30 which identifies the subject (study volunteer) who performed the activities summarized in each row.
- `activity`: labels for the activity represented in each row.  These are one of six activites: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.  They were assigned manually from video recordings of the volunteer.

Variable Names for measurements
-------------------------------

- timeDomain.body.acceleration.mean.X.average
- timeDomain.body.acceleration.mean.Y.average
- timeDomain.body.acceleration.mean.Z.average
- timeDomain.body.acceleration.SD.X.average
- timeDomain.body.acceleration.SD.Y.average
- timeDomain.body.acceleration.SD.Z.average
- timeDomain.gravity.acceleration.mean.X.average
- timeDomain.gravity.acceleration.mean.Y.average
- timeDomain.gravity.acceleration.mean.Z.average
- timeDomain.gravity.acceleration.SD.X.average
- timeDomain.gravity.acceleration.SD.Y.average
- timeDomain.gravity.acceleration.SD.Z.average
- timeDomain.body.acceleration.jerk.mean.X.average
- timeDomain.body.acceleration.jerk.mean.Y.average
- timeDomain.body.acceleration.jerk.mean.Z.average
- timeDomain.body.acceleration.jerk.SD.X.average
- timeDomain.body.acceleration.jerk.SD.Y.average
- timeDomain.body.acceleration.jerk.SD.Z.average
- timeDomain.body.gyroscope.mean.X.average
- timeDomain.body.gyroscope.mean.Y.average
- timeDomain.body.gyroscope.mean.Z.average
- timeDomain.body.gyroscope.SD.X.average
- timeDomain.body.gyroscope.SD.Y.average
- timeDomain.body.gyroscope.SD.Z.average
- timeDomain.body.gyroscope.jerk.mean.X.average
- timeDomain.body.gyroscope.jerk.mean.Y.average
- timeDomain.body.gyroscope.jerk.mean.Z.average
- timeDomain.body.gyroscope.jerk.SD.X.average
- timeDomain.body.gyroscope.jerk.SD.Y.average
- timeDomain.body.gyroscope.jerk.SD.Z.average
- timeDomain.body.acceleration.magnitude.mean.average
- timeDomain.body.acceleration.magnitude.SD.average
- timeDomain.gravity.acceleration.magnitude.mean.average
- timeDomain.gravity.acceleration.magnitude.SD.average
- timeDomain.body.acceleration.jerk.magnitude.mean.average
- timeDomain.body.acceleration.jerk.magnitude.SD.average
- timeDomain.body.gyroscope.magnitude.mean.average
- timeDomain.body.gyroscope.magnitude.SD.average
- timeDomain.body.gyroscope.jerk.magnitude.mean.average
- timeDomain.body.gyroscope.jerk.magnitude.SD.average
- frequencyDomain.body.acceleration.mean.X.average
- frequencyDomain.body.acceleration.mean.Y.average
- frequencyDomain.body.acceleration.mean.Z.average
- frequencyDomain.body.acceleration.SD.X.average
- frequencyDomain.body.acceleration.SD.Y.average
- frequencyDomain.body.acceleration.SD.Z.average
- frequencyDomain.body.acceleration.jerk.mean.X.average
- frequencyDomain.body.acceleration.jerk.mean.Y.average
- frequencyDomain.body.acceleration.jerk.mean.Z.average
- frequencyDomain.body.acceleration.jerk.SD.X.average
- frequencyDomain.body.acceleration.jerk.SD.Y.average
- frequencyDomain.body.acceleration.jerk.SD.Z.average
- frequencyDomain.body.gyroscope.mean.X.average
- frequencyDomain.body.gyroscope.mean.Y.average
- frequencyDomain.body.gyroscope.mean.Z.average
- frequencyDomain.body.gyroscope.SD.X.average
- frequencyDomain.body.gyroscope.SD.Y.average
- frequencyDomain.body.gyroscope.SD.Z.average
- frequencyDomain.body.acceleration.magnitude.mean.average
- frequencyDomain.body.acceleration.magnitude.SD.average
- frequencyDomain.body.acceleration.jerk.magnitude.mean.average
- frequencyDomain.body.acceleration.jerk.magnitude.SD.average
- frequencyDomain.body.gyroscope.magnitude.mean.average
- frequencyDomain.body.gyroscope.magnitude.SD.average
- frequencyDomain.body.gyroscope.jerk.magnitude.mean.average
- frequencyDomain.body.gyroscope.jerk.magnitude.SD.average


Measurement Data
----------------

- Features are normalized and bounded within [-1,1].

