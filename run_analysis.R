#make sure plyr is loaded
library(plyr)

#in the specialization course this is basically assignment 4 so this is what i called it
assignment = "Assignment4"

#build the directory names using paste
zipfile = paste(assignment, "Smartphone_Dataset.zip", sep="/")

#download the file
if(!file.exists(zipfile)){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zipfile)
}

directory = paste(assignment, "UCI HAR Dataset", sep="/")

#if we havent done so yet unzip the contents
if(!file.exists(directory)){
  unzip(filename, exdir=assignment)
}

#read the labels and features
activity_labels <- read.table(paste(directory,"activity_labels.txt", sep="/"))
features <- read.table(paste(directory, "features.txt", sep="/"))

#extract the test data
subject_test <- read.table(paste(directory, "test", "subject_test.txt", sep="/"))
x_test <- read.table(paste(directory, "test", "X_test.txt", sep="/"))
y_test <- read.table(paste(directory, "test", "Y_test.txt", sep="/"))

#extract the training data
subject_train <- read.table(paste(directory, "train", "subject_train.txt", sep="/"))
x_train <- read.table(paste(directory, "train", "X_train.txt", sep="/"))
y_train <- read.table(paste(directory, "train", "Y_train.txt", sep="/"))

#Lets do the easiest step first and combine our test and training data
#since we have the same number of columns in each lets use rbind to do this
x_dataset <- rbind(x_test, x_train)
y_dataset <- rbind(y_test, y_train)
subject_dataset <- rbind(subject_test, subject_train)
#name the subject_dataset column
names(subject_dataset) <- "subject"

#lets do some memory cleanup since we should no longer need the original data frames and a few other values
rm(x_test, y_test, x_train, y_train, subject_test, subject_train, zipfile)

#extract the mean and std feature name indexes from features
mean_and_std_cols <- grep("(mean|std)", features[, 2])

#grab the mean and std column indicies from the x_dataset
#this will extract only the columns we want from the data
x_dataset <- x_dataset[, mean_and_std_cols]

#name each column in the x_dataset using the mean and std column names but remove 
#the () to make the column names more readable
names(x_dataset) <- gsub("()", "", features[mean_and_std_cols, 2], fixed = TRUE)
#remove redundent Body text from column names to make more readable
names(x_dataset) <- gsub("BodyBody", "Body", colnames(x_dataset), fixed = TRUE)

#do the same to the dataset labels
y_dataset <- y_dataset[, 1]
#convert the y_dataset numbers to their correct activity labels
y_dataset <- as.data.frame(activity_labels[y_dataset, 2])
#name the y_dataset column
names(y_dataset) <- "activity"

#bind all the data together into one table so we can perform a calculation on each column
all_datasets <- cbind(x_dataset, y_dataset, subject_dataset)

#use ddply to split and apply the mean function to all_datasets while keeping the result set a dataframe
#split on activity and subject and apply the mean to all columns except activity and subject (-2)
averages_dataset <- ddply(all_datasets, .(activity, subject), mean = mean(all_datasets[, -2]))

#lets do some more memory cleanup
rm(features, activity_labels, mean_and_std_cols, x_dataset, y_dataset, subject_dataset, directory)

#save the results to a txt file
write.table(averages_dataset, paste(assignment, "averages_dataset.txt", sep="/"), row.name = FALSE)