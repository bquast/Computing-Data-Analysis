# Bastiaan Quast
# Computing for Data Analysis
# Week 3
# Part 7

rankall <- function(outcome, num = "best") {
  ## Read outcome data

  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[, 11] <- suppressWarnings(as.numeric(data[, 11]))
  data[, 17] <- suppressWarnings(as.numeric(data[, 17]))
  data[, 23] <- suppressWarnings(as.numeric(data[, 23]))
  
  # create empty data.frame
  providers <- data.frame(hospital = character(0), state = character(0), stringsAsFactors=FALSE)
  
  
  ## Check that outcome is valid

  if (outcome == "heart attack") {
    outcome.col <- 11
  } else if (outcome == "heart failure") {
    outcome.col <- 17
  } else if (outcome == "pneumonia") {
    outcome.col <- 23
  } else {
    stop('invalid outcome')
  }
  
  
  ## For each state, find the hospital of the given rank
  
  if (num == "best") {
    for (i in unique(data$State)) {
      sub.data <- subset(data, data$State == i)
      return.data.frame <- subset(sub.data, sub.data[, outcome.col] == min(sub.data[, outcome.col], na.rm=TRUE), c(Hospital.Name, State) )
      # sort data frame
      sorted.data.frame <- return.data.frame[with(return.data.frame, order(Hospital.Name) ), ]
      providers[i,] <- sorted.data.frame[1,]
    }    
  } else if (num == "worst") {
    for (i in unique(data$State)) {
      sub.data <- subset(data, data$State == i)
      return.data.frame <- subset(sub.data, sub.data[, outcome.col] == max(sub.data[, outcome.col], na.rm=TRUE), c(Hospital.Name, State) )
      # sort data frame
      sorted.data.frame <- return.data.frame[with(return.data.frame, order(Hospital.Name) ), ]
      providers[i,] <- sorted.data.frame[1,]
    }
  } else if (typeof(num) == "double") {
    num <- as.integer(num)
    for (i in unique(data$State)) {
      sub.data <- subset(data, data$State == i)
      return.data.frame <- sub.data[ order(sub.data[, outcome.col], xtfrm(sub.data[, 2])), ]
      providers[i, ] <- return.data.frame[num, c(2,7)]
    }
  } else {
    stop('invalid num')
  }
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  providers[ order(xtfrm(providers$state) ), ]
  #providers
}