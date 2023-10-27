g <- read.csv("pima-indians-diabetes.csv" ,header = TRUE)
View(g)
str(g)
#-----------------------CONVER TO FACTOR#-----------------------#
g$Diabetes.status = as.factor(g$Diabetes.status)
str(g)
View(g)
#-----------------------SLICE DATA-----------------------#
data = g[2:9]
View(data)
#-----------------------IMP LIB-----------------------#
library(caTools)
#-----------------------GEN RAN NUM-----------------------#
set.seed(100)

#-----------------------SPLIT THE DATASET-----------------------#
split = sample.split(g$Diabetes.status,SplitRatio = 0.8)
training_set=subset(data,split==TRUE)
View(training_set)
testing_set = subset(data, split == FALSE)
View(training_set)
#-----------------------SUMMARISE-----------------------#
summary(training_set)
summary(testing_set)

library(randomForest)
#-----------------------MODEL CREATION-----------------------#
model <- randomForest(Diabetes.status ~ .,data = training_set,ntree = 500, mtry = 6, importance = TRUE)
model

#-----------------------PREDICTING-----------------------#
predTrain <- predict(model, training_set, type ="class")

table(predTrain, training_set$Diabetes.status)
#-----------------------CROSS PREDt-----------------------#
predTrain <- predict(model,testing_set, type ="class")

table(predTrain, testing_set$Diabetes.status)
importance(model)

