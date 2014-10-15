##Background
The script processes data from the Human Activity Recognition Using Smartphones Data Set of the UCI Machine Learning Repository
Description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Location
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The script run_analysis.R performs the following steps:
•	Merge the training and the test sets to create one data set.
•	Extract only the measurements on the mean and standard deviation for each measurement.
•	Use descriptive activity names to name the activities in the data set
•	Label the data set with descriptive variable names.
•	From the data set in the previous step, create a second, independent tidy data set with the average of each variable for each activity and each subject.

##Assumptions
The file is downloaded to a local repository and the working directory is set to be the folder UCI HAR Dataset that contains relevant data. Plyr and Reshape2 packages are installed

##Data processing

### Load relevant data
* file with training data: x_train.txt
* file with training activity ID label: y_train.txt
* file with subject IDs: subject_train.txt
* file with test data: x_test.txt
* file with test activity ID labels: y_test.txt
* file with test subject IDs: subject_test.txt
* file with column names: features.txt
* file with descriptive activity labels: activity_labels.txt

###Merge data
Steps:
* Combine training and test data
* Add column names to data, activity ID and subject ID
* Combine columns for activity IDs and subject ID with combined data set

### Extract measurements on mean and standard deviations
Create a data frame that only contains activity ID and subject ID as well as any column with a name that includes the substrings “mean” or “std” (see features_info.txt).

### Use descriptive activity names
Merge the data frame with the descriptive activity labels file

###Label data set with descriptive variable names
Use a for loop to replace relevant sub-strings in accordance with the description available:
* remove empty brackets
* replace t and f at the beginning of labels with Time and Frequency
* replace mean and std with Mean and Standard Deviation
* replace other relevant components with more descriptive names (e.g. Acc with Acceleration) and ensure that words are capitalized consistently

###Create independent data set for the mean values for each activity that a person has data for
Create a key that combines subject ID and activity ID. Melt the data frame and re-cast it to calculate the mean values for each person/activity ID. Merge the subject ID and descriptive activity name back into the data set and re-format it so that the first two columns are subject ID, activity description followed by the data and sorted by the first two columns.
Save the file as tidydata.txt

