# Bastiaan Quast
# Week 3 homework
# part 4

# load package
library(lattice)

# import data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
hospital <- read.csv("hospital-data.csv", colClasses = "character")

# merge
outcome.hospital <- merge(outcome, hospital, by = "Provider.Number")

# encode variables
death <- as.numeric(outcome.hospital[, 11]) ## Heart attack outcome
npatient <- as.numeric(outcome.hospital[, 15])
owner <- factor(outcome.hospital$Hospital.Ownership)

# lattice plot
xyplot(death ~ npatient)

# now with x label
xyplot(death ~ npatient, 
       xlab = "Number of Patients Seen"
       )

# now with x and y label
xyplot(death ~ npatient, 
       xlab = "Number of Patients Seen", 
       ylab = "30-day Death Rate"
       )

# now by ownership type and with x and y label, and title
xyplot(death ~ npatient | owner, 
       xlab = "Number of Patients Seen", 
       ylab = "30-day Death Rate", 
       main = "Heart Attack 30-day Death Rate by Ownership"
       )

# extent with a double function
xyplot(death ~ npatient | owner, 
       xlab = "Number of Patients Seen", 
       ylab = "30-day Death Rate", 
       main = "Heart Attack 30-day Death Rate by Ownership", 
       panel = function(x, y) {
         panel.xyplot(x, y)
         panel.lmline(x, y)
         } 
       )