corr <- function(directory, threshold = 0) {
  corrs <- vector()
  filenames <- dir(directory, pattern =".csv")
  for (f in filenames) {
    location = paste(directory,f,sep="/")
    data <- read.csv(location, header = TRUE)
    completeData <- data[complete.cases(data),]
    if (nrow(completeData) > threshold) {
      n = completeData[,"nitrate"]
      c = completeData[,"sulfate"]
      corrs <- c(corrs, cor(n,c))
    }
  }
  corrs
}