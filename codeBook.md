# CodeBook for the tidyDataset.txt
###author: "Wagner Luiz Cambruzzi

## Data source

This dataset is derived from data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original dataset was obtained:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Variables


In the original file has a file called `features_info` with the information data. Below is the mapping between the columns of tidyDataSet and original.


`TimeBodyAccelerometer.Mean()-X -> tBodyAcc-mean()-X (column 1)`

`TimeBodyAccelerometer.Mean()-Y -> tBodyAcc-mean()-Y (column 2)`

`TimeBodyAccelerometer.Mean()-Z -> tBodyAcc-mean()-Z (column 3)`

`TimeBodyAccelerometer.StandardDeviation()-X -> tBodyAcc-std()-X (column 4)`

`TimeBodyAccelerometer.StandardDeviation()-Y -> tBodyAcc-std()-Y (column 5)`

`TimeBodyAccelerometer.StandardDeviation()-Z -> tBodyAcc-std()-Z (column 6)`

`TimeGravityAccelerometer.Mean()-X -> tGravityAcc-mean()-X (column 41)`

`TimeGravityAccelerometer.Mean()-Y -> tGravityAcc-mean()-Y (column 42)`

`TimeGravityAccelerometer.Mean()-Z -> tGravityAcc-mean()-Z (column 43)`

`TimeGravityAccelerometer.StandardDeviation()-X -> tGravityAcc-std()-X (column 44)`

`TimeGravityAccelerometer.StandardDeviation()-Y -> tGravityAcc-std()-Y (column 45)`

`TimeGravityAccelerometer.StandardDeviation()-Z -> tGravityAcc-std()-Z (column 46)`

`TimeBodyAccelerometerJerk.Mean()-X -> tBodyAccJerk-mean()-X (column 81)`

`TimeBodyAccelerometerJerk.Mean()-Y -> tBodyAccJerk-mean()-Y (column 82)`

`TimeBodyAccelerometerJerk.Mean()-Z -> tBodyAccJerk-mean()-Z (column 83)`

`TimeBodyAccelerometerJerk.StandardDeviation()-X -> tBodyAccJerk-std()-X (column 84)`

`TimeBodyAccelerometerJerk.StandardDeviation()-Y -> tBodyAccJerk-std()-Y (column 85)`

`TimeBodyAccelerometerJerk.StandardDeviation()-Z -> tBodyAccJerk-std()-Z (column 86)`

`TimeBodyGyroscope.Mean()-X -> tBodyGyro-mean()-X (column 121)`

`TimeBodyGyroscope.Mean()-Y -> tBodyGyro-mean()-Y (column 122)`

`TimeBodyGyroscope.Mean()-Z -> tBodyGyro-mean()-Z (column 123)`

`TimeBodyGyroscope.StandardDeviation()-X -> tBodyGyro-std()-X (column 124)`

`TimeBodyGyroscope.StandardDeviation()-Y -> tBodyGyro-std()-Y (column 125)`

`TimeBodyGyroscope.StandardDeviation()-Z -> tBodyGyro-std()-Z (column 126)`

`TimeBodyGyroscopeJerk.Mean()-X -> tBodyGyroJerk-mean()-X (column 161)`

`TimeBodyGyroscopeJerk.Mean()-Y -> tBodyGyroJerk-mean()-Y (column 162)`

`TimeBodyGyroscopeJerk.Mean()-Z -> tBodyGyroJerk-mean()-Z (column 163)`

`TimeBodyGyroscopeJerk.StandardDeviation()-X -> tBodyGyroJerk-std()-X (column 164)`

`TimeBodyGyroscopeJerk.StandardDeviation()-Y -> tBodyGyroJerk-std()-Y (column 165)`

`TimeBodyGyroscopeJerk.StandardDeviation()-Z -> tBodyGyroJerk-std()-Z (column 166)`

`TimeBodyAccelerometerMagnitude.Mean() -> tBodyAccMag-mean() (column 201)`

`TimeBodyAccelerometerMagnitude.StandardDeviation() -> tBodyAccMag-std() (column 202)`

`TimeGravityAccelerometerMagnitude.Mean() -> tGravityAccMag-mean() (column 214)`

`TimeGravityAccelerometerMagnitude.StandardDeviation() -> tGravityAccMag-std() (column 215)`

