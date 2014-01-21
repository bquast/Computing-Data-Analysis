# Bastiaan Quast

# import data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
View(outcome)

# encode
outcome[, 11] <- as.numeric(outcome[, 11])
outcome[, 17] <- as.numeric(outcome[, 17])
outcome[, 23] <- as.numeric(outcome[, 23])

# set plot window to three plots on a row
par(mfrow = c(3, 1))

max.range <- range(c(outcome[, 11]), outcome[, 17], outcome[,23], na.rm=TRUE)

# plot 1
hist(outcome[, 11], main="Heart Attack", xlab="30-day Death Rate", xlim=max.range)
# plot 2
hist(outcome[, 17], main="Heart Failure", xlab="30-day Death Rate", xlim=max.range)
# plot 3
hist(outcome[, 23], main="Pneumonia", xlab="30-day Death Rate", xlim=max.range)