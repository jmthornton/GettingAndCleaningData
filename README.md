# Getting and Cleaning Data Course Project

## Introduction

The purpose of the project is to demonstrate the principles of data tidying on a data set containing 'messy' data.  The [original data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is provided by the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Setup

### Files Required

* __run_analysis.R__ - The script that creates the data set
* __README.md__ - This file
* __CodeBook.md__ - The code book describing the output data set

The script should be placed in the working directory and the data should be unzipped to a directory named __UCI HAR Dataset__ in the working directory.

### Output Files

The script produces a file named __tidy_data.txt__ in the working directory.

## Processing Methodology

The final data set is produced by assembling the feature measurements, subjects and activities which exist in separate files into a single data set.

The data is cleaned by removing unwanted features and  correcting naming errors in the original features.

This data set is then reshaped into a tidy format (described below) and then the average value for each subject, activity and feature group is calculated.

The following files are used to build the final data set:

* __UCI HAR Dataset/features.txt__ - Feature names
* __UCI HAR Dataset/activity_labels.txt__ - Activity names 
* __UCI HAR Dataset/train/X_train.txt__ - Training set data
* __UCI HAR Dataset/test/X_test.txt__ - Test set data
* __UCI HAR Dataset/train/subject_train.txt__ - Training data set subject list
* __UCI HAR Dataset/test/subject_test.txt__ - Test data set subject list
* __UCI HAR Dataset/train/y_train.txt__ - Training data set activity list
* __UCI HAR Dataset/test/y_test.txt__ - Test data set activity list

### Tidy Data Principles

The original data set is considered untidy because the column headers are feature values that characterise the type of measurement and are not variables.  The script tidies this by turning these into factors of a feature variable.  The final result is a 'long' format of the original data.
