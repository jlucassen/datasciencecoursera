#pull in data, bind test and train data
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
x <- rbind(xTest, xTrain)
y <- rbind(yTest, yTrain)

#pull in column names, format
features <- read.table("UCI HAR Dataset/features.txt")
allFields <- features[,2]
allFields <- gsub("-", "", allFields)
allFields <- gsub("\\(\\)", "", allFields)

#set column names, use to filter to mean/std columns only
colnames(x) <- allFields
selectedFields <- grep("mean|std", allFields, value = TRUE)
data <- x[selectedFields]

#pull in activity labels, translate y data, attach to data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activities <- factor(y[,1], activity_labels$V1, activity_labels$V2)
data$activities <- activities

#pull in subjects, merge test/train, attach to data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjects <- rbind(subject_test, subject_train)
data$subject <- subjects[,1]

#calculate means for each column
means <- colMeans(data[sapply(data, is.numeric)]) 

#output data files
write.table(data, "tidied_data.txt", row.names = FALSE)
write.table(means, "tidied_means.txt", row.names = FALSE)
