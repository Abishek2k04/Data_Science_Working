#IMPORT LIBRARIES
library(ggplot2)
library(dplyr)

#Importing dataset
expenses <- read.csv("dailyexpenses.csv")

#viewing dataset
View(expenses)

#Data Type Conversion
expenses$Date <- as.Date(expenses$Date, "%d/%m/%y")
View(expenses)

#Dataframes for comparing data
tot <- expenses[ ,2:9]
total <- colSums(tot)
detail <- c("Food", "Groceries", "Medical", "Fuel", "Toll", "Mobilebill", "Electricity", "Miscellanous")
tot_each <- data.frame(detail, total)
View(tot_each)

#Bar plot of expenses
ggplot(data = tot_each, aes(x=detail,y=total))+geom_bar(stat="identity",fill="darkred")+
  labs(x = "Items", y = "Expenses", title = "Comparing Expenses")

#Data frame for daily expenses
cm <- expenses[, 2:9]
dt <- expenses[, 1]
rs <- rowSums(cm)


daily_tot <- data.frame(dt, rs)
View(daily_tot)

#line plot for daily total expense
ggplot(data = daily_tot, aes(x=dt,y =rs))+
  geom_line(color="green", size = 2)+
  labs(x ="Date", y ="Expenses",title= "Total Expenses")

#Data frame for medical expenses
md <- expenses[, 3]
ds <- expenses[, 1]

daily_med <- data.frame(ds, md)
View(daily_med)

#scatter plot of daily medical expenses
ggplot(data =daily_med, aes(x=ds,y =md))+geom_point()+
  labs(x ="Expenses", y ="Medical",title= "Medical  Expenses")

#histogram of daily medical expenses
ggplot(expenses, aes(x = Medical))+
  geom_histogram(binwidth=5, color= "black", fill = "blue")

#pie chart
#importing datasheet for pie chart
pc <- read.csv("piechart.csv")
View(pc)

#pie chart
pie <- ggplot(pc, aes(x = "", y = amount,fill = factor(expense)))+
  geom_bar(width = 1, stat = "identity")+
  theme(axis.line = element_blank(),
        plot.title = element_text(hjust = 0.5))+
  labs(fill = "expenses", x = NULL, y = NULL,
       title = "pie chart of expenses")
pie + coord_polar(theta = "y", start = 0 )


#let's explore more
View(airquality)
summary(airquality)
airquality$Month = factor(airquality$Month)
summary(airquality)
print(airquality[1:5,])
mean(airquality$Temp)
quantile(airquality$Temp)
hist(airquality$Temp)
hist(airquality$Temp, breaks = 20)
par(mfrow = c(2,2))
hist(airquality$Temp, prob = T)
hist(airquality$Ozone, prob = T)
hist(airquality$Wind, prob = T)
hist(airquality$Solar.R, prob = T)
par(mfrow = c(1,1))
boxplot(airquality$Ozone)
