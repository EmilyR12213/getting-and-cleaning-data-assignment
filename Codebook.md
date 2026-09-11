# Code Book

## Data Source

The data used in this project are from the Human Activity Recognition Using Smartphones Dataset.

The dataset contains measurements collected from the accelerometer and gyroscope of a Samsung Galaxy S II smartphone worn by 30 subjects while performing six different activities.

## Data Processing

The following steps were performed:
  
  1. The training and test datasets were merged to create one dataset.
2. Only measurements of the mean and standard deviation were retained.
3. Numerical activity codes were replaced with descriptive activity names.
4. Variable names were changed to descriptive variable names.
5. A second tidy dataset was created containing the average of each measurement for each subject and activity.

## Variables

### subject

Identifies the participant who performed the activity. Subjects are numbered from 1 to 30.

### activity

Identifies the activity performed by the subject. The six possible activities are:
  
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### Measurement Variables

The remaining variables represent averages of the selected mean and standard deviation measurements for each subject and activity.

The variable names use the following terminology:
  
  - Time = time-domain signal
- Frequency = frequency-domain signal
- Body = body-motion component
- Gravity = gravity component
- Accelerometer = accelerometer measurement
- Gyroscope = gyroscope measurement
- Jerk = jerk signal
- Magnitude = magnitude of the signal
- Mean = mean measurement
- StandardDeviation = standard deviation measurement
- X, Y, Z = measurement axis

For example:
  
  `TimeBodyAccelerometerMeanX` represents the mean of the time-domain body acceleration signal along the X axis.

`FrequencyBodyGyroscopeStandardDeviationZ` represents the standard deviation of the frequency-domain body gyroscope signal along the Z axis.