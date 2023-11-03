#PRE PROCESSING
#importing lbraries
library(rvest)
library(dplyr)

#IMPORTING DATASET
imdb.ratings <- read.csv("my_movie data.csv")

#VISIT DATABASE
View(imdb.ratings)

#1.check for special characters(gsub-global substitute)
imdb.ratings$year <- gsub("[()]", "",imdb.ratings$year)
View(imdb.ratings)
imdb.ratings$duration <- gsub("[min]", "",imdb.ratings$duration)
View(imdb.ratings)

#2.checking for wheater all the variable have same datatype or not
str(imdb.ratings)
imdb.ratings$name <- as.character(imdb.ratings$name)
imdb.ratings$duration <- as.integer(imdb.ratings$duration)
imdb.ratings$year <- as.numeric(imdb.ratings$year)
imdb.ratings$rating <- as.numeric(imdb.ratings$rating)
View(imdb.ratings)
str(imdb.ratings)

#3.dealing eith missing values(runif-produce random no)
set.seed(124)
imdb.ratings$Gross <- runif(50, min =1000000,max =1000000000)
imdb.ratings$Gross_dollars <- runif(50,min =1000000, max = 1000000000) 
View(imdb.ratings)

#Oops remove the extra column
imdb.ratings  <- subset(imdb.ratings,select = -(Gross))
View(imdb.ratings)
imdb.ratings$rank <- c(1:50)
View(imdb.ratings)
imdb.ratings <- imdb.ratings[c("rank", "name", "year",
                               "rating", "duration", "Gross_dollars")]

View(imdb.ratings)

#lets create a missing value
View(imdb.ratings)
imdb.ratings[1,  6] <- NA
imdb.ratings[18, 6] <- NA
imdb.ratings[36, 6] <- NA
imdb.ratings[45, 6] <- NA
View(imdb.ratings)

#let's replace missing values 
imdb.ratings$Gross_dollars <- ifelse(is.na(imdb.ratings$Gross_dollars), 
                                     ave(imdb.ratings$Gross_dollars, 
                                         FUN = function(x) mean(x, na.rm = TRUE)),
                                     imdb.ratings$Gross_dollar)        
View(imdb.ratings)                                     
imdb.ratings$watch_list <-imdb.ratings$rating > 8.6          
View(imdb.ratings)
str(imdb.ratings)
imdb.ratings$watch_list <- as.factor(imdb.ratings$watch_list)
str(imdb.ratings)

#lets deal with catogory data
imdb.ratings$watch_list <- factor(imdb.ratings$watch_list,levels = c('TRUE','FALSE'), labels = c(1, 0))
View(imdb.ratings)

#Trraining set and testing set
library(caTools)
split = sample.split(imdb.ratings$Gross_dollars, SplitRatio = 0.8)
training_set = subset(imdb.ratings, split == TRUE)
testing_set = subset(imdb.ratings, split == FALSE)
View(training_set)
View(testing_set)

# outlier Detection (Grubbs Test)
library(outliers)
test <- grubbs.test(imdb.ratings$Gross_dollars)
test

#features scaling (standardlization)
training_set$scaled_gross = scale(training_set[,6])
View(training_set)
testing_set$scaled_gross <- scale(testing_set[,6])
View(testing_set)
                      
                      