# CodeBook for the Tidy Dataset

## 1. Data Overview

The *tidy* dataset is summarized from the [Human Activity Recognition Using Smartphones (HAR) Dataset](www.smartlab.ws). 

The HAR dataset is the result of the experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each participant has a smartphone (Samsung Galaxy S II) strapped to their waist and performed six types of activities. The smartphone recorded data from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ as features. 

The *tidy* dataset aggregates the average of a set of features from the HAR dataset, for each activity and each subject. The set of features include only the measurements on the mean and standard deviation for each measurement (79 out of 561 features in HAR). The tidy dataset includes both training and testing sets of the HAR dataset. It includes a variable for subject ('subject'), a variable for activity label ('label'), and 79 features ('tBodyAcc-mean()-X', 'tBodyAcc-mean()-Y', etc.). Six activity types times 30 subjects resulted in 180 observations in total.

## 2. Data Transformation

1. Check if the HAR dataset exists in working directory. If not, download and unzip the [file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

2. Read descriptive activity labels ('UCI HAR Dataset/activity_labels.txt') and feature names ('UCI HAR Dataset/features.txt').

3. For both testing ('UCI HAR Dataset/test/') and training ('UCI HAR Dataset/train') sets:

    3.1. Read subject vector ('subject_test.txt')
    
    3.2. Read feature vectors ('X_test/train.txt') but only choose those containing 'mean' and 'std'. Name the columns with feature names retrieved in Step 2.
    
    3.3. Read activity label vectors ('y_test.txt'). Match the activity number with its descriptive labels retrieved in Step 2, adjust factor level accordingly.
    
    3.4 Create 'set' vector indicating whether the data came from a training or testing set.
    
    3.5 Combine all vectors above to form a complete 'train'/'test' data frame.
    
4. Combine 'train' and 'test' data frames.

5. Aggregate by subject ('subject') and activity label ('label') using mean function to get the *tidy* data frame.

6. Write the *tidy* data frame to 'tidy.txt' in workspace.

## 3. Variable Description

### 3.1 Dependent Variable - Activity Label (label)

label - activity label consisting of, in order: 
```{r}
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING
```

### 3.2 Features

Features include the mean and standard deviation for each measurement from the HAR dataset (normalized to be within [-1,1]), aggregated by subjects and activity labels through mean() function. This resulted in 79 variables in total. More information about the feautures are in the 'features_info.txt' of HAR dataset:

```{r}
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
```

### 3.3 Others - Subject (subject)

subject - subject identification number 1-30
