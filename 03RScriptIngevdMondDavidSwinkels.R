# Inge van der Mond
# 11-01-2017
library(raster)

source('R/CheckClass.R')
source('R/CheckRange.R')
source('R/CheckLeap.R')

#checking whether the year given is later than 1600
CheckRange(2000)

#checking whether the year is of class numeric
CheckClass(2000)

#checking whether the year is a leap year
CheckLeap(2000)

