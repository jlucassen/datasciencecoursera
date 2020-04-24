complete <- function(directory, id = 1:332) {
  nobs <- vector()
  for (i in id) {
    if (i < 10) {
      filename <- paste("00",i,".csv",sep="")
    } else if (i < 100) {
      filename <- paste("0",i,".csv",sep="")
    } else {
      filename <- paste(i,".csv",sep="")
    }
    location <- paste(directory, filename,sep="/")
    data <- read.csv(location, header = TRUE)
    numComplete <- nrow(data[complete.cases(data),])
    nobs <- c(nobs, numComplete)
  }
  data.frame(id, nobs)
}