# Bastiaan Quast
# Coursera
# Computing for Data Analysis
# Week 4
# Part 2

agecount <- function(age = NULL) {
  ## Check that "age" is non-NULL; else throw error
  if ( is.null(age) ) {
    stop("cause is not defined")
  }
  
  ## Read "homicides.txt" data file
  homicides <- readLines("homicides.txt")
  
  ## Extract ages of victims; ignore records where no age is
  ## given
  reg.age <- regexec("<dd>.*? (.*?) years old</dd>", homicides)
  mat.age <- regmatches(homicides, reg.age )
  ages <- sapply(mat.age, function(x) as.integer(x[2]) )
  
  ## Return integer containing count of homicides for that age
  sum(age == ages, na.rm=TRUE)
  
}