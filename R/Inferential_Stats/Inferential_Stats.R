#T - Test
#One sample T-test
#Random Generation Of Normal Distribution
x <- rnorm(100)
x
#Applying One Sample T-Test
t.test(x, mu = 5)

#Two Sample T-Test
#Random Generation Of Normal Distribution
y <- rnorm(100)

#Applying Two Sample T-Test
t.test(x,y)

#----------------------------------------------------"TYPES DATA"----------------------------------------------------#
data <- read.csv("Heartstroke_data.csv")
View(data)
#Data_cleaning
str(data)
data$hypertension <- as.factor(data$hypertension)
data$heart_disease <- as.factor(data$heart_disease)
data$bmi <- as.factor(data$bmi)
data$stroke <-as.factor(data$stroke)

str(data)

#Apply chi-sequence Test
#---------------------------------Test 1---------------------------------#
test1<-chisq.test(table(data$hypertension,data$heart_disease))
print(test1)
#---------------------------------Test 2---------------------------------#
test2 <- chisq.test(table(data$Residence_type, data$hypertension))
print(test2)
#---------------------------------Test 3---------------------------------#
test3 <- chisq.test(table(data$ever_married, data$work_type))
print(test3)

#----------------------------------------------------"HYPOTHYSIS"----------------------------------------------------#
X1 <- c(16,2,25,4,21,21,1,27,7,21,6)
X2 <- c(39,2,6,21,4,2,16,1,21,55,9)

data <- data.frame(Site = rep(c("Urban","Rural"), each=10), Weight=c(X1, X2))
print(data)
View(data)

library(car)
leveneTest(weight-Site.data)
