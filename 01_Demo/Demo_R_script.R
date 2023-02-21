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

#using bracket notation to select data from 
#two-dimensional data structures 
demo_table[3,"Year"]

#another way to achieve the same result as above
demo_table[3,3]

#3rd option on how to select data like above
demo_table$Vehicle_Class

#same as option above just one result
demo_table$Vehicle_Class[2]

#filtering car data table 2 to retrieve only 
#data whose car price is greater than 10,000
filter_table <- demo_table2[demo_table2$price > 10000,]

#using subset Data to filter subset data using more 
#complicated logic
#looking at documentation for subset
?subset()

#example of a more elaborate filtered data set
filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status) #filter by price and drive train

#another example of the same code above
filter_table3 <- demo_table2[("clean" %in% demo_table2$title_status) & (demo_table2$price > 10000) & (demo_table2$drive == "4wd"),]

#how to use sample data in R
#looking at documentation 
?sample()

#one sample from a larger vector to smaller vector
#using sample
sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)

#how to sample using two dimensional data structures
#first capture the number of rows in the table using (:) operator
num_rows <- 1:nrow(demo_table)

#2nd sample 3 of those rows
sample_rows <-sample(num_rows, 3)

#finally retrieve the requested data 
demo_table[sample_rows,]

#if we want to combine all 3 steps mention above in 
#one line of code 
demo_table[sample(1:nrow(demo_table), 3),]
