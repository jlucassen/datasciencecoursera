##Code from the course: instructions say to use this to set up question
library(pgmm)
data(olive)
olive = olive[,-1]

#my code, based on the slides
library(caret)
trainMask = createDataPartition(olive$Area, p = 0.8)[[1]]
train = olive[trainMask,]
testing = olive[-trainMask,]
mdl <- train(Area~., data=train, method="rpart")
predict(mdl, newdata = as.data.frame(t(colMeans(olive))))