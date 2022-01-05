## Deliverable 1 Linear Regression to Predict MPG

#load the dplyr package
library(dplyr)
#Import and read in the MechaCar_mpg.csv
MechaCar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
#create multiple linear model
lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg,data=MechaCar_mpg)
#generate summary stats
summary(lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg,data=MechaCar_mpg))

## Deliverable 2 Create Visualizations for the Trip

#  import and read in the Suspension_Coil.csv file as a table.
Suspension_Coil_data <- read.csv(file="Suspension_Coil.csv", check.names=F,stringsAsFactors = F)

#  Write an RScript that creates a total_summary dataframe to get the mean, median, variance, and standard deviation of the suspension coil's PSI column
total_summary <- Suspension_Coil_data %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
# Create Summary table
summarize_demo <- lot_summary %>% group_by(Manufacturing_Lot) %>% summarize()

#  RScript that creates a lot_summary dataframe to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil's PSI column.
lot_summary <- Suspension_Coil_data %>% group_by(Manufacturing_Lot) %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

## Deliverable 3 T-Tests on Suspension Coils

# Test for Normality 
shapiro.test(Suspension_Coil_data$PSI)
# PSi distribution is normal since P-value is way less than 0.05

# RScript using the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
t.test(x=Suspension_Coil_data$PSI, mu=1500)

# Write three more RScripts in your MechaCarChallenge.RScript using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
subset_Lot1 <- subset(Suspension_Coil_data, Suspension_Coil_data$Manufacturing_Lot == 'Lot1')
t.test(x=subset_Lot1$PSI, mu=1500)

subset_Lot2 <- subset(Suspension_Coil_data, Suspension_Coil_data$Manufacturing_Lot == 'Lot2')
t.test(x=subset_Lot2$PSI, mu=1500)

subset_Lot3 <- subset(Suspension_Coil_data, Suspension_Coil_data$Manufacturing_Lot == 'Lot3')
t.test(x=subset_Lot3$PSI, mu=1500)






