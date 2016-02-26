# Overview

The *tidy* dataset is summarized from the [Human Activity Recognition Using Smartphones (HAR) Dataset](www.smartlab.ws). It contains the following files. It is part of the Coursera Data Science Specialization's [Getting and Cleaning Data](https://www.coursera.org/account/accomplishments/records/B8Z4ERJDYNDW) Final Project.

# CodeBook.md

CodeBook.md gives an overview about the *tidy* dataset, the [Human Activity Recognition Using Smartphones (HAR) Dataset](www.smartlab.ws) where it came from, the data transformation procedures, and the description of all variables.

# run_analysis.R

The R file that performs the data transformation from HAR to tidy as detailed in CodeBook.md.

# tidy.txt

The resulting dataset from transforming the HAR dataset as detailed in CodeBook.md. 

Each row is the subject x activity label (observation). It has a total of 180 observations and 66 features.

To read the dataset
```{r}
tidy<-read.table('tidy.txt')
```
