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

##Raw data description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Attribute Information:

For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

##Final data set
Contains:
* Two ID columns for activity and test subject IDs
* Variable columns refer permutations of the following factors:
  * Time/Frequency
  * Body/Gravity
  * Gyro/Acceleration/Angle
  * Jerk
  * Statistical measure (mean, standard deviation)
  * Direction relative to device denoted as X, Y and Z axes
* For each combination of ID and activity, the average of observations was calculated for all variables.

Please refer to complete list of column names at the end of the codebook.

##Data processing steps

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
Merge the data frame with the descriptive activity labels file.

###Label data set with descriptive variable names
Use a for loop to replace relevant sub-strings in accordance with the description available:
* remove empty brackets
* replace t and f at the beginning of labels with Time and Frequency
* replace mean and std with Mean and Standard Deviation
* replace other relevant components with more descriptive names (e.g. Acc with Acceleration) and ensure that words are capitalized consistently

###Create independent data set for the mean values for each activity that a person has data for
Steps:
* Create a key that combines subject ID and activity ID. 
* Melt the data frame and re-cast it to calculate the mean values for each person/activity ID. 
* Merge the subject ID and descriptive activity name back into the data set and re-format it so that the first two columns are subject ID, activity description followed by the data and sorted by the first two columns.
* Save the file as tidydata.txt


## List of columns in final data set
 [1] "SubjectID"                                                             
 [2] "Activity"                                                              
 [3] "Time Body Acceleration -Mean -X"                                       
 [4] "Time Body Acceleration -Mean -Y"                                       
 [5] "Time Body Acceleration -Mean -Z"                                       
 [6] "Time Body Acceleration -Stdandard Deviation -X"                        
 [7] "Time Body Acceleration -Stdandard Deviation -Y"                        
 [8] "Time Body Acceleration -Stdandard Deviation -Z"                        
 [9] "Time Gravity Acceleration -Mean -X"                                    
[10] "Time Gravity Acceleration -Mean -Y"                                    
[11] "Time Gravity Acceleration -Mean -Z"                                    
[12] "Time Gravity Acceleration -Stdandard Deviation -X"                     
[13] "Time Gravity Acceleration -Stdandard Deviation -Y"                     
[14] "Time Gravity Acceleration -Stdandard Deviation -Z"                     
[15] "Time Body Acceleration Jerk-Mean -X"                                   
[16] "Time Body Acceleration Jerk-Mean -Y"                                   
[17] "Time Body Acceleration Jerk-Mean -Z"                                   
[18] "Time Body Acceleration Jerk-Stdandard Deviation -X"                    
[19] "Time Body Acceleration Jerk-Stdandard Deviation -Y"                    
[20] "Time Body Acceleration Jerk-Stdandard Deviation -Z"                    
[21] "Time Body Gyro -Mean -X"                                               
[22] "Time Body Gyro -Mean -Y"                                               
[23] "Time Body Gyro -Mean -Z"                                               
[24] "Time Body Gyro -Stdandard Deviation -X"                                
[25] "Time Body Gyro -Stdandard Deviation -Y"                                
[26] "Time Body Gyro -Stdandard Deviation -Z"                                
[27] "Time Body Gyro Jerk-Mean -X"                                           
[28] "Time Body Gyro Jerk-Mean -Y"                                           
[29] "Time Body Gyro Jerk-Mean -Z"                                           
[30] "Time Body Gyro Jerk-Stdandard Deviation -X"                            
[31] "Time Body Gyro Jerk-Stdandard Deviation -Y"                            
[32] "Time Body Gyro Jerk-Stdandard Deviation -Z"                            
[33] "Time Body Acceleration Magnitude -Mean "                               
[34] "Time Body Acceleration Magnitude -Stdandard Deviation "                
[35] "Time Gravity Acceleration Magnitude -Mean "                            
[36] "Time Gravity Acceleration Magnitude -Stdandard Deviation "             
[37] "Time Body Acceleration Jerk magnitudenitude -Mean "                    
[38] "Time Body Acceleration Jerk magnitudenitude -Stdandard Deviation "     
[39] "Time Body Gyro Magnitude -Mean "                                       
[40] "Time Body Gyro Magnitude -Stdandard Deviation "                        
[41] "Time Body Gyro Jerk magnitudenitude -Mean "                            
[42] "Time Body Gyro Jerk magnitudenitude -Stdandard Deviation "             
[43] "Frequency Body Acceleration -Mean -X"                                  
[44] "Frequency Body Acceleration -Mean -Y"                                  
[45] "Frequency Body Acceleration -Mean -Z"                                  
[46] "Frequency Body Acceleration -Stdandard Deviation -X"                   
[47] "Frequency Body Acceleration -Stdandard Deviation -Y"                   
[48] "Frequency Body Acceleration -Stdandard Deviation -Z"                   
[49] "Frequency Body Acceleration -Mean Freq-X"                              
[50] "Frequency Body Acceleration -Mean Freq-Y"                              
[51] "Frequency Body Acceleration -Mean Freq-Z"                              
[52] "Frequency Body Acceleration Jerk-Mean -X"                              
[53] "Frequency Body Acceleration Jerk-Mean -Y"                              
[54] "Frequency Body Acceleration Jerk-Mean -Z"                              
[55] "Frequency Body Acceleration Jerk-Stdandard Deviation -X"               
[56] "Frequency Body Acceleration Jerk-Stdandard Deviation -Y"               
[57] "Frequency Body Acceleration Jerk-Stdandard Deviation -Z"               
[58] "Frequency Body Acceleration Jerk-Mean Freq-X"                          
[59] "Frequency Body Acceleration Jerk-Mean Freq-Y"                          
[60] "Frequency Body Acceleration Jerk-Mean Freq-Z"                          
[61] "Frequency Body Gyro -Mean -X"                                          
[62] "Frequency Body Gyro -Mean -Y"                                          
[63] "Frequency Body Gyro -Mean -Z"                                          
[64] "Frequency Body Gyro -Stdandard Deviation -X"                           
[65] "Frequency Body Gyro -Stdandard Deviation -Y"                           
[66] "Frequency Body Gyro -Stdandard Deviation -Z"                           
[67] "Frequency Body Gyro -Mean Freq-X"                                      
[68] "Frequency Body Gyro -Mean Freq-Y"                                      
[69] "Frequency Body Gyro -Mean Freq-Z"                                      
[70] "Frequency Body Acceleration Magnitude -Mean "                          
[71] "Frequency Body Acceleration Magnitude -Stdandard Deviation "           
[72] "Frequency Body Acceleration Magnitude -Mean Freq"                      
[73] "Frequency Body Acceleration Jerk magnitudenitude -Mean "               
[74] "Frequency Body Acceleration Jerk magnitudenitude -Stdandard Deviation "
[75] "Frequency Body Acceleration Jerk magnitudenitude -Mean Freq"           
[76] "Frequency Body Gyro Magnitude -Mean "                                  
[77] "Frequency Body Gyro Magnitude -Stdandard Deviation "                   
[78] "Frequency Body Gyro Magnitude -Mean Freq"                              
[79] "Frequency Body Gyro Jerk magnitudenitude -Mean "                       
[80] "Frequency Body Gyro Jerk magnitudenitude -Stdandard Deviation "        
[81] "Frequency Body Gyro Jerk magnitudenitude -Mean Freq"                   
[82] "angle(tBody Acceleration Mean,Gravity )"                               
[83] "angle(tBody Acceleration JerkMean),Gravity Mean)"                      
[84] "angle(tBody Gyro Mean,Gravity Mean)"                                   
[85] "angle(tBody Gyro JerkMean,Gravity Mean)"                               
[86] "angle(X,Gravity Mean)"                                                 
[87] "angle(Y,Gravity Mean)"                                                 
[88] "angle(Z,Gravity Mean)" 
