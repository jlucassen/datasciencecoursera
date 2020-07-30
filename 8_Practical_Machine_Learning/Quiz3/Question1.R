##Code from the course: instructions say to use this to set up question
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

##My code, based on slides
train = segmentationOriginal[segmentationOriginal$Case=="Train",]
test = segmentationOriginal[segmentationOriginal$Case=="Test",]
set.seed(125)
mdl <- train(Class~., data=train, method="rpart")
plot(mdl$finalModel, margin=0.2)
dev.off()
text(mdl$finalModel, use.n=T, all=T, cex=0.8)