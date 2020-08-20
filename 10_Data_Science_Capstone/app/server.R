library(shiny)
shinyServer(function(input, output, session) {
  library(RWeka)
  wordData <- readRDS('wordData.Rda')
  pairData <- readRDS('pairData.Rda')
  tripData <- readRDS('tripData.Rda')
  quadData <- readRDS('quadData.Rda')
  backoff <- function(x) {
    clean <- as.character(gsub("[^a-z0-9 ]*", "", tolower(x)))
    trips <- NGramTokenizer(clean, Weka_control(min=3, max=3))
    if (length(trips) > 0) {
      lastTrip <- trips[length(trips)]
      if (lastTrip %in% tripData$str) return(as.character(tripData[tripData$str==lastTrip, 'nextWord'][1, ]))
    }
    pairs <- NGramTokenizer(clean, Weka_control(min=2, max=2))
    if (length(pairs) > 0) {
      lastPair <- pairs[length(pairs)]
      if (lastPair %in% pairData$str) return(as.character(pairData[pairData$str==lastPair, 'nextWord'][1, ]))
      
    }
    words <- WordTokenizer(clean)
    if (length(words) > 0) {
      lastWord <- words[length(words)]
      if (lastWord %in% wordData$str) return(as.character(wordData[wordData$str==lastWord, 'nextWord'][1, ]))
    }
    return(NA)
  }
  
  output$prediction <- eventReactive(input$predict, {
    if (input$append) {
      updateTextInput(session, "text", "label", paste(input$text, backoff(input$text), sep=' '))
    }
    backoff(input$text)
    })
})
