library(sqldf)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "question2data.csv")
acs <- read.csv("question2data.csv", header=T)
names(acs)
selected <- sqldf("select pwgtp1 from acs where AGEP < 50")

