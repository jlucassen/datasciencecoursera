download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "data1.csv")
data <- read.csv("data1.csv")
strsplit(names(data), "wgtp")[123]