`TimeBodyAccelerometerJerkMagnitude.Mean() -> tBodyAccJerkMag-mean() (column 227)`

`TimeBodyAccelerometerJerkMagnitude.StandardDeviation() -> tBodyAccJerkMag-std() (column 228)`

`TimeBodyGyroscopeMagnitude.Mean() -> tBodyGyroMag-mean() (column 240)`

`TimeBodyGyroscopeMagnitude.StandardDeviation() -> tBodyGyroMag-std() (column 241)`

`TimeBodyGyroscopeJerkMagnitude.Mean() -> tBodyGyroJerkMag-mean() (column 253)`

`TimeBodyGyroscopeJerkMagnitude.StandardDeviation() -> tBodyGyroJerkMag-std() (column 254)`

`FrequencyBodyAccelerometer.Mean()-X -> fBodyAcc-mean()-X (column 266)`

`FrequencyBodyAccelerometer.Mean()-Y -> fBodyAcc-mean()-Y (column 267)`

`FrequencyBodyAccelerometer.Mean()-Z -> fBodyAcc-mean()-Z (column 268)`

`FrequencyBodyAccelerometer.StandardDeviation()-X -> fBodyAcc-std()-X (column 269)`

`FrequencyBodyAccelerometer.StandardDeviation()-Y -> fBodyAcc-std()-Y (column 270)`

`FrequencyBodyAccelerometer.StandardDeviation()-Z -> fBodyAcc-std()-Z (column 271)`

`FrequencyBodyAccelerometerJerk.Mean()-X -> fBodyAccJerk-mean()-X (column 345)`

`FrequencyBodyAccelerometerJerk.Mean()-Y -> fBodyAccJerk-mean()-Y (column 346)`

`FrequencyBodyAccelerometerJerk.Mean()-Z -> fBodyAccJerk-mean()-Z (column 347)`

`FrequencyBodyAccelerometerJerk.StandardDeviation()-X -> fBodyAccJerk-std()-X (column 348)`

`FrequencyBodyAccelerometerJerk.StandardDeviation()-Y -> fBodyAccJerk-std()-Y (column 349)`

`FrequencyBodyAccelerometerJerk.StandardDeviation()-Z -> fBodyAccJerk-std()-Z (column 350)`

`FrequencyBodyGyroscope.Mean()-X -> fBodyGyro-mean()-X (column 424)`

`FrequencyBodyGyroscope.Mean()-Y -> fBodyGyro-mean()-Y (column 425)`

`FrequencyBodyGyroscope.Mean()-Z -> fBodyGyro-mean()-Z (column 426)`

`FrequencyBodyGyroscope.StandardDeviation()-X -> fBodyGyro-std()-X (column 427)`

`FrequencyBodyGyroscope.StandardDeviation()-Y -> fBodyGyro-std()-Y (column 428)`

`FrequencyBodyGyroscope.StandardDeviation()-Z -> fBodyGyro-std()-Z (column 429)`

`FrequencyBodyAccelerometerMagnitude.Mean() -> fBodyAccMag-mean() (column 503)`

`FrequencyBodyAccelerometerMagnitude.StandardDeviation() -> fBodyAccMag-std() (column 504)`

`FrequencyBodyBodyAccelerometerJerkMagnitude.Mean() -> fBodyBodyAccJerkMag-mean() (column 516)`

`FrequencyBodyBodyAccelerometerJerkMagnitude.StandardDeviation()  ;  fBodyBodyAccJerkMag-std() (column 517)`

`FrequencyBodyBodyGyroscopeMagnitude.Mean() -> fBodyBodyGyroMag-mean() (column 529)`

`FrequencyBodyBodyGyroscopeMagnitude.StandardDeviation() -> fBodyBodyGyroMag-std() (column 530)`

`FrequencyBodyBodyGyroscopeJerkMagnitude.Mean() -> fBodyBodyGyroJerkMag-mean() (column 542)`

`FrequencyBodyBodyGyroscopeJerkMagnitude.StandardDeviation() -> fBodyBodyGyroJerkMag-std() (column 543)`


Two additional columns have been included.

`Subject:` corresponds to the subject of the experiment.

`Activity:` corresponds the activity of the subject.

