##Code from the course: instructions say to use this to set up question
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

##This bit is my code
il <- training[, grepl("^IL", names(training))]
processed <- preProcess(il, method="pca", thresh=0.9)
pcas <- predict(processed, il)
length(pcas)