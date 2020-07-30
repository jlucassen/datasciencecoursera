##Code from the course, using bestglm instead of ElemStatLearn, which is no longer available
#library(ElemStatLearn)
library(bestglm) 
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

##My code
library(caret)
set.seed(13234)
fields <- c("chd", "age", "alcohol", "obesity", "tobacco", "typea", "ldl")
trainSA <- trainSA[, fields]
mdl <- train(factor(chd)~., data=trainSA, method="glm", family="binomial")
pred1 <- predict(mdl, trainSA)
pred2 <- predict(mdl, testSA[, fields])
missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)} #from the class
missClass(trainSA$chd, as.numeric(pred1))
missClass(testSA$chd, as.numeric(pred2))