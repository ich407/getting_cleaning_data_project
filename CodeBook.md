<b>CodeBook</b>

tidy_average.txt - this file contains an output of the average of each calculated mean and standard deviation value within the "Human Activity Recognition Using Smartphones Dataset." The granularity of this data is a the Subject/Activity/Variable level

Variables:

Subject - Individual with whom the data row was observed

Activity - Physical activity undertaken by the subject

Variable - Name of measurement recorded by original Human Activity Recognition dataset

AvgValue - Average calcualted value across the Subject/Activity/Variable

Steps to create tidy_average output:

1) The following datasets were loaded into R:
X_test.txt
X_train.txt

Y_test.txt
Y_train.txt

subject_test.txt
subject_train.txt

features.txt

activity_labels.txt

2) Each test/train pair was then merged.

3) Relevant column names were applied to the data sets and a decode was applied to transform the numeric values in the X and Y data into human readable values

4) A subset of the columns within the X data set were then merged with Y, and subject

5) The merged data set was transposed into a 4 column matrix using 'gather'

6) Finally, a new data set was created creating an average value calculation across each Subject/Activity/Variable
