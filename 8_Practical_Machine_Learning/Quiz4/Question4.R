library(lubridate) # For year() function below
dat = read.csv("https://d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)
library(forecast)
pred <- forecast(bats(tstrain), h=length(testing$visitsTumblr), level=0.95)
mean(pred$upper > testing$visitsTumblr & pred$lower < testing$visitsTumblr)