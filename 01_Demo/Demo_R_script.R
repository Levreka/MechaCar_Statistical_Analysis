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


#using line graph to visualize relationship between
#Categorical and continuous data 
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) #import data set into ggplot2
plt + geom_line()#graphing the actual line plot
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) #add line plot with labels

#implementing scatter plots in ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty)) #import data set into ggplot2
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)") #add scatter plot with labels

#adding formatting to our scatter plot to show
#more information in a single visualization
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class)) #import data set into ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class") #add scatter plot with labels

#adding extra aesthetics to the graph like shape and size
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv,size=cty)) #import data set into ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive", size="City MPG") #add scatter plot with multiple aesthetics

#creating whisker plots 
plt <- ggplot(mpg,aes(y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() #add boxplot


#expanding the abilities of whisker plots
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy, fill=(manufacturer))) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot and rotate x-axis labels 45 degrees

#using heat maps visualizations
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table

plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))#adding the data set to ggplot

plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)") #create heat map with labels

#using heat map to show difference in avg hwy fuel efficiency across 
#each vehicle model from 1999
mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) #import dataset into ggplot2
#add heatmap with labels
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") +    
theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5)) #rotate x-axis labels 90 degrees

#using layering to add additional plots to visualizations
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + #add boxplot
theme(axis.text.x=element_text(angle=45,hjust=1)) + #rotate x-axis labels 45 degrees
geom_point() #overlay scatter plot on top each dot represents an entry in the hwy data


#using mapping to add 
#to our previous graph 
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") #add scatter plot


#using dplyr to summarize and create geom_errobar
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot with labels
geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars

#using Faceting function 
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)

#If we want to visualize the different vehicle fuel efficiency ratings by manufacturer, our R code would be as follows:
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees

#looking at documentation for facet_wrap
?facet_wrap()

#to facet our previous example by the fuel-efficiency type, our R code could be as follows:
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + #create multiple boxplots, one for each MPG type
theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") #rotate x-axis labels

#running qualitative test for normality  from build in 
#mtcars data set in R
ggplot(mtcars,aes(x=wt)) + geom_density() #visualize distribution using density plot

#using Shapiro.test documentation function to view how functions works
?shapiro.test()

#running Shapiro.test to check for normality on the built in data set of 
#mtcars if a p value is return greater than .05 is consider normally distributed
shapiro.test(mtcars$wt)


#looking at the documentation for function sample_n this function R is suggesting
#to move to the new one slice_sample()
?sample_n()

#opening new data set from used vehicle data set
#visualizing the distribution of driven miles for our entire population one example would be:
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) #import used car dataset
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

#creating our sample data using sample_n() like our module keep in mind we will later need
#to start using the new slice_sample
sample_table <- population_table %>% sample_n(50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

#viewing the one sample t-test built in function in R
?t.test()

#using the previous samples  we want to test if the miles driven from our previous 
#sample dataset is statistically different from the miles driven in our population 
#data, we would use our t.test()function as follows: 
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means
# the results provides different measurements but using the p-value which in this case
#we are using the common p-value .05 we can see that p-value is above our significant lvl
#therefore we do not have sufficient evidence to reject the null hypothesis the two means
#are statistically similar

#conducting the two sample t test using the same build in function however
#now we will also use the y argument in the syntax
sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50) #generate another 50 randomly sampled data points
t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven)) #compare means of two samples

#using now the same t.test function to built a pair test 
mpg_data <- read.csv('mpg_modified.csv') #import dataset
mpg_1999 <- mpg_data %>% filter(year==1999) #select only data points where the year is 1999
mpg_2008 <- mpg_data %>% filter(year==2008) #select only data points where the year is 2008
t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples

#using aov function to test for ANOVA Test looking at documentation
?aov()


#To practice our one-way ANOVA, return to the mtcars dataset. For this statistical test, we'll 
#answer the question, "Is there any statistical difference in the horsepower of a vehicle 
#based on its engine type?"
mtcars_filt <- mtcars[,c("hp","cyl")] #filter columns from mtcars dataset
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert numeric column to factor
aov(hp ~ cyl,data=mtcars_filt) #compare means across multiple levels
summary(aov(hp ~ cyl,data=mtcars_filt))#to retrieve the p_values we must use this
#the "Pr(>F)" column, is the same as our p-value the results might come out in scientific notation or E notation
#you can quickly transform it online calculators

#studying the correlation build in function in r
?cor()

#practicing the correlation method using mtcars dataset
head(mtcars)#viewing the data
plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() #create scatter plot
cor(mtcars$hp,mtcars$qsec) #calculate correlation coefficient

#another example using correlation
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F) #read in dataset
head(used_cars)#looking at the columns in dataset
#testing whether or not vehicle miles driven and selling price are correlated.
plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price)) #import dataset into ggplot2
plt + geom_point() #create a scatter plot
cor(used_cars$Miles_Driven,used_cars$Selling_Price) #calculate correlation coefficient

#creating a correlation matrix to compute multiple numeric variables since calculating them all
#individually can be very time consuming
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")]) #convert data frame into numeric matrix
cor(used_matrix)

#exploring single linear regression using the built in formula lm()
?lm()

#begin creating our linear regression using our previous assumption that there is a strong correlation
#between horsepower and quarter mile times
lm(qsec ~ hp,mtcars) #create linear model
summary(lm(qsec~hp,mtcars)) #summarize linear model in order to retrieve our p-value and rsquare
#plotting our linear analysis and drawing the line
model <- lm(qsec ~ hp,mtcars) #create linear model
yvals <- model$coefficients['hp']*mtcars$hp + model$coefficients['(Intercept)'] #determine y-axis values from linear model
plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model


#single model regression not very well to explain variability between horse power and quarter mile times
#using multiple-linear regression to use more independent variables
lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate summary statistics

#looking at chisquare test documentations
?chisq.test()

# if we want to test whether there is a statistical difference in the distributions of vehicle class across 1999 and 2008 
#from our mpg dataset, we would first need to build our contingency table as follows:
table(mpg$class,mpg$year) #generate contingency table

#passing  pass contingency table to the chisq.test()function:
tbl <- table(mpg$class,mpg$year) #generate contingency table
chisq.test(tbl) #compare categorical distributions

#practicing 
table(mpg$trans,mpg$drv) #generate contingency table

tbl <- table(mpg$trans,mpg$drv) #generate contingency table
chisq.test(tbl) #compare categorical distributions
