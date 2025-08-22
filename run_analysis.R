# 1. Set working directory to the folder containing the dataset
# (adjust this path to your own system if needed)
setwd("C:/Users/espef/OneDrive/Documents/R/R course/Getting and Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

# 2. Load training and test datasets
Xtrain <- read.table("./train/X_train.txt")
Ytrain <- read.table("./train/y_train.txt")
IDtrain <- read.table("./train/subject_train.txt")

Xtest  <- read.table("./test/X_test.txt")
Ytest  <- read.table("./test/y_test.txt")
IDtest <- read.table("./test/subject_test.txt")

# 3. Merge training and test sets
X  <- rbind(Xtrain, Xtest)   # feature measurements
Y  <- rbind(Ytrain, Ytest)   # activity labels
ID <- rbind(IDtrain, IDtest) # subject IDs

# Name the subject and activity columns
colnames(ID) <- "subject"
colnames(Y)  <- "activity"

# 4. Label dataset with descriptive variable names
features <- read.table("features.txt")    # feature names
colnames(X) <- features[, 2]              # assign names to X columns

# 5. Extract only mean and standard deviation measurements
mean_std <- grep("mean\\(\\)|std\\(\\)", colnames(X))  
CleanX <- X[ , mean_std]

# Combine subject, activity, and selected features
alldata <- cbind(ID, Y, CleanX)

# 6. Use descriptive activity names
activity_labels <- read.table("activity_labels.txt")
alldata$activity <- factor(alldata$activity,
                           levels = activity_labels[, 1],   
                           labels = activity_labels[, 2])

# 7. Clean and make variable names more descriptive
names(alldata) <- gsub("^t", "Time", names(alldata))
names(alldata) <- gsub("^f", "Frequency", names(alldata))
names(alldata) <- gsub("Acc", "Accelerometer", names(alldata))
names(alldata) <- gsub("Gyro", "Gyroscope", names(alldata))
names(alldata) <- gsub("Mag", "Magnitude", names(alldata))
names(alldata) <- gsub("-mean\\(\\)", "Mean", names(alldata))
names(alldata) <- gsub("-std\\(\\)", "STD", names(alldata))
names(alldata) <- gsub("[\\(\\)-]", "", names(alldata))

# 8. Create a tidy dataset with the average of each variable
# for each activity and each subject
tidyData <- aggregate(. ~ subject + activity, data = alldata, FUN = mean)

# 9. Save the tidy dataset to a text file
write.table(tidyData, "tidyData.txt", row.names = FALSE)

# Optional: read back the tidy dataset to verify
read.table("tidyData.txt", header = TRUE)
