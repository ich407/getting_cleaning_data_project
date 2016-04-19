# Load libraries
library(tidyr)

# Read in relevant datasets
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")

Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

features <- read.table("UCI HAR Dataset/features.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Merge relevant datasets
X_total <- rbind(X_test,X_train)
Y_total <- rbind(Y_test,Y_train)
subject_total <- rbind(subject_test,subject_train)

# Declare column values
names(subject_total) <- "Subject"
names(Y_total) <- "Activity"
names(X_total) <- features[,2]

# Decode activity values
Y_total <- sapply(Y_total, function(x){
    as.character(activity_labels$V2[match(x, activity_labels$V1)])
    }
    )

# Select subset of calculations for StdDev and means
X_rel_columns <- grep("mean|std", names(X_total))
X_rel_total <- X_total[, X_rel_columns]

# Merge the datasets
merged_data_set <- cbind(subject_total,Y_total,X_rel_total)

# "tidy" the merged dataset
tidy_data_set <- merged_data_set %>%
    gather(Variable, Value, -Subject, -Activity)

# Average each variable for each activity and each subject
tidy_average <- ddply(tidy_data_set, .(Subject, Activity, Variable), summarise, AvgValue = mean(Value))

# Create output file for validation
write.table(tidy_average, "tidy_average.txt", row.names = FALSE)