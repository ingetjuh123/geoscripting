#checking whether given year meets all three criteria in the functions
CheckLeapYear <- function (x){
  CheckRange(x)
  CheckClass(x)
  CheckLeap(x)
}