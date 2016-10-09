---
title: "Getting and cleaning Data Course Project"
author: "Wagner Luiz Cambruzzi"
date: "October 8, 2016"
output: html_document
---



# Project Instructions

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!


# Step 1: Merges the training and the test sets to create one data set.

### Prepare the enviroment

Load packages.


```r
library(utils)
library(data.table)
```

```
## data.table 1.9.6  For help type ?data.table or https://github.com/Rdatatable/data.table/wiki
```

```
## The fastest way to learn (by data.table authors): https://www.datacamp.com/courses/data-analysis-the-data-table-way
```

```r
library(plyr)
```

Create dictory for dataset.


```r
wd <- getwd()
projectPath <- paste0(wd, "/Data")

if (!file.exists(projectPath)) {
  dir.create(projectPath)
}
```

### Get the data.

Download dataset file.


```r
sourceUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

datasetFileName <- "GettingAndCleaningData_Project_Dataset.zip"

datasetFilePath <- file.path(projectPath,datasetFileName)

download.file(sourceUrl, datasetFilePath)
```

Unzip dataset file.


```r
unzip(datasetFilePath, exdir =  projectPath)
```

The unzipped files are in the folder `UCI HAR Dataset`.


```r
dataPath <- file.path(projectPath, "UCI HAR Dataset")
list.files(dataPath, recursive = TRUE)
```

```
##  [1] "activity_labels.txt"                         
##  [2] "features.txt"                                
##  [3] "features_info.txt"                           
##  [4] "README.txt"                                  
##  [5] "test/Inertial Signals/body_acc_x_test.txt"   
##  [6] "test/Inertial Signals/body_acc_y_test.txt"   
##  [7] "test/Inertial Signals/body_acc_z_test.txt"   
##  [8] "test/Inertial Signals/body_gyro_x_test.txt"  
##  [9] "test/Inertial Signals/body_gyro_y_test.txt"  
## [10] "test/Inertial Signals/body_gyro_z_test.txt"  
## [11] "test/Inertial Signals/total_acc_x_test.txt"  
## [12] "test/Inertial Signals/total_acc_y_test.txt"  
## [13] "test/Inertial Signals/total_acc_z_test.txt"  
## [14] "test/subject_test.txt"                       
## [15] "test/X_test.txt"                             
## [16] "test/y_test.txt"                             
## [17] "train/Inertial Signals/body_acc_x_train.txt" 
## [18] "train/Inertial Signals/body_acc_y_train.txt" 
## [19] "train/Inertial Signals/body_acc_z_train.txt" 
## [20] "train/Inertial Signals/body_gyro_x_train.txt"
## [21] "train/Inertial Signals/body_gyro_y_train.txt"
## [22] "train/Inertial Signals/body_gyro_z_train.txt"
## [23] "train/Inertial Signals/total_acc_x_train.txt"
## [24] "train/Inertial Signals/total_acc_y_train.txt"
## [25] "train/Inertial Signals/total_acc_z_train.txt"
## [26] "train/subject_train.txt"                     
## [27] "train/X_train.txt"                           
## [28] "train/y_train.txt"
```

### Load raw data set

Read train files.


```r
subjectTrain <- read.table(file.path(dataPath, "train", "subject_train.txt"))
featuresTrain <- read.table(file.path(dataPath, "train", "x_train.txt"))
activityTrain <- read.table(file.path(dataPath, "train", "y_train.txt"))
```

Read test files.


```r
subjectTest <- read.table(file.path(dataPath, "test", "subject_test.txt"))
featuresTest <- read.table(file.path(dataPath, "test", "x_test.txt"))
activityTest <- read.table(file.path(dataPath, "test", "y_test.txt"))
```

### Merges the training and the test sets to create one data set.

```r
subjectData <- rbind(subjectTrain, subjectTest)
featuresData <- rbind(featuresTrain, featuresTest)
activityData <- rbind(activityTrain, activityTest)
```

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

Read the `features.txt` and set the measurements names.


```r
featuresNames <- read.table(file.path(dataPath, "features.txt"))
names(featuresData) <- featuresNames[,2]
```


Extracts only the measurements on the mean and standard deviation for each measurement.


```r
featuresData <- featuresData[,grepl("mean\\(\\)|std\\(\\)", featuresNames[,2])]
```


# Step 3: Uses descriptive activity names to name the activities in the data set

Read the `activity_labels.txt` and update data set.


```r
activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"))
activityData[,1] <- activityLabels[activityData[,1],2]
```

Set the name for Activity and Subject columns.

```r
names(activityData) <- "Activity"
names(subjectData) <- "Subject"
```


# Step 4: Appropriately labels the data set with descriptive variable names.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 


```r
names(featuresData)<-gsub("^t", "Time", names(featuresData))
names(featuresData)<-gsub("^f", "Frequency", names(featuresData))
names(featuresData)<-gsub("Acc", "Accelerometer", names(featuresData))
names(featuresData)<-gsub("Gyro", "Gyroscope", names(featuresData))
names(featuresData)<-gsub("Mag", "Magnitude", names(featuresData))
names(featuresData) <- gsub(".mean",".Mean",names(featuresData))
names(featuresData) <- gsub(".std",".StandardDeviation",names(featuresData))
```

### Join the featureData, activityData and subjectData


```r
mergedData <- cbind(featuresData,subjectData,activityData)
names(mergedData)
```

