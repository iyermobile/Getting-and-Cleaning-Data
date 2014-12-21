## About CodeBook:
This is a code book that describes the variables, the data, and any transformations or work were performed to clean up the data as part of the Course Project - Getting and Cleaning Data.

## About Data Source:

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For the provided UCI HAR data-set the following variables are set from run_analysis.R.  See the [README](README.md) for additional details.

## About Tidy:

A data.table named `data.mean.std` is set with the following columns.  All units are maintained from the original data set. A file named tidy_data_set.txt is written from run_analysis.R.

| column       | description                                              | type    |
| ------------ | -------------------------------------------------------- | ------- |
| Subject      | Identifier of the subject                                | integer |
| Activity     | Label of the activity                                    | factor  |
| MeanSamples  | Mean of variables by Subject + Activity provided in tidy | numeric |

The set of variables that were estimated from these signals are: 

mean: Mean value

std: Standard deviation


## About Variables:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## About Data:
The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


## About Data Transformation:

* Step 1:
	* Read each of the test and training files.
	* Combine the files into a data frame in the form of subjects, labels, and the remaining data.
* Step 2:
	* Read the features part from features.txt and filter it to only trim the features that are either means ("mean()") or standard deviations ("std()"). The reason for trimming out meanFreq() is that the goal for this step is to only include means and standard deviations of measurements,. Hence meanFreq() can be ignored.
	* A new data frame is created that includes subjects, labels and the required features.
* Step 3:
	* Read the activity labels from activity_labels.txt and replace the numbers with the text.
* Step 4:
	* Make a column list (including "subjects" and "label" at the start)
	* Tidy out the list by removing all non-alphanumeric characters and converting the result to lowercase.
	* Apply the now-good-column names to the data frame.
* Step 5:
	* Create a new data frame by finding out the mean for each of the combination of subject and label using the `aggregate()` function.
* Step 6 (Final):
	* Write the new tidy set into a new text file called “tidy_data_set.txt”, with format similar to the original file.

### Result: All the values are means, aggregated over 30 subjects and 6 activities, hence the resulting dataset is 180 rows by 68 columns.
