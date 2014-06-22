---
title: "CodeBook"
---

# Description of file names and dataframes used when reading in data

* data.files:         folder path of files in UCI HAR Dataset
* data.test:          folder path of files in test subfolder
* data.train:         folder path of files in training subfolder

## Read in from data.files

* activity.label:     activity labels data frames in R  
* features:           feature labels data frame in R      

## Read in from data.test

* subject.test        test subject id data frame in R
* x.test              test measurements data frame  in R 
* y.test              test activity id dataframe in R

## Read in from data.train 

* subject.train:      training subject id data frame in R
* x.train:            training measurements data frame  in R 
* y.train:            activity id dataframe in R


# Description of data frames and other variables after concatanation, cleaning and transformations

* attributes:        data frame of concatanated subject IDs and activity IDs of test and train data sets; 10299 rows x 2 columns
* combined:          data frame of concatanated test and train data and "attributes" data frame including descriptive headers for ID columns; 10299 rows x 563 columns
* selected:          data frame of "combined" subsetted to std() and mean() including descriptive activity labels and cleaned up column names; 10299 rows x 68 columns
* labels.old:        vector of characters in "selected" that are supposed to be substituted for R compatability
* labels.new:        vector of character substitutions for "labels.old"
* substitute:        function that takes 2 variable arguments such as "labels.old" by "labels.new" and executes their substitution using gsub()
* tidy.data:         data frame (long) summarizing mean of all subject-variable combinations across activities, variable renamed to "Parameter"; 1980 rows x 8 columns
