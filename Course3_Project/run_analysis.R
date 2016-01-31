## run_analysis.R by Sergio Gregorio, January 31, 2016

## This script seeks to satisfy all 5 functional requirements listed in the instructions:
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each measurement.
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names.
## 5) From the data set in step 4, creates a second, independent tidy data set with 
##    the average of each variable for each activity and each subject. 

## Load the 'dplyr' package
library(dplyr)

## run_analysis() is the main function to run.  It calls three other helper functions.

run_analysis <- function() {

	## Read in data common to both test and training data sets
	act_labels <- read.table("activity_labels.txt", sep=" ")  
	features <- read.table("features.txt", sep=" ")
   sub_test <- read.table("test/subject_test.txt", sep="\t") 
   x_test <- read.table("test/X_test.txt", sep="\t")  
   y_test <- read.table("test/y_test.txt", sep="\t")  

   ## We mark all our test data with label "test" under a column named "dset".
   dset <- rep("test", length(sub_test))   
   test <- cbind(dset, sub_test, y_test)   

   ## Project requirement no. 4:  Label data set with descriptive variable names. 
   names(test) <- c("DataSet", "Subject", "ActivityLabel")   

   sub_train <- read.table("train/subject_train.txt", sep="\t") 
   x_train <- read.table("train/X_train.txt", sep="\t")  
   y_train <- read.table("train/y_train.txt", sep="\t")  

   ## We mark all our training data with label "train" under a column named "dset".
   dset <- rep("train", length(sub_train))   
   train <- cbind(dset, sub_train, y_train)   

   ## Project requirement no. 4:  Label data set with descriptive variable names. 
   names(train) <- c("DataSet", "Subject", "ActivityLabel") 

   ## Project requirement no. 3: Use descriptive activity names in the data set.
   names(act_labels) <- c("ActivityLabel", "ActivityName")   	                   
   ## Project requirement no. 1: Merge training and test sets to create one data set    
   all <- merge(rbind(train, test), act_labels, by="ActivityLabel")

   ## Extract all features from x_train and x_test, store in a data frame feat_df,
   ## merge feat_df with our data set "all" (contaning Subject, ActivityLabel etc). 
   x_all <- rbind(x_train, x_test) 
   feat_df <- feature_df(x_all, features)
   ## We should get 10 rows x 70 columns (4 from all + 66 from x_data)
   all_final <- cbind(all, feat_df)

   ## Give user-friendly names to our data set
   names(all_final) <- friendly_names(names(all_final)) 

   write.table(all_final, file = "all_data.txt", append = FALSE, quote = TRUE, 
            eol = "\n", na = "NA", dec = ".", col.names = TRUE, row.names = FALSE, 
            qmethod = c("escape", "double"), fileEncoding = "")    
   summary_data <- subset(all_final, select=-c(ActivityLabel,DataSet))
   
   ## Create a grouping by activity, subject in dplyer.  We include dset so it would
   ## show up in final tidy data set.  There is no harm to this because each subject
   ##belongs to one and only one data set (either 'test' or 'training', but not both). 
   by_act_sub <- group_by(summary_data, ActivityName, Subject)

   ## Project requirement no. 5: Create data set with averages per activity, subject. 
   data_summary <- by_act_sub %>% summarise_each(funs(mean))
   ## Project requirements no. 4: Feature columns should begin with "MeanOf" (descriptive).
   names(data_summary) <- friendly_summary_names(names(data_summary))

   ## Save data to a file.
   write.table(data_summary, file = "summary_data.txt", append = FALSE, quote = TRUE, 
            eol = "\n", na = "NA", dec = ".", col.names = TRUE, row.names = FALSE, 
            qmethod = c("escape", "double"), fileEncoding = "", sep=" ")   

   ## Just return the big, merged data set
   all_final
}  ## End of the main run_analysis() function   

## feature_df() function - reads all the features data, extracts those related to
##   mean and std dev, and returns a data frame containing them.

feature_df <- function(df, features) {   

   ## Convert our df into something we can handle.
   df <- df[1:length(df[[1]]),]
   names(features) <- c("index", "feature_name")
   ## Get the index and column names of all features that contain "mean()" or "std()".
   colnames_list <- filter(features, grepl("mean\\(\\)", feature_name) | grepl("std\\(\\)", feature_name)) %>% select(feature_name)   
   idx_list <- filter(features, grepl("mean\\(\\)", feature_name) | grepl("std\\(\\)", feature_name)) %>% select(index)   
   idx_list <- as.numeric(idx_list[[1]])

   totrows <- length(df)   
   mylist <- as.list(df) 
   ## 1) Split x_data (long string) into tiny pieces in a list.  
   result <- sapply(mylist, function(x) strsplit(trimws(x), "(\\s)+"))      
   totidx <- length(idx_list)
   
   value_matrix <- matrix(, nrow = 0, ncol = totidx)
   for (row in 1:totrows)
      {
      value_vec <- numeric()      
      for (ctr in 1:totidx)   
         {
         idx <- idx_list[ctr]
         ## Use the indexes to extract values from inside 'result' (which is a list).
         value_vec <- c( value_vec, as.numeric(result[[row]][[idx]]) )
         }
      ## Add each extracted value to our matrix of features. 
      value_matrix <- rbind(value_matrix, value_vec)  
      }
   value_df <- data.frame(value_matrix, row.names=NULL)
   names(value_df) <- colnames_list[[1]]
   value_df
}

## friendly_names() function - accepts a list of column names from the phone
##   data set and generates a list of equivalent but user-friendly column names

friendly_names <- function(cnames) {

   cnames <- sub("^t", "Time", cnames)
   cnames <- sub("^f", "Frequency", cnames)
   cnames <- sub("Acc", "Acceleration", cnames)
   cnames <- sub("Gyro", "Gyroscope", cnames)
   cnames <- sub("Mag", "Magnitude", cnames)   
   cnames <- gsub("mean\\(\\)", "Mean", cnames)   
   cnames <- gsub("mean", "Mean", cnames)   
   cnames <- gsub("std\\(\\)", "StanDev", cnames)
   cnames <- gsub("std", "StanDev", cnames)
   cnames <- sub("X$", "XAxis", cnames)
   cnames <- sub("Y$", "YAxis", cnames)
   cnames <- sub("Z$", "ZAxis", cnames)
   cnames <- gsub("(\\.)+", "", cnames)   
   cnames <- gsub("(\\-)+", "", cnames)   
   cnames <- gsub("(\\_)+", "", cnames)   
} 

## friendly_summary_names() gives human readable names to data set columns produced by STEP 5.

friendly_summary_names <- function(cnames) {
   cnames <- sub("^Time", "MeanOfTime", cnames)
   cnames <- sub("^Frequency", "MeanOfFrequency", cnames)
}   