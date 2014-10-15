Getting-and-cleaning-data
=========================

Repository contains my submission for the assignment of the Coursera Getting and Cleaning Data course.

##Background
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

Deliverables: 
* a tidy data set as described below, 
* a link to a Github repository with your script for performing the analysis, and 
* a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

##Content
The script processes data from the Human Activity Recognition Using Smartphones Data Set of the UCI Machine Learning Repository 

Description:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Location

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script run_analysis.R perfoms the following steps:
* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement. 
* Use descriptive activity names to name the activities in the data set
* Label the data set with descriptive variable names. 
* From the data set in the previous step, create a second, independent tidy data set with the average of each variable for each activity and each subject.

