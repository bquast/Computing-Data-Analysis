# Bastiaan Quast
# Coursera
# Computing for Data Analysis
# Week 4
# Part 1

count <- function(cause = NULL) {
  ## Check that "cause" is non-NULL; else throw error
  if ( is.null(cause) ) {
    stop("cause is not defined")
  }
  
  ## Read "homicides.txt" data file
  homicides <- readLines("homicides.txt")
  
  ## Check that specific "cause" is allowed; else throw error
  ## Extract causes of death
  if (cause == "asphyxiation") {
    cause.count <- length(grep("<dd>Cause: [Aa]sphyxiation</dd>", homicides) )
  } else if (cause == "blunt force") {
    cause.count <- length(grep("<dd>Cause: [Bb]lunt [Ff]orce</dd>", homicides) )
  } else if (cause == "other") {
    cause.count <- length(grep("<dd>Cause: [Oo]ther</dd>", homicides) )
  } else if (cause == "shooting") {
    cause.count <- length(grep("<dd>Cause: [Ss]hooting</dd>", homicides) )
  } else if (cause == "stabbing") {
    cause.count <- length(grep("<dd>Cause: [Ss]tabbing</dd>", homicides) )
  } else if (cause == "unknown") {
    cause.count <- length(grep("<dd>Cause: [Uu]nknown</dd>", homicides) )
  } else {
    stop("unknown cause")
  }
 
  ## Return integer containing count of homicides for that cause
  cause.count
}