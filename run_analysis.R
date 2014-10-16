library(reshape2)
library(plyr)

## load relevant data
trdata <- read.table("train/x_train.txt")
trlabel <- read.table("train/y_train.txt")
trsub <- read.table("train/subject_train.txt")
tedata <- read.table("test/x_test.txt")
telabel <- read.table("test/y_test.txt")
tesub <- read.table("test/subject_test.txt")
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

## 1. Merge the training and the test sets to create one data set.
data <- rbind(trdata, tedata)

## Add subject and activity ID, add column names
colnames(data) = features[ , 2] ## add column names to data
labels <- rbind(trlabel, telabel) ## combine training and test labels
colnames(labels) = "ActivityID" ## name label col "ActivityID"
subjects <- rbind(trsub, tesub) ## combine training and test subjects 
colnames(subjects) <- "SubjectID" ## name label col "SubjectID
df <- cbind(labels, subjects, data) ## combine to one large data frame

## 2. Extract only the measurements on the mean and standard deviation for each measurement. 
## Obtain IDs and any col name that includes the substring "mean" or "std" (per formum FAQ)
mean.std <- sort(c(1,2,agrep("mean", colnames(df)), agrep("std", colnames(df))))
df <- df[, mean.std]

## 3. Use descriptive activity names to name the activities in the data set
colnames(activities) = c("ActivityID", "Activity")
df= merge(df, activities, byx = 'ActivityID' , all.x=TRUE)
df <- df[,c(1,2,89,3:88)]

## 4. Appropriately label the data set with descriptive variable names. 
## Rename columns based on sub-strings 
colnames <- colnames(df)
for (i in 1:ncol(df)) {
        colnames[i] = gsub("\\()", "", colnames[i])
        colnames[i] = gsub("^[t]", "Time ", colnames[i])
        colnames[i] = gsub("^[f]", "Frequency ", colnames[i])
        colnames[i] = gsub("mean()", "Mean ", colnames[i])
        colnames[i] = gsub("std()", "Stdandard Deviation ", colnames[i])
        colnames[i] = gsub("([Gg]ravity)","Gravity ",colnames[i])
        colnames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body ",colnames[i])
        colnames[i] = gsub("[Gg]yro","Gyro ",colnames[i])
        colnames[i] = gsub("[Aa]cc","Acceleration ",colnames[i])
        colnames[i] = gsub("[Mm]ag","Magnitude ",colnames[i])
        colnames[i] = gsub("JerkMag","Jerk magnitude",colnames[i])
        colnames[i] = gsub("GyroMag","Gyro magnitude",colnames[i])
}

colnames(df) = colnames

## 5. From the data set in step 4, create a second, independent tidy data set with the average 
## of each variable for each activity and each subject.

## This is understood to mean a data set that gives the average per activity for each person.

## Create an ID for each person/activity 
df$SubjectActivityID <- paste(df$SubjectID,df$ActivityID)
df <- df[,c(1,2,3,90,4:89)]

## Melt and recast the data frame to contain the mean for every person/activity
dfmelt <- melt(df, id=1:4, measure.vars = 5:90)
final.data <- dcast(dfmelt, SubjectActivityID ~ variable, mean)

## Merge the subject ID and activity decription to the melted data set, rearrange the columns 
## to display subject and activity cols first and sort by subject and activity. 
ids <- unique(df[, 1:4])
final.data <- merge(final.data, ids, by="SubjectActivityID")
final.data <- final.data[,c(89,90,2:87)]
final.data <- arrange(final.data, SubjectID, Activity)

## write the final table
write.table(final.data, "tidydata.txt", row.name=FALSE)


