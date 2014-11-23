# run_analysis.r
# This script analyzes smartphone accelerometer & gyroscope data. The data was supplied
# in a ZIP file which was unzipped to the working directory.
#
# This script reads the training set & test set data into separate data frames which are then
# merged into a single data frame.

#create path variables to training & test data sets
train_path = "~/SpiderOak Hive/Getting & Cleaning Data/Class Project/UCI HAR Dataset/train"
test_path = "~/SpiderOak Hive/Getting & Cleaning Data/Class Project/UCI HAR Dataset/test"

# save the original working directory path so it can be restored later, & set working 
# directory to training data set folder
orig_path <- setwd(train_path)

# read training data into data frames; subject & activity data will be combined w/ measured
# data later
train_data <- read.table("X_train.txt")
train_subject_data <- read.table("subject_train.txt")
train_activity_data  <- read.table("y_train.txt")

# change to test data folder & read data into data frames
setwd(test_path)
test_data <- read.table("X_test.txt")
test_subject_data <- read.table("subject_test.txt")
test_activity_data  <- read.table("y_test.txt")

# combine training data & test data into single data frames
all_data <- rbind(train_data, test_data)
all_subject_data <- rbind(train_subject_data, test_subject_data)
all_activity_data <-rbind(train_activity_data, test_activity_data)

# use descriptive activity names
all_activity_data$V1 <- as.character(all_activity_data$V1)
all_activity_data$V1[all_activity_data$V1 == "1"] <- "Walking"
all_activity_data$V1[all_activity_data$V1 == "2"] <- "Walking Up Stairs"
all_activity_data$V1[all_activity_data$V1 == "3"] <- "Walking Down Stairs"
all_activity_data$V1[all_activity_data$V1 == "4"] <- "Sitting"
all_activity_data$V1[all_activity_data$V1 == "5"] <- "Standing"
all_activity_data$V1[all_activity_data$V1 == "6"] <- "Lying"

# select the measured data (X/Y/Z mean & std dev for accelerometer & gyro); use of column 
# numbers avoids problem w/ duplicated column names for many of the analyzed variables; 
# besides, we are only interested in the measurements according to the project statement
mean_std_data <- select(all_data, 1:6, 121:126)

# combine the subject, activity, & measured data into a single data frame
mean_std_data <- cbind(all_subject_data, all_activity_data, mean_std_data)
names(mean_std_data)<- c("subject", "activity",
                         "meanXBody", "meanYBody", "meanZBody",
                         "stdXBody", "stdYBody", "stdZBody",
                         "meanXGyro", "meanYGyro", "meanZGyro",
                         "stdXGyro", "stdYGyro", "stdZGyro")

# melt the data into a new data frame to prepare for tidying
mean_std_melt <- melt(mean_std_data, id = c("subject", "activity"), 
                      measure.vars = c("meanXBody", "meanYBody", "meanZBody",
                                       "stdXBody", "stdYBody", "stdZBody",
                                       "meanXGyro", "meanYGyro", "meanZGyro",
                                       "stdXGyro", "stdYGyro", "stdZGyro"))

# tidy the data by averaging the measurements over subject & activity
mean_std_mean <- dcast(mean_std_melt, subject + activity ~ variable, mean)


setwd("~/SpiderOak Hive/Getting & Cleaning Data/# save the output in the Class Project folderClass Project")
write.table(mean_std_mean, "tidy_means.txt", row.names = FALSE)

# restore the working directory path to original
setwd(orig_path)
