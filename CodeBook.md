Code Book for `uci_har_tidy.txt`
================================

Data Set Information
--------------------

Smartlab (Non-Linear Complex Systems Laboratory) at the DITEN Department of the University of Genova carried out experiments with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experimenters captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to enable labeling the activities manually.

The raw data originally came from the [HCI Machine Learning
Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones),
and can be obtained in a [data
and description file archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The raw data was filtered and summarized as described in later sections.

Table Structure
---------------

Data is grouped by `subject.id` and `activity`; for each subject (study
volunteer) and for each activity for that subject, measurements are summarized
in the other table columns for each of 66 features.  There are thus 68 columns.

Since there are 30 subjects and six possible activites (WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) for each subject, there are a total of 180 rows in the
table.

Variables for grouping
----------------------

- `subject.id`: number from 1 to 30 which identifies the subject (study volunteer) who performed the activities summarized in each row.
- `activity`: labels for the activity represented in each row.  These are one of six activites: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.  They were assigned manually from video recordings of the subject.

Variables for measurements
--------------------------

### Measurements

The measurements come from accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix 'timeDomain') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.  They were then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). Similarly, the acceleration signal was then separated into body and gravity acceleration signals (prefixes timeDomain.body.acceleration and timeDomain.gravity.acceleration) using another low pass Butterworth filter.  A cutoff frequency of 0.3 Hz was used, as the gravitational force was assumed to have only low frequency components.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (prefixes timeDomain.body.acceleration.jerk and timeDomain.body.gyroscope.jerk).  In addition, the magnitude of these three-dimensional signals were calculated using the Euclidean norm (prefixes timeDomain.body.acceleration.magnitude, timeDomain.gravity.acceleration.magnitude, timeDomain.body.acceleration.jerk.magnitude, timeDomain.body.gyroscope.magnitude, timeDomain.body.gyroscope.jerk.magnitude). 

A Fast Fourier Transform (FFT) was applied to some of these signals producing separate variables with corresponding names (Note the 'frequencyDomain' to indicate frequency domain signals). 

For each of these signals, the mean and standard deviations were calculated and then normalized and bounded within [-1,1].

### Summarization

All the means and standard deviations were summarized by subject.id and activity group and taking the average.

### Organization and naming of variables

The variables are organized in a hierarchy of subdivision, as reflected by the consecutive chaining of prefixes to form the final variable names:

1. The measurement variables are first divided this way:
    - signals in the time domain (prefix 'timeDomain')
    - signals in the frequency domain, resulting by applying a Fast Fourier
      Transform (FFT) to some of the time-domain signals (prefix 'frequencyDomain')
2. The time-domain signals can be themselves divided into 2 groups:
    - signals related to the body's movement (prefix 'body')
    - signals related to the acceleration of gravity (prefix 'gravity')
   For the frequency-domain signals, there are only variables related to the body's movement. (prefix 'body')
3. For body signals, there are measurements from the two devices:
    - accelerometer (prefix 'acceleration')
    - gyroscope (prefix 'gyroscope')
4. For gravity signals, there are only only measurements from the accelerometer (prefix 'acceleration')
5. For body accelerometer and body gyroscope signals, the derivative in time was computed in order to obtain new variables representing the Jerk signals (prefix 'jerk')
6. For all these three-axial signals, the magnitude was computed using the Euclidian norm to obtain new variabels (prefix 'magnitude')
7. For all these variables, these statistics were calculated:
    - mean (prefix 'mean')
    - standard deviation (prefix 'SD')
8. The three-axial signals (i.e., all the variables without the subname 'magnitude') are subdivided into their respective dimensions:
    - X (prefix 'X')
    - Y (prefix 'Y')
    - Z (prefix 'Z')
9. At this point, all values were normalized and bounded within [-1,1].
10. Finally, the variable subname 'average' is appended to each variable's chain of prefixes in order to denote the summarization function.

### Variable names

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
