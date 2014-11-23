GettingAndCleaningDataClassProject
==================================

Submitted files for Getting &amp; Cleaning Data Class Project

1) run_analysis.r:
 This script analyzes smartphone accelerometer & gyroscope data. The data was supplied
 in a ZIP file which was unzipped to the working directory.

 This script reads the training set & test set data into separate data frames which are then
 merged into a single data frame.

 Path variables are created to the training & test data sets, and the original working directory path is saved so it 
 can be restored later. The training data are read into data frames (for measurements, subsects, and activites). The
 subject & activity data iscombined with measured data later in the script.
 
 The training data & test data are combined into single data frames. The activities are given descriptive activity names.
 
 The measured data (X/Y/Z mean & std dev for accelerometer & gyro) are selected. The use of column 
 numbers avoids problem with duplicated column names for many of the analyzed variables in original data sets. Besides, 
 we are only interested in the measurements according to the project statement.
 
 The subject, activity, and measured data are combined into a single data frame, then melted into a new data frame to
 prepare for tidying. The data is tidied by averaging the measurements over subject and activity.
 
 The output is saved in the Class Project folder, and the working directory path is restoredto the original value.
 
2) CodeBook.md:
 This file describes the variables and data used in run_analysis.r.
 
3) README.md: this file.




