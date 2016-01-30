# Codebook for Smartphones Dataset 

## Originally written by: Jorge L. Reyes-Ortiz, et al @smartlab.ws

## Updated by: SERGIO GREGORIO in compliance with the requirements
of the course "Getting and Cleaning Data" at Coursera.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## A. FILES

To the original data set, I added two files, namely:

1. all_data.txt: Contains consolidated data taken from the ff. files:

   + activity_labels.txt
   + X_train.txt
   + y_train.txt
   + subject_train.txt 
   + X_test.txt
   + y_test.txt
   + subject_test.txt
   + features.txt 

2. summary_data.txt: Contains summary information (i.e. mean) for all_data.txt 

Please consult the UCI website for a complete list and description of the files that come with the original data set.

## B. DESCRIPTION OF VARIABLES

The following features were extracted from X_train.txt and X_test.txt based on the criteria that they contained the phrases "mean()" or "std()":

Column Id | Column Name | Variable Description
--------------------------------------------------
1 | Subject | An identifier of the subject who carried out the experiment.
2 | ActivityName | Activities performed during the experiment
3 | fBodyAccmeanX | Averaged mean of frequency domain body acceleration signals measured by accelerometer on axis X
4 | fBodyAccmeanY | Averaged mean of frequency domain body acceleration signals measured by accelerometer on axis Y
5 | fBodyAccmeanZ | Averaged mean of frequency domain body acceleration signals measured by accelerometer on axis Z
6 | fBodyAccstdX | Averaged standard deviation offrequency domain body acceleration signals measured by accelerometer on axis X
7 | fBodyAccstdY | Averaged standard deviation offrequency domain body acceleration signals measured by accelerometer on axis Y
8 | fBodyAccstdZ | Averaged standard deviation offrequency domain body acceleration signals measured by accelerometer on axis Z
9 | fBodyAccJerkmeanX | Averaged mean of frequency domain body acceleration Jerk signals measured by accelerometer on axis X
10 | fBodyAccJerkmeanY | Averaged mean of frequency domain body acceleration Jerk signals measured by accelerometer on axis Y
11 | fBodyAccJerkmeanZ | Averaged mean of frequency domain body acceleration Jerk signals measured by accelerometer on axis Z
12 | fBodyAccJerkstdX | Averaged standard deviation offrequency domain body acceleration Jerk signals measured by accelerometer on axis X
13 | fBodyAccJerkstdY | Averaged standard deviation offrequency domain body acceleration Jerk signals measured by accelerometer on axis Y
14 | fBodyAccJerkstdZ | Averaged standard deviation offrequency domain body acceleration Jerk signals measured by accelerometer on axis Z
15 | fBodyAccMagmean | Averaged mean of frequency domain body acceleration signal magnitudes measured by accelerometer
16 | fBodyAccMagstd | Averaged standard deviation offrequency domain body acceleration signal magnitudes measured by accelerometer
17 | fBodyBodyAccJerkMagmean | Averaged mean of frequency domain body acceleration Jerk signal magnitudes measured by accelerometer
18 | fBodyBodyAccJerkMagstd | Averaged standard deviation offrequency domain body acceleration Jerk signal magnitudes measured by accelerometer
19 | fBodyBodyGyroJerkMagmean | Averaged mean of frequency domain body Jerk signal magnitudes measured by gyroscope
20 | fBodyBodyGyroJerkMagstd | Averaged standard deviation offrequency domain body Jerk signal magnitudes measured by gyroscope
21 | fBodyBodyGyroMagmean | Averaged mean of frequency domain body signal magnitudes measured by gyroscope
22 | fBodyBodyGyroMagstd | Averaged standard deviation offrequency domain body signal magnitudes measured by gyroscope
23 | fBodyGyromeanX | Averaged mean of frequency domain body signals measured by gyroscope on axis X
24 | fBodyGyromeanY | Averaged mean of frequency domain body signals measured by gyroscope on axis Y
25 | fBodyGyromeanZ | Averaged mean of frequency domain body signals measured by gyroscope on axis Z
26 | fBodyGyrostdX | Averaged standard deviation offrequency domain body signals measured by gyroscope on axis X
27 | fBodyGyrostdY | Averaged standard deviation offrequency domain body signals measured by gyroscope on axis Y
28 | fBodyGyrostdZ | Averaged standard deviation offrequency domain body signals measured by gyroscope on axis Z
29 | tBodyAccmeanX | Averaged mean of time domain body acceleration signals measured by accelerometer on axis X
30 | tBodyAccmeanY | Averaged mean of time domain body acceleration signals measured by accelerometer on axis Y
31 | tBodyAccmeanZ | Averaged mean of time domain body acceleration signals measured by accelerometer on axis Z
32 | tBodyAccstdX | Averaged standard deviation oftime domain body acceleration signals measured by accelerometer on axis X
33 | tBodyAccstdY | Averaged standard deviation oftime domain body acceleration signals measured by accelerometer on axis Y
34 | tBodyAccstdZ | Averaged standard deviation oftime domain body acceleration signals measured by accelerometer on axis Z
35 | tBodyAccJerkmeanX | Averaged mean of time domain body acceleration Jerk signals measured by accelerometer on axis X
36 | tBodyAccJerkmeanY | Averaged mean of time domain body acceleration Jerk signals measured by accelerometer on axis Y
37 | tBodyAccJerkmeanZ | Averaged mean of time domain body acceleration Jerk signals measured by accelerometer on axis Z
38 | tBodyAccJerkstdX | Averaged standard deviation oftime domain body acceleration Jerk signals measured by accelerometer on axis X
39 | tBodyAccJerkstdY | Averaged standard deviation oftime domain body acceleration Jerk signals measured by accelerometer on axis Y
40 | tBodyAccJerkstdZ | Averaged standard deviation oftime domain body acceleration Jerk signals measured by accelerometer on axis Z
41 | tBodyAccJerkMagmean | Averaged mean of time domain body acceleration Jerk signal magnitudes measured by accelerometer
42 | tBodyAccJerkMagstd | Averaged standard deviation oftime domain body acceleration Jerk signal magnitudes measured by accelerometer
43 | tBodyAccMagmean | Averaged mean of time domain body acceleration signal magnitudes measured by accelerometer
44 | tBodyAccMagstd | Averaged standard deviation oftime domain body acceleration signal magnitudes measured by accelerometer
45 | tBodyGyromeanX | Averaged mean of time domain body signals measured by gyroscope on axis X
46 | tBodyGyromeanY | Averaged mean of time domain body acceleration signals by gyroscope on axis Y
47 | tBodyGyromeanZ | Averaged mean of time domain body acceleration signals by gyroscope on axis Z
48 | tBodyGyrostdX | Averaged standard deviation oftime domain body acceleration signals by gyroscope on axis X
49 | tBodyGyrostdY | Averaged standard deviation oftime domain body acceleration signals by gyroscope on axis Y
50 | tBodyGyrostdZ | Averaged standard deviation oftime domain body acceleration signals by gyroscope on axis Z
51 | tBodyGyroJerkmeanX | Averaged mean of time domain body acceleration Jerk signals by gyroscope on axis X
52 | tBodyGyroJerkmeanY | Averaged mean of time domain body acceleration Jerk signals by gyroscope on axis Y
53 | tBodyGyroJerkmeanZ | Averaged mean of time domain body acceleration Jerk signals by gyroscope on axis Z
54 | tBodyGyroJerkstdX | Averaged standard deviation oftime domain body acceleration Jerk signals by gyroscope on axis X
55 | tBodyGyroJerkstdY | Averaged standard deviation oftime domain body acceleration Jerk signals by gyroscope on axis Y
56 | tBodyGyroJerkstdZ | Averaged standard deviation oftime domain body acceleration Jerk signals by gyroscope on axis Z
57 | tBodyGyroJerkMagmean | Averaged mean of time domain body acceleration Jerk signal magnitudes by gyroscope
58 | tBodyGyroJerkMagstd | Averaged standard deviation oftime domain body acceleration Jerk signal magnitudes by gyroscope
59 | tBodyGyroMagmean | Averaged mean of time domain body acceleration signal magnitudes by gyroscope
60 | tBodyGyroMagstd | Averaged standard deviation oftime domain body acceleration signal magnitudes by gyroscope
61 | tGravityAccmeanX | Averaged mean of time domain gravity acceleration signals by accelerometer on axis X
62 | tGravityAccmeanY | Averaged mean of time domain gravity acceleration signals by accelerometer on axis Y
63 | tGravityAccmeanZ | Averaged mean of time domain gravity acceleration signals by accelerometer on axis Z
64 | tGravityAccstdX | Averaged standard deviation oftime domain gravity acceleration signals by accelerometer on axis X
65 | tGravityAccstdY | Averaged standard deviation oftime domain gravity acceleration signals by accelerometer on axis Y
66 | tGravityAccstdZ | Averaged standard deviation oftime domain gravity acceleration signals by accelerometer on axis Z
67 | tGravityAccMagmean | Averaged mean of time domain gravity acceleration signal magnitudes by accelerometer
68 | tGravityAccMagstd | Averaged standard deviation oftime domain gravity acceleration signal magnitudes by accelerometer

