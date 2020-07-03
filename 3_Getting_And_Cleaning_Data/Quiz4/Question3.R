download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "data2.csv")
data <- read.csv("data2.csv")
countryNames <- data$X.2
grep("^United", countryNames)