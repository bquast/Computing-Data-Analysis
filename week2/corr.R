# Computing for Data Analysis
# Programming Exercise week 2
# Bastiaan Quast
#################################

# PART 3

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations

  filter.data <- list()
  output <- vector()
  
  j <- 1
  
  temp <- list.files(path = directory, pattern="*.csv")
  temp <- paste(directory, temp, sep="/")
  import.data <- lapply(temp, read.csv)
  
  import.data.seq = 1:length(import.data)
  
  for(i in import.data.seq){
    if (sum(complete.cases(import.data[[i]])) > threshold){
      output[[j]] <- cor(import.data[[i]]$nitrate, import.data[[i]]$sulfate, use="pairwise.complete.obs")
      j <- j + 1
    }
  }
  
  output
}