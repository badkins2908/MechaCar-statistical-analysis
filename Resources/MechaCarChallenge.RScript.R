library(dplyr)

########### Import the data ###########
# Import mechacar data
mecha_car_mpg <- read.csv(file='/Users/baileymaier/Desktop/GWU - Data Analytics/Module 15 - R Studio/MechaCar_mpg.csv',check.names = F, stringsAsFactors = F)

# Import the coil data
sus_coil <- read.csv(file='/Users/baileymaier/Desktop/GWU - Data Analytics/Module 15 - R Studio/Suspension_Coil.csv', check.names = F, stringsAsFactors = F)


######### Deliverable 1 ###########
# Perform linear regression that predicts the mpg of MechaCar prototypes
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mecha_car_mpg)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mecha_car_mpg))
# p-value: 5.35e-11
# adjusted r-squared: 0.6825


######### Deliverable 2 ###########
# Create a total_summary dataframe and then carry out summary statistics
total_summary <- sus_coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# Create a lot_summary dataframe grouped by manufacturing Lot and carry out summary statistics
lot_summary <- sus_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI),Variance = var(PSI), SD = sd(PSI))


######### Deliverable 3 ###########
#Create subset for each lot
Lot1 = subset(sus_coil, Manufacturing_Lot == 'Lot1')
Lot2 = subset(sus_coil, Manufacturing_Lot == 'Lot2')
Lot3 = subset(sus_coil, Manufacturing_Lot == 'Lot3')

# Run t-test on PSI across all lots
t.test(sus_coil$PSI, mu = 1500)

# Run t-test on PSI for each individual lot
t.test(Lot1$PSI, mu = 1500) 
t.test(Lot2$PSI, mu = 1500)
t.test(Lot3$PSI, mu = 1500)