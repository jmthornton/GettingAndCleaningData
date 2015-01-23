# Declare libraries used
if(!require(dplyr))
  install.packages("dplyr")

if(!require(tidyr))
  install.packages("tidyr")

require(dplyr)
require(tidyr)

# Read the feature labels.  The second column contains the feature names.
features <- read.table("UCI HAR Dataset/features.txt")[,2]

# Read the activity labels and give the data frame descriptive column names
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activities) <- c("id", "activity")

# Find mean() and std() measurements from features
colindex <- grep("mean\\(\\)|std\\(\\)", features)

# Clean these feature names to remove invalid characters and correct those containing 'BodyBody'
cols <- gsub("BodyBody", "Body", gsub("[-()]", "", features[colindex]))
cols <- gsub("mean", "Mean", cols)
cols <- gsub("std", "Std", cols)

# Read the relevant columns from the training and test data
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")[colindex]
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")[colindex]

# Add column names
names(xtrain) <- cols
names(xtest) <- cols

# Add the subjects
xtrain["subject"] <- read.table("UCI HAR Dataset/train/subject_train.txt")
xtest["subject"] <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Add the activities
xtrain["activity"] <- read.table("UCI HAR Dataset/train/y_train.txt")
xtest["activity"] <- read.table("UCI HAR Dataset/test/y_test.txt")

# Merge the data sets
df <- rbind(xtrain, xtest)

df <- df  %>% gather(feature, value, -subject, -activity) %>%
  group_by(subject, activity, feature) %>%
  summarise(average = mean(value))

# Create factors
df$activity <- factor(df$activity, labels = activities$activity)
df$feature <- factor(df$feature)

# Write the tidy data set
write.table(df, "tidy_data.txt", row.name=FALSE)
