# Getting-and-Cleaning-Data-Course-Project-Assignment

Follows the steps below to successfully execute the R script
1. Download the required data and unzip them into your R working directory
2. Save the R script in your R working directory
3. Execute the R script and it will create the tidy data set

The R script processes the following files:
1. 'features.txt': List of all features.
2. 'activity_labels.txt': Links the class labels with their activity name.
3. 'train/X_train.txt': Training set.
4. 'train/y_train.txt': Training labels.
5. 'test/X_test.txt': Test set.
6. 'test/y_test.txt': Test labels.
7. 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

The R scrpt performs the following operations:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
