#Checking whether year is a leap year
CheckLeap <- function (year){
  if (year %% 4 == 0){
    return(TRUE)
  }
  else if (!year %% 100 == 0){
    return(TRUE)
  }
  else if (!year %% 400 == 0){
    return(FALSE)
  }
  else{
    return(TRUE)
  }
}



