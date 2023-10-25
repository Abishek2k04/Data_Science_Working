#--------------------------------------------<IMP-DATASE>---------------------------------------------#
server <- read.csv("Admission_Predict.csv")
View(server)
str(server)

#--------------------------------------------<SLICING-DATA>---------------------------------------------#
gre = server [,2]
coa = server [,9]

#--------------------------------------------<Dataset-For-SLR>---------------------------------------------#
data =data.frame(gre, coa)
View(data)

#--------------------------------------------<IMPORTING-DATA-SPLITING-LIBRARY>---------------------------------------------#
library(caTools)

#--------------------------------------------<GEM-RANDOM-NUM>---------------------------------------------#
set.seed(42)

#--------------------------------------------<DATA-SPLITING>---------------------------------------------#
split = sample.split(data$coa, SplitRatio = 0.8)

#--------------------------------------------<Training-Data>---------------------------------------------#
training_set = subset(data, split==TRUE)
View(training_set)
testing_set = subset(data, split==FALSE)
View(training_set)

#--------------------------------------------<Training-Data>---------------------------------------------#
regressor = lm(formula = coa~gre, data = training_set)

#--------------------------------------------<Training-Data>---------------------------------------------#
y_pred = predict(regressor, newdata = testing_set)
View(y_pred)

#--------------------------------------------<Training-Data>---------------------------------------------#
library(ggplot2)

#--------------------------------------------<Training-Data>---------------------------------------------#
plot(testing_set$gre, testing_set$coa, type= 'p',
     col ='blue', xlab = 'GRE', ylab = 'COA')

lines(testing_set$gre, y_pred ,type= 'o', col='red')

#--------------------------------------------<Training-Data>---------------------------------------------#
ggplot(testing_set, aes(x = gre)) +
   geom_line(aes(y=coa, color = 'Actual')) +
   geom_line(aes(y=y_pred, color = 'Predicted'))
 
