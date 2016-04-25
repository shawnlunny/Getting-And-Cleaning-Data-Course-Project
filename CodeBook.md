<h1>Getting And Cleaning Data Course Project CodeBook</h1>

<p>Source data and initial codebook information can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</p>

<h2>Analysis Steps</h2>
<p>The run_analysis.R file merges several files in the source data, renames some variables to make them more human readable, and then makes a tidy data set and saves it to file.</p>

<ol>
<li>First the source code zip file is downloaded to the local directory, unzipped, and then each data set is read into a dataframe.</li>
<li>Next the source txt files are read in and merged. The files are:</li>
<ul>
<li>activity_labels.txt - Links the class labels with their activity name.</li>
<li>features.txt - List of all the features.</li>
<li>subject_test.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. </li>
<li>X_test.txt - Test set</li>
<li>Y_test.txt - Test labels</li>
<li>subject_train.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. </li>
<li>X_train.txt - Training set</li>
<li>Y_train.txt - Training labels</li>
</ul>
<li>We then isolate and extract only the measurements on the mean and standard deviation for each measurement and exclude the other measurements.
<li>We name the dataset variables based on the variable names in features.txt and apply it to our merged dataframe.</li>
<li>We then rename the variables to make them more human readable and descriptive by removing the <code>()</code> from the column names.</li>
<li>We then create an independent tidy data set with the average of each variable for each activity and each subject.</li>
<li>Our full set of variables as renamed and in the averages_dataset.txt are:</li>
<ul>
<li>subject - The id of the experiment participant.</li>
<li>activity - The name of the activity that the measurements correspond to, like LAYING or WALKING.</li>
<li> tBodyAcc-mean-X</li><li> tBodyAcc-mean-Y</li><li> tBodyAcc-mean-Z</li><li> tBodyAcc-std-X</li><li> tBodyAcc-std-Y</li><li> tBodyAcc-std-Z</li><li> tGravityAcc-mean-X</li><li> tGravityAcc-mean-Y</li><li> tGravityAcc-mean-Z</li><li> tGravityAcc-std-X</li><li> tGravityAcc-std-Y</li><li> tGravityAcc-std-Z</li><li> tBodyAccJerk-mean-X</li><li> tBodyAccJerk-mean-Y</li><li> tBodyAccJerk-mean-Z</li><li> tBodyAccJerk-std-X</li><li> tBodyAccJerk-std-Y</li><li> tBodyAccJerk-std-Z</li><li> tBodyGyro-mean-X</li><li> tBodyGyro-mean-Y</li><li> tBodyGyro-mean-Z</li><li> tBodyGyro-std-X</li><li> tBodyGyro-std-Y</li><li> tBodyGyro-std-Z</li><li> tBodyGyroJerk-mean-X</li><li> tBodyGyroJerk-mean-Y</li><li> tBodyGyroJerk-mean-Z</li><li> tBodyGyroJerk-std-X</li><li> tBodyGyroJerk-std-Y</li><li> tBodyGyroJerk-std-Z</li><li> tBodyAccMag-mean</li><li> tBodyAccMag-std</li><li> tGravityAccMag-mean</li><li> tGravityAccMag-std</li><li> tBodyAccJerkMag-mean</li><li> tBodyAccJerkMag-std</li><li> tBodyGyroMag-mean</li><li> tBodyGyroMag-std</li><li> tBodyGyroJerkMag-mean</li><li> tBodyGyroJerkMag-std</li><li> fBodyAcc-mean-X</li><li> fBodyAcc-mean-Y</li><li> fBodyAcc-mean-Z</li><li> fBodyAcc-std-X</li><li> fBodyAcc-std-Y</li><li> fBodyAcc-std-Z</li><li> fBodyAcc-meanFreq-X</li><li> fBodyAcc-meanFreq-Y</li><li> fBodyAcc-meanFreq-Z</li><li> fBodyAccJerk-mean-X</li><li> fBodyAccJerk-mean-Y</li><li> fBodyAccJerk-mean-Z</li><li> fBodyAccJerk-std-X</li><li> fBodyAccJerk-std-Y</li><li> fBodyAccJerk-std-Z</li><li> fBodyAccJerk-meanFreq-X</li><li> fBodyAccJerk-meanFreq-Y</li><li> fBodyAccJerk-meanFreq-Z</li><li> fBodyGyro-mean-X</li><li> fBodyGyro-mean-Y</li><li> fBodyGyro-mean-Z</li><li> fBodyGyro-std-X</li><li> fBodyGyro-std-Y</li><li> fBodyGyro-std-Z</li><li> fBodyGyro-meanFreq-X</li><li> fBodyGyro-meanFreq-Y</li><li> fBodyGyro-meanFreq-Z</li><li> fBodyAccMag-mean</li><li> fBodyAccMag-std</li><li> fBodyAccMag-meanFreq</li><li> fBodyBodyAccJerkMag-mean</li><li> fBodyBodyAccJerkMag-std</li><li> fBodyBodyAccJerkMag-meanFreq</li><li> fBodyBodyGyroMag-mean</li><li> fBodyBodyGyroMag-std</li><li> fBodyBodyGyroMag-meanFreq</li><li> fBodyBodyGyroJerkMag-mean</li><li> fBodyBodyGyroJerkMag-std</li><li> fBodyBodyGyroJerkMag-meanFreq</li>
</ul>
</ol>
<p>Each line in run_analysis.R is commented. Reference the file for more information on the logic chosen to tidy the data.</p>
<p>Additional information about the original dataset can be found in its README.txt file</p>
