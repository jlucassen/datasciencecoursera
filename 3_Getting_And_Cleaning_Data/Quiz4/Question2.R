download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "data2.csv")
data <- read.csv("data2.csv")
complete <- data[!is.na(as.numeric(data$Gross.domestic.product.2012)),]
gdps <- as.numeric(gsub(",","", complete$X.3,))
mean(gdps, na.rm = TRUE)
