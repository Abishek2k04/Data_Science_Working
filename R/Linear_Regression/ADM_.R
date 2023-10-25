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
training_set = subset(data, split==FALSE)
View(training_set)
