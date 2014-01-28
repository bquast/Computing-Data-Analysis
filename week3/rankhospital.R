# Bastiaan Quast
# Computing for Data Analysis
# Week 3
# Part 6

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[, 11] <- suppressWarnings(as.numeric(data[, 11]))
  data[, 17] <- suppressWarnings(as.numeric(data[, 17]))
  data[, 23] <- suppressWarnings(as.numeric(data[, 23]))
  
  ## Check that state and outcome are valid
  
  if (!state %in% data$State){
    stop('invalid state')
  } else {
    sub.data <- subset(data, data$State == state, na.rm = TRUE)
  }
  
  if (outcome == "heart attack") {
    outcome.col <- 11
  } else if (outcome == "heart failure") {
    outcome.col <- 17
  } else if (outcome == "pneumonia") {
    outcome.col <- 23
  } else {
    stop('invalid outcome')
  }
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  if (num == "worst") {
    return.list <- subset(sub.data, sub.data[, outcome.col] == max(sub.data[, outcome.col], na.rm=TRUE), Hospital.Name)
    sorted.list <- sort(return.list)
    results <- sorted.list[, 1]
    } else if (num == "best") {
    return.list <- subset(sub.data, sub.data[, outcome.col] == min(sub.data[, outcome.col], na.rm=TRUE), Hospital.Name)
    sorted.list <- sort(return.list)
    results <- sorted.list[, 1]
  } else if (typeof(as.integer(num)) == "integer") {
    num <- as.integer(num)
    sort.data <- sub.data[ order(sub.data[, outcome.col], xtfrm(sub.data[, 3])), ]
    results <- sort.data[num, 2]
    } else {
    stop('invalid rank')
  }
  
  results

}