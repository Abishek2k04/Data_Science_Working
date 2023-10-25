#Measeure of central tendancy
library(modeest)

#Import Data set
neo <- read.csv("neo.csv")

#View dataset
View(neo)

#mean
diamin <- mean(neo$Estimated.Diameter.minimum..m.)
print(diamin)
diamax <- mean(neo$Estimated.Diameter.maximum..m.)
print(diamax)
avgvelr <- mean(neo$Vrelative..km.s.)
print(avgvelr)
avddist <- mean(neo$CA.Distance.Minimum..au.)
print(avddist)

# Median
middist <- median(neo$CA.Distance.Nominal..au.)
print(middist)
middistm <- median(neo$CA.Distance.Minimum..au.)
print(middistm)

#Mode
modemag <- mfv(neo$H..mag.)
print(modemag)
modemeg <- mfv(neo$CA.Date)
print(modemeg)

#Measure of variance in Data
range <- max(neo$Vrelative..km.s.) - min(neo$Vrelative..km.s.)
print(range)

#Standard Deviation
sdofvelocity <- sd(neo$Vrelative..km.s.)
print(sdofvelocity)
sdofvelocity <- sd(neo$CA.Distance.Minimum..au.)
print(sdofvelocity)
sdofvelocity <- sd(neo$CA.Distance.Nominal..au.)
print(sdofvelocity)

#Variance
varofvelocity <- var(neo$Vrelative..km.s.)
print(varofvelocity)
varofvelocity <- var(neo$CA.Distance.Minimum..au.)
print(varofvelocity)
varofvelocity <- var(neo$CA.Distance.Nominal..au.)
print(varofvelocity)
varofvelocity < var(neo$Estimated.Diameter.minimum..m.)
print(varofvelocity)

      #Measure of state//////
library(moments)

#Kurtiosis
kurtosis(neo$CA.Distance.Minimum..au.)
kurtosis(neo$Estimated.Diameter.minimum..m.)
kurtosis(neo$CA.Distance.Nominal..au.)

#skewness
skewness(neo$Vrelative..km.s.)
skewness(neo$Estimated.Diameter.minimum..m.)
skewness(neo$CA.Distance.Nominal..au.)

