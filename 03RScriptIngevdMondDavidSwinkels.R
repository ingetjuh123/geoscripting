# Inge van der Mond
# 11-01-2017
library(raster)

source('R/CheckClass.R')
source('R/CheckRange.R')
source('R/CheckLeap.R')
source('R/CheckLeapYear.R')

CheckLeapYear(2000)
CheckLeapYear(2003)
CheckLeapYear(1581)
CheckLeapYear("Inge")
