# Getting and Cleaning Data Course Project

The ```run_analysis.R``` puts the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) from recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors ([see the project website here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)) and creates a second, independent tidy data set with the average of each variable for each activity and each subject called ```tidy_data.txt```.

## Principles of tidy data
The ```tidy_data.txt``` meets the following principles of tidy data:
* each variable in one column
* each row represents an observation, the result of the **mean of the measurements** of **one subject** performing **one activity** 

Also, as shown in week 1 of the course, the variable names are human-readable.

## Reading the file
You can read the file by typing:
```tidy_data <- read.table("tidy_data.txt", header = TRUE); View(tidy_data)```

The codebook has a specific description of the tidy data file contents.

## Acknowledgment
The script was greatly helped by the [David Hood's post](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/), [Hadley Wickham's paper](https://vita.had.co.nz/papers/tidy-data.pdf) and [Luis Sandino's help guide](https://drive.google.com/file/d/0B1r70tGT37UxYzhNQWdXS19CN1U/view).

