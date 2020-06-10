download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", "question5data.for")
rawData <- read.fortran("question5data.for", format = "A62")
data <- rawData[5:1258,]
col4 <- substring(data, 29, 32)
numData <- as.numeric(col4)
sum(numData)