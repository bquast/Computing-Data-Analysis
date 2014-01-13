# Computing for Data Analysis
# Programming Exercise week 2
# Bastiaan Quast
#################################

# PART 2

complete <- function(directory, id) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  c.id <- as.integer(id)

  # convert to string of length 3

  
  obj <- data.frame(id=0, nobs=0)
  j <- 1  
  for (i in c.id) {
    # define string id
    s.id <- sprintf("%03i",i)
    # define path
    path <- paste(directory, "/", s.id, ".csv", sep="")
    
    # read data
    temp.data <- read.csv(path)
    
    obj[[j,"id"]] <- i
    obj[[j,"nobs"]] <- sum(complete.cases(temp.data))
    j <- j + 1
  }
  obj
}