# Bastiaan Quast

# import data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
View(outcome)

# encode
outcome[, 11] <- as.numeric(outcome[, 11])

# summarise
table(outcome$State)

# vector of more than 20 or not
state.total <- as.data.frame(table(outcome$State))
state.select <- subset(state.total, Freq >= 20)

# subset with only 20 hospitals or more
outcome2 <- subset(outcome, State %in% state.select$Var1)

# select variables
death <- outcome2[, 11]
state <- outcome2$State

# plot
boxplot(death ~ state)

# add y label and title
title(ylab = "30-day Death Rate")
title(main = "Heart Attack 30-day Death Rate by State")

# change par to perpendicular
par(las = 2)

# create data frame
data <- as.data.frame(cbind(death,state), stringsAsFactors = FALSE)
sort.data <- data[order(death),]

# CHALLANGE PART
# ....