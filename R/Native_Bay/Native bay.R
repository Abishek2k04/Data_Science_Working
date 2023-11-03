#Native bayes
#Import the dataset
dataset =read.csv("Scocial_Network_Ads.csv")
View(dataset)
dataset = dataset[3:5]
View(dataset)

#Encoding the arget feature as factor
dataset$Purchased = factor(dataset$Purchased,levels = c(0, 1))

###########Spliting dataset into training set&Testset
#instaling package('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split=TRUE)
View(training_set)
test_set = subset(dataset, split=FALSE)
View(test_set)

#capture scaling
training_set[-3]=scale(training_set[-3])
test_set[-3]=scale(test_set[-3])
View(training_set[-3])
View(test_set[-3])

library(e1071)
classifier = naiveBayes(x = training_set[-3],
                      y = training_set$Purchased)
###########Predict###########
y_pred = predict(classifier,newdata = test_set[-3])

###########Making the confusion matrix###########
cm = table(test_set[,3],y_pred)
View(cm)
cm
