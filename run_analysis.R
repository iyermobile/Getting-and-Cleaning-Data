## R SCRIPT for Course Project - Getting and Cleaning Data

## Step 1

# Read each of the test and training files.
test.labels <- read.table("test/y_test.txt", col.names="label")
test.subjects <- read.table("test/subject_test.txt", col.names="subject")
test.data <- read.table("test/X_test.txt")
train.labels <- read.table("train/y_train.txt", col.names="label")
train.subjects <- read.table("train/subject_train.txt", col.names="subject")
train.data <- read.table("train/X_train.txt")

# Combine the files into a data frame in the form of subjects, labels, and the remaining data.
data <- rbind(cbind(test.subjects, test.labels, test.data),
              cbind(train.subjects, train.labels, train.data))

## Step 2

# Read the features part.
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)

# Retain the features of mean and standard deviation.
features.mean.std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

# Select only the means and standard deviations from data.
# Increment it by 2 because data has subjects and labels at the start.
data.mean.std <- data[, c(1, 2, features.mean.std$V1+2)]

## Step 3

# Read the activity labels
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)

# Replace the numbers with the text.
data.mean.std$label <- labels[data.mean.std$label, 2]

## Step 4

# Make a column list (including "subjects" and "label" at the start).
good.colnames <- c("subject", "label", features.mean.std$V2)

# Tidy out the list by removing all non-alphanumeric characters and converting the result to lowercase.
good.colnames <- tolower(gsub("[^[:alpha:]]", "", good.colnames))

# Apply the now-good-column names to the data frame.
colnames(data.mean.std) <- good.colnames

## Step 5

# Find out the mean for each combination of subject and label.
aggr.data <- aggregate(data.mean.std[, 3:ncol(data.mean.std)], by=list(subject = data.mean.std$subject, label = data.mean.std$label), mean)

## Step 6 (Final):

# Write the new tidy set into a new text file.
write.table(format(aggr.data, scientific=T), "tidy_data_set.txt", row.names=F, col.names=F, quote=2)