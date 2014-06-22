dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataset_url, "datasets.zip")
unzip("datasets.zip", exdir = "datasets")
    

    ## Reading in data as data frames

data.files          <- dir("datasets\\UCI HAR Dataset", full.names=T)
data.test           <- dir("datasets\\UCI HAR Dataset\\test", full.names=T)
data.train          <- dir("datasets\\UCI HAR Dataset\\train", full.names=T)

activity.label      <- read.table(data.files[1])    
features            <- read.table(data.files[2])    


subject.train       <- read.table(data.train[2]) 
x.train             <- read.table(data.train[3]) 
y.train             <- read.table(data.train[4]) 


subject.test        <- read.table(data.test[2]) 
x.test              <- read.table(data.test[3]) 
y.test              <- read.table(data.test[4]) 

    ## Combining data frames

attributes          <- cbind(rbind(subject.test, subject.train), rbind(y.test, y.train))

combined            <- cbind(attributes,rbind(x.test, x.train))

colnames(combined)  <- c("Subject", "Activity",as.character(features[,2]))

    
    ## Subsetting

selected            <- combined[, grep("mean\\(\\)|std|Subject|Activity", colnames(combined))]


    ## Cleaning up
selected$Activity   <- activity.label[selected[,2],2]

labels.old          <- c("-", "\\(\\)", " ")
labels.new          <- c(".","", ".")

substitute          <- function(pattern, replacement,x){
    for(i in 1:length(pattern)) 
        x           <- gsub(pattern[i], replacement[i],x)
    x    
}

colnames(selected)  <- substitute(labels.old, labels.new, colnames(selected))

    ## Summarazing
library(reshape2)
tidy.data           <- dcast(melt(data=selected, id=c("Subject", "Activity"), variable.name="Parameter"), Subject + Parameter ~ Activity, fun=mean)

    ## Printing to .txt file
options(max.print=2E4)
capture.output( print(tidy.data, print.gap=5, row.names=FALSE), file="tidy_data.txt")

