best <- function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE, header = TRUE, na.string="Not available")
  if (!state %in% data$State){
    stop("invalid state")
  } 
  outcomeAddresses <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  if (!outcome %in% names(outcomeAddresses)) {
    stop("invalid outcome")
  }
  outcomeAddress <- outcomeAddresses[outcome]
  stateData <- data[which(data$State==state),]
  alphData <- stateData[order(stateData[,2]),]
  sortData <- alphData[order(as.numeric(alphData[,outcomeAddress])),]
  sortData[1,2]
}
