library(dplyr)

# import all the data
X_test <- read.table(".\\test\\X_test.txt")
Y_test <- read.table(".\\test\\Y_test.txt")
subject_test <- read.table(".\\test\\subject_test.txt")
X_train <- read.table(".\\train\\X_train.txt")
Y_train <- read.table(".\\train\\Y_train.txt")
subject_train <- read.table(".\\train\\subject_train.txt")
variable_names <- read.table(".\\features.txt")
activity_labels <- read.table(".\\activity_labels.txt")

## Merges training and test data
X_merge <- rbind(X_train, X_test)
Y_merge <- rbind(Y_train, Y_test)
subjects_merge <- rbind(subject_train, subject_test)

## Extracts only the measurements on the mean and standard deviation for each measurement.
selected_columns <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names$V2),]
X_merge <- X_merge[,selected_columns[,1]]

## Uses descriptive activity names to name the activities in the data set
colnames(Y_merge) <- "activities"
Y_merge$activity_name <- factor(Y_merge$activities, labels = as.character(activity_labels[,2]))
activity_name <- Y_merge[,-1]

## Appropriately labels the data set with descriptive variable names.
colnames(X_merge) <- variable_names[selected_columns[,1],2]

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subjects.
colnames(subjects_merge) <- "subjects"
x <- cbind(X_merge, activity_name, subjects_merge)
y <- group_by(x, activity_name, subjects)
z <- summarize_each(y,funs(mean))
write.table(z, file = ".\\tidydataset.txt", row.names = FALSE, col.names = TRUE)