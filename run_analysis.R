
# Step 1: Merges the training and the test sets to create one data set.
  
### Prepare the enviroment
  
####  Load packages.
library(utils)
library(data.table)
library(plyr)

#### Create dictory for dataset.
wd <- getwd()
projectPath <- paste0(wd, "/Data")

if (!file.exists(projectPath)) {
  dir.create(projectPath)
}


### Get the data.

#### Download dataset file.

sourceUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
datasetFileName <- "GettingAndCleaningData_Project_Dataset.zip"
datasetFilePath <- file.path(projectPath,datasetFileName)
download.file(sourceUrl, datasetFilePath)


#### Unzip dataset file.
unzip(datasetFilePath, exdir =  projectPath)


#### The unzipped files are in the folder `UCI HAR Dataset`.
dataPath <- file.path(projectPath, "UCI HAR Dataset")
list.files(dataPath, recursive = TRUE)


### Load raw data set

#### Read train files.
subjectTrain <- read.table(file.path(dataPath, "train", "subject_train.txt"))
featuresTrain <- read.table(file.path(dataPath, "train", "x_train.txt"))
activityTrain <- read.table(file.path(dataPath, "train", "y_train.txt"))

#### Read test files.
subjectTest <- read.table(file.path(dataPath, "test", "subject_test.txt"))
featuresTest <- read.table(file.path(dataPath, "test", "x_test.txt"))
activityTest <- read.table(file.path(dataPath, "test", "y_test.txt"))


### Merges the training and the test sets to create one data set.
subjectData <- rbind(subjectTrain, subjectTest)
featuresData <- rbind(featuresTrain, featuresTest)
activityData <- rbind(activityTrain, activityTest)


# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

### Read the `features.txt` and set the measurements names.
featuresNames <- read.table(file.path(dataPath, "features.txt"))
names(featuresData) <- featuresNames[,2]

### Extracts only the measurements on the mean and standard deviation for each measurement.
featuresData <- featuresData[,grepl("mean\\(\\)|std\\(\\)", featuresNames[,2])]


# Step 3: Uses descriptive activity names to name the activities in the data set

### Read the `activity_labels.txt` and update data set.
activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"))
activityData[,1] <- activityLabels[activityData[,1],2]

### Set the name for Activity and Subject columns.
names(activityData) <- "Activity"
names(subjectData) <- "Subject"


# Step 4: Appropriately labels the data set with descriptive variable names.

names(featuresData)<-gsub("^t", "Time", names(featuresData))
names(featuresData)<-gsub("^f", "Frequency", names(featuresData))
names(featuresData)<-gsub("Acc", "Accelerometer", names(featuresData))
names(featuresData)<-gsub("Gyro", "Gyroscope", names(featuresData))
names(featuresData)<-gsub("Mag", "Magnitude", names(featuresData))
names(featuresData) <- gsub(".mean",".Mean",names(featuresData))
names(featuresData) <- gsub(".std",".StandardDeviation",names(featuresData))


#### Join the featureData, activityData and subjectData
mergedData <- cbind(featuresData,subjectData,activityData)
names(mergedData)


# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyDataSet<-aggregate(. ~Subject + Activity, mergedData, mean)
write.table(tidyDataSet, file = file.path(projectPath,"tidydata.txt"),row.name=FALSE)

