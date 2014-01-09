# Computing for Data Analysis
# Programming Exercise week 1
# Bastiaan Quast
#################################

# load the csv file
hw1 <- read.csv("hw1_data.csv")

# view column names
ls(hw1)

# view the first two rows
head(hw1, 2)

# number of rows / observations
nrow(hw1)

# view the last two rows
tail(hw1, 2)

# row 47
hw1[47,]

# missing values in Ozone
summary(hw1$Ozone)

# mean Ozone
mean(hw1$Ozone, na.rm=T)

# mean Solar.R where Ozone > 31 and Temp > 90
mean(subset(hw1, Ozone > 31 & Temp > 90)$Solar.R, na.rm=T)

# mean Temp when Month == 6
mean(subset(hw1, Month == 6)$Temp, na.rm=T)

# max Ozone in May (Month == 5)
max(subset(hw1, Month == 5)$Ozone, na.rm=T)