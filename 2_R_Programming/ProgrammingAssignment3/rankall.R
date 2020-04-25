rankall <- function(outcome, r) {
  data <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE, header = TRUE, na.string="Not available")
  outcomeAddresses <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  if (!outcome %in% names(outcomeAddresses)) {
    stop("invalid outcome")
  }
  outcomeAddress <- outcomeAddresses[outcome]
  splitData <- split(data, data$State)
  #write.csv(splitData[1], "out.csv")
  hospitals <- lapply(X=splitData, FUN=rankallHelper, outAdd=outcomeAddress, rank=r)
  state <- names(hospitals)
  data.frame(cbind(hospitals, state))
}

rankallHelper <- function(X, outAdd, rank) {
  if (rank == "best") {
    sortData <- X[order(as.numeric(X[,outAdd])),]
    sortData[1,2]
  }
  if (rank == "worst") {
    sortData <- X[order(as.numeric(X[,outAdd]),decreasing=TRUE),]
    sortData[1,2]
  } else {
    sortData <- X[order(as.numeric(X[,outAdd])),]
    sortData[rank,2]
  }
}