# Inge van der Mond
# 11-01-2017
library(raster)

#checking whether the year is of class numeric
CheckClass <- function (x) {
  if (!is.numeric(x)) {
    stop('object of class character expected for x')
  }
}   

#checking whether the year given is later than 1600
CheckRange <- function (x){
  if (x < 1600) {
    stop('year should be later than 1600')
  }
}   

#checking whether the year is a leap year
CheckLeap <- function (year){
  if (year %% 400 == 0){
    return(TRUE)
  }
  else if (year %% 100 == 0){
    return(FALSE)
  }
  else if (year %% 4 == 0){
    return(TRUE)
  }
  else{
    return(FALSE)
  }
}

#checking whether all three criteria are met
CheckLeapYear <- function (x){
  CheckRange(x)
  CheckClass(x)
  CheckLeap(x)
}
  
CheckLeapYear(2000)
CheckLeapYear(2003)
CheckLeapYear(1581)
CheckLeapYear("Inge")
