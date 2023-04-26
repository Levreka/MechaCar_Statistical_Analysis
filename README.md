# MechaCar_Statistical_Analysis


Overview of Project
A few weeks after starting his new role, Jeremy is approached by upper management about a special project. AutosRUs’ newest prototype, the MechaCar, is suffering from production troubles that are blocking the manufacturing team’s progress. AutosRUs’ upper management has called on Jeremy and the data analytics team to review the production data for insights that may help the manufacturing team.

In this challenge, you’ll help Jeremy and the data analytics team do the following:

Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes
Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots
Run t-tests to determine if the manufacturing lots are statistically different from the mean population
Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. For each statistical analysis, you’ll write a summary interpretation of the findings.
Deliverables:
This new assignment consists of three technical analysis deliverables and a proposal for further statistical study. You’ll submit the following:

Deliverable 1: Linear Regression to Predict MPG
Deliverable 2: Summary Statistics on Suspension Coils
Deliverable 3: T-Test on Suspension Coils
Deliverable 4: Design a Study Comparing the MechaCar to the Competition

## Linear Regression to Predict MPG

<img width="960" alt="Deliverable_1" src="https://user-images.githubusercontent.com/90356052/148167520-104ab4ef-a084-4944-a71b-1a098c64c0dc.png">
Which variables/coefficients provided a non-random amount of variance to the mpg values in the data set?

Vehicle length and ground_clearance provide a non-random amount of variance to the mpg values in the data set under the assumption 
of using a .05 significance level. That is to say that vehicle length and vehicle ground clearance have significant impact on mpg, while vehicle weight spoiler angle and AWD indicate a random ammount of variance this is shown by their P-values above the .05 assumption

Is the slope of the linear model considered to be zero? Why or why not?

Our slope is not zero just be looking at the p-value, which is less than 0.05.

Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

Our R-squared value is 67%, which means roughly ~67% of the time the model our model will most likely predict MPG values correctly. Some of the Factors that might contribute some of this variability might be ground clearance and vehicle length. There might be other factors that may contribute to the variability that perhaps were not capture in our data 

## Summary Statistics on Suspension Coils

<img width="960" alt="Delivrable_2_total" src="https://user-images.githubusercontent.com/90356052/148171106-7f88df3e-dac2-449c-9ade-763a864a0463.png">

<img width="960" alt="deliverable2_lot_summary" src="https://user-images.githubusercontent.com/90356052/148171118-7082f8c8-51b5-410b-8811-d09e6bd66637.png">

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

Lot 1 and Lot 2 are both within design specifications. Lot 3 shows the most variance and exceeds the manufacturers specs.

## T-Tests on Suspension Coils

<img width="960" alt="Deliverable3_2" src="https://user-images.githubusercontent.com/90356052/148171741-349c32c9-b609-4890-8017-a04095871df0.png">
<img width="960" alt="Deliverable_3_1" src="https://user-images.githubusercontent.com/90356052/148171742-5c859a4e-0dee-4c48-896d-0b54fa68eace.png">

