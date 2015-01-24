# Code Book

This is the code book describing the data set produced by the __run_analysis.R__ script.  Please refer to the __README.md__ file and the code comments for a description of its operation.

Reference should be made to the original code book located in the __UCI HAR Dataset/features_info.txt__ file for a description of the original data.

The data set contains the following four variables:

__subject__ - An integer value between 1 and 30 which is the id of each subject in the experiment

__activity__ - A 6-level factor describing the subject's activity at the time of the measurement.  The values are:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

__feature__ - A 66-level factor describing the type of measurement.  These factors are identical to the features described in the original data code book and reference should be made to this.  The features in this data set are those relating to the mean or standard deviation, defined in the original data set with mean() and std() suffixes.  An example feature name is: __tGravityAccMeanZ__ which is interpreted as the mean value of the time domain gravity signal from the accelerometer Z-axis.

__average__ - A unitless numeric value with the range -1 to +1.  This is the mean value for each group of subject, activity and feature observations.
