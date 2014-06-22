---
title: "ReadMe"
---


## Dowload and data extraction  done with download.file() and unzip()
* File names were annotated with the dir() function 
* Files were individually read in as dataframes using read.table() and the file path pointing to the respective position of the file in the subfolders. This allows for the maintenance of the .zip folder structure when operating from a working directory in the same directory 

## Reading in files
* Individual file were read in as data frames using read.table(), examined with dim(), str() and unique() in order to identify suitable concatanation methods (see codebook for names)
* x.test contains 2947 rows x 561 columns (numeric)
* subject.test contains 2947 rows x 1 column denoting subject ids 2,4,9,10,12,13,18,20,24 (integers)
* y.test contains 2947 rows x 1 column denoting activity ids 1-6 (integers)

* x.train contains 7352 rows x 561 columns (numeric)
* subject.train 7352 rows x 1 column denoting subject ids 1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30 (integers)
* y.train 7352 rows x 1 column denoting activity ids 1-6 (integers)
    
* features contains 561 rows x 2 columns denoting 477 unique entries
* activity contains 6 rows x 2 columns 
    
## Concatanation of data files
* Subject and activity ids of 1.test and 2.train data frames were combined (cbind() and rbind()) leading to a subject + activity dataframe with 10299 rows x 2 columns containing integer variables ("attributes")
* "attributes" was combined (cbind()) with the concatanated test and train data frame ("combined")
* Descriptive column names were added to Subject and Activity ID columns using colnames()

## Subsetting of combined data frame
* grep() was used to subset the data frame to columns that include "std()" and "mean()" in column name; I excluded "meanFreq" as well columns containing "Mean" in column header; the resulting data frame is called "selected" and contains 10299 rows x 68 columns

## Cleaning up
* Activity labels were replaced with descriptive labels from the "activity.label" data frame (see codebook)
* Two vectors were created of character strings in column headers that are supposed to be replaced due to R incompatibilities or readability: "lables.old" and "lables.new" where "labeled.new" should substitute for the string at the same position in "table.old"
* Replacement of certain strings in "colnames(selected)" was done using a function that takes three arguments (pattern, replacement and x) and places them in the gsub() function; using a for() loop this substitution can be done for a variable number of strings denoted by i; the character vector colnames(selected) is searched for patterns defined in "labels.old"  and every i of "lables.old" is replaced by the corresponding string in "labels.new"
* the resulting data frame is used in the melt() function to create a long data frame with each row being a unique Subject-Activity-variable combination where the header "variable" was replaced by "Parameter"; 679743 rows x 4 columns; 
* The data was summarized by averaging (using mean())  in "Parameter" values for each Subject-Activity combination using dcast() 

## Printing to .txt file
* The resulting data frame was saved as a txt file with defined maximal row number length and gap length and removing line labels

  
