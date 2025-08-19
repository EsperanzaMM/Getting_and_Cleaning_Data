setwd("C:/Users/espef/OneDrive/Documents/R/R course/Getting and Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

Xtrain <- read.table("./train/X_train.txt")
Ytrain <- read.table("./train/y_train.txt")
IDtrain <- read.table("./train/subject_train.txt")

Xtest <- read.table("./test/X_test.txt")
Ytest <- read.table("./test/y_test.txt")
IDtest <- read.table("./test/subject_test.txt")

X <- rbind(Xtrain, Xtest)
Y <- rbind(Ytrain, Ytest)
ID <- rbind(IDtrain, IDtest)
colnames(ID) <- "subject"
colnames(Y) <- "activity"
features <- read.table("features.txt")
colnames(X) <- features[, 2]

mean_std <- grep("mean\\(\\)|std\\(\\)", colnames(X))
CleanX <- X[ , mean_std]
alldata <- cbind(ID, Y, CleanX)

activity_labels <- read.table("activity_labels.txt")
alldata$activity <- factor(alldata$activity,
                           levels = activity_labels[, 1],   
                           labels = activity_labels[, 2])

names(alldata) <- gsub("^t", "Time", names(alldata))
names(alldata) <- gsub("^f", "Frequency", names(alldata))
names(alldata) <- gsub("Acc", "Accelerometer", names(alldata))
names(alldata) <- gsub("Gyro", "Gyroscope", names(alldata))
names(alldata) <- gsub("Mag", "Magnitude", names(alldata))
names(alldata) <- gsub("-mean\\(\\)", "Mean", names(alldata))
names(alldata) <- gsub("-std\\(\\)", "STD", names(alldata))
names(alldata) <- gsub("[\\(\\)-]", "", names(alldata))

tidyData <- aggregate(. ~ subject + activity, data = alldata, FUN = mean)

write.table(tidyData, "tidyData.txt", row.names = FALSE)
read.table("tidyData.txt", header = TRUE)

