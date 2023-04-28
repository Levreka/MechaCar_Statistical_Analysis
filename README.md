# MechaCar_Statistical_Analysis


Overview of Project

A few weeks after starting his new role, Jeremy is approached by upper management about a special project. AutosRUs’ newest prototype, the MechaCar, is suffering from production troubles that are blocking the manufacturing team’s progress. AutosRUs’ upper management has called on Jeremy and the data analytics team to review the production data for insights that may help the manufacturing team.

In this challenge, you’ll help Jeremy and the data analytics team do the following:

Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes

Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots

Run t-tests to determine if the manufacturing lots are statistically different from the mean population

Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. For each statistical analysis, you’ll write a summary interpretation of the findings.

## Deliverables:

This new assignment consists of three technical analysis deliverables and a proposal for further statistical study. You’ll submit the following:

Deliverable 1: Linear Regression to Predict MPG
Deliverable 2: Summary Statistics on Suspension Coils
Deliverable 3: T-Test on Suspension Coils
Deliverable 4: Design a Study Comparing the MechaCar to the Competition

## Linear Regression to Predict MPG

<img width="960" alt="Deliverable_1" src="https://user-images.githubusercontent.com/90356052/148167520-104ab4ef-a084-4944-a71b-1a098c64c0dc.png">

Which variables/coefficients provided a non-random amount of variance to the mpg values in the data set?

Vehicle length and ground_clearance provide a non-random amount of variance to the mpg values in the data set under the assumption of using a .05 significance level. That is to say that vehicle length and vehicle ground clearance have significant impact on mpg, while vehicle weight spoiler angle and AWD indicate a random amount of variance this is shown by their P-values above the .05 assumption

Is the slope of the linear model considered to be zero? Why or why not?

Our slope is not zero just be looking at the p-value, which is less than 0.05 significance level. Is also important to view at the intercept which is significant, this could mean that different variables not included in our model may described the difference in variability. It could also mean that out vehicle_length and ground_clearance may need scaling or transforming to help improve the predictive power of the model.  

Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

Our R-squared value is 0.7149, which means roughly ~71% of the time our model will most likely predict MPG values correctly.There might be other factors that may contribute to the variability that perhaps were not capture in our data set 

## Summary Statistics on Suspension Coils

<img width="960" alt="Delivrable_2_total" src="https://user-images.githubusercontent.com/90356052/148171106-7f88df3e-dac2-449c-9ade-763a864a0463.png">

<img width="960" alt="deliverable2_lot_summary" src="https://user-images.githubusercontent.com/90356052/148171118-7082f8c8-51b5-410b-8811-d09e6bd66637.png">

The design specifications for the MechaCar suspension coils 
dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

Lot 1 and Lot 2 are both within design specifications. Lot 3 shows the most variance and exceeds the manufacturers specs.

## T-Tests on Suspension Coils

<img width="960" alt="Deliverable_3_1" src="https://user-images.githubusercontent.com/90356052/148171742-5c859a4e-0dee-4c48-896d-0b54fa68eace.png">
<img width="960" alt="Deliverable3_2" src="https://user-images.githubusercontent.com/90356052/148171741-349c32c9-b609-4890-8017-a04095871df0.png">


# findings

the first finding we make is that using the one t-test for the entire data set shows that there is no statistical difference between the sample data mean and the population mean looking at the summary image, we can see that our p-value is greater than our .05 significance level 0.51 this means we don't have enough evidence to reject our null hypothesis of there being a statistical difference between the means. Running three more individual test this time by manufacturing lots we arrive to the same conclusion lot_1 with p-value .90, lot_2 with a p-value of .34, lot_3 with a p-value of .63. 

## Study Design: MechaCar vs Competition

This study would involve collecting data on MechaCar and its comparable models across several different manufacturers over the last 3 years.

What are the competitions' comparable models,
Which cars will MechaCar be competing with head-to-head? which cars will be included in the study?
Which factors will look at the study to determine the relevant to selling price?
Metrics
Collecting data for comparable models across all major manufacturers for past 3 years for the following metrics:

Safety Feature Rating: Independent Variable
Current Price (Selling): Dependent Variable
Drive Package : Independent Variable
Engine (Electric, Hybrid, Gasoline / Conventional): Independent Variable
Resale Value: Independent Variable
Average Annual Cost of ownership (Maintenance): Independent Variable
MPG (Gasoline Efficiency): Independent Variable
Hypothesis: Null and Alternative
After determining which factors are key for the MechaCar's genre:

Null Hypothesis (Ho): MechaCar is priced correctly based on its performance of key factors for its genre.
Alternative Hypothesis (Ha): MechaCar is NOT priced correctly based on performance of key factors for its genre.
Statistical Tests
A multiple linear regression would be used to determine the factors that have the highest correlation/predictability with the list selling price (dependent variable); which combination has the greatest impact on price (it may be all of them!)
