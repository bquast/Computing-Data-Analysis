# Bastiaan Quast
# Computing for Data Analysis
# Week 3
# Part 5

best <- function(state, outcome) {
  ## Read outcome data
  
  # read data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[, 11] <- suppressWarnings(as.numeric(data[, 11]))
  data[, 17] <- suppressWarnings(as.numeric(data[, 17]))
  data[, 23] <- suppressWarnings(as.numeric(data[, 23]))
  ## Check that state and outcome are valid
  
  # creat list of valid outcomes
  
  if (!state %in% data$State){
    stop('invalid state')
  } else {
    sub.data <- subset(data, data$State == state, na.rm = TRUE)
  }
    
  if (outcome == "heart attack") {
    return.list <- subset(sub.data, sub.data[, 11] == min(sub.data[, 11], na.rm=TRUE), Hospital.Name)
  } else if (outcome == "heart failure") {
    return.list <- subset(sub.data, sub.data[, 17] == min(sub.data[, 17], na.rm=TRUE), Hospital.Name, na.rm = TRUE )
  } else if (outcome == "pneumonia") {
    return.list <- subset(sub.data, sub.data[, 23] == min(sub.data[, 23], na.rm=TRUE), Hospital.Name, na.rm = TRUE )
  } else {
    stop('invalid outcome')
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  sorted.list <- sort(return.list)
  sorted.list[, 1]
}
