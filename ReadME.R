# Getting and Cleaning Data Course Project

This repository contains my submission for the Getting and Cleaning Data Course Project.

## Files

- `run_analysis.R` - performs the data cleaning and creates the final tidy dataset.

- `tidy_data.txt` - the final tidy dataset containing the average of each measurement for each subject and activity.

- `CodeBook.md` - describes the variables, data, and transformations used in the analysis.

## How the Script Works

The `run_analysis.R` script performs the following steps:
  
  1. Reads the training and test data from the UCI HAR Dataset.

2. Assigns the feature names to the measurement variables.

3. Combines the subject, activity, and measurement data.

4. Merges the training and test datasets.

5. Extracts only measurements of the mean and standard deviation.

6. Replaces numerical activity codes with descriptive activity names.

7. Replaces abbreviated variable names with more descriptive names.

8. Groups the data by subject and activity and calculates the average of each measurement.

9. Writes the resulting tidy dataset to `tidy_data.txt`.

## Running the Analysis

Place the UCI HAR Dataset folder in the project directory and run

`run_analysis.R`.

The script will produce `tidy_data.txt`.