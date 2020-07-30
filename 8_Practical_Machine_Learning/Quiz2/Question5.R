library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[inTrain,]
testing = adData[-inTrain,]

##This bit is my code
dil_train <- training[, grepl("^IL|^diagnosis", names(training))]
mdl1 <- train(diagnosis~., data=dil_train, method="glm")
mdl2 <- train(diagnosis~., data=dil_train, method="glm", preProcess="pca", trControl=trainControl(preProcOptions = list(thresh = 0.8)))
dil_test <- testing[, grepl("^IL|^diagnosis", names(training))]
pred1 <- predict(mdl1, dil_test)
pred2 <- predict(mdl2, dil_test)
print(paste("Non-PCA accuracy:", sum(pred1==dil_test$diagnosis)/length(dil_test$diagnosis)))
print(paste("PCA accuracy:", sum(pred2==dil_test$diagnosis)/length(dil_test$diagnosis)))