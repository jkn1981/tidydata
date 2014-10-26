tidydata
========

To run the  run_analysis.R script, download it and place it in the same folder as the data folder (i.e. in the same folder as the "UCI HAR Dataset" folder).

The R code is profusely commented, so I recommend to look at it to understand how it works exactly and what every line does. In general it follows the steps proposed in the assignment, but in a different order to simplify, resulting in:

1. Read the necessary files
2. Merge the training and the test sets to create three datasets (x, y, subjects).
3. Use descriptive activity names to name the activities in the y data set
4. Appropriately label the x data set with descriptive variable names.
5. Extract (from the x data set) only the measurements on the mean and standard deviation for each measurement.
6. Merge the modified x, y, and subjects datasets. That way we obtain a first tidy data set.
7. From this data set, create a second, independent tidy data set with the average of each variable for each activity and each subject.

To export the data sets you can use the command write.table(data, "tidydata.txt", row.name=FALSE) for the data set in step 6, or write.table(data2, "tidydata.txt", row.name=FALSE) for the data set in step 7.