```
##  [1] "TimeBodyAccelerometer.Mean()-X"                                  "TimeBodyAccelerometer.Mean()-Y"                                 
##  [3] "TimeBodyAccelerometer.Mean()-Z"                                  "TimeBodyAccelerometer.StandardDeviation()-X"                    
##  [5] "TimeBodyAccelerometer.StandardDeviation()-Y"                     "TimeBodyAccelerometer.StandardDeviation()-Z"                    
##  [7] "TimeGravityAccelerometer.Mean()-X"                               "TimeGravityAccelerometer.Mean()-Y"                              
##  [9] "TimeGravityAccelerometer.Mean()-Z"                               "TimeGravityAccelerometer.StandardDeviation()-X"                 
## [11] "TimeGravityAccelerometer.StandardDeviation()-Y"                  "TimeGravityAccelerometer.StandardDeviation()-Z"                 
## [13] "TimeBodyAccelerometerJerk.Mean()-X"                              "TimeBodyAccelerometerJerk.Mean()-Y"                             
## [15] "TimeBodyAccelerometerJerk.Mean()-Z"                              "TimeBodyAccelerometerJerk.StandardDeviation()-X"                
## [17] "TimeBodyAccelerometerJerk.StandardDeviation()-Y"                 "TimeBodyAccelerometerJerk.StandardDeviation()-Z"                
## [19] "TimeBodyGyroscope.Mean()-X"                                      "TimeBodyGyroscope.Mean()-Y"                                     
## [21] "TimeBodyGyroscope.Mean()-Z"                                      "TimeBodyGyroscope.StandardDeviation()-X"                        
## [23] "TimeBodyGyroscope.StandardDeviation()-Y"                         "TimeBodyGyroscope.StandardDeviation()-Z"                        
## [25] "TimeBodyGyroscopeJerk.Mean()-X"                                  "TimeBodyGyroscopeJerk.Mean()-Y"                                 
## [27] "TimeBodyGyroscopeJerk.Mean()-Z"                                  "TimeBodyGyroscopeJerk.StandardDeviation()-X"                    
## [29] "TimeBodyGyroscopeJerk.StandardDeviation()-Y"                     "TimeBodyGyroscopeJerk.StandardDeviation()-Z"                    
## [31] "TimeBodyAccelerometerMagnitude.Mean()"                           "TimeBodyAccelerometerMagnitude.StandardDeviation()"             
## [33] "TimeGravityAccelerometerMagnitude.Mean()"                        "TimeGravityAccelerometerMagnitude.StandardDeviation()"          
## [35] "TimeBodyAccelerometerJerkMagnitude.Mean()"                       "TimeBodyAccelerometerJerkMagnitude.StandardDeviation()"         
## [37] "TimeBodyGyroscopeMagnitude.Mean()"                               "TimeBodyGyroscopeMagnitude.StandardDeviation()"                 
## [39] "TimeBodyGyroscopeJerkMagnitude.Mean()"                           "TimeBodyGyroscopeJerkMagnitude.StandardDeviation()"             
## [41] "FrequencyBodyAccelerometer.Mean()-X"                             "FrequencyBodyAccelerometer.Mean()-Y"                            
## [43] "FrequencyBodyAccelerometer.Mean()-Z"                             "FrequencyBodyAccelerometer.StandardDeviation()-X"               
## [45] "FrequencyBodyAccelerometer.StandardDeviation()-Y"                "FrequencyBodyAccelerometer.StandardDeviation()-Z"               
## [47] "FrequencyBodyAccelerometerJerk.Mean()-X"                         "FrequencyBodyAccelerometerJerk.Mean()-Y"                        
## [49] "FrequencyBodyAccelerometerJerk.Mean()-Z"                         "FrequencyBodyAccelerometerJerk.StandardDeviation()-X"           
## [51] "FrequencyBodyAccelerometerJerk.StandardDeviation()-Y"            "FrequencyBodyAccelerometerJerk.StandardDeviation()-Z"           
## [53] "FrequencyBodyGyroscope.Mean()-X"                                 "FrequencyBodyGyroscope.Mean()-Y"                                
## [55] "FrequencyBodyGyroscope.Mean()-Z"                                 "FrequencyBodyGyroscope.StandardDeviation()-X"                   
## [57] "FrequencyBodyGyroscope.StandardDeviation()-Y"                    "FrequencyBodyGyroscope.StandardDeviation()-Z"                   
## [59] "FrequencyBodyAccelerometerMagnitude.Mean()"                      "FrequencyBodyAccelerometerMagnitude.StandardDeviation()"        
## [61] "FrequencyBodyBodyAccelerometerJerkMagnitude.Mean()"              "FrequencyBodyBodyAccelerometerJerkMagnitude.StandardDeviation()"
## [63] "FrequencyBodyBodyGyroscopeMagnitude.Mean()"                      "FrequencyBodyBodyGyroscopeMagnitude.StandardDeviation()"        
## [65] "FrequencyBodyBodyGyroscopeJerkMagnitude.Mean()"                  "FrequencyBodyBodyGyroscopeJerkMagnitude.StandardDeviation()"    
## [67] "Subject"                                                         "Activity"
```

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


```r
tidyDataSet<-aggregate(. ~Subject + Activity, mergedData, mean)
write.table(tidyDataSet, file = file.path(projectPath,"tidydata.txt"),row.name=FALSE)
```
