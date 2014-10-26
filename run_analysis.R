# R script for the course project

# Step 0: load the necessary data

xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# First we merge the training and the test sets

x <- rbind(xtrain,xtest)            # Merge x data
y <- rbind(ytrain,ytest)            # Merge y data
subj <- rbind(subjtrain,subjtest)   # Merge subject data

# We can already replace the values in y so activities are clear
# (actual step 3 in the assignment)

y2 <- merge(y,activities)

# Also, we can already set the right labels 
# (actual step 4 in the assignment)

names(x) <- features$V2
names(y2) <- c("activity_id","activity")
names(subj) <- c("subject_id")

# And we can also extract the measurements on the mean and standard deviation
# (actual step 2 in the assignment)

# To do so, first we create an empty matrix...
x2 <- matrix(, nrow = nrow(x), ncol = 0)

# ...and there we put only those columns with "mean()" or "std()" in the name
# (if using grepl, "meanFreq()" must be also checked, otherwise it is also included)
for(i in 1:ncol(x)){
  if((grepl("mean()",names(x)[i]) & !grepl("meanFreq()",names(x)[i])) 
     | grepl("std()",names(x)[i])){
    x2 <- cbind(x2,x[i])
  }
}

# Finally, merge the sets as columns of the final set
# From y2 we only want the descriptive column, so we only take that one

data <- cbind(subj,y2[2],x2)

# Now only step 5 remains: create a second, independent tidy data set
# with the average of each variable for each activity and each subject.

data2 <- aggregate(. ~ subject_id + activity, data, mean)
