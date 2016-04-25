<h1>Getting And Cleaning Data Course Project CodeBook</h1>

<p>Source data and initial codebook infomration can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</p>

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
<li>We then rename the variables to make them more human readable and descriptive by removing the <code>()</code>. Our full set of variables is:</li>
<li>We then create an independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>
<p>Each line in run_analysis.R is commented. Reference the file for more information on the logic chosen to tidy the data.</p>
