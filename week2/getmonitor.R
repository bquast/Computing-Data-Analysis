# Computing for Data Analysis
# Programming Exercise week 2
# Bastiaan Quast
#################################

# PART 1

getmonitor <- function(id, directory, summarize = FALSE) {
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  
  ## Your code here
  
  # convert id into string of length 3
  c.id <- as.integer(id)
  s.id <- sprintf("%03i",c.id)
  
  # define path
  path <- paste(directory, "/", s.id, ".csv", sep="")
  
  # define summarize option
  if (summarize == TRUE) {
    print(summary(read.csv(path)))
  }
}