download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "data1.csv")
data <- read.csv("data1.csv", header = TRUE)
agricultureLogical <- data$ACR == 3 & data$AGS == 6
data[which(agricultureLogical), ]