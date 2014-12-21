# Course Project - Getting and Cleaning Data

##  Repository URL : https://github.com/iyermobile/Getting-and-Cleaning-Data

##  Project Goal: 
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data (in txt format) that can be used for later analysis. 

## About Files in this repository:
* README.md -- Read Me file of the repository that explains how all of the scripts work and how they are connected.  
* CodeBook.md -- codebook file describing variables, the data and transformations.
* run_analysis.R -- actual R code to run the analysis.

## About - How Files are connected and how the script flows?

Assumptions (per instructions of the project):

* All required libraries are present to run the R script.
* The working directory is set to folder which has R script.
* The Data zip file “getdata-projectfiles-UCI HAR Dataset.zip” is unzipped and a folder named “UCI HAR Dataset” is present. From this folder all the files and folders (points below) are copied to the working directory.
	* activity_labels.txt
	* features.txt
	* test
	* train

When the R script “run_analysis.R” is run, the code flow is as explained below: 

1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output tidy data set file “tidy_data_set.txt” is created in the working directory.

## R-Script Code Flow:
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