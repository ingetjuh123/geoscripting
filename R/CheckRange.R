#Checking whether given year is later than 1600
CheckRange <- function (x){
  if (x < 1600) {
    stop('object of class character expected for x')
  }
}   

