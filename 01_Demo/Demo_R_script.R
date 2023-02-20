#importing library
library(jsonlite)
#assigning variable name as x and assigning value 3
x<-3
#in R all objects are mutable changing x value from 3 to 5
x<-5
#creating a numeric list using c for concatenating 
numlist <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
#reading a csv file make sure you set the folder to the working dirct
#other wise file wont read or full csv path most be typed
demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)
#using R help center to view what a function does
?fromJSON()
#reading in a json file same reasoning as csv file 
demo_table2<- fromJSON(txt='demo.json')
#example on how to select subset of a data
x <- c(3, 3, 2, 2, 5, 5, 8, 8, 9)
#the actual selection of the subset data
x[3]       
