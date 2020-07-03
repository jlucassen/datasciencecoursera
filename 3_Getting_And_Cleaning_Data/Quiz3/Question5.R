library(quantmod)
library(lubridate)
amzn <- getSymbols("AMZN",auto.assign=FALSE)
sampleTimes <- index(amzn)
lubed <- ymd(sampleTimes)
rightYear <- year(lubed)==2012
print(sum(rightYear, na.rm = TRUE))
rightDay <- wday(lubed[rightYear])==2
print(sum(rightDay, na.rm = TRUE))