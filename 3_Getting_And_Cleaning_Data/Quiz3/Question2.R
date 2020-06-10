library(jpeg)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", "data2.jpg", method = "curl")
imgRaster <- readJPEG("data2.jpg", native=TRUE)
quantile(imgRaster, c(0.3, 0.8))