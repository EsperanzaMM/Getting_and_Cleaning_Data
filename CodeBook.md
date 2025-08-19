---
title: "CodeBook.md"
author: "Esperanza"
date: "2025-08-19"
output: html_document
---


# Code Book for Tidy Dataset

## Dataset Description
The dataset comes from the [UCI Human Activity Recognition Using Smartphones Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The data contains measurements from the accelerometers and gyroscopes of a Samsung smartphone carried by 30 subjects while performing 6 different activities.


## Variables in `tidyData.txt`
- `subject` : Identifier of the subject (1–30).

- `activity` : Activity performed by the subject. One of the following:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
  
- Remaining columns: Average of each measurement on the mean and standard deviation. Variable names are descriptive, e.g.:
  - `TimeBodyAccelerometerMeanX` = mean of the X-axis of body acceleration (time domain)
  - `FrequencyBodyGyroscopeSTDZ` = standard deviation of the Z-axis of body gyroscope (frequency domain)


## Data Cleaning and Transformation
1. Merged training and test sets to create one dataset.

2. Extracted only measurements on mean and standard deviation.

3. Applied descriptive activity names instead of numeric codes.

4. Labeled the dataset with descriptive variable names:
   - `t` → `Time`
   - `f` → `Frequency`
   - `Acc` → `Accelerometer`
   - `Gyro` → `Gyroscope`
   - `Mag` → `Magnitude`
   - `mean()` → `Mean`
   - `std()` → `STD`
   - Removed parentheses and dashes.

5. Created a second, independent tidy dataset with the average of each variable for each activity and each subject.


## Format of Tidy Data
- Each row: a unique combination of subject + activity.

- Each column: a specific measurement (average value across trials).
