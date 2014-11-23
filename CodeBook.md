---
title: "CodeBook.md"
author: "Neal Dowling"
date: "Saturday, November 22, 2014"
output: html_document
---

Additional packages loaded:
1) dplyr
2) reshape2
3) tidyr

Original data contained in file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Variables used:
1) train_data, a data frame containing training measurements
2) train_subject_data, a data frame containing training subject numbers
3) train_activity_data, a data frame containing training activity numbers
4) test_data, a data frame containing test measurements
5) test_subject_data, a data frame containing test subject numbers
6) test_activity_data, a data frame containing test activity numbers
7) all_data, a data frame containing combined training and test measurements
8) all_subject_data, a data frame containing combined training and test subject numbers
9) all_activity_data, a data frame containing combined training and test activity numbers
10) mean_std_data, a data frame containing selected measurement data from all_data
11) mean_std_melt, a data frame containing a melted version of mean_std_data
12) mean_std_mean, a data frame containing a tidy version of the data

Transformations of data:
1) Original raw data is read into training and test measurement, subject, and activity data frames.
2) Training and test measurement, subject, and activity data frames are merged into new data frames.
3) Activity numbers are turned into descriptive activity names.
4) The subset of data containing the measurements is selected and placed in a new data frame.
5) The measurement, subject, and activity data frames are combined into a single data frame, and
the columns are labeled appropriately.
6) The data is melt into a new data frame to prepare for tidying.
7) The data is tidied by averaging the measurements over subject and activity.
8) The tidy data is saved to a text file.
