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


#--------------------------------------------<Y-PRES>---------------------------------------------#
y_pred = predict(regressor, newdata = testing_set)
View(y_pred)

#--------------------------------------------<IMP-LIBRARY>---------------------------------------------#
library(ggplot2)

#--------------------------------------------<PLOT1>---------------------------------------------#
plot(testing_set$gre, testing_set$coa, type= 'p',
     col ='blue', xlab = 'GRE', ylab = 'COA')

lines(testing_set$gre, y_pred ,type= 'o', col='red')

#--------------------------------------------<FINAL>---------------------------------------------#
ggplot(testing_set, aes(x = gre)) +
  geom_line(aes(y=coa, color = 'Actual')) +
  geom_line(aes(y=y_pred, color = 'Predicted'))
