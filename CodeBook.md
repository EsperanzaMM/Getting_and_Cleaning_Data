# Code Book for Tidy Dataset

## Dataset Description
The dataset comes from the [UCI Human Activity Recognition Using Smartphones Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The data contains measurements from the accelerometers and gyroscopes of a Samsung smartphone carried by 30 subjects while performing 6 different activities.

## Variables in `tidyData.txt`
- **subject**: Identifier of the subject (integer 1–30).  
- **activity**: Activity performed by the subject (factor with 6 levels):  
  - WALKING  
  - WALKING_UPSTAIRS  
  - WALKING_DOWNSTAIRS  
  - SITTING  
  - STANDING  
  - LAYING  

- **Measurement variables**: Average of each selected feature (mean and standard deviation only), grouped by subject and activity.  
  Examples of variable names:
  - `TimeBodyAccelerometerMeanX` → mean of body acceleration in the X-axis (time domain)  
  - `TimeBodyAccelerometerSTDY` → standard deviation of body acceleration in the Y-axis (time domain)  
  - `FrequencyBodyGyroscopeMeanZ` → mean of gyroscope signal in the Z-axis (frequency domain)  
  - `FrequencyBodyAccelerometerMagnitudeSTD` → standard deviation of body acceleration magnitude (frequency domain)  

The final tidy dataset contains **180 rows** (30 subjects × 6 activities) and **68 columns** (66 measurement variables + subject + activity).  

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
5. Created a second, independent tidy dataset with the **average of each variable** for each activity and each subject.  

## Format of Tidy Data
- Each **row**: a unique combination of subject and activity.  
- Each **column**: a specific measurement (average value).  
