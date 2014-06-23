Code Book for `uci_har_tidy.txt`
================================

Table Structure
---------------

Data is grouped by `subject.id` and `activity`; for each subject (study
volunteer) and for each activity for that subject, measurements are summarized
in the other table columns for each of 66 features.

Since there are 30 subjects and of six possible activites (WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), there are a total of 180 rows in the
table.

Grouping Variable Names
-----------------------

- `subject.id`: number from 1 to 30 which identifies the subject (study volunteer) who performed the activities summarized in each row.
- `activity`: labels for the activity represented in each row.  These are one of six activites: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.  They were assigned manually from video recordings of the volunteer.

Feature Variable Names
----------------------


Feature Data
------------

- Features are normalized and bounded within [-1,1].

