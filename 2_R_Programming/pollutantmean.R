pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = 1:332) {
  data <- vector()
  for (i in id) {
    if (i < 10) {
      filename <- paste("00",i,".csv",sep="")
    } else if (i < 100) {
      filename <- paste("0",i,".csv",sep="")
    } else {
      filename <- paste(i,".csv",sep="")
    }
    location <- paste(directory, filename,sep="/")
    data <- c(data, read.csv(location, header = TRUE)[,pollutant])
  }
  mean(data, na.rm = TRUE)
}

