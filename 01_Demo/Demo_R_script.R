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


#looking at mutate() beginning tidyverse to 
#transform data 

#you usually want this at the very top 
library(tidyverse)

#looking at documentation for mutate()
?mutate()

#using mutate if we want to use our coworker vehicle data 
#from the demo_table and add a column 
#for the mileage per year, as well as 
#label all vehicles as active, we would 
#use the following statement
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) #add columns to original data frame


#starting Group data in order to summarize 
#dplyr statement: if we want to summarize the used car data
#by vehicle and determine the average mileage per condition
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), .groups = 'keep') #create summary table

#if in addition to our previous summary table we wanted to 
#add the maximum price for each 
#condition, as well as add the vehicles 
#in each category, our statement would look as follows:
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep') #create summary table with multiple columns


#Reshaping data in R gather() and spread()

#looking at gather documentation which is used to transform a wide data set into long
?gather()

#loading demo2csv file and creating a new demo_table3
demo_table3 <-read.csv('demo2.csv',check.names = F ,stringsAsFactors = F)

#reshaping demo_table3 from wide format to long format using 
#gather() this code needs further study i cant understand the buying_price:popularity
#understanding is gathering- understanding the range is x:y key is metric converting
#all column names into key on the table and all values of those column names are being place
#in score spread is working the same way 
long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)

#using spread to turn a long format data into wide 
#format

#documentation on spread()
?spread()

#turning the long table back to wide
wide_table <- long_table %>% spread(key="Metric",value="Score")

#seeing if our wide table matches our original data
#this code will give us an error since we need to match all
#columns to the table 
all.equal(demo_table3, wide_table)

#using R visualization ggplot looking at 
#documentation first 
?ggplot

#the mpg data set is build into R and it contains
#data from fuel economy from 1999
head(mpg)

#to view entire mpg data it will pop a extra window
#showing data table
view(mpg)

#how to start layering your code for plotting graph
plt <- ggplot(mpg,aes(x=class)) #import data set into ggplot2

#actually printing visualization
plt + geom_bar()#plot a bar plot

#viewing geom_bar()documentation
?geom_bar

#another use for bar plots to compare and contrast
#categorical results to do this we also need to layer it as follow:
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep') #create summary table

plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count)) #import data set into ggplot2

plt + geom_col() #plot a bar plot

#adding formatting functions to the bar
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") #plot bar plot with labels
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + #plot a boxplot with labels
theme(axis.text.x=element_text(angle=45,hjust=1)) #rotate the x-axis label 45 degrees