Source: [UCI website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

In general, the human readable column names were constructed using rules such as:

1. Replace t (when it's the first letter) with Total.
2. Replace f (when it's the first letter) iwth Frequency.
3. Replace Acc with Acceleration.
4. Replace Gyro with Gyroscope.
5. Replace Mag with Magnitude.
6. Replace X, Y, Z with XAxis, YAxis, ZAxis.

A comprehensive list and further explanation can be found in the run_analysis.R script.

## C. DATA PROCESSING 

The main analysis script requires the 'dplyr' package.

1. The source files such as X_train.txt, X_test.txt, etc. were read into R variables
   using the read.table() command.

2. Observations from the training and test data sets were marked by adding a 
   character column with the words "train" or "test", like so:
   
   dset <- rep("train", length(sub_train))   

3. The data from different data files and sets were merged using:

   all <- merge(rbind(train, test), act_labels, by="ActivityLabel")

4. Whenever and wherever possible, friendly or human readable names were assigned to 
   columns with the aid of helper functions (e.g. friendly_names function), like so:

   names(all_final) <- friendly_names(names(all_final)) 

5. The average of selected features for each activity and subject were obtained via:

   data_summary <- by_act_sub %>% summarise_each(funs(mean))   

6. The outputs of STEPS 1 and 5 of the project instructions are written to files with:

   write.table(all_final, file = "all_data.txt", append = FALSE, quote = TRUE, 
            eol = "\n", na = "NA", dec = ".", col.names = TRUE, row.names = FALSE, 
            qmethod = c("escape", "double"), fileEncoding = "")    