# Getting and Cleaning Data Course Project

The ```run_analysis.R``` puts the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) from recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors ([see the project website here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)) and creates a second, independent tidy data set with the average of each variable for each activity and each subject called ```tidy_data```.

The ```tidy_data``` meets the following principles of tidy data, as shown in week 1 of the course:
* each variable in one column
* each different observation of the variable in a different row
* human-readable variable names

The script follows the [David Hood post](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) and [Hadley Wickham's article](https://vita.had.co.nz/papers/tidy-data.pdf).

The codebook has a specific description of the tidy data file contents.